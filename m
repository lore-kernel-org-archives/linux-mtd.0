Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D142C11F68
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 09:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15C561C4D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 09:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15C561C4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXslmN1azidojYjaXOQuHvyyAOs0zUnw+QE361kLOmM=; b=4D4q5VbJuOfyvV
	dIS2Rd9xtX1U6ncS3aa4wPYxaylGi6xaIjCJD4yB0MxXpat/Qkm0MVs9L/mnHBNnXXuG6fEH3ph75
	7XDGqlrQtkyeMF5a/fzqtYbOMSBh5ResYdUcmno2IsN3mEYxK018anTJGPZ/tB4d3hclbKy36wGdh
	tUYRbTRKAG1JglvQJA7zPNDvMLt4xzTSJw2Qbva30oFd2yHe8ZUtUkMpTwEC1xxIqgOJWRCEDTaJU
	yyvdFyZoVt7CyJFJ0jGaoWW2EBGS4pBJ68dczM9g4sngzlG0x9+AEQdekHI/VZq24Fxma2zCAPYVp
	FTd59iemsNdP5HyWiRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyW8V-00DPaC-7x; Wed, 30 Jun 2021 09:03:59 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyW8R-00DPWJ-SD
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 09:03:57 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 15U93W4Q081226;
 Wed, 30 Jun 2021 17:03:32 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 5EEB8ACF30658089771D;
 Wed, 30 Jun 2021 17:03:33 +0800 (CST)
In-Reply-To: <59855ba0-31d8-25b4-3000-ca493a83fe00@microchip.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
 <59855ba0-31d8-25b4-3000-ca493a83fe00@microchip.com>
To: <Tudor.Ambarus@microchip.com>
Cc: broonie@kernel.org, jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org, 
 linux-spi@vger.kernel.org, miquel.raynal@bootlin.com, p.yadav@ti.com
Subject: Re: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
MIME-Version: 1.0
X-KeepSent: 064E94C6:E4E45300-48258704:002E055A;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF064E94C6.E4E45300-ON48258704.002E055A-48258704.0031C392@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Wed, 30 Jun 2021 17:03:33 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/06/30 PM 05:03:33,
 Serialize complete at 2021/06/30 PM 05:03:33
X-MAIL: TWHMLLG3.macronix.com 15U93W4Q081226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_020356_236542_7B138D26 
X-CRM114-Status: GOOD (  10.54  )
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


Hi Tudor,

> Subject
> 
> Re: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix 
octaflash
> 
> On 5/17/21 9:14 AM, Zhengxun Li wrote:
> > +       { "mx66lm1g45g", INFO(0xc2853b, 0, 32 * 1024, 4096,
> > +                             SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                             SPI_NOR_OCTAL_DTR_PP | 
SPI_NOR_4B_OPCODES)
> > +               .fixups = &octaflash_fixups },
> 
> I have a mx66lm1g45g which does not define SFDP tables, how you'll 
> differentiate
> between the two? Mine will fail after reset. I'm working to address 
> the flash ID
> collisions, will send patches soon. I won't queue any new flash 
> additions until
> we'll solve the ID collisions problem.

I asked our flash team, unfortunately, they said that due to SFDP on 
octaflash not existing from beginning, therefore, some old parts may not 
support the SFDP parameter inside the Flash. For MX66LM1G45G, we have SFDP 
available from 2020/03. However, other flash maybe meet the same problem, 
I will update them later. 

As for ID conflicts, I will discuss with them which series of flash has 
encountered this problem, and I will update it later.

Thanks,
Zhengxun


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
