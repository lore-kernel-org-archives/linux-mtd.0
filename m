Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F13C388F9
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 00:15:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245CF2075E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 00:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="neEy5Ye/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="p9GgvFOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245CF2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ThCaVsiTkYhZ+tU6Dr7VlL6XusodPxcBdFV0ejKcn/Q=; b=neEy5Ye/EsIlZZHqRorxEXPi7
	2gtQycmuKZ9Q9WtLOEI+hOmqxYPVyXQ/ALGWixSxmDtOY8Gx5Fr02WjHbGPuscqwFufa8MuJ0+r+H
	nHHja7gctDeIbklyLDemb/Hf6YS0L//k1KA9od/mnncThPm8UQ6MwozLEOqjJym0FypO4S3L7mo41
	wX73vpf1rAMEQeww0GYOtyXMajFiySv2RENaKis9drzrii9cftsyoYBxty48eHJVLj5zZDmJyqFBI
	j4w9r/ZwdqlRW9mVAjLCfDbZgkfCFCkZmz7MpI2tVAGoh4HR8P5QmJBYIVLhmQDo4Mf9kPsWUZOSf
	M52NiP4zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgd1T-0001wC-JL; Sun, 22 Nov 2020 00:14:31 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgd1Q-0001ub-5h
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 00:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1606004062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cj1wngFCjk9djvKAy6t7nyB6kZBenske4zVZclaXmf8=;
 b=p9GgvFOLiTjeB7wfQltS1U9sTEiL7DS9dQsDHKZ+EedzMXgkr/fYuzhvXSIfpGJS5ng+Et
 sHM0lTcdZ34pBmNz+BUUHbjBADzOeDuou0Wd+h2+2FoHy8jPGcagStZirclEaEEUhtDB03
 Y2OqOc3x9U01n3z6ZiUDY47vXWfUEW0=
From: Sven Eckelmann <sven@narfation.org>
To: linux-mtd@lists.infradead.org, John Audia <graysky@archlinux.us>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
Date: Sun, 22 Nov 2020 01:14:14 +0100
Message-ID: <7171837.EvYhyI6sBW@sven-edge>
In-Reply-To: <20200429165347.48909-1-rminnich@google.com>
References: <20200429165347.48909-1-rminnich@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_191428_572149_C6B02540 
X-CRM114-Status: GOOD (  21.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Ronald G. Minnich" <rminnich@gmail.com>, Richard Weinberger <richard@nod.at>,
 Ron Minnich <rminnich@google.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="===============7038700796320429993=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7038700796320429993==
Content-Type: multipart/signed; boundary="nextPart3334135.iIbC2pHGDl"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3334135.iIbC2pHGDl
Content-Type: multipart/mixed; boundary="nextPart3563161.kQq0lBPeGt"; protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Sven Eckelmann <sven@narfation.org>
To: linux-mtd@lists.infradead.org, John Audia <graysky@archlinux.us>, Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org, Ron Minnich <rminnich@google.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Ronald G. Minnich" <rminnich@gmail.com>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or more colons
Date: Sun, 22 Nov 2020 01:14:14 +0100
Message-ID: <7171837.EvYhyI6sBW@sven-edge>
In-Reply-To: <20200429165347.48909-1-rminnich@google.com>
References: <20200429165347.48909-1-rminnich@google.com>

This is a multi-part message in MIME format.

--nextPart3563161.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 29 April 2020 18:53:47 CET Ronald G. Minnich wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Looks like some drivers define MTD names with a colon in it, thus
> making mtdpart= parsing impossible. Let's fix the parser to gracefully
> handle that case: the last ':' in a partition definition sequence is
> considered instead of the first one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ron Minnich <rminnich@google.com>
> Tested-by: Ron Minnich <rminnich@google.com>
> ---
>  drivers/mtd/parsers/cmdlinepart.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)

This change broke OpenWrt booting on some IPQ40xx devices. Here for example 
the parts of the cmdline which the u-boot on an OpenMesh A62 sets 
automatically:

    root=31:11 mtdparts=spi0.0:256k(0:SBL1),128k(0:MIBIB),384k(0:QSEE),64k(0:CDT),64k(0:DDRPARAMS),64k(0:APPSBLENV),512k(0:APPSBL),64k(0:ART),64k(custom),64k(0:KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive) rootfsname=rootfs rootwait

This is then parsed by newpart as: KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive)

And of course, this results in:

    mtd: partition has size 0
    [...]
    /dev/root: Can't open blockdev
    VFS: Cannot open root device "31:11" or unknown-block(31,11): error -6
    Please append a correct "root=" boot option; here are the available partitions:
    1f00           32768 mtdblock0
    (driver?)
    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(31,11)
    CPU1: stopping
    CPU: 1 PID: 0 Comm: 

