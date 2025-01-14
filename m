Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0593CC02183
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlmUoPYUmFB1wRDUe/DQwhGMwezZsKmDkGSvBuHqFYo=; b=hGBx9hmAHx2NWz
	8NgZPXxAP9fUzfaDQfMO+fDvJbkEeJ+TCvGBFWQrFfKEV+Bipm1bUmSVF1M0UBhjDfWgPziIOc7sz
	ZNnwxdYUtURORq1LbQp0dNlzg8iqa79vt3TFR1L4q6Iz/HUKGHC/QY587wEoeLnoNCNaJf+GSDplx
	zuYYItZPX9R9iB/UqwECmytZk1y+DtITtY2g+zrCOmYxjhCO5899z+/rz7YUtmk7zYBSWx3whdKDP
	1CXkL/GFIPcgBIFlHznGVo8Yd2WzqlL0OoKybnFy1X381son2x6inConsuq0NIYUQI1DkYJP+A/rI
	15eNNRfu0wm+7Zl8en0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgVe-00000008Se4-3lp6;
	Tue, 14 Jan 2025 12:59:06 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgUk-00000008SYO-1RHu
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 12:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736859490; x=1768395490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kxAoaj5aWo5znfnGjLu/P2YOXL+a99GY6jbbceTDTeQ=;
  b=XSKTy3k/TWhQn0x2vq8GKgiBoqMXCqCeJLsId+589uajH28PaPaG0D9h
   OjDOPhgyObMn8uzjsfNhPa8e6iRHBXJM4BR4AATwsk+No/LO1q3SGdli2
   fJgGATbfL3F1vvLy1gyXfGaFnEGV09G3FH9Q6/fvsVWrNb0t/bArWNFuk
   ZnxbyEVggNWYpHK4H8g0QUEHJcsXNPDxwuhVU7cTg1B4KdPCSTP7XNTRh
   LPSBuc0PJ/M+0N+GUtkPxi6s58kRqdbjuqfU/wOrxx02f0ZP0kXP7VSCf
   3nBDJdfbcFwYu2pp/bl2ZfCnYyb38eMJx5YXQho4EP71P4OQ+XroocPCP
   g==;
X-CSE-ConnectionGUID: TLLs8gtfR66rsUGSctIZHw==
X-CSE-MsgGUID: jWhkfVdtT5Oxt/gTGhyw0A==
X-IronPort-AV: E=Sophos;i="6.12,314,1728943200"; 
   d="scan'208";a="41042266"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Jan 2025 13:58:06 +0100
X-CheckPoint: {67865F5E-3-31397509-E321C4C4}
X-MAIL-CPID: 2C366D73D57A7C6B648CB932145AEB1F_0
X-Control-Analysis: str=0001.0A682F24.67865F5E.003D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFC72160ABF;
	Tue, 14 Jan 2025 13:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736859481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxAoaj5aWo5znfnGjLu/P2YOXL+a99GY6jbbceTDTeQ=;
	b=LBBrO/U00sR4FG7n06ALJwmNZ9H3rPMh97Ch7VTA/N6wS9gnjtLiHwD7ictcX3VPj2yXZQ
	J6MNIsavuTmB29XFlaILQw9OxumS23x9ByYn9fBRbkSOxRHJDJJgQF+c0TtNAhWJs/PahE
	/TlK9Q84Cf3vSgxRV9EUws9b85GMAxet0x1qCsq79vx+LHtsedk1SMpXUg6bI84ADatCcA
	NJVpOgDObqYQnITGN9KJZjE/AkdlNgoWCTGlEmOuFjrVgX+UhADIbwmWYLgmKulEYDRfIc
	tmkK6WGsQHiyJEXqahWOyCUYx1ebQLtLsYa8EDBupCd3FtF732BOJAAeyaNo5A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org, Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Tue, 14 Jan 2025 13:57:59 +0100
Message-ID: <3342163.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241112075242.174010-2-linchengming884@gmail.com>
References: <20241112075242.174010-1-linchengming884@gmail.com> <20241112075242.174010-2-linchengming884@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_045810_876477_82485C20 
X-CRM114-Status: GOOD (  19.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello everyone,

Am Dienstag, 12. November 2024, 08:52:42 CET schrieb Cheng Ming Lin:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> =

> The default dummy cycle for Macronix SPI NOR flash in Octal Output
> Read Mode(1-1-8) is 20.
> =

> Currently, the dummy buswidth is set according to the address bus width.
> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
> dummy cycles to bytes, this results in 20 x 1 / 8 =3D 2 bytes, causing the
> host to read data 4 cycles too early.
> =

> Since the protocol data buswidth is always greater than or equal to the
> address buswidth. Setting the dummy buswidth to match the data buswidth
> increases the likelihood that the dummy cycle-to-byte conversion will be
> divisible, preventing the host from reading data prematurely.
> =

> Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")
> Cc: stable@vger.kernel.org
> Reviewd-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f9c189ed7353..c7aceaa8a43f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  		op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
>  =

>  	if (op->dummy.nbytes)
> -		op->dummy.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
> +		op->dummy.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
>  =

>  	if (op->data.nbytes)
>  		op->data.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
> =


I just noticed this commit caused a regression on my i.MX8M Plus based boar=
d,
detected using git bisect.
DT: arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
Starting with this patch read is only 1S-1S-1S, before it was
1S-1S-4S.

before:
> cat /sys/kernel/debug/spi-nor/spi0.0/params
> name            mt25qu512a
> id              20 bb 20 10 44 00
> size            64.0 MiB
> write size      1
> page size       256
> address nbytes  4
> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_=
BP
> | HAS_SR_BP3_BIT6 | SOFT_RESET
> =

> opcodes
> =

>  read           0x6c
>  =

>   dummy cycles  8
>  =

>  erase          0xdc
>  program        0x12
>  8D extension   none
> =

> protocols
> =

>  read           1S-1S-4S
>  write          1S-1S-1S
>  register       1S-1S-1S
> =

> erase commands
> =

>  21 (4.00 KiB) [1]
>  dc (64.0 KiB) [3]
>  c7 (64.0 MiB)
> =

> sector map
> =

>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+----------
>  00000000-03ffffff |     [   3] | no

after:
> cat /sys/kernel/debug/spi-nor/spi0.0/params
> name            mt25qu512a
> id              20 bb 20 10 44 00
> size            64.0 MiB
> write size      1
> page size       256
> address nbytes  4
> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_=
BP
> | HAS_SR_BP3_BIT6 | SOFT_RESET
> =

> opcodes
> =

>  read           0x13
>  =

>   dummy cycles  0
>  =

>  erase          0xdc
>  program        0x12
>  8D extension   none
> =

> protocols
> =

>  read           1S-1S-1S
>  write          1S-1S-1S
>  register       1S-1S-1S
> =

> erase commands
> =

>  21 (4.00 KiB) [1]
>  dc (64.0 KiB) [3]
>  c7 (64.0 MiB)
> =

> sector map
> =

>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+----------
>  00000000-03ffffff |     [   3] | no

AFAICT the patch seems sane, so it probably just uncovered another
problem already lurking somewhere deeper.
Given the HW similarity I expect imx8mn and imx8mm based platforms to be
affected as well.
Reverting this commit make the read to be 1S-1S-4S again.
Any ideas ow to tackling down this problem?

Best regards,
Alexander
-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
