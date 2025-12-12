Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD1D44149
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDRse/IkEx6eQUGp+eTF0dsdZf2XzD4FKWj+vCYfChU=; b=CX99X0a/eljnJ7Nw92PBKrxYVd
	Jja/oi/7O0DrX60NaIynUtFyfor78X1bU4Ufs3d3wPeNy/jk0+H0s0EiO2w0dVSpolglOkF4d9cBI
	33bTOA3F6VLwRnzSrv6yD3lS8ZJychTP+KW5Qn+8RIL6R31Cch1jAL0/5B9jC9nQpWlM3TBER6/ce
	p7lQdD4IkPOl6bS1mqqwE76urqa1rp9Ub+HiAhdpfelwZdW4xsIwLtlZu5QkP35q4xaQQ8ML/zd7l
	2+TcW/u/RJ1m+tuKL5UbxzrORIPjKhInijDYnNkEjM0trT73ZXSWYJfFer23dphjteGpLva7Fpn45
	xFAD6SeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyby-00000000H6b-20MD;
	Fri, 12 Dec 2025 08:34:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTybw-00000000H6T-43bb
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 08:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9BC0600C3;
	Fri, 12 Dec 2025 08:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BC0C4CEF1;
	Fri, 12 Dec 2025 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765528486;
	bh=1PoCoI/iDulrDrCBG+dRMcgiy7qUslVONnQjTC1K6B8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=PtYSTgqQXlaD4uASHYQ+jFFe7vFU6jbOxC+csC2IniERZeEH1qMeOYw4/eAJhW1o2
	 cq/4dDOWI5QmqgBT1Oy6rKzSiTjAY1g5h14aGAkOZznSo4NNiUi+iKgHCYZWm9haeZ
	 +8Pmoo/7pO8DFAVKEbGUh/VHpfQBxDofha99unrKpu2o9JX3eZgS2G31Oe8idElCrf
	 tAnTc4/2DTAf0mbDE5CDfFI/uX9kF3VClY0NVleNVynNbMulGNG3iJvg02SPpwY22e
	 SeWhfQjBzsutsUbV32LykwU+8W1cWluzQQsQW8XzdSN+01rC8GFfb3cdtrkaiKx0II
	 SkqnkeZaUg3Aw==
Mime-Version: 1.0
Date: Fri, 12 Dec 2025 09:34:41 +0100
Message-Id: <DEW3M3BQEGIW.3AFGPPSCBGI16@kernel.org>
Subject: Re: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <han.xu@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Haibo Chen" <haibo.chen@nxp.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20251212-nor-v1-1-20a5a381979c@nxp.com>
In-Reply-To: <20251212-nor-v1-1-20a5a381979c@nxp.com>
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
Content-Type: multipart/mixed; boundary="===============2092691684218348942=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2092691684218348942==
Content-Type: multipart/signed;
 boundary=3a447c79091588e2a94044d6d01cf0e8baa40503869af63b848f49e4df49;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3a447c79091588e2a94044d6d01cf0e8baa40503869af63b848f49e4df49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Dec 12, 2025 at 9:30 AM CET, Haibo Chen wrote:
> This reverts commit 44dd635cd632824f412ff2a6b320d9302a277ad0.
>
> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. To make all batches of mt35xu512aba work well and
> support OCT DTR mode, back to hardcode the flags.

What are "batches" in this case? A new revision of the same flash
chip? Why would they use a different ID then.
What's wrong with the parsed flags? Both support SFDP, so if you
really need to fixup any flags, please use a fixup callback to
actually fix them. But first, what will go wrong?

-michael

> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> mt35xu512aba chip with label 4KA17 RW303:
> root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# cat jedec_id
> 2c5b1a
> root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# cat manufacturer
> micron
> root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# hexdump -Cv sfdp
> 00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........=
0...|
> 00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |............=
....|
> 00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..........=
....|
> 00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............=
. ..|
> 00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a......=
..'=3D|
> 00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p.=
.P..|
> 00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.........=
....|
> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |............=
....|
> 00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.....=
....|
> 000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |............=
....|
> 000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |............=
....|
> 000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |............=
....|
> 000000d0
>
> mt35xu512aba chip with label 0DA15 RW303:
> root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# ls
> jedec_id  manufacturer  sfdp
> root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat jedec_id
> 2c5b1a
> root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat manufacturer
> micron
> root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# hexdump -Cv sfdp
> 00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  |SFDP........=
0...|
> 00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..........=
....|
> 00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............=
. ..|
> 00000050  0f 52 00 00 24 5a 99 00  8b 8e 03 e1 ac 01 27 38  |.R..$Z......=
..'8|
> 00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 b0 38 36  |zuzu...\..p.=
..86|
> 00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000080  43 0e ff ff 21 dc 5c ff                           |C...!.\.|
> 00000088

Thanks!

-michael

--3a447c79091588e2a94044d6d01cf0e8baa40503869af63b848f49e4df49
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaTvToRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hZmgGAhPjGan8Un+Viv7qOmKS+fdhnb/3Hrob0
vdlrD71Loer2dAjqQJIqW78LDjaApxKfAYCZAMOLSAt6K1oxrqEQE6bC74C5SEIc
YqRLmzwFwKRkZPsUknGWy6sDPpuOaPjDgrQ=
=JjRL
-----END PGP SIGNATURE-----

--3a447c79091588e2a94044d6d01cf0e8baa40503869af63b848f49e4df49--


--===============2092691684218348942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2092691684218348942==--

