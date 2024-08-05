Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB18C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VZyFAkZvDVGhKbu1vDHLpxB/UJ+HkpCDixpgosjNcM=; b=2BoD6GM30rdG4HmYKQFo048yej
	l1XN+fwIzAPezVuhSTtxhvBD5UgfwNjJtIJc2xfrmJQb3QeQwdPX+LjRBM4CLSp/jHTtmrlOJPELs
	d7wtTbCzDKXCT19NZTp/mxtoT35ZCr37IX3nk1/+GKvZwy1GnkCTRQ8vbNAtT0kbCPtSjIdJraR4y
	3siB+W+G296SpbsMShUlDjNb38UXjVo90cvlK2CQsB/ILXyT98iE9+yGV4Fyb8W0kUAFI/MpLkjnJ
	a6a65FkwbePL+KsjqcsNfoGwGBAVMlt279yLDLbrq6ekaOuH4EFiH8jYQarjCHD2QDbJGzp/w1e5H
	gNS/wolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satiF-0000000FE45-4Apd;
	Mon, 05 Aug 2024 09:09:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satiC-0000000FE3Y-1Jad
	for linux-mtd@lists.infradead.org;
	Mon, 05 Aug 2024 09:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5698CCE09CF;
	Mon,  5 Aug 2024 09:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E90C32782;
	Mon,  5 Aug 2024 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722848940;
	bh=uYKxe8/EbRJuDMthlZxzxe0Y0NLFzd7scfGIG1do5JQ=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=AC8f9Swg3Mg0jRKjaLzo0TppN6I+dEaeGr3jqH1JYH1dYTvQYZWwnpa4K4vK5aYFb
	 Z6I7vXBb4ejhp9AHARVGEUcrDereCj7QAJmLiT87UIuv4CiCBKjKtIrwSfrlBho+Jc
	 iVy0NAQt+lI8hSJIFb9dcnsOcqdl1asE9AiNUij86LLF9SpBvh/V2myUFGsges1zlF
	 BTpOQSuyNeyCfAIVYcRnTpaAeWs7xc5PS/wJx3qWf8GEdIhMS1qwW8ht04p+eLH4Qm
	 dvS+MXNDNWR5L9KhC74t27Lph4gceT+yelx7kxa4toSXcShPf+qs3wMVOxTVLpxk32
	 /sb00vs+2cn6A==
Date: Mon, 05 Aug 2024 11:08:56 +0200
Message-Id: <D37UZ77FNRUP.3K7M4O4K2WZF3@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "A. Zini" <alessandro.zini@siemens.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/3] Add support for Cypress/Infineon cy15b102q
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <20240729102016.8527-1-alessandro.zini@siemens.com>
In-Reply-To: <20240729102016.8527-1-alessandro.zini@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_020904_549950_8E89B018 
X-CRM114-Status: UNSURE (   7.40  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3204804699793281853=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3204804699793281853==
Content-Type: multipart/signed;
 boundary=0c9526eb18c3dbda83e97de5ed4edae8afa71eb9525fe5abc4ef5b9f0d21;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0c9526eb18c3dbda83e97de5ed4edae8afa71eb9525fe5abc4ef5b9f0d21
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> This patch series introduces support for Cypress/Infineon cy15b102q, a 2M=
bit
> serial SPI F-RAM device.

Have you had a look at drivers/misc/eeprom/at25.c? There is already
support for the cypress,fm25.

-michael

--0c9526eb18c3dbda83e97de5ed4edae8afa71eb9525fe5abc4ef5b9f0d21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrCWqRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ic0AF/fNL4/iPKLA4PUWW42lONAjMgHuqSbubl
xFAtaiZC25m42HABqhrCTHNpTrAwlKZRAX40k8KxwsV0/aFHxOZAfpLZmThv1CuR
Q1pCOQYzcWsUfPBwU8H36cNm03rVtlRBfpQ=
=LzfP
-----END PGP SIGNATURE-----

--0c9526eb18c3dbda83e97de5ed4edae8afa71eb9525fe5abc4ef5b9f0d21--


--===============3204804699793281853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3204804699793281853==--

