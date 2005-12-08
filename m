Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EkUKs-0004wS-JD
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2005 17:33:59 -0500
Received: by zproxy.gmail.com with SMTP id i11so747171nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Dec 2005 14:33:57 -0800 (PST)
Message-ID: <782515bb0512081433y3b08fd8dwd7deba25088ed822@mail.gmail.com>
Date: Thu, 8 Dec 2005 16:33:57 -0600
From: nishanth menon <menon.nishanth@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Query Regarding the check_node_data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

One more beginner's query regarding the handling of check_node_data
(fs/jffs2/nodelist.c)

         /* Calculate how many bytes were already checked */
         ofs =3D ref_offset(ref) + sizeof(struct jffs2_raw_inode);
         len =3D ofs % c->wbuf_pagesize;
         if (likely(len))
                 len =3D c->wbuf_pagesize - len;
<snip>
         ofs +=3D len;
         len =3D tn->csize - len;

<snip>
 #ifndef __ECOS
         /* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
          * adding and jffs2_flash_read_end() interface. */
         if (c->mtd->point) {
                 err =3D c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
                 if (!err && retlen < tn->csize) {
                         JFFS2_WARNING("MTD point returned len too
short: %u instead of %u.\n", retlen, tn->csize);
                         c->mtd->unpoint(c->mtd, buffer, ofs, len);
<snip>
I dont see how this is valid(may be my understanding is faulty here).
Since we resize len (len <=3Dcsize), and request for mtd-point for len,
the check for (retlen <tn->csize) will be true and unpoint will be
called(along with the warning)!!

Can some one throw a bit of light at this. I see this code in CVS as
well as the linux git tree too.. So I suspect this as some
understanding error on my part..

Regards,
Nishanth Menon
