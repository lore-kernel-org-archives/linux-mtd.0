Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CBFC33CA1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 09:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06EF3207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 09:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S4BJdgmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06EF3207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Fl3PIsrPLUIo3ESMutur0NSY6AzstVOGaq5ZZzQXdc=; b=S4BJdgmoF7mHrI
	90tfGQthK/bbe3fUUq8MgMioE4sEsTGJ1ZShC1nO4PlqjIQgY+gyhWr8PPBBncYDFoKuDRM81CJCQ
	80Yuf1z6KGmuYhldYfOKHRdvea0aTylUU0hOFNKyUDiZUSPXfMy/b+lapl+0cKrbJFu2BUMRXq6wU
	/nvyY1qf92A+zFcCqgkO4L7e0jYLAnD9N4rCUky2M2edE1zkRmAKySwZD9gev93aP9YQrIv2DFmch
	hTO3gbKJImk7RFPGTayllOLmjU5vEprBzRWaCT5mLH3IrG1FWO1FdvKKNMkwXD0l05TVNZX5CybO3
	Yj8DHsNJnVvB2/HOapeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itTNS-0001UN-9S; Mon, 20 Jan 2020 09:29:46 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itTNK-0001Sx-6T
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 09:29:44 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 00K9SWMX073874;
 Mon, 20 Jan 2020 17:28:32 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 6B1B2630C9CB4D990834;
 Mon, 20 Jan 2020 17:28:33 +0800 (CST)
In-Reply-To: <20200117101346.3611dc0a@xps13>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>	<1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
 <20200109172816.6c1d7be7@xps13>	<OFECBDB130.03AD44B7-ON482584F2.002B40F2-482584F2.002B720F@mxic.com.tw>
 <20200117101346.3611dc0a@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add support for Macronix NAND
 randomizer
MIME-Version: 1.0
X-KeepSent: 1377603E:0BE29BC1-482584F5:00335731;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF1377603E.0BE29BC1-ON482584F5.00335731-482584F5.00340DE4@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 20 Jan 2020 17:28:35 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/01/20 PM 05:28:33,
 Serialize complete at 2020/01/20 PM 05:28:33
X-MAIL: TWHMLLG3.macronix.com 00K9SWMX073874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_012938_490781_B0C859CC 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > > > +}
> > > > +
> > > >  static void macronix_nand_onfi_init(struct nand_chip *chip)
> > > >  {
> > > >     struct nand_parameters *p = &chip->parameters;
> > > >     struct nand_onfi_vendor_macronix *mxic;
> > > > +   struct device_node *dn = nand_get_flash_node(chip);
> > > > +   int rand_otp = 0;
> > > > +   int ret;
> > > > 
> > > >     if (!p->onfi)
> > > >        return;
> > > > 
> > > > +   if (of_find_property(dn, "mxic,enable-randomizer-otp", NULL))
> > > > +      rand_otp = 1;
> > > > +
> > > >     mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
> > > > +   /* Subpage write is prohibited in randomizer operatoin */ 
> > > 
> > >                                        with          operation
> > > 
> > > > +   if (rand_otp && chip->options & NAND_NO_SUBPAGE_WRITE &&
> > > > +       mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
> > > > +      if (p->supports_set_get_features) {
> > > > +         bitmap_set(p->set_feature_list,
> > > > +               ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
> > > > +         bitmap_set(p->get_feature_list,
> > > > +               ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
> > > > +         ret = macronix_nand_randomizer_check_enable(chip);
> > > > +         if (ret < 0)
> > > > +            pr_info("Macronix NAND randomizer failed\n");
> > > > +         else
> > > > +            pr_info("Macronix NAND randomizer enabled\n"); 
> > > 
> > > Maybe we should update the bitmaps only if it succeeds? 
> > 
> > okay, will drop pr_info();
> 
> It's not my point, you can keep the pr_info, I just say that you should
> check ret before updating the bitmap maybe? Otherwise if
> macronix_nand_randomizer_check_enable() fails, you end up without the
> feature but with its bit set in the bitmap.

Driver should set ONFI_FEATURE_ADDR_MXIC_RANDOMIZER in 
p->set/get_feature_list
before calling macronix_nand_randomizer_check_enable() for randomizer 
set/get
feature operation.

I will patch bitmap_clear() if macronix_nand_randomizer_check_enable() 
return fails.

thanks for your time & comments.
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
