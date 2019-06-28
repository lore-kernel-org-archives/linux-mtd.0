Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2545C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 06:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3BD2086D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 06:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m4K483di"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3BD2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cZhreOSgJrbXNzpfXzVtmw2xojPodJYUSgm1k1URV4=; b=m4K483dikZSpjp
	i8h3HozHvTaQbeGFBO7LNWXcXqHQSsk9XvI61rWj5yudCev3vpK3i/qVS7YKTc6nsFrnYYujYuHbX
	B6M8WXZnsJwIrEPsNMKuIODyQNpEVU1g7jaQBDjAxd45sMSAFHwRS921g8piZwLSUNjf+nGd3VXgn
	Bp1DJLtvZjfrtUFObKNCpFADpyhrD9+cbNBVa76/MkoXkTbmUhoHAGZoo2/ax+hnspFE+I21r9Jxd
	xQBhOJhSfpyhaseviaDYPxzCNekVnZ0mxGtjTM0uY+R4iezacDL44HrFGrs6Kn4MzSndjvNeDKKVx
	YNnVqgbR9K35JdvgqIoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgjyS-0000e7-OR; Fri, 28 Jun 2019 06:03:04 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgjyP-0000dC-F0
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 06:03:03 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x5S61tNF083187;
 Fri, 28 Jun 2019 14:01:55 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 8B3D25791B757428CD0E;
 Fri, 28 Jun 2019 14:01:55 +0800 (CST)
In-Reply-To: <20190627193635.29abff43@xps13>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>	<1561443056-13766-2-git-send-email-masonccyang@mxic.com.tw>
 <20190627193635.29abff43@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add Macronix Raw NAND controller
MIME-Version: 1.0
X-KeepSent: DDC43C05:7B4092B5-48258427:001EE57E;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFDDC43C05.7B4092B5-ON48258427.001EE57E-48258427.002122D1@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 28 Jun 2019 14:01:55 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/06/28 PM 02:01:55,
 Serialize complete at 2019/06/28 PM 02:01:55
X-MAIL: TWHMLLG3.macronix.com x5S61tNF083187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_230301_778175_4AB88C6D 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
 anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,


> > Add a driver for Macronix raw NAND controller.
> 
> Could you pass userspace major MTD tests and can you attach/mount/edit
> a UBI/UBIFS storage?

mtd_debug passed and using dd utility to read and write 
with md5sum checking passed.

UBI/UBIFS testing is not yet. will do it.


