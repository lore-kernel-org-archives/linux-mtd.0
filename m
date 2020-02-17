Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBE2C7619D
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 08:25:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E4D20725
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 08:25:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4tYG/WT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E4D20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5R0zYMWXLAMa+lT94h9Msgzyu/hqsyZWc/0BClB65q8=; b=e4tYG/WTk4jnNd
	h8Jf8ToeG7L29KNU9ULgPvkRJ9ttsN9U0GP1ld8ZnXvqv4uiYwKaDLjQdh5fgTrQfTArz+/WgVHDN
	KkY/Y+jr4RUWfQQZ2gGHL/d4ZShUswseRtdu0ooxKIzKrJVayRGJaPqgd3mr21bWQfVSPQHrQsriU
	H76UbCIJs2Xw3FxVhIyFUyxbtqho7fTCyvuZDi6ur0FKoARN6NN+CN4aAF3l2yefTU3wmKrF/WceR
	oPLSsSjKTQR3kvX6KAovTUHr7UM8fyMgoGPQ/IkOVosUlppsMPH9I4N4RWOM4IGp/TYjtlep+8wdI
	Tpq3X9nA+nYpFhJWoVQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bi1-0001Qg-Tm; Mon, 17 Feb 2020 08:24:53 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bhy-0001Ps-TT
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 08:24:52 +0000
Received: from twhfm1p2.macronix.com (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 01H8OYP2085135;
 Mon, 17 Feb 2020 16:24:34 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 419D3A22114FEBE2AA04;
 Mon, 17 Feb 2020 16:24:35 +0800 (CST)
In-Reply-To: <20200109174713.71ea377b@xps13>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>	<1572256527-5074-3-git-send-email-masonccyang@mxic.com.tw>
 <20200109174713.71ea377b@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/4] mtd: rawnand: Add support Macronix Block Protection
 function
MIME-Version: 1.0
X-KeepSent: 29F7BCDB:FE14909F-48258511:002D91A4;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF29F7BCDB.FE14909F-ON48258511.002D91A4-48258511.002E31F0@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 17 Feb 2020 16:24:34 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/02/17 PM 04:24:35,
 Serialize complete at 2020/02/17 PM 04:24:35
X-MAIL: TWHMLLG4.macronix.com 01H8OYP2085135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_002451_242054_8F0408B3 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > +/*
> > + * Macronix NAND supports Block Protection by Protectoin(PT) pin;
> > + * active high at power-on which protects the entire chip even the 
#WP is
> > + * disabled. Lock/unlock protection area can be partition according 
to
> > + * protection bits, i.e. upper 1/2 locked, upper 1/4 locked and so 
on.
> > + */
> > +static int mxic_nand_lock(struct nand_chip *chip, loff_t ofs, 
uint64_t len)
> > +{
> > +   u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
> > +   int ret;
> > +
> > +   feature[0] = MXIC_BLOCK_PROTECTION_ALL_LOCK;
> > +   nand_select_target(chip, 0);
> > +   ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_PROTECTION,
> > +            feature);
> > +   nand_deselect_target(chip);
> > +   if (ret)
> > +      pr_err("%s all blocks failed\n", __func__);
> > +
> > +   return ret;
> > +}
> > +
> > +static int mxic_nand_unlock(struct nand_chip *chip, loff_t ofs, 
uint64_t len)
> > +{
> > +   u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
> > +   int ret;
> > +
> > +   feature[0] = MXIC_BLOCK_PROTECTION_ALL_UNLOCK;
> > +   nand_select_target(chip, 0);
> > +   ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_PROTECTION,
> > +            feature);
> > +   nand_deselect_target(chip);
> > +   if (ret)
> > +      pr_err("%s all blocks failed\n", __func__);
> > +
> > +   return ret;
> >  }
> > 
> > +/*
> > + * Macronix NAND AC series support Block Protection by SET_FEATURES
> > + * to lock/unlock blocks.
> > + */
> >  static int macronix_nand_init(struct nand_chip *chip)
> >  {
> > +   bool blockprotected = false;
> > +
> >     if (nand_is_slc(chip))
> >        chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
> > 
> > -   macronix_nand_fix_broken_get_timings(chip);
> > +   if (macronix_nand_fix_broken_get_timings(chip))
> > +      blockprotected = true;
> 
> I don't like this at all :)
> 
> Please create a helper which detects which part is broken/protected
> then create helpers to act in this case.

okay, will patch it to read default protected value (after power-on)
for protection function detection.

> 
> If the list is absolutely identical, you can share the detection
> helper. Otherwise, if you think the list can diverge, please only share
> the list for now and create two detection helpers.
> 
> > +
> >     macronix_nand_onfi_init(chip);
> > 
> > +   if (blockprotected) {
> > +      bitmap_set(chip->parameters.set_feature_list,
> > +            ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
> > +      bitmap_set(chip->parameters.get_feature_list,
> > +            ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
> > +
> > +      chip->_lock = mxic_nand_lock;
> > +      chip->_unlock = mxic_nand_unlock;
> > +   }
> > +
> >     return 0;
> >  }
> > 

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
