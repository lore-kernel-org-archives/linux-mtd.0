Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC50C5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAsSSGsLBJP3mum8Ka3wGnHfFIH+VGOj3HpjUzm2w40=; b=rD4riDoVPJSscO1Y7cDRbrxRGz
	zjJa3gO+TeroVFK037g+Njgo+L0l7269rw4oODjK7LZzMnx2ONGzlhoG+i4Msi2bJr/VUCBKo7zFc
	65jgfeFX5TeKw/6lJXsEIY8E712d22qfowSIiFtjVwZnwRduMzaSBMcJbbIfSdfcigBYggTVnTe6Z
	tMYF/ga0ynlGmPFkec24Utu9LNrFWfDUzEsljrEsZgtdJb+0xzJkbg+xMp9IKcMo7efScx1EF+vD9
	En/gQzXknMaNADdDjdo/xjMK4Y1Kl5z8Af45BEG1fwQCHw3K8zTh4y416cdFixjSoecT5S7qekxN5
	ILx9JU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZb-00000002SDS-05hk;
	Fri, 14 Aug 2026 09:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZZ-00000002SBi-0i8o;
	Fri, 14 Aug 2026 09:51:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 5C59C600C3;
	Fri, 14 Aug 2026 09:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8FC691F000E9;
	Fri, 14 Aug 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701092;
	bh=yKwWlv1KBBDVcGlVvYQaRm4OQYG5+7xIMGwbAKrSt58=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=dBQ5yEWG5cMXYljpEvVc9W/72QRI2W+NaM/8gpARQFmOdu62rAaQ+RWQ8ixuTQ5WF
	 2w/gpLl9YQ8uP5i+ihSr8IqRz+sMcjIl4RDqAtyUtGBtwYdzd0uls5uzp3K5WzZC1I
	 roQnI3P/7iYgiAmpVKc3HP1vmRe/Hiqh1oSzeXsrtNMjCNpkrSiGXXz19CgzLsOYPM
	 xfxm0psvux9MBq9qR7sHjfKEMyGsPoOcsY3icAiMQZ8cab0w5oFWgb2xr7SJ5cJLzX
	 FMSHQI38H4vgt0OLrBF3ohGMNnYXjpQlRNvACwyNxJPduSFkiUHT/zxN02H4H60ptK
	 mz5Dy+2wMlmIQ==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:51:28 +0200
Message-Id: <DKOKOCLARP0E.12YCLA6X5CZLG@kernel.org>
Subject: Re: [PATCH v3 17/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-M
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============0117108730845482008=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0117108730845482008==
Content-Type: multipart/signed;
 boundary=6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lIBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iKUgF/drf5qwyJjnPwmEPk4RJL7i6CfQOL+3Nt
9b22BGkw7DuISaYohvZa9zIyAEaAoGaqAX485MjHM21TT2CXQEfM59C4EDBkCUFv
ARUz9cR0p0qznCSrqlL6H7TADS6j7z7/arw=
=xrbX
-----END PGP SIGNATURE-----

--6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47--


--===============0117108730845482008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0117108730845482008==--

