Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA70DC5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZ9YvJTdwvHh8m/jGG5Adovq+54IWqmJAPatkkqVSps=; b=I7UREFnT6U6Haq+lbQd03sr/av
	tvwbbhhy8ib15fb73pC8LIo2avV1uuQA9a4Y0BuuG9j3c84HlRVqi2nhG1vcz8gpa3QeB9USJVwTH
	d5zgrqrxhjauuBdHRNcahhecG6jef8buLwnOQjIn+OzVdiLDHLRUNmJAcP0d7el7XczVOeczEdwx7
	BSPmfJbAqEOVqO3K2KshFpjiqtpfFdcKVWatThV5y6KDkeoE/ldhmj5vks7mDSXPsCGqiCJ56++6M
	lpUNwqHNgML17AGTjQpwy2SQQCXkc054ZWQubJK2OnopzG057Rl3uCqkCnKlK1pu5EpZO764vJn7D
	6VHFYF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoW3-00000002RU8-2F1c;
	Fri, 14 Aug 2026 09:47:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoW1-00000002RTK-1XVi;
	Fri, 14 Aug 2026 09:47:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CB019600C3;
	Fri, 14 Aug 2026 09:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 011A01F000E9;
	Fri, 14 Aug 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700872;
	bh=pNSlvDwfkqL67d3nSwlphGmC0ZNFVWwfipL6aC61x2E=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=eD9y1M6G5UpTxC0nnV+kvA/MXb3TuYjlwhkk+pK8Jd5HtC25z2oLcjEnqonUUm95e
	 wbQWHTFEdoocLreSTkAWOglulFANn5lBs9R/YTZnJxRc4ftTxKo88unq0BHas3PNFg
	 Pd3jFyzZA/m3JVuvARpZGWQR8+HiTUqrULxRWz3mV1qeKoMQb5cD6y+8/HSxUY26sK
	 lEEp1l0gPNgtSYvd+KMLIqLbVYot9AOhkK8ytN75/jvt0g5IHleaE3I3LCZ/B+CLRf
	 bLqt7vKiHYfsmOkZ4kF3jEV6npb2N6KaTX7E0q/7dot/1ht5hMY63OrcuJ6mZ8x/CP
	 3FB7NVpW3MlqA==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:47:48 +0200
Message-Id: <DKOKLJVLFN8J.2M6H2X3LPF04J@kernel.org>
Subject: Re: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6893961401756026094=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6893961401756026094==
Content-Type: multipart/signed;
 boundary=750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f
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

Reviewed-by: Michael Walle <mwalle@kernel.org>


--750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kRRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gZvAGA9WT5E0JXnbHC7KGtcjS3UY/jU0O5hEY5
ljw/KJbO9LHU00NMKlUmQjJPd0MFAmw9AX9wQzkDDfSfzrVrHlBTWBkWAPyEKIpA
Pd+m5QkDCSyNTuMaFKy0xKkqagmn60FDCq8=
=S/rt
-----END PGP SIGNATURE-----

--750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f--


--===============6893961401756026094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6893961401756026094==--

