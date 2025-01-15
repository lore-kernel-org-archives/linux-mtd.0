Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEABC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 06:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1j+htCUGnSBtZ70YAAjbHx3jK7NKB2cxNkWulFNUjw=; b=bhwAEebEum41uB
	boO7i3/1bu8k/azXuUpouaci/R82Kmnc6aGnToI27IvxTND26qAaHiskHxkxfs1Pis68Hl4Bal8uj
	x0fTjDd6Wl4yRj+eVZVS2cKXbesugxy2fuKWWTqJI2p44nqx3xHrZlr/xhd6QJ3Dmgmh5mGvnNH3l
	AkE1QmT6fRoJtCGNyM211Mnb2qGLlmvvaFLioJO6kSTo5Vj4ppq29ANbowLY/xNaqcCVGE7NZCgGc
	Fx1PnjfcRkup/l27lCOCHxdUNX7vD10FfoagfRl1GZuAjt5emqKZytTegceY7zCf2j99xSEjeXJrJ
	klvJly44TP8+p58aSJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxIW-0000000Arpp-1RtC;
	Wed, 15 Jan 2025 06:54:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxIB-0000000Armt-3wly
	for linux-mtd@bombadil.infradead.org;
	Wed, 15 Jan 2025 06:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cUh82Ypecrl42cm19wZgKhQaors0qjkO/giiuR2KOqk=; b=Pfrr0l3+ko6q0UgPLLtHDaXqeC
	XV2SI5aErA1H6HfT3IO4HEBQM6qlytu45mxTp3xHpPU9lRxOszk5rL9u4QtpGmBqOu6501z5LATt1
	av+i2tidbFG2Vm18j2uKq7AJFELpScOlzg3q3y59EywbybP078jBXZ7Oy3l925507BYYOE6XFiuTd
	/aISlCazHvGLNyuUmoZ0S9AgFGwUa7YhpmQ7udUOZeMFPyp8+LXwbmeOItR/91vlt/okfjgKnFuKz
	ZOhprYQzxOp8hlkXZbp5Oo3+UQIBBaKORdbg+gV6FSXYG9fPpnR/sb2RiE2a09Q08oAFwUaruKpKc
	mCgWD4+g==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxI8-0000000An1x-2khu
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 06:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736924056; x=1768460056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cUh82Ypecrl42cm19wZgKhQaors0qjkO/giiuR2KOqk=;
  b=J+W7raK4oT5MHqsIeVn0Y6P15+fYLJ+MUW/9zuncJ7YjxWBtCGSz7OBg
   cXP7IJyw1UeKlyesNJzSR1h0YvVW58ZVMLtPmFo6rudgGs0mp6hHWcbGL
   xy8vM5flhkbkF5SotthQ6iD5Z+BAwfpjPrGEBrjWIeNGhhxffIvqGNSM3
   31Uup97nv8Ip0G5nx/RD1H/Kbn5GALCTpq1WvItAXetCCMjZbzmKRgtSt
   E7IJtXTuSNmeUfbhD7CpoxyV9cf0dMliC/uIrtGre+udGPGl190OR6sib
   1kSiPCfFfB5uUOuFQPehsUyeAJz8NPfxGvAlciuC4BCz/WorzIG5ezbVg
   w==;
X-CSE-ConnectionGUID: 1WshnoaVT36nA8K3g80jsA==
X-CSE-MsgGUID: aTM2Kga9RAil/liCSJl1gw==
X-IronPort-AV: E=Sophos;i="6.12,316,1728943200"; 
   d="scan'208";a="41055585"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Jan 2025 07:54:11 +0100
X-CheckPoint: {67875B93-18-31397509-E321C4C4}
X-MAIL-CPID: C9F704F06C0285F836D8E8AB81EE47DB_0
X-Control-Analysis: str=0001.0A682F1F.67875B93.00A3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFC8516A91B;
	Wed, 15 Jan 2025 07:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736924047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUh82Ypecrl42cm19wZgKhQaors0qjkO/giiuR2KOqk=;
	b=Iu71vKgiqzPeJH2V5TD89VCu81IqxFpUJh0ZjRuZMm1udrUNMOetIU98aqDmll81DBdoGj
	syCmskQyC6VZxt/UVaY2g8G+rvolsJ3UnjYjHporp7F9oqHOltc35GHIM4heGM5h/bdhXG
	ERZNuN1rnGKePM5VDgQeJLy2yjN5MuuOOa1p1QYMcdT+qECWzfkkGgMVh7EayTBhAIFtTh
	QaKJmGKSUyXbSNG/bEBXRe+UzXF/z7fxxNxElcfYGU/7jMU6XWh9MhoU0U0zsZb5VJU/hy
	0bfVwKZVHQ1ElN/0W5b2ukQA3SAkq4AfVf4NBHAMx2Y3wYsWtD4392vPt9zVFw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org, Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Wed, 15 Jan 2025 07:54:05 +0100
Message-ID: <9397238.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <mafs0zfjt5q3n.fsf@kernel.org>
References: <20241112075242.174010-1-linchengming884@gmail.com> <3342163.44csPzL39Z@steina-w> <mafs0zfjt5q3n.fsf@kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_065416_998656_BB9C3D3B 
X-CRM114-Status: GOOD (  38.63  )
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

Hi Pratyush,

Am Dienstag, 14. Januar 2025, 17:15:24 CET schrieb Pratyush Yadav:
> On Tue, Jan 14 2025, Alexander Stein wrote:
> =

