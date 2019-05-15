Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29056C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 09:19:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5792084A
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 09:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJ71ZgM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5792084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+f//aO/7kRU5m71vpQjkdoU+a5bm6g/4jjW/7KWB/M0=; b=JJ71ZgM7KW9F8Z
	RtY62tbC8+NXq2lGhpdga106W2K9kzPZP325Vt/r28ziAiwOsmMi24IWUkqzU3tqcZSkd4nIqc1by
	cBXTp9ryWcIIqtdnEixpaFqcUD5PeLkypNJUg+S1VBDHfrar9GInXLOqHHc/BZ4nRMJwvQ1RZz9De
	mDl7wTEho3T16fv7+Up/BvSkKNZTOQRq7p/5ospGtOO49zY0way7rbxuRJEcvK44d9x4yQWDgUBaE
	vfao2f58sREcTcogv/iiWgC2l11qo0O2Al3yfX+690cS0LNyJ3Ner698QmLsZgZfQKjTzPrs7llCm
	8lSsfTI3yBFA/lfCnlWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQq4P-000727-Bh; Wed, 15 May 2019 09:19:29 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQq4M-00071n-3L
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 09:19:27 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x4F9IYq4083398;
 Wed, 15 May 2019 17:18:34 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id C9C318AF5007845D623E;
 Wed, 15 May 2019 17:18:34 +0800 (CST)
In-Reply-To: <OF8A566F14.A2F0F576-ON482583FB.002E7E32-482583FB.003068B1@LocalDomain>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>
 <OF8A566F14.A2F0F576-ON482583FB.002E7E32-482583FB.003068B1@LocalDomain>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
MIME-Version: 1.0
X-KeepSent: BFE3CB74:F4E01135-482583FB:00313C7E;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFBFE3CB74.F4E01135-ON482583FB.00313C7E-482583FB.003323B4@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 15 May 2019 17:18:35 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/15 PM 05:18:34,
 Serialize complete at 2019/05/15 PM 05:18:34
X-MAIL: TWHMLLG4.macronix.com x4F9IYq4083398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_021926_418766_C0C9EB96 
X-CRM114-Status: GOOD (  11.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, christophe.kerello@st.com,
 marcel.ziswiler@toradex.com, stefan@agner.ch, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 lee.jones@linaro.org, richard@nod.at, marek.vasut@gmail.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, paul.burton@mips.com, broonie@kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

Sorry, previous email missed this mxic_nand_data_xfer() reply.

This Flash Memory Controller implemented the Buffer read-write data 
transfer 
for SPI mode and raw NAND mode.

That is each time driver write to the transmit of the TXD port and the 
data 
is shifted out, new data is received in RXD port. 
By transmitting the entire buffer without reading any data, driver are 
losing
the received data.

Actually the mxic_nand_data_xfer() is a copy of mxic_spi_data_xfer().

https://github.com/torvalds/linux/blame/master/drivers/spi/spi-mxic.c 

therefore, I plan to patch this part to MFD as a common code for 
both raw NAND and SPI.

i.e,. 
In driver/mfd/mxic-mfd.c, we have mxic_mfd_data_xfer() and 

here call mxic_mfd_data_xfer() for raw NAND data read-write.


> > > +static int mxic_nand_data_xfer(struct mxic_nand_ctlr *mxic, const 
void *txbuf,
> > > +                void *rxbuf, unsigned int len)
> > > +{
> > 
> > There is not so much code shared, why not separating this function for
> > rx and tx cases?
> > 
> > > +   unsigned int pos = 0;
> > > +
> > > +   while (pos < len) {
> > > +      unsigned int nbytes = len - pos;
> > > +      u32 data = 0xffffffff;
> > > +      u32 sts;
> > > +      int ret;
> > > +
> > > +      if (nbytes > 4)
> > > +         nbytes = 4;
> > > +
> > > +      if (txbuf)
> > > +         memcpy(&data, txbuf + pos, nbytes);
> > > +
> > > +      ret = readl_poll_timeout(mxic->mfd->regs + INT_STS, sts,
> > > +                sts & INT_TX_EMPTY, 0, USEC_PER_SEC);
> > 
> > Using USEC_PER_SEC for a delay is weird
> > 
> > > +      if (ret)
> > > +         return ret;
> > > +
> > > +      writel(data, mxic->mfd->regs + TXD(nbytes % 4));
> > > +
> > > +      if (rxbuf) {
> > > +         ret = readl_poll_timeout(mxic->mfd->regs + INT_STS, sts,
> > > +                   sts & INT_TX_EMPTY, 0,
> > > +                   USEC_PER_SEC);
> > > +         if (ret)
> > > +            return ret;
> > > +
> > > +         ret = readl_poll_timeout(mxic->mfd->regs + INT_STS, sts,
> > > +                   sts & INT_RX_NOT_EMPTY, 0,
> > > +                   USEC_PER_SEC);
> > > +         if (ret)
> > > +            return ret;
> > > +
> > > +         data = readl(mxic->mfd->regs + RXD);
> > > +         data >>= (8 * (4 - nbytes));
> > 
> > What is this? Are you trying to handle some endianness issue?
> 
> yes,
> 
> > 
> > > +         memcpy(rxbuf + pos, &data, nbytes);
> > > +         WARN_ON(readl(mxic->mfd->regs + INT_STS) &
> > > +            INT_RX_NOT_EMPTY);
> > > +      } else {
> > > +         readl(mxic->mfd->regs + RXD);
> > > +      }
> > > +      WARN_ON(readl(mxic->mfd->regs + INT_STS) & INT_RX_NOT_EMPTY);
> > > +
> > > +      pos += nbytes;
> > > +   }
> > > +
> > > +   return 0;
> > > +}

thanks for your review.

best regards,
Mason

--

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
