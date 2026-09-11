Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C5BC79FA1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFxg3YVhbWwVIjiXD3x4vEf/Wu2feyvWXnfRA+HWZn0=; b=e/Kkb0eIwUzujgJgpgL4YWLQ7B
	IYSueMnOMRGZmx60NgweAJnvCU8hcXq6W07z/uifdAZypZSe2g5DsOSv0iQ53uhMFEG8ixKSYNtc4
	7swrgl6BbDekKTXXTfZR+sw9+xFLiOEmSgxc4iM2m/Aw3xYxf81ebOcfWfG6DWcirCXANhDYY1Mxe
	cXCW2ZyThbkm/jCYqT5Td+thznpaOSVk79JrKX1Pyg8jLCCWnUnijHEBrjjVoqd20taszmPBsHYMn
	msOm5pK1NdcgKoN6e/PNlGY4S1SsEqwXuWWrObt1df2hgLr6H/ouLsbGWNfDta2BaDaNbY1D0tMUs
	INVV8fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wKD-0000000G66c-29Xq;
	Fri, 11 Sep 2026 08:09:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wKB-0000000G66J-3GZQ
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 08:09:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 2C45143C7F;
	Fri, 11 Sep 2026 08:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 891FE1F000FF;
	Fri, 11 Sep 2026 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789114171;
	bh=C/bSmY3dussktX4XXEfGa3xLo4YHGuzrmx2ufGQXu50=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=ABkeFsR8RRtD+1Vun7xe2fHSqIREw+siG1VKDK5hpnMUXpt1K7U6LtxHk5CemAhUL
	 LdL0DB/Pr1jruWSxvsbxvmZWj5AmCUKL02hbBfNzBeh+e1rQV+HbJptlmWsEleWIuK
	 v0imTqdKQOPCLlEzh9ydJEuhI+n3MUvuddeDz4oRoC4Op3yn9mYITdPiwnIXOXkMbD
	 7fsL5gnZsdWi+lAPXOz/okxISoYki7JaaiqvToDp+A59tKocMGyJOIi5dbZ92Oc2Rk
	 wlKDjLC+fqA/35sVoiXCVSqgGp+Il4WMNupgM6z3l6hqW/Y++9U/ol/lYM1dvm9Bie
	 rskzWyquJKolA==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 10:09:27 +0200
Message-Id: <DLCC1HX0HX8Z.1X4CEDDDVRQ58@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sanjaikumar V S" <sanjaikumarvs@gmail.com>, <pratyush@kernel.org>
Subject: Re: [PATCH v5] mtd: spi-nor: Fix SST AAI write mode opcode handling
Cc: <hd@os-cillation.de>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <sanjaikumar.vs@dicortech.com>, <stable@vger.kernel.org>,
 <tudor.ambarus@linaro.org>, <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260331095026.38-1-sanjaikumarvs@gmail.com>
In-Reply-To: <20260331095026.38-1-sanjaikumarvs@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7455821755215704912=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7455821755215704912==
Content-Type: multipart/signed;
 boundary=450039049a878f99262beedcb50f43df13d2c89635805f68d2b59f1390f8;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--450039049a878f99262beedcb50f43df13d2c89635805f68d2b59f1390f8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Mar 31, 2026 at 11:50 AM CEST, Sanjaikumar V S wrote:
> From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
>
> When the SPI controller lacks direct mapping support, the fallback path
> in spi_nor_spimem_write_data() uses nor->write_proto based operation
> template. However, this template uses the standard page program opcode
> set during probe, not the AAI opcode required for SST flash.

So it looks like that mtd->_write override in sst.c is rather
hacky..

> Additionally, controllers that do support direct mapping will also use
> the wrong opcode since the dirmap template is created at probe time
> with the standard page program opcode.
>
> Fix this by:
> 1. Checking the nodirmap flag in spi_nor_spimem_write_data() to ensure
>    the code falls through to spi_nor_spimem_exec_op() path which builds
>    the operation at runtime with the correct program_opcode.
> 2. Setting nodirmap=3Dtrue for SST AAI devices in sst_nor_late_init() to
>    disable dirmap and force the runtime opcode path.

I'd be fine with disabling dirmap support as a workaround. But I'm
not sure if we are supposed to change the nodirmap property as that
is a property owned/set by the controller.

Could we just compare the mtd->_write =3D=3D spi_nor_write and then skip
the dirmap support? With a big here be dragons warning.

-michael

--450039049a878f99262beedcb50f43df13d2c89635805f68d2b59f1390f8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqO3NxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gjMwGA5E7TquopeYXl0SpjG/PWzgt0kUtU/ZoQ
uzs6pbnl1rGqJR84IXbMXDJGThX4Udh8AYDu9tBGaN9gWgZdAdaYkjYte1mBv8w4
uvUdV+6z5WEYqoZDxG/J67/LhpXNUcHEdi8=
=4Zdr
-----END PGP SIGNATURE-----

--450039049a878f99262beedcb50f43df13d2c89635805f68d2b59f1390f8--


--===============7455821755215704912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7455821755215704912==--

