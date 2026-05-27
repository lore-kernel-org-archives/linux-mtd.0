Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A2CCD5BD5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttRCrcdSfjBKudDVKQwHcPNl+yW38Vqb3jxvVdjOiec=; b=OwkqWMA+2bJTuakG9vWM93LeQi
	/LX/Nphl0JFPu1D4q/e4sStOqYv2ApdzILNrhnBpAyB1UluY7v/sAyggKDE1Fou1MW1TZFBV8SosV
	AVNZP5eLAS85gk8msUlRQt6b04Htdqm8YXc7R/XgPyD5xv3LveyBp1DLViiFQ+SQoy3m8xmHLLhl5
	hbIloL6Z6umkEV1xXN4Ns5xZVY5coAusEKEMsPrhkO7devg1wbHhUTWcHF5EELrPuGngZVujvrCOF
	FHC76+3FLq+xdLOmKcSVjLbWi3AGLn9TBSgIxFbM7T1a8H3u8MctQbZpmnw/grtDh1B1iCdTi57tG
	jAG0cVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAjp-00000003f7E-2cf8;
	Wed, 27 May 2026 09:39:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAjm-00000003f75-1W03
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:39:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id A28E8600AB;
	Wed, 27 May 2026 09:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CB49F1F000E9;
	Wed, 27 May 2026 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779874781;
	bh=2Bn8gyGPiQfqOVs/pmI51tKekDBHNiAdwq0QNIiWMuA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=NVTpfAM0m4jFfIrgtl0zbjKt9gs8LgTxImjH14j7fhnBUh0xAbf3ecAqhFMctX8HN
	 EnxFRO7sZPsqksJPC2HAYDRU0IDNqAt2WVB9keAUUV1oGUK6vFpfBiFDRLH36LZp+/
	 owRvMd8K3VwnUnAlrPQ74XEySqyzdzaAoC5rjMalhzSz+pt9eL4u+CSY9RDlBdSoDt
	 jtY5SeA8dYT6MnwpNxU29dgNBYkmwtOSrjoP3qCn8mJMwaByk3r754tSEnM98IawPQ
	 KR74AwpdYVbM8AJz5IusfNENKGf6xEqYRHYHy8TicYerzS1yIdh1j92clw02DfMRQb
	 HSY5PPlxlM8aA==
Mime-Version: 1.0
Date: Wed, 27 May 2026 11:39:35 +0200
Message-Id: <DITCY7X2NFWI.2SUAC9UISD6X3@kernel.org>
Subject: Re: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for
 GD25LQ255E
Cc: <Takahiro.Kuwano@infineon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Weimin Wu" <wuweimin@huaqin.corp-partner.google.com>
X-Mailer: aerc 0.20.0
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com> <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org> <792c09f5ae754bf899693f110ef1dbe0@infineon.com> <DHXX61QRBDVA.2VIO2J63UKZC3@kernel.org> <CAB2WukQjU=ik5fom=5B=C_R-Tsxwcx+Y78ON5qZt6zAtV7sjhg@mail.gmail.com>
In-Reply-To: <CAB2WukQjU=ik5fom=5B=C_R-Tsxwcx+Y78ON5qZt6zAtV7sjhg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2937995299116164836=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2937995299116164836==
Content-Type: multipart/signed;
 boundary=6bfe5e8538d6e204e18c56b1fc8128ca6cdeffe03cd19cc553cd77f8f655;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--6bfe5e8538d6e204e18c56b1fc8128ca6cdeffe03cd19cc553cd77f8f655
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue May 26, 2026 at 3:30 PM CEST, Weimin Wu wrote:
> Hi, sorry for the late reply.

Please do not top post, see https://docs.kernel.org/process/submitting-patc=
hes.html


> I consulted GD's engineers, and they replied that jedec_id=3D0xC86019
> corresponds to several FlashROM models: GD25LQ255E, GD25LB256F,
> GD25LQ256H, GD25LE256H, and GD25LR256F. It has been confirmed that we
> are currently using the GD25LQ256HYIGR chip, and the corresponding
> datasheet is https://download.gigadevice.com/Datasheet/DS-01085-GD25LQ256=
H-Rev1.3.pdf.
> It seems that the model I previously read as GD25LQ255E using Google's
> tool was incorrect. I used .flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP
> | SPI_NOR_HAS_TB | The SPI_NOR_TB_SR_BIT6 configuration verification
> passed Google's flashrom_tester program test, indicating that
> read/write and write protection meet the requirements. For these
> reasons, I will modify the title and remove the description of the
> name; therefore, I will submit a separate patch v4 update. Thanks.


No this won't work. You have to find a way to differentiate between
all these flashes with the same id because the locking is different.
As you've noticed, one needs the SPI_NOR_4BIT_BP and one doesn't. So
either way, it's wrong. You'll need to have a fixup which needs to
detect that particular type at runtime and fix the locking.

So please work with GD's how to fingerprint a particular flash
using it's SFDP data (which is hopefully different between the
devices).

-michael

--6bfe5e8538d6e204e18c56b1fc8128ca6cdeffe03cd19cc553cd77f8f655
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaha71xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j0JAGApFOJ3KSjj8a527xSNZW5E5k88pjfCe/M
kt6wJV+caFKtC/rd8pCj415maLPQmssmAYC1EK1y0XrAO0NDusJP3WBg/+ROTpZ6
ajKzaTy1kiE01QI6UkqAaLc61+cFFXlWkqE=
=jmtf
-----END PGP SIGNATURE-----

--6bfe5e8538d6e204e18c56b1fc8128ca6cdeffe03cd19cc553cd77f8f655--


--===============2937995299116164836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2937995299116164836==--

