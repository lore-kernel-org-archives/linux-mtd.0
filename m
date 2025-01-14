Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622EEE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmBwsGixjCKuUIxr2EzwZvaSQ/Pid+JRUg8x7SMiUi4=; b=p8vT+b1MoPEzsh
	+2m0PRgmXRpvzWVLarlHTOydPKE5fPcE2bAVEHg/RJELgnvPw6SFpiydEXz4QcjqXNZeSsC92kIpC
	JDbU8MVL68rEossqpNZCMISl4yM7qkTXeszAVnryXEcuz+YPYYkw6aKkZAKQpsjlVoUhWsCZeRmCp
	MRGrdTzJsiP3ZyTjJyVMpwDy5QLKQskotynQYe4rm/KW9Zz67guilDDOYVruph+cXeBqu+zlw6dZh
	lDppJJOaAjU6Aa/EYHgxNclYPBGxKBndm04fjKbsI6EG5Gr37J6TIPm2RCkXwPfCJmSsLjZiEmElu
	C0WvK6t5chPUim4JkFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjid-000000091UL-3WkB;
	Tue, 14 Jan 2025 16:24:43 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjib-000000091Tl-07me
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 16:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736871881; x=1768407881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=39dVf0Tb0fckv4UPirWil96f+ziUJtDlcOjzF/ZAKhQ=;
  b=cbAzqhaIzjMcXGGF9CzGxg3qS2IQZZJXnSwC36Ud3E+8Wrd/KQQrUc9d
   TgCAUXSQqS3C83iM+QATwgMrt3VhYUlI/vLFqZLYScGqt3ncrfsMPHQ/U
   urfvmFCE7K4MTi74SYHxSlWuDjrGSW0Dn5Mr5UaJkBisiIHpAnq4s3W7i
   czasctjlok27kymDr4qNqTQEPpdKYcs1AnFauRe0joNIFWbLFZFkfdMJl
   z2ubUVOf9PYaKCbA3cKmn4E41M/0Y8bkAHT1equnMH+QnMl8U9kycW+o4
   nwJeR0ZP7qspeo2UCJ/xAz6atBb+/UAG0oCKmzRQYpQGR/r4FQlPjTOzN
   w==;
X-CSE-ConnectionGUID: OXSJm04TSmWgqkeplEc0ew==
X-CSE-MsgGUID: Td7csQGBQomFzwXILfKdfQ==
X-IronPort-AV: E=Sophos;i="6.12,314,1728943200"; 
   d="scan'208";a="41047167"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Jan 2025 17:24:38 +0100
X-CheckPoint: {67868FC6-12-1CE016C0-E589DA3E}
X-MAIL-CPID: A189C402A519FB2DCE8FDD4064935AF3_1
X-Control-Analysis: str=0001.0A682F1C.67868FC7.000A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EE681691A5;
	Tue, 14 Jan 2025 17:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736871874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39dVf0Tb0fckv4UPirWil96f+ziUJtDlcOjzF/ZAKhQ=;
	b=UgGDKLwZHj6xCzHqavdmXYZqlqxeU64reflfx/mGDvC8UVNdojAGjaweJYhmoG1lVHf31A
	6/EiyWhCFrrll20Tc+LkPBJJ/4mBa434wYUxsfuZEcTqEq1SsyDF976aVtteY6n/tJdQwm
	22Dmc0w1vrDRQsaeEKxrGSED8c4bBleQllsfk4UhQUAMtfP7MofNjfZhvEH9oEfxqFQOUu
	I9imW0UJibd4M7fQv1UcCfOpaxbmthY+bNT78FPZ4qNuK6TRhoygyLWyvUTIz+i4iv19MT
	p83bhr6fkzYX8VqPiLAOtFDUEMSTDNebiDBj1pnTxB95ShAeKjCAGDlvAnj/Rw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org, Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Tue, 14 Jan 2025 17:24:32 +0100
Message-ID: <7762352.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a6a9dfce-6cac-4831-9c96-45471f5ee13a@linaro.org>
References: <20241112075242.174010-1-linchengming884@gmail.com> <3342163.44csPzL39Z@steina-w> <a6a9dfce-6cac-4831-9c96-45471f5ee13a@linaro.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_082441_568198_D791C36F 
X-CRM114-Status: GOOD (  31.80  )
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

Hi Tudor,

Am Dienstag, 14. Januar 2025, 14:26:47 CET schrieb Tudor Ambarus:
> On 1/14/25 12:57 PM, Alexander Stein wrote:
> > Hello everyone,
> =

> Hi,
> =

> > =

