Received: from lon-del-02.spheriq.net ([195.46.50.98])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwPJR-0002KM-9k
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 13:33:14 -0500
Received: from lon-inc-08.spheriq.net ([195.46.50.72])
	by lon-del-02.spheriq.net with ESMTP id j12GdHrM020795
	for <linux-mtd@lists.infradead.org>; Wed, 2 Feb 2005 17:02:01 GMT
Received: from lon-out-03.spheriq.net (lon-out-03.spheriq.net [195.46.50.131])
	by lon-inc-08.spheriq.net with ESMTP id j12GLtHu028800
	for <linux-mtd@lists.infradead.org>; Wed, 2 Feb 2005 16:21:55 GMT
Received: from lon-cus-02.spheriq.net (lon-cus-02.spheriq.net [195.46.50.38])
	by lon-out-03.spheriq.net with ESMTP id j12GLqHi001777
	for <linux-mtd@lists.infradead.org>; Wed, 2 Feb 2005 16:21:52 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by lon-cus-02.spheriq.net with ESMTP id j12GLoCg023562
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 2 Feb 2005 16:21:52 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22DACDA45
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Feb 2005 16:21:46 +0000 (GMT)
Received: from zeta.dmz-eu.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55F927599D
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Feb 2005 16:22:36 +0000 (UTC)
Received: from mail1.clb.st.com (mail1.clb.st.com [164.129.68.17])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D00B47645
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Feb 2005 16:22:35 +0000 (GMT)
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4200FE17.30B38D9C@st.com>
Date: Wed, 02 Feb 2005 17:21:43 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
	<1100978366.7949.38.camel@localhost.localdomain>
	<1100988787.7949.46.camel@localhost.localdomain>
	<1102604262.6694.17.camel@hades.cambridge.redhat.com>
	<41B88622.4BCD78EC@st.com> <41C02F29.92D2B5A@st.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle HAMMACHE wrote:
> 
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

After some thinking I wrote a smallish patch to correct 
this part of the problem (edited below to show the full
function). If there are no objections I will commit it
this week-end. The wbuf semaphore is locked only after
the first checks, I don't believe this can cause trouble
because the wbuf is not freed once it is allocated
and the later checks are enough to prevent copying
a wrong wbuf contents.

The other case I mentionned (no erasing block so
jffs2_do_reserve_space tries to flush the wbuf)
seems impossible - we would not have allowed writing
in this case.

bye
Estelle


 int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, u_char *buf)
 {
 	loff_t	orbf = 0, owbf = 0, lwbf = 0;
 	int	ret;
 
 	/* Read flash */
 	if (!jffs2_can_mark_obsolete(c)) {
-		down_read(&c->wbuf_sem);
 
 		if (jffs2_cleanmarker_oob(c))
 			ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
 		else
 			ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
 
 		if ( (ret == -EBADMSG) && (*retlen == len) ) {
 			printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx) returned ECC error\n",
 			       len, ofs);
 			/* 
 			 * We have the raw data without ECC correction in the buffer, maybe 
 			 * we are lucky and all data or parts are correct. We check the node.
 			 * If data are corrupted node check will sort it out.
 			 * We keep this block, it will fail on write or erase and the we
 			 * mark it bad. Or should we do that now? But we should give him a chance.
 			 * Maybe we had a system crash or power loss before the ecc write or  
 			 * a erase was completed.
 			 * So we return success. :)
 			 */
 		 	ret = 0;
 		 }	
 	} else
 		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
 
 	/* if no writebuffer available or write buffer empty, return */
 	if (!c->wbuf_pagesize || !c->wbuf_len)
-		goto exit;
+		return ret;
 
 	/* if we read in a different block, return */
 	if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) 
-		goto exit;
+		return ret;
+
+	/* Lock only if we have reason to believe wbuf contains relevant data,
+	   so that checking an erased block during wbuf recovery space allocation
+	   does not deadlock. */
+	down_read(&c->wbuf_sem);
 
 	if (ofs >= c->wbuf_ofs) {
 		owbf = (ofs - c->wbuf_ofs);	/* offset in write buffer */
 		if (owbf > c->wbuf_len)		/* is read beyond write buffer ? */
 			goto exit;
 		lwbf = c->wbuf_len - owbf;	/* number of bytes to copy */
 		if (lwbf > len)	
 			lwbf = len;
 	} else {	
 		orbf = (c->wbuf_ofs - ofs);	/* offset in read buffer */
 		if (orbf > len)			/* is write beyond write buffer ? */
 			goto exit;
 		lwbf = len - orbf; 		/* number of bytes to copy */
 		if (lwbf > c->wbuf_len)	
 			lwbf = c->wbuf_len;
 	}	
 	if (lwbf > 0)
 		memcpy(buf+orbf,c->wbuf+owbf,lwbf);
 
 exit:
 	up_read(&c->wbuf_sem);
 	return ret;
 }
