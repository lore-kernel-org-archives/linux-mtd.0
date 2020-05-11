Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC34BC54E8D
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 06:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 777772075E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 06:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YSqzJ/pF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 777772075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ztu8zbVJOwoyvq0+WYdvynWdUiTAW7Pd59H/zC0SUw=; b=YSqzJ/pFqpvHj9
	d8+Af9Hr0rh4a164jUuNs4icgxszPGLkjxQePoLeQZRoFfydZxr7uFGtRDVUX7c+42HInPREgJLD9
	tiicH593vaGHqiNM/zFNkwkDzD5m3pHlske5FC6M5xNjb/XBQrZJMDCGISUgiD6866je5c9nW9NRc
	2QCylsVDcDFItZh7FGRz34NebFDIow5tIiSwnKjCsl4tJ8R5OCWZNlb38/e5GvCVZKkDx5luWKbvB
	TOoBjkJJSguOOuBlAZp/2Lh5zbI3yzGyUVCsVp82c123eiWw6eIXDSqeTh06Mu8F2p+0ZZCOTbZ6+
	KlPtqPtb/g7x/Sx9BJJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY2Lg-0001IK-A5; Mon, 11 May 2020 06:55:36 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY2Ld-0001Hs-SA
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 06:55:35 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 04B6subk017855;
 Mon, 11 May 2020 14:54:56 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id CB39D9EF3346938A34B5;
 Mon, 11 May 2020 14:54:56 +0800 (CST)
In-Reply-To: <20200505120123.24962338@collabora.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>	<20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>	<OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>	<OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
 <20200429181856.kkavelcczylg4yxf@yadavpratyush.com>	<OF28AE0642.4F34D6BB-ON4825855F.002D6E58-4825855F.003458C9@mxic.com.tw>
 <20200505114443.6ebd5d3c@collabora.com>
 <20200505120123.24962338@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
MIME-Version: 1.0
X-KeepSent: 38C348F3:6278EE64-48258565:0025C5C2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF38C348F3.6278EE64-ON48258565.0025C5C2-48258565.0025FD93@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 11 May 2020 14:54:56 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/11 PM 02:54:56,
 Serialize complete at 2020/05/11 PM 02:54:56
X-MAIL: TWHMLLG3.macronix.com 04B6subk017855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_235534_163563_1F15B222 
X-CRM114-Status: GOOD (  23.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, Pratyush Yadav <me@yadavpratyush.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Boris,


> > > > 
> > > > To clarify a bit more, the idea is that we transmit the opcode MSB 

> > > > first, just we do for the address. Assume we want to issue the 
command 
> > > > 0x05. In 1S mode, we set cmd.opcode to 0x05. Here cmd.nbytes == 1. 
Treat 
> > > 
> > > > is as a 1-byte value, so the MSB is the same as the LSB. We 
directly 
> > > > send 0x5 on the bus. 
> > > 
> > > There are many SPI controllers driver use "op->cmd.opcode" directly,
> > > so is spi-mxic.c.
> > > 
> > > i.e,.
> > > ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 
op->cmd.nbytes); 
> > 
> > Just because you do it doesn't mean it's right. And most controllers 
use
> > the opcode value, they don't dereference the pointer as you do here.
> > 
> > > 
> > > > 
> > > > If cmd.nbytes == 2, then the opcode would be 0x05FA (assuming 
extension 
> > > > is invert of command). So we send the MSB (0x05) first, and LSB 
(0xFA) 
> > > > next. 
> > > 
> > > My platform is Xilinx Zynq platform which CPU is ARMv7 processor.
> > > 
> > > In 1-1-1 mode, it's OK to send 1 byte command by u16 opcode but
> > > in 8D-8D-8D mode, I need to patch
> > > 
> > > i.e.,
> > > op->cmd.opcode = op->cmd.opcode | (ext << 8);
> > > 
> > > rather than your patch. 
> > 
> > Seriously, how hard is it to extract each byte from the u16 if your
> > controller needs to pass things in a different order? I mean, that's
> > already how it's done for the address cycle, so why is it a problem
> > here? This sounds like bikeshedding to me. If the order is properly
> > documented in the kernel doc, I see no problem having it grouped in 
one
> > u16, with the first cmd cycle placed in the MSB and the second one in
> > the LSB.
> 
> So, I gave it a try, and we're talking about something as simple as the
> below diff. And yes, the mxic controller needs to be patched before
> extending the cmd.opcode field, but we're talking about one driver here
> (all other drivers should be fine). Oh, and if you look a few lines 
below
> the changed lines, you'll notice that we do exactly the same for the
> address.

yup,
thanks again for your time & comments.

> 
> --->8---
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 69491f3a515d..c3f4136a7c1d 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -356,6 +356,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>         int nio = 1, i, ret;
>         u32 ss_ctrl;
>         u8 addr[8];
> +       u8 cmd[2];
> 
>         ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
>         if (ret)
> @@ -393,7 +394,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem 
*mem,
>         writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
>                mxic->regs + HC_CFG);
> 
> -       ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
> +       for (i = 0; i < op->cmd.nbytes; i++)
> +               cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 
1));
> +
> +       ret = mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
>         if (ret)
>                 goto out;
> 

best regards,
Mason

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