This affects OpenWrt since the commit d6a9a92e3217 ("kernel: bump 5.4 to 
5.4.69") because this change was backported to Linux v5.4.69. Reverting 
this change fixes the problem for me.

And if I see it correctly, this is also affecting the kernel (4.14) for
the OpenWrt 18.06.x + 19.07.x branch because it can also be found in
there as part of the v4.14.200 release.

Another workaround is to replace the first "(" with a NULL too. See the
attached patch for the one which I used to fix the OpenWrt bootup.

Kind regards,
	Sven
--nextPart3563161.kQq0lBPeGt
Content-Disposition: attachment; filename="499-mtd-parser-cmdline-Fix-parsing-of-part-names-with-co.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="499-mtd-parser-cmdline-Fix-parsing-of-part-names-with-co.patch"

From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 22 Nov 2020 00:48:33 +0100
Subject: [PATCH RFC] mtd: parser: cmdline: Fix parsing of part-names with colons

Some devices (especially QCA ones) are already using hardcoded partition
names with colons in it. The OpenMesh A62 for example provides following
mtd relevant information via cmdline:

  root=31:11 mtdparts=spi0.0:256k(0:SBL1),128k(0:MIBIB),384k(0:QSEE),64k(0:CDT),64k(0:DDRPARAMS),64k(0:APPSBLENV),512k(0:APPSBL),64k(0:ART),64k(custom),64k(0:KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive) rootfsname=rootfs rootwait

The change to split only on the last colon between mtd-id and partitions
will cause newpart to see following string for the first partition:

  KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive)

Such a partition list cannot be parsed and thus the device fails to boot.

Avoid this behavior by making sure that the start of the first part-name
("(") will also be the last byte the colon search algorithm is using for
its mtd-id search.

Fixes: eb13fa022741 ("mtd: parser: cmdline: Support MTD names containing one or more colons")
Signed-off-by: Sven Eckelmann <sven@narfation.org>

diff --git a/drivers/mtd/parsers/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
index 0625b25620ca766318ea4646a6e3761ff4d3a4cc..22881ea4c132ea5a5ba7aebd025d91bf1cd023af 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -218,7 +218,7 @@ static int mtdpart_setup_real(char *s)
 		struct cmdline_mtd_partition *this_mtd;
 		struct mtd_partition *parts;
 		int mtd_id_len, num_parts;
-		char *p, *mtd_id, *semicol;
+		char *p, *mtd_id, *semicol, *open_parenth;
 
 		/*
 		 * Replace the first ';' by a NULL char so strrchr can work
@@ -228,6 +228,13 @@ static int mtdpart_setup_real(char *s)
 		if (semicol)
 			*semicol = '\0';
 
+		/* make sure that part-names with ":" will not be handled as
+		 * part of the mtd-id with an ":"
+		 */
+		open_parenth = strchr(s, '(');
+		if (open_parenth)
+			*open_parenth = '\0';
+
 		mtd_id = s;
 
 		/*
@@ -237,6 +244,10 @@ static int mtdpart_setup_real(char *s)
 		 */
 		p = strrchr(s, ':');
 
+		/* Restore the '(' now. */
+		if (open_parenth)
+			*open_parenth = '(';
+
 		/* Restore the ';' now. */
 		if (semicol)
 			*semicol = ';';

--nextPart3563161.kQq0lBPeGt--

--nextPart3334135.iIbC2pHGDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl+5rVYACgkQXYcKB8Em
e0YAow/+OnDWfvCurCi8ygHDUV1smV8NZQOfvjDB1giE16VqOjfewFrEFiXi+Pvu
kNBrmkh7GrGHjCCu2RwkXG5g8+TOtDpuU5gcZ7QsnPgsfbg38dIY9hi8R+NiMy2a
P4xKQUlyib0+OICZ8YIbn19IrmuMpVBk5sMOjMpUQR6uwAvID3nPCtWPFEuNIjVc
xLenU2X+iFDZn9oc5JlC9iM0xFOmuXjZWYxTuZloxsCepXVC8jUBZsm7yXgFRrCm
+PJApU5IZrLIy5uYtI+nPxbp/c34tjXTGDJuUNMuWU63cegBYfRIUr0fcSURBHcJ
sEg194GAuuLvuXmLQaMg9kFtAMkfCz8770ZmkXKSAGFWHhT/F5EAoT3m5HTuppFP
TbdmHuh8AGyk4KULXdJLSAo5bOnkxXEDRU34uxGBU9ub95HsS15nxjlagW05VPRN
kNNKW9mRzgUvAhm7g4D94apzSXNCpcPzzAAR1lJg1r3SH1spTuK7AqcjlGsvB6oe
e6UhbBgxTPEVShVcO+t6XuEtaqPw5KHuyeKi9hc9D49kHxD2Q994fJVJX1fH9nEf
7BoeuDahz4IgIf1RMW55k+TVY4i+Bf0Kbsrdbq/RRcSrK2R0e6OluSDSYiFyY1PS
mdbEh6upSSHcr/O0DWr7+DJivjrNdtIhIRFj7T7vwh0z6vVEiWs=
=I0FK
-----END PGP SIGNATURE-----

--nextPart3334135.iIbC2pHGDl--





--===============7038700796320429993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7038700796320429993==--




