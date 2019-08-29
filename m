Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C212C3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 09:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70C22073F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 09:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t2+B4ppa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70C22073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrFgBJZwCGHsL4+PBk4SFfqNPoVKxeJGCHmgBkUaVu4=; b=t2+B4ppahyoayA
	roxZ0+fjxcS1KxsO1UCFgcXlcamNDYJXFMOgO4jSMyViv4Fid2itwrHSOnH919GV7YK3Jn7IZgwSu
	1WWlvtS/bygU91zBM/AYX+sGlfzAUM4YGVR6wEXHu0hJ7XWTDrULhwjZtkaR6hudVr5tFiyAU0Zwq
	+GrFzkWgisagC1s+hXumqM92rS6OtkGJgW5VFGDyOSKWi1AJJxN6rQ4zfQWy0VnKC2p0UcnT7GP6P
	DPJDjlRyX78hJcdBIqpz3ilOYL3CJccgR12ko780iag4WlHftUBX52Y2JrBZ7dIBJhWOfcNlOxMqh
	Ic3jR899Lxy6crOYqSrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3GQN-000374-NQ; Thu, 29 Aug 2019 09:08:59 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3GQL-00036k-0l
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 09:08:58 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x7T97oGv092690;
 Thu, 29 Aug 2019 17:07:50 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 30071D83829036DCCD67;
 Thu, 29 Aug 2019 17:07:51 +0800 (CST)
In-Reply-To: <20190824130329.68f310aa@xps13>
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
 <20190824130329.68f310aa@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
MIME-Version: 1.0
X-KeepSent: 22C5A579:E2E7676F-48258465:002F7F69;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF22C5A579.E2E7676F-ON48258465.002F7F69-48258465.00322849@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 29 Aug 2019 17:07:51 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/08/29 PM 05:07:51,
 Serialize complete at 2019/08/29 PM 05:07:51
X-MAIL: TWHMLLG3.macronix.com x7T97oGv092690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_020857_332946_65C06594 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: kstewart@linuxfoundation.org, vigneshr@ti.com, bbrezillon@kernel.org,
 juliensu@mxic.com.tw, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel, 


> > 
> > If subpage write not available with hardware ECC, for example,
> > NAND chip options NAND_NO_SUBPAGE_WRITE be set in driver and
> > randomizer function is recommended for high-reliability.
> > Driver checks byte 167 of Vendor Blocks in ONFI parameter page table
> > to see if this high-reliability function is supported.
> > 
> 
> You did not flagged this patch as a v2 and forgot about the changelog.
> You did not listen to our comments in the last version neither. I was
> open to a solution with a specific DT property for warned users but I
> don't see it coming.
> 

Based on your comments by specific DT property for randomizer support.
to add a new property in children nodes:

i.e,.

nand: nand-controller@43c30000 {

                nand@0 {
                        reg = <0>;
                        nand-reliability = "randomizer";
                };
};


file of nand_macronix.c will patch to:

static void macronix_nand_onfi_init(struct nand_chip *chip)
{
        struct nand_parameters *p = &chip->parameters;
        struct device_node *dn = nand_get_flash_node(chip);
        const char *pm;
        int rand_enable = 0;

        ret = of_property_read_string(dn, "nand-reliability", &pm);
        if (!ret) {
                if (!strcasecmp(pm, "randomizer"));
                        rand_enable = 1;
        }
 
        mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
        if (rand_enable &&
            mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
                if (p->supports_set_get_features) {
                        bitmap_set(p->set_feature_list,
                                   ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
                        bitmap_set(p->get_feature_list,
                                   ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
                        /* set-up chip options with NAND_NO_SUBPAGE_WRITE 
*/
                        chip->options |= NAND_NO_SUBPAGE_WRITE;
                        macronix_nand_randomizer_check_enable(chip);
                }
        }
 
} 

something like this,

is it OK ?

thanks & best regards,
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
