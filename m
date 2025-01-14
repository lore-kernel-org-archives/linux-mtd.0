Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE7CE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+GaFxnjTK/00wLvxb20EQzpSLoaqCj2AaBUeyJGv04=; b=BexG/LcDkj1Twt
	9IJFiYjgRJnbD1H1V5tTWmmFsvwiFbNxU5TCqy9Uz5qwWT8Ew2M77R5lXp3vNxXpI8YTE7LpnIQkE
	anUrC2SNWl0PBF9z5UXSO116Jbmbveax4sgWbFlWeE1RkwEGtmFIWGTj6RNDJFgVmrukqhi5evnhX
	Ip5UvgdWhlY85+LlSsVnpL7ZbYazT9GsJnzAmosj4yCuj2N1YjvidRutp6omvlUAve0hkiqroLvqv
	Hm43UXUcUuap276fN2WBVXGEOT8eQHOOvhl0WASpIt7WhXsRJAbO3YFPQuU+Rm4eoiFti708OKrp8
	4Ob4P3vDimKDAl3akzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjnL-0000000920d-1Qyl;
	Tue, 14 Jan 2025 16:29:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjnI-000000091zl-3L2V
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 16:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7650A41879;
	Tue, 14 Jan 2025 16:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89640C4CEDF;
	Tue, 14 Jan 2025 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736872171;
	bh=h62z4y1wv+NTpFNoOfOMwrg0bd6GXzx/E3jJZhWJ5kA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g0l/akWkNUdWlMejGlteYuENKMox7ADPISatLnC1vgs3xaT9h3yXrP9qcQ86M+rgp
	 I9gugjLyITShbUpOm42Pm+dFS4uufFlvxvRXKw5hvXFMeeTa2MaLXmqEmi9+OeVzWC
	 YojSbtSfhCLqc1nzNR/Ws53hobpg13q2aUpLuO3mjsm7zUCIp4FKJoVnPSxRa0u5ME
	 n9kPlebdSsH70RBCP6g5zaoWMKxRo9kXI4ffyKrTHHNstHpCMrdWb37uUq+DA2Qa9C
	 FsrjD12EBac5fjZRHmYWKSiw7JqpH6R62kbe8bm85qSY8o3WXniakTNmRlnBrYkV6x
	 tcW3zcsOdYm9w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  stable@vger.kernel.org,  Cheng Ming Lin
 <linchengming884@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