> > Hello everyone,
> >
> > Am Dienstag, 12. November 2024, 08:52:42 CET schrieb Cheng Ming Lin:
> >> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >> =

> >> The default dummy cycle for Macronix SPI NOR flash in Octal Output
> >> Read Mode(1-1-8) is 20.
> >> =

> >> Currently, the dummy buswidth is set according to the address bus widt=
h.
> >> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
> >> dummy cycles to bytes, this results in 20 x 1 / 8 =3D 2 bytes, causing=
 the
> >> host to read data 4 cycles too early.
> >> =

> >> Since the protocol data buswidth is always greater than or equal to the
> >> address buswidth. Setting the dummy buswidth to match the data buswidth
> >> increases the likelihood that the dummy cycle-to-byte conversion will =
be
> >> divisible, preventing the host from reading data prematurely.
> >> =

> >> Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")
> >> Cc: stable@vger.kernel.org
> >> Reviewd-by: Pratyush Yadav <pratyush@kernel.org>
> >> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >> ---
> >>  drivers/mtd/spi-nor/core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> =

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
> >> =

> >
> > I just noticed this commit caused a regression on my i.MX8M Plus based =
board,
> > detected using git bisect.
> > DT: arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > Starting with this patch read is only 1S-1S-1S, before it was
> > 1S-1S-4S.
> >
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
> >> =

> >> opcodes
> >> =

> >>  read           0x6c
> >>  =

> >>   dummy cycles  8
> >>  =

> >>  erase          0xdc
> >>  program        0x12
> >>  8D extension   none
> >> =

> >> protocols
> >> =

> >>  read           1S-1S-4S
> >>  write          1S-1S-1S
> >>  register       1S-1S-1S
> >> =

> >> erase commands
> >> =

> >>  21 (4.00 KiB) [1]
> >>  dc (64.0 KiB) [3]
> >>  c7 (64.0 MiB)
> >> =

> >> sector map
> >> =

> >>  region (in hex)   | erase mask | overlaid
> >>  ------------------+------------+----------
> >>  00000000-03ffffff |     [   3] | no
> >
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
> >> =

> >> opcodes
> >> =

> >>  read           0x13
> >>  =

> >>   dummy cycles  0
> >>  =

> >>  erase          0xdc
> >>  program        0x12
> >>  8D extension   none
> >> =

> >> protocols
> >> =

> >>  read           1S-1S-1S
> >>  write          1S-1S-1S
> >>  register       1S-1S-1S
> >> =

> >> erase commands
> >> =

> >>  21 (4.00 KiB) [1]
> >>  dc (64.0 KiB) [3]
> >>  c7 (64.0 MiB)
> >> =

> >> sector map
> >> =

> >>  region (in hex)   | erase mask | overlaid
> >>  ------------------+------------+----------
> >>  00000000-03ffffff |     [   3] | no
> >
> > AFAICT the patch seems sane, so it probably just uncovered another
> > problem already lurking somewhere deeper.
> > Given the HW similarity I expect imx8mn and imx8mm based platforms to be
> > affected as well.
> > Reverting this commit make the read to be 1S-1S-4S again.
> > Any ideas ow to tackling down this problem?
> =

> Thanks for reporting this. I spent some time digging through this, and I
> think I know what is going on.
> =

> Most controller's supports_op hook call spi_mem_default_supports_op(),
> including nxp_fspi_supports_op(). In spi_mem_default_supports_op(),
> spi_mem_check_buswidth() is called to check if the buswidths for the op
> can actually be supported by the board's wiring. This wiring information
> comes from (among other things) the spi-{tx,rx}-bus-width DT properties.
> Based on these properties, SPI_TX_* or SPI_RX_* flags are set by
> of_spi_parse_dt(). spi_mem_check_buswidth() then uses these flags to
> make the decision whether an op can be supported by the board's wiring
> (in a way, indirectly checking against spi-{rx,tx}-bus-width).
> =

> In arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi we have:
> =

> 	flash0: flash@0 {
> 		reg =3D <0>;
> 		compatible =3D "jedec,spi-nor";
> 		spi-max-frequency =3D <80000000>;
> 		spi-tx-bus-width =3D <1>;
> 		spi-rx-bus-width =3D <4>;
> =

> Now the tricky bit here is we do the below in spi_mem_check_buswidth():
> =

> 	if (op->dummy.nbytes &&
> 	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
> 		return false;
> =

> The "true" parameter here means to "treat the op as TX". Since the board
> only supports 1-bit TX, the 4-bit dummy TX is considered as unsupported,
> and the op gets rejected. In reality, a dummy phase is neither a RX nor
> a TX. We should ideally treat it differently, and only check if it is
> one of 1, 2, 4, or 8, and not test it against the board capabilities at
> all.
> =

> Alexander, can you test my theory by making sure it is indeed the dummy
> check in spi_mem_check_buswidth() that fails, and either removing it or
> passing "false" instead of "true" to spi_check_buswidth_req() fixes the
> bug for you?

Thanks for the explanation, this matches my observation. I'm using the
following diff
---8<---
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -150,7 +150,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
                return false;
 =

        if (op->dummy.nbytes &&
-           spi_check_buswidth_req(mem, op->dummy.buswidth, true))
+           spi_check_buswidth_req(mem, op->dummy.buswidth, false))
                return false;
 =

        if (op->data.dir !=3D SPI_MEM_NO_DATA &&
---8<---
and I'm back at read 1S-1S-4S. So your theory is correct.

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