> > Am Dienstag, 12. November 2024, 08:52:42 CET schrieb Cheng Ming Lin:
> >> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >>
> >> The default dummy cycle for Macronix SPI NOR flash in Octal Output
> >> Read Mode(1-1-8) is 20.
> >>
> >> Currently, the dummy buswidth is set according to the address bus widt=
h.
> >> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
> >> dummy cycles to bytes, this results in 20 x 1 / 8 =3D 2 bytes, causing=
 the
> >> host to read data 4 cycles too early.
> >>
> >> Since the protocol data buswidth is always greater than or equal to the
> >> address buswidth. Setting the dummy buswidth to match the data buswidth
> >> increases the likelihood that the dummy cycle-to-byte conversion will =
be
> >> divisible, preventing the host from reading data prematurely.
> >>
> >> Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")
> >> Cc: stable@vger.kernel.org
> >> Reviewd-by: Pratyush Yadav <pratyush@kernel.org>
> >> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >> ---
> >>  drivers/mtd/spi-nor/core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index f9c189ed7353..c7aceaa8a43f 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *n=
or,
> >>  		op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
> >>  =

> >>  	if (op->dummy.nbytes)
> >> -		op->dummy.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
> >> +		op->dummy.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
> >>  =

> >>  	if (op->data.nbytes)
> >>  		op->data.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
> >>
> > =

> > I just noticed this commit caused a regression on my i.MX8M Plus based =
board,
> > detected using git bisect.
> > DT: arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > Starting with this patch read is only 1S-1S-1S, before it was
> > 1S-1S-4S.
> > =

> > before:
> >> cat /sys/kernel/debug/spi-nor/spi0.0/params
> >> name            mt25qu512a
> >> id              20 bb 20 10 44 00
> >> size            64.0 MiB
> >> write size      1
> >> page size       256
> >> address nbytes  4
> >> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4B=
IT_BP
> >> | HAS_SR_BP3_BIT6 | SOFT_RESET
> >>
> >> opcodes
> >>
> >>  read           0x6c
> >>  =

> >>   dummy cycles  8
> >>  =

> >>  erase          0xdc
> >>  program        0x12
> >>  8D extension   none
> >>
> >> protocols
> >>
> >>  read           1S-1S-4S
> >>  write          1S-1S-1S
> >>  register       1S-1S-1S
> >>
> >> erase commands
> >>
> >>  21 (4.00 KiB) [1]
> >>  dc (64.0 KiB) [3]
> >>  c7 (64.0 MiB)
> >>
> >> sector map
> >>
> >>  region (in hex)   | erase mask | overlaid
> >>  ------------------+------------+----------
> >>  00000000-03ffffff |     [   3] | no
> > =

> > after:
> >> cat /sys/kernel/debug/spi-nor/spi0.0/params
> >> name            mt25qu512a
> >> id              20 bb 20 10 44 00
> >> size            64.0 MiB
> >> write size      1
> >> page size       256
> >> address nbytes  4
> >> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4B=
IT_BP
> >> | HAS_SR_BP3_BIT6 | SOFT_RESET
> >>
> >> opcodes
> >>
> >>  read           0x13
> >>  =

> >>   dummy cycles  0
> >>  =

> >>  erase          0xdc
> >>  program        0x12
> >>  8D extension   none
> >>
> >> protocols
> >>
> >>  read           1S-1S-1S
> >>  write          1S-1S-1S
> >>  register       1S-1S-1S
> >>
> >> erase commands
> >>
> >>  21 (4.00 KiB) [1]
> >>  dc (64.0 KiB) [3]
> >>  c7 (64.0 MiB)
> >>
> >> sector map
> >>
> >>  region (in hex)   | erase mask | overlaid
> >>  ------------------+------------+----------
> >>  00000000-03ffffff |     [   3] | no
> > =

> > AFAICT the patch seems sane, so it probably just uncovered another
> > problem already lurking somewhere deeper.
> > Given the HW similarity I expect imx8mn and imx8mm based platforms to be
> > affected as well.
> > Reverting this commit make the read to be 1S-1S-4S again.
> > Any ideas ow to tackling down this problem?
> > =

> =

> My guess is that 1S-1S-4S is stripped out in
> spi_nor_spimem_adjust_hwcaps(). Maybe the controller has some limitation
> in nxp_fspi_supports_op(). Would you add some prints, and check these
> chunks of code?

Thanks for the fast response. I was able to track it down.
Eventually the buswidth check in spi_check_buswidth_req fails.
For command 0x3c:
Before revert:
> mode: 0x800, buswidth: 2
After revert
> mode: 0x800, buswidth: 1

The mode is set to SPI_RX_QUAD. Thus the check for dummy buswidth fails
now that data_nbits are used now.

For command 0x6c it's similar but op->dummy.buswidth is 4 now.

It boils down that there are SPI controllers which have
> spi-tx-bus-width =3D <1>;
> spi-rx-bus-width =3D <4>;
set in their DT nodes.

So it seems this combination is not supported.

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