In-Reply-To: <7762352.EvYhyI6sBW@steina-w> (Alexander Stein's message of "Tue,
	14 Jan 2025 17:24:32 +0100")
References: <20241112075242.174010-1-linchengming884@gmail.com>
	<3342163.44csPzL39Z@steina-w>
	<a6a9dfce-6cac-4831-9c96-45471f5ee13a@linaro.org>
	<7762352.EvYhyI6sBW@steina-w>
Date: Tue, 14 Jan 2025 16:29:28 +0000
Message-ID: <mafs0sepl5pg7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_082932_973353_060EED37 
X-CRM114-Status: GOOD (  27.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14 2025, Alexander Stein wrote:

> Hi Tudor,
>
> Am Dienstag, 14. Januar 2025, 14:26:47 CET schrieb Tudor Ambarus:
>> On 1/14/25 12:57 PM, Alexander Stein wrote:
>> > Hello everyone,
>> 
>> Hi,
>> 
>> > 
>> > Am Dienstag, 12. November 2024, 08:52:42 CET schrieb Cheng Ming Lin:
>> >> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> >>
>> >> The default dummy cycle for Macronix SPI NOR flash in Octal Output
>> >> Read Mode(1-1-8) is 20.
>> >>
>> >> Currently, the dummy buswidth is set according to the address bus width.
>> >> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
>> >> dummy cycles to bytes, this results in 20 x 1 / 8 = 2 bytes, causing the
>> >> host to read data 4 cycles too early.
>> >>
>> >> Since the protocol data buswidth is always greater than or equal to the
>> >> address buswidth. Setting the dummy buswidth to match the data buswidth
>> >> increases the likelihood that the dummy cycle-to-byte conversion will be
>> >> divisible, preventing the host from reading data prematurely.
>> >>
>> >> Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")
>> >> Cc: stable@vger.kernel.org
>> >> Reviewd-by: Pratyush Yadav <pratyush@kernel.org>
>> >> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> >> ---
>> >>  drivers/mtd/spi-nor/core.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> >> index f9c189ed7353..c7aceaa8a43f 100644
>> >> --- a/drivers/mtd/spi-nor/core.c
>> >> +++ b/drivers/mtd/spi-nor/core.c
>> >> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>> >>  		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>> >>  
>> >>  	if (op->dummy.nbytes)
>> >> -		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>> >> +		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
>> >>  
>> >>  	if (op->data.nbytes)
>> >>  		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
>> >>
>> > 
>> > I just noticed this commit caused a regression on my i.MX8M Plus based board,
>> > detected using git bisect.
>> > DT: arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
>> > Starting with this patch read is only 1S-1S-1S, before it was
>> > 1S-1S-4S.
>> > 
>> > before:
>> >> cat /sys/kernel/debug/spi-nor/spi0.0/params
>> >> name            mt25qu512a
>> >> id              20 bb 20 10 44 00
>> >> size            64.0 MiB
>> >> write size      1
>> >> page size       256
>> >> address nbytes  4
>> >> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP
>> >> | HAS_SR_BP3_BIT6 | SOFT_RESET
>> >>
>> >> opcodes
>> >>
>> >>  read           0x6c
>> >>  
>> >>   dummy cycles  8
>> >>  
>> >>  erase          0xdc
>> >>  program        0x12
>> >>  8D extension   none
>> >>
>> >> protocols
>> >>
>> >>  read           1S-1S-4S
>> >>  write          1S-1S-1S
>> >>  register       1S-1S-1S
>> >>
>> >> erase commands
>> >>
>> >>  21 (4.00 KiB) [1]
>> >>  dc (64.0 KiB) [3]
>> >>  c7 (64.0 MiB)
>> >>
>> >> sector map
>> >>
>> >>  region (in hex)   | erase mask | overlaid
>> >>  ------------------+------------+----------
>> >>  00000000-03ffffff |     [   3] | no
>> > 
>> > after:
>> >> cat /sys/kernel/debug/spi-nor/spi0.0/params
>> >> name            mt25qu512a
>> >> id              20 bb 20 10 44 00
>> >> size            64.0 MiB
>> >> write size      1
>> >> page size       256
>> >> address nbytes  4
>> >> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP
>> >> | HAS_SR_BP3_BIT6 | SOFT_RESET
>> >>
>> >> opcodes
>> >>
>> >>  read           0x13
>> >>  
>> >>   dummy cycles  0
>> >>  
>> >>  erase          0xdc
>> >>  program        0x12
>> >>  8D extension   none
>> >>
>> >> protocols
>> >>
>> >>  read           1S-1S-1S
>> >>  write          1S-1S-1S
>> >>  register       1S-1S-1S
>> >>
>> >> erase commands
>> >>
>> >>  21 (4.00 KiB) [1]
>> >>  dc (64.0 KiB) [3]
>> >>  c7 (64.0 MiB)
>> >>
>> >> sector map
>> >>
>> >>  region (in hex)   | erase mask | overlaid
>> >>  ------------------+------------+----------
>> >>  00000000-03ffffff |     [   3] | no
>> > 
>> > AFAICT the patch seems sane, so it probably just uncovered another
>> > problem already lurking somewhere deeper.
>> > Given the HW similarity I expect imx8mn and imx8mm based platforms to be
>> > affected as well.
>> > Reverting this commit make the read to be 1S-1S-4S again.
>> > Any ideas ow to tackling down this problem?
>> > 
>> 
>> My guess is that 1S-1S-4S is stripped out in
>> spi_nor_spimem_adjust_hwcaps(). Maybe the controller has some limitation
>> in nxp_fspi_supports_op(). Would you add some prints, and check these
>> chunks of code?
>
> Thanks for the fast response. I was able to track it down.
> Eventually the buswidth check in spi_check_buswidth_req fails.
> For command 0x3c:
> Before revert:
>> mode: 0x800, buswidth: 2
> After revert
>> mode: 0x800, buswidth: 1
>
> The mode is set to SPI_RX_QUAD. Thus the check for dummy buswidth fails
> now that data_nbits are used now.
>
> For command 0x6c it's similar but op->dummy.buswidth is 4 now.
>
> It boils down that there are SPI controllers which have
>> spi-tx-bus-width = <1>;
>> spi-rx-bus-width = <4>;
> set in their DT nodes.
>
> So it seems this combination is not supported.

No, this check is wrong. See
https://lore.kernel.org/linux-mtd/20241112075242.174010-1-linchengming884@gmail.com/T/#m7cc1a5055702f5a42a8f3949c968842d845914d7

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
