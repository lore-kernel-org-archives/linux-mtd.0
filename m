Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2254C433EB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 08:39:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD8D20674
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 08:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0pbedUGT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD8D20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GmgMsNcm0KPoFVDabwRS17BGjXRggDhTdSBDlXCJEik=; b=0pb
	edUGT+PzByu7Z/VXmP3Coj7oFJXYXK3VZV9exTzY3Oeh1n26AaBR0/+89zWcfoyfPnlCnscXf+CGm
	QSZJ0ii6dNGcshBDxDRK8ZKNJTFvbfz6510DreemRw9ae/8sx8kFDOjPG24ega+yTdF1qXhxbNbOg
	lU4VjkT0f2G7AD/Qhhi+8j1F4J59EjFMtDlo//LlmO4TIfqPQ+tkY4G0cqoEerUALBLxu4Ja3gGYN
	ehtiuhIP3v7BoVKE9MwlXQC81qScANM0FiMY2ZndtT970pbTFBWag6q3zmN4Qg4g4LTUwYUMJRDAW
	f+nO0JYKG9rg6tNb7OeAOtYykxyfgbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jytDw-0000CC-6a; Fri, 24 Jul 2020 08:38:36 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jytDq-0000AO-BU; Fri, 24 Jul 2020 08:38:31 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 614BF1C0BD2; Fri, 24 Jul 2020 10:38:26 +0200 (CEST)
Date: Fri, 24 Jul 2020 10:38:25 +0200
From: Pavel Machek <pavel@ucw.cz>
To: trivial@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, narmstrong@baylibre.com, nishkadg.linux@gmail.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: oxnas: cleanup/simplify code
Message-ID: <20200724083825.GA31437@amd>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_043830_517367_28258F4B 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============0539975431059509596=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0539975431059509596==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify oxnas_nand_probe.

Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>

diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas=
_nand.c
index 8d0d76ad319d..f44947043e5a 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -144,8 +144,7 @@ static int oxnas_nand_probe(struct platform_device *pde=
v)
 		if (err)
 			goto err_cleanup_nand;
=20
-		oxnas->chips[oxnas->nchips] =3D chip;
-		++oxnas->nchips;
+		oxnas->chips[oxnas->nchips++] =3D chip;
 	}
=20
 	/* Exit if no chips found */

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8angEACgkQMOfwapXb+vJBYQCgwXVjv8KuArzkxb1gBBAOEO3z
IeMAn2E3CEeCAZ+t6WDFpNLo9z8KWf/n
=VmJN
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


--===============0539975431059509596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0539975431059509596==--

