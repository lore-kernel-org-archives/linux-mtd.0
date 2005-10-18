Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERlTr-000123-VP
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 03:01:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 237025E57AF
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Oct 2005 09:01:44 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B2865A.dip0.t-ipconnect.de
	[84.178.134.90])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 594FB5E411A
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Oct 2005 09:01:42 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id C58211E014A
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Oct 2005 09:01:05 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 18 Oct 2005 09:01:03 +0200
References: <b1c6420f0510142011i28bee950s3827e341452430ba@mail.gmail.com>
In-Reply-To: <b1c6420f0510142011i28bee950s3827e341452430ba@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510180901.03326.hs4233@mail.mn-solutions.de>
Subject: Re: [PATCH 1/4] util/jffs2reader compile fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Index: Makefile
> ===================================================================
> RCS file: /home/cvs/mtd/util/Makefile,v
> retrieving revision 1.59
> diff -u -p -r1.59 Makefile
> --- Makefile	7 Sep 2005 08:34:57 -0000	1.59
> +++ Makefile	10 Oct 2005 07:31:58 -0000
> @@ -16,7 +16,7 @@ TARGETS = ftl_format flash_erase flash_e
>  	jffs2dump \
>  	nftldump nftl_format docfdisk \

You did not attach your patch, but put it inline into your e-mail. So you 
cannot do "Save Attachment", which would do all the de-MIME-ification. If I 
save the whole e-mail, I get this output:

Index: Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/util/Makefile,v
retrieving revision 1.59
diff -u -p -r1.59 Makefile
--- Makefile=097 Sep 2005 08:34:57 -0000=091.59
+++ Makefile=0910 Oct 2005 07:31:58 -0000
@@ -16,7 +16,7 @@ TARGETS =3D ftl_format flash_erase flash_e
 =09jffs2dump \
 =09nftldump nftl_format docfdisk \

And "patch" (patcher/quilt/whatever) doesn't like this. :-(