> > +static int mxic_nfc_clk_enable(struct mxic_nand_ctlr *nfc)
> > +{
> > +   int ret;
> > +
> > +   ret = clk_prepare_enable(nfc->send_clk);
> > +   if (ret)
> > +      return ret;
> > +
> > +   ret = clk_prepare_enable(nfc->send_dly_clk);
> > +   if (ret)
> > +      goto err_send_dly_clk;
> 
> I'm not sure why you only enable 2 out of 3 clocks and also why ou
> handle two of them here (which is great, I prefer having a separate
> helper for that) and the other one elsewhere?
> 

send_clk and send_dly_clk are device domain clocks.

send_clk is clock without phase delay to ps_clk, used for sending device
signals except for SIO[7:0].
send_dly_clk is clock with phase delay to ps_clk, used for sending 
SIO[7:0]

ps_clk is system domain clock and it's a source clock of send_clk and 
send_dly_clk.

> > +
> > +   return ret;
> > +
> > +err_send_dly_clk:
> > +   clk_disable_unprepare(nfc->send_clk);
> > +
> > +   return ret;
> > +}
> > +
> > +static void mxic_nfc_clk_disable(struct mxic_nand_ctlr *nfc)
> > +{
> > +   clk_disable_unprepare(nfc->send_clk);
> > +   clk_disable_unprepare(nfc->send_dly_clk);
> > +}
> > +
> > +static void mxic_nfc_set_input_delay(struct mxic_nand_ctlr *nfc, u8 
idly_code)
> > +{
> > +   writel(IDLY_CODE_VAL(0, idly_code) |
> > +          IDLY_CODE_VAL(1, idly_code) |
> > +          IDLY_CODE_VAL(2, idly_code) |
> > +          IDLY_CODE_VAL(3, idly_code),
> > +          nfc->regs + IDLY_CODE(0));
> > +   writel(IDLY_CODE_VAL(4, idly_code) |
> > +          IDLY_CODE_VAL(5, idly_code) |
> > +          IDLY_CODE_VAL(6, idly_code) |
> > +          IDLY_CODE_VAL(7, idly_code),
> > +          nfc->regs + IDLY_CODE(1));
> > +}
> > +
> > +static int mxic_nfc_clk_setup(struct mxic_nand_ctlr *nfc, unsigned 
long freq)
> > +{
> > +   int ret;
> > +
> > +   ret = clk_set_rate(nfc->send_clk, freq);
> > +   if (ret)
> > +      return ret;
> > +
> > +   ret = clk_set_rate(nfc->send_dly_clk, freq);
> > +   if (ret)
> > +      return ret;
> > +
> > +   /*
> > +    * A constant delay range from 0x0 ~ 0x1F for input delay,
> > +    * the unit is 78 ps, the max input delay is 2.418 ns.
> > +    */
> > +   mxic_nfc_set_input_delay(nfc, 0xf);
> > +
> > +   /*
> > +    * Phase degree = 360 * freq * output-delay
> > +    * where output-delay is a constant value 1 ns in FPGA.
> 
> Will it always be in FPGA?

yes.

> 
> > +    *
> > +    * Get Phase degree = 360 * freq * 1 ns
> > +    *                  = 360 * freq * 1 sec / 1000000000
> > +    *                  = 9 * freq / 25000000
> > +    */
> > +   ret = clk_set_phase(nfc->send_dly_clk, 9 * freq / 25000000);
> > +   if (ret)
> > +      return ret;
> > +
> > +   return 0;
> > +}
> > +
> > +static int mxic_nfc_set_freq(struct mxic_nand_ctlr *nfc, unsigned 
long freq)
> > +{
> > +   int ret;
> > +
> > +   if (freq > MXIC_NFC_MAX_CLK_HZ)
> > +      freq = MXIC_NFC_MAX_CLK_HZ;
> > +
> > +   mxic_nfc_clk_disable(nfc);
> > +   ret = mxic_nfc_clk_setup(nfc, freq);
> > +   if (ret)
> > +      return ret;
> > +
> > +   ret = mxic_nfc_clk_enable(nfc);
> > +   if (ret)
> > +      return ret;
> > +
> > +   return 0;
> > +}
> > +
> > +static void mxic_nfc_hw_init(struct mxic_nand_ctlr *nfc)
> > +{
> > +   writel(DATA_STROB_EDO_EN, nfc->regs + DATA_STROB);
> > +   writel(HC_CFG_NIO(8) | HC_CFG_TYPE(1, HC_CFG_TYPE_RAW_NAND) |
> > +          HC_CFG_SLV_ACT(0) | HC_CFG_MAN_CS_EN |
> > +          HC_CFG_IDLE_SIO_LVL(1), nfc->regs + HC_CFG);
> > +   writel(INT_STS_ALL, nfc->regs + INT_STS_EN);
> > +   writel(0x0, nfc->regs + ONFI_DIN_CNT(0));
> > +   writel(0, nfc->regs + LRD_CFG);
> > +   writel(0, nfc->regs + LRD_CTRL);
> > +   writel(0x0, nfc->regs + HC_EN);
> > +
> > +   /* Default 10 MHz to setup tRC_min/tWC_min:100 ns */
> > +   mxic_nfc_set_freq(nfc, 10000000);
> > +}
> > +
> > +static void mxic_nfc_cs_enable(struct mxic_nand_ctlr *nfc)
> > +{
> > +   writel(readl(nfc->regs + HC_CFG) | HC_CFG_MAN_CS_EN,
> > +          nfc->regs + HC_CFG);
> > +   writel(HC_CFG_MAN_CS_ASSERT | readl(nfc->regs + HC_CFG),
> > +          nfc->regs + HC_CFG);
> 
> So you can drive only one CS with this controller?

yes,

> 
> > +}
> > +
> > +static void mxic_nfc_cs_disable(struct mxic_nand_ctlr *nfc)
> > +{
> > +   writel(~HC_CFG_MAN_CS_ASSERT & readl(nfc->regs + HC_CFG),
> > +          nfc->regs + HC_CFG);
> > +}
> > +
> > +static int  mxic_nfc_wait_ready(struct nand_chip *chip)
> > +{
> > +   struct mxic_nand_ctlr *nfc = nand_get_controller_data(chip);
> > +   u32 sts;
> > +
> > +   return readl_poll_timeout(nfc->regs + INT_STS, sts,
> > +              sts & INT_RDY_PIN, 0, USEC_PER_SEC);
> > +}
> > +
> > +static int mxic_nfc_data_xfer(struct mxic_nand_ctlr *nfc, const void 
*txbuf,
> > +               void *rxbuf, unsigned int len)
> > +{
> > +   unsigned int pos = 0;
> > +
> > +   while (pos < len) {
> > +      unsigned int nbytes = len - pos;
> > +      u32 data = 0xffffffff;
> > +      u32 sts;
> > +      int ret;
> > +
> > +      if (nbytes > 4)
> > +         nbytes = 4;
> > +
> > +      if (txbuf)
> > +         memcpy(&data, txbuf + pos, nbytes);
> > +
> > +      ret = readl_poll_timeout(nfc->regs + INT_STS, sts,
> > +                sts & INT_TX_EMPTY, 0, USEC_PER_SEC);
> > +      if (ret)
> > +         return ret;
> > +
> > +      writel(data, nfc->regs + TXD(nbytes % 4));
> > +
> > +      if (rxbuf) {
> > +         ret = readl_poll_timeout(nfc->regs + INT_STS, sts,
> > +                   sts & INT_TX_EMPTY, 0,
> > +                   USEC_PER_SEC);
> > +         if (ret)
> > +            return ret;
> > +
> > +         ret = readl_poll_timeout(nfc->regs + INT_STS, sts,
> > +                   sts & INT_RX_NOT_EMPTY, 0,
> > +                   USEC_PER_SEC);
> > +         if (ret)
> > +            return ret;
> > +
> > +         data = readl(nfc->regs + RXD);
> > +         data >>= (8 * (4 - nbytes));
> > +         memcpy(rxbuf + pos, &data, nbytes);
> > +         WARN_ON(readl(nfc->regs + INT_STS) & INT_RX_NOT_EMPTY);
> > +      } else {
> > +         readl(nfc->regs + RXD);
> > +      }
> > +      WARN_ON(readl(nfc->regs + INT_STS) & INT_RX_NOT_EMPTY);
> 
> WARN_ON() is maybe a bit overkill here?

should I remove it ?


thanks for your review.
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
