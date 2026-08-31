Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FABDC61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rPphfXHjDF00i6UNPS5Vkx9+HKbamwa17GLGYZo3rU=; b=TnbbmsriuRe/VbpWvu2Fl5iCbw
	96XBOsv1+fnAm+qmS/z9lLjyJadSjR46dQ7bpULzmfRDwLBQrfSaghHge+VuNxHx7IPbRLJWnLqgb
	Fod2HEKJ21VhDSu9JzGw+zBUPh73z6ISzZwN2Dkd7+8TgScNINERnICiUkiwaqiyQ3m0k6iI5y3WF
	12sXSNHR5DypnO2kG1PfhpjmrYM41vWDuh8aDKlmcvmIBVGiAmscks/82FuC0pQLau6/fp1XASJiv
	fsNIvD9Yu76bNC1IeMngWQDGtAwblZMUawRTFT0OSNOjzpkbGS6fSA366Zc2kVMro0PetjhwTT2Pb
	ngXAaS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11cx-00000009LzU-1pDQ;
	Mon, 31 Aug 2026 13:00:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11cw-00000009LzH-0t7F
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 13:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C801E41288;
	Mon, 31 Aug 2026 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 287931F000E9;
	Mon, 31 Aug 2026 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181240;
	bh=LccMWHwKeNmBt5/n07sCdFGBtusyOXIFYHFflnDLqvA=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=FLgHCqzxbqKrYSvv1tmT3a5UKLzs9NUdK9AKQiHCw9o36tzIr/dV7TVZGPUdE2Dy8
	 r5ZpBM5Hsb4Ce7UJZJ8c0qM6d8SrsUZWgio4jttTy89LjZHNmtZMfJJdFNqw8Z8i27
	 s08tF/cBL8p2VIdqcXcnBQY8NgaXrM7epnlyJzs0p+gxtDycOf+nUG9Zp7bSXA/bst
	 v6+iqd+M9t8Aa7CiSzzZDQ+xpVRk/CymchL1V1SMadSMPopPmzrHO4r1v86qMUllTV
	 pLVySKfEPCp31YnRw8m5p9KoVBSle3qhEdUeWZVRVoQZrbR2N4vr17gxJW4evQuZAS
	 HRBU8vx5lDzXw==
Mime-Version: 1.0
Date: Mon, 31 Aug 2026 15:00:36 +0200
Message-Id: <DL35CFJ3BXZ1.2RE00JYDZKXXU@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Report platform enforced SPI flash write
 protection
Cc: <tjakobsen84@protonmail.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com> <DL34V3WU5UY1.3FYYB7UPWYY83@kernel.org> <20260831125526.GJ124825@black.igk.intel.com>
In-Reply-To: <20260831125526.GJ124825@black.igk.intel.com>
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
Content-Type: multipart/mixed; boundary="===============3215989823768473830=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3215989823768473830==
Content-Type: multipart/signed;
 boundary=d55e914e04fb4ece455ae1e1571756b36266d056b52f931a1c322b7d976b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d55e914e04fb4ece455ae1e1571756b36266d056b52f931a1c322b7d976b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Aug 31, 2026 at 2:55 PM CEST, Mika Westerberg wrote:
> Hi,
>
> On Mon, Aug 31, 2026 at 02:37:59PM +0200, Michael Walle wrote:
>> Hi,
>>=20
>> On Mon Aug 31, 2026 at 2:05 PM CEST, Tobias Jakobsen via B4 Relay wrote:
>> > Patch 2 adds the only user, spi-intel, which already computes protecte=
d
>> > range state at probe but has had no way to expose it since the SPI MEM
>> > conversion removed its visibility of the MTD device.
>>=20
>> Where was it removed, though?
>
> After the SPI MEM conversion the driver is a regular SPI driver so it can
> only use spi_new_device() to add and configure the SPI-NOR chip (via
> platform data, struct flash_platform_data). Prior this it was creating th=
e
> MTD device itself.

Yeah, but it never exposed the _is_locked() op, right?

-michael

--d55e914e04fb4ece455ae1e1571756b36266d056b52f931a1c322b7d976b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCapV69RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jAFgGAiFgQYm7EIaJ9tj+3pgn9H/Kd3nsSinNu
gxLBHL8eYoUknmaw/7ZZ+4RD3WlGpKZTAX9IcgVNg/qj0kKts6FgERhU7YiR6PH4
db+oZKWRvC0XXedaqzqD69aXQQhY5p+rC7c=
=IYD5
-----END PGP SIGNATURE-----

--d55e914e04fb4ece455ae1e1571756b36266d056b52f931a1c322b7d976b--


--===============3215989823768473830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3215989823768473830==--

