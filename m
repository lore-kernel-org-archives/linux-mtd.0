Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIRAG-0002yk-56
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 08:58:50 -0400
Message-ID: <425139E8.5000508@yandex.ru>
Date: Mon, 04 Apr 2005 16:58:16 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Estelle HAMMACHE <estelle.hammache@st.com>
References: <419B8715.4036BDBB@st.com>	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>	<419CE1E8.F20DD890@st.com>	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>	<419E1DE0.FDD5DEC0@st.com>	<1100978366.7949.38.camel@localhost.localdomain>	<1100988787.7949.46.camel@localhost.localdomain>	<1102604262.6694.17.camel@hades.cambridge.redhat.com>	<41B88622.4BCD78EC@st.com>
	<41C02F29.92D2B5A@st.com>
In-Reply-To: <41C02F29.92D2B5A@st.com>
Content-Type: multipart/mixed; boundary="------------040006020105040308070604"
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040006020105040308070604
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Estelle HAMMACHE wrote:
> Hi everyone,
> 
> it seems there is a problem with jffs2_wbuf_recover and
> the wbuf_sem...
> 
> jffs2_flash_writev
> ** down_write(&c->wbuf_sem);  !!!
> ** __jffs2_flush_wbuf
> **** jffs2_wbuf_recover
> ******  jffs2_block_refile
> ********  nextblock = NULL;
> ******  jffs2_reserve_space_gc
> ********  jffs2_do_reserve_space
> **********  jffs2_erase_pending_blocks
> ************  jffs2_mark_erased_block
> **************  jffs2_flash_read
> ****************  down_read(&c->wbuf_sem); !!!
> 
> I believe that when checking a newly erased block, the
> wbuf should not be used anyway, so this is probably easy to
> correct. Is it ok to create a jffs2_flash_read_nobuf function
> and call it only from jffs2_mark_erased_block ?
> 
Hello Estelle,

I've found that JFFS2 has wbuf problems on SMP again. The reason are the 
changes which were made to fix the deadlock you've spotted.
The wbuf_sem rwsem doesn't help if it is locked after you've read flash 
because by the time you copy data from wbuf it might have been chaneged. 
I.e:

/* A part of our data is in wbuf at this point */
mtd->read_ecc(...)
/* At this point another CPU fills wbuf and flushes it, so in contains 
the wrong data */
down_read(&c->wbuf_sem)
memcpy(buf, c->wbuf, len)
up_read(&c->wbuf_sem)

I'd prefer not to use jffs2_flash_read() in jffs2_mark_erased_block() 
but to directly read flash since it wbuf anyway must not correspond to a 
newly erased block.

Please, look at the attached patch.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--------------040006020105040308070604
Content-Type: text/plain;
 name="wbuf_sem-1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="wbuf_sem-1.diff"

diff -auNrp --exclude=CVS mtd/fs/jffs2/erase.c mtd-fixed/fs/jffs2/erase.c
--- mtd/fs/jffs2/erase.c	2005-04-04 16:37:02.099649680 +0400
+++ mtd-fixed/fs/jffs2/erase.c	2005-04-04 16:33:18.665344419 +0400
@@ -333,7 +333,11 @@ static void jffs2_mark_erased_block(stru
 
 			bad_offset = ofs;
 
-			ret = jffs2_flash_read(c, ofs, readlen, &retlen, ebuf);
+			if (!jffs2_is_writebuffered(c) || !jffs2_cleanmarker_oob(c))
+				ret = c->mtd->read(c->mtd, ofs, readlen, &retlen, ebuf);
+			else
+				ret = c->mtd->read_ecc(c->mtd, ofs, readlen, &retlen, ebuf, NULL, c->oobinfo);
+
 			if (ret) {
 				printk(KERN_WARNING "Read of newly-erased block at 0x%08x failed: %d. Putting on bad_list\n", ofs, ret);
 				goto bad;
diff -auNrp --exclude=CVS mtd/fs/jffs2/wbuf.c mtd-fixed/fs/jffs2/wbuf.c
--- mtd/fs/jffs2/wbuf.c	2005-04-04 16:37:09.133148264 +0400
+++ mtd-fixed/fs/jffs2/wbuf.c	2005-04-04 16:33:18.667343992 +0400
@@ -873,6 +873,7 @@ int jffs2_flash_read(struct jffs2_sb_inf
 		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
 
 	/* Read flash */
+	down_read(&c->wbuf_sem);
 	if (jffs2_cleanmarker_oob(c))
 		ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
 	else
@@ -896,16 +897,11 @@ int jffs2_flash_read(struct jffs2_sb_inf
 
 	/* if no writebuffer available or write buffer empty, return */
 	if (!c->wbuf_pagesize || !c->wbuf_len)
-		return ret;;
+		goto exit;
 
 	/* if we read in a different block, return */
 	if (SECTOR_ADDR(ofs) != SECTOR_ADDR(c->wbuf_ofs))
-		return ret;
-
-	/* Lock only if we have reason to believe wbuf contains relevant data,
-	   so that checking an erased block during wbuf recovery space allocation
-	   does not deadlock. */
-	down_read(&c->wbuf_sem);
+		goto exit;
 
 	if (ofs >= c->wbuf_ofs) {
 		owbf = (ofs - c->wbuf_ofs);	/* offset in write buffer */

--------------040006020105040308070604--
