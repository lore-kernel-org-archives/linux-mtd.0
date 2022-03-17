Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E1DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiTH1oCYXAODltqoVobh3V692hjYQI2ZKvdT2r4ccyY=; b=GLR1V9CPEzvOvGDrNyNfN8q5rV
	90tKaI9jjVJq4IYw5BKEIf/Z9a3VqVmnRFEe38wohgii4Ga6XkliMLCUTU1JuV0Q3wwRaVyLcjcAL
	TmUd3zMT9WyZcHQKHZzMEyWtNn9GoHuZa9GPIcsO9O2mCbytGQ7B8Rr8SF0VQCe/LfLxEIX6poVT7
	WDDVxMsdHJGNzSVrq4eQTF/cGFlZBiIk3msg5ObaDhj1TuSTyMgMPKinCdynT+Wp7C4fCaQvl30XY
	yomDmXpt+cCUuIXT95WwRf2kp6kPiFZkIA5AcQaOSgg0VG38hk5fUIst4suOvcxN8BaE6orO24FfK
	pbZkwOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmY1-00FXXB-RA; Thu, 17 Mar 2022 09:35:57 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmXx-00FXUz-PO
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 09:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=M1kfGq35Txrk2/WrFn9836CKxulS
 Oplyo3itJGzIWE4=; b=uXofC98gbVT4ydrsrX5gFPPoKnGP/6ko4aJu+gGeEemb
 qbvsr3V6SDd1BJ8TfF3i1GnVBm7NbVKI1Ba4uCwoLmaFFUuIWOySo4FvwqyJtJlz
 Ec0faaMo0ZUwaCmAoGiZUD+sMQLoDRop5iBkWmldGcytdxDM9mhvJD+nM+XZZfg=
Received: (qmail 3395135 invoked from network); 17 Mar 2022 10:35:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 17 Mar 2022 10:35:45 +0100
X-UD-Smtp-Session: l3s3148p1@OP0ewWbaYs0gAQnoAEd5ADwsgXkBgqk7
Date: Thu, 17 Mar 2022 10:35:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Lad@rox.of.borg,
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual mode
Message-ID: <YjMA8TuXWj3HvQkD@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Lad@rox.of.borg,
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <27107f2d578b198078df841ee2e4d7b71b183898.1647017136.git.geert+renesas@glider.be>
 <31a776ed-3371-55d6-747b-8e70e72619d7@canonical.com>
MIME-Version: 1.0
In-Reply-To: <31a776ed-3371-55d6-747b-8e70e72619d7@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_023554_151451_5AFB87C3 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6702790100768904728=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6702790100768904728==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncIMMMuhdN5FBkyZ"
Content-Disposition: inline


--ncIMMMuhdN5FBkyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Some reviews and tests will be useful. Anyway it's too late upcoming
> cycle, so I will pick it up after merge window.

We just discussed on IRC a better solution. So expect a new patch for
this issue. Thanks!


--ncIMMMuhdN5FBkyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIzAO0ACgkQFA3kzBSg
KbZeSQ/+MMP9kyqwgaotyBIzZLr6O0gU5dbxHE74xNpiw7rr5PZ9YUswaMGLygJV
BVmc3GfYxm7acBfKA7voUvAVPsLx0p06kTutWWZ8xiFoRsm/3a/v+r81jl9n2atY
B91VTUco3ZXhYRyiNWoy7ChIHf+/XUzeookt/+CTnMvirTeUprLcESyJ3+X+KwfC
/L3kBy1MrrBVLImocz8xhHo6YmiNupujT5kmFqskkPdAnbYkQKXXuGKFQ2Ff6hc/
4DxCCinV1dc8RjvYhLNHFyhdXPZ+wz6FX+mhhoXgddyzx2y2QnSyeQtfTjK0e41b
23yritvWTnHgmvjjf8lZs5sExsOx8zUS9QRyUvLQciL+7MzqPAyzZ9LuzT8rLG3M
L5Zt/aLUIuSBU7AiVs/JS4+83n4PqOBCObb1xalSFI4kq7Bk7yDOXMGBUMQhPLF5
3iVKR/+4mlrAlRb967YwN6bn/SNFGMLfQ1QH456X6QLpORxfXY3Lu7b1hDANTbrV
D66nO/3PPwn/u6fGEnLeA2o4c06vsaVegYZzUe/5kd74OHxBA6XNLV7j7JqFe1ZS
3O7usINcPdSM+Fe5GIBN61CCLfnUwvP+kSjTJHdpwHoY9HEi2IImKIGdeEHGNlg2
3xRFm/dTmKsm2IckwBInpvo9ldoTUKR8RxoHJ+xGoMemBVKjLE8=
=nfHW
-----END PGP SIGNATURE-----

--ncIMMMuhdN5FBkyZ--


--===============6702790100768904728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6702790100768904728==--

