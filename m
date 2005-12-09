Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EkWGK-0006n3-TZ
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2005 19:37:28 -0500
Received: by zproxy.gmail.com with SMTP id i11so768098nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Dec 2005 16:37:23 -0800 (PST)
Message-ID: <782515bb0512081637o1f21fef7n5b5e783a22c8d21a@mail.gmail.com>
Date: Thu, 8 Dec 2005 18:37:23 -0600
From: nishanth menon <menon.nishanth@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <782515bb0512081433y3b08fd8dwd7deba25088ed822@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <782515bb0512081433y3b08fd8dwd7deba25088ed822@mail.gmail.com>
Subject: Re: Query Regarding the check_node_data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> <snip>
> I dont see how this is valid(may be my understanding is faulty here).
> Since we resize len (len <=3Dcsize), and request for mtd-point for len,
> the check for (retlen <tn->csize) will be true and unpoint will be
> called(along with the warning)!!
Dont know if this patch is accepable.
--- 2.6_kernel/fs/jffs2/nodelist.c.orig 2005-12-08 18:36:04.000000000 -0600
+++ 2.6_kernel/fs/jffs2/nodelist.c      2005-12-08 18:36:39.000000000 -0600
@@ -436,7 +436,7 @@
         * adding and jffs2_flash_read_end() interface. */
        if (c->mtd->point) {
                err =3D c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
-               if (!err && retlen < tn->csize) {
+               if (!err && (retlen !=3D len)) {
                        JFFS2_WARNING("MTD point returned len too
short: %u instead of %u.\n", retlen, tn->csize);
                        c->mtd->unpoint(c->mtd, buffer, ofs, len);
                } else if (err)

Regards,
Nishanth Menon
