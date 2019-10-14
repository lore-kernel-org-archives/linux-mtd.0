Return-Path: <SRS0=jzn5=YH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CE6C4CECE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 09:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5C1C20854
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 09:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NE3lsAGp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5C1C20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFcFl5iHQY+qc7uoZuo8ErglwM4aoxc0lwjFNgCIPAI=; b=NE3lsAGpLLWvHK
	r/3HNZSGI9PhBCwvHqPIz5TmUfBRqQYEmG/j/JfETVQRBeMHS1Ra7a/NfTA6vrRfnTvMC7lbpYO8U
	eapXj6Mm94EydPso+09ts3sQk+fwby+LZI2j0Ai+5roFWbslox+WyoC3DcQ4vG1YT33e9IaLQITs+
	HYzjbUj5eFLXbXPhtBQyDTUoQ4vrLyKsHa85epdQ7Z5pTP0Hyh+gy/LYa1LsS1wR7UspQc0R5qPzB
	dzH+q8CD0TCRAgvGP0fd4Z0ZEISj7w4Cda98hTpm71dJABeMsgwJORfQ6XaI+TuhxGV+IJJRqb5rK
	jyX6CmC2fI3mGz+AeTOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJwew-0005KW-4i; Mon, 14 Oct 2019 09:28:58 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJwes-0005JZ-C3
 for linux-mtd@lists.infradead.org; Mon, 14 Oct 2019 09:28:56 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x9E9RL0C077829;
 Mon, 14 Oct 2019 17:27:21 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 6E969CCCFD0F074FFBBA;
 Mon, 14 Oct 2019 17:27:21 +0800 (CST)
In-Reply-To: <20191007101847.7fcfcfc7@xps13>
References: <1567676229-23414-1-git-send-email-masonccyang@mxic.com.tw>
 <20191007101847.7fcfcfc7@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3] mtd: rawnand: Add support for Macronix NAND randomizer
MIME-Version: 1.0
X-KeepSent: F66743F5:5B74B775-48258493:003332F7;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFF66743F5.5B74B775-ON48258493.003332F7-48258493.0033F1E2@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 14 Oct 2019 17:27:22 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/10/14 PM 05:27:21,
 Serialize complete at 2019/10/14 PM 05:27:21
X-MAIL: TWHMLLG3.macronix.com x9E9RL0C077829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_022854_679668_FBC25F49 
X-CRM114-Status: GOOD (  18.55  )
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
 richard@nod.at, linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,


> > changelog
> > v3:
> > To enable randomizer by specific DT property in children nodes,
> > mxic,enable-randomizer-otp;
> > 
> > v2:
> > To enable randomizer by checking chip options NAND_NO_SUBPAGE_WRITE
> > 
> > v1:
> > To enable randomizer by sys-fs
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  drivers/mtd/nand/raw/nand_macronix.c | 64 
++++++++++++++++++++++++++++++++++++
> 
> As long as you modify bindings, you should write a separate patch to
> update the documentation and get it acked by Rob Herring.

Do you mean I have to create a new device tree binding file by 
nand_macronix.txt 
for raw NAND device ?

> 
> >  1 file changed, 64 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_macronix.c 
b/drivers/mtd/nand/raw/
> nand_macronix.c
> > index 58511ae..d5df09a 100644
> > --- a/drivers/mtd/nand/raw/nand_macronix.c
> > +++ b/drivers/mtd/nand/raw/nand_macronix.c
> > @@ -11,6 +11,13 @@
> >  #define MACRONIX_READ_RETRY_BIT BIT(0)
> >  #define MACRONIX_NUM_READ_RETRY_MODES 6
> > 
> > +#define MACRONIX_RANDOMIZER_BIT BIT(1)
> > +#define ONFI_FEATURE_ADDR_MXIC_RANDOMIZER 0xB0
> > +#define MACRONIX_RANDOMIZER_ENPGM BIT(0)
> > +#define MACRONIX_RANDOMIZER_RANDEN BIT(1)
> > +#define MACRONIX_RANDOMIZER_RANDOPT BIT(2)
> > +#define MACRONIX_RANDOMIZER_MODE_EXIT ~MACRONIX_RANDOMIZER_ENPGM
> 
> I would rather prefer a 
> 
> #define ...RANDOMISER_MODE_ENTER (ENGPM | RANDEN | RANDOPT)
> #define ...RANDOMISER_MODE_EXIT (RANDEN | RANDOPT)
> 

okay.

> > +
> >  struct nand_onfi_vendor_macronix {
> >     u8 reserved;
> >     u8 reliability_func;
> > @@ -29,15 +36,72 @@ static int macronix_nand_setup_read_retry(struct 
> nand_chip *chip, int mode)
> >     return nand_set_features(chip, ONFI_FEATURE_ADDR_READ_RETRY, 
feature);
> >  }
> > 
> > +static void macronix_nand_randomizer_check_enable(struct nand_chip 
*chip)
> 
> You should return something and check it from the calling function.

okay, will fix it.

> 
> > +{
> > +   u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
> > +   int ret;
> > +
> > +   ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (feature[0]) {
> > +      pr_info("Macronix NAND randomizer enabled:0x%x\n", feature[0]);
> > +      return;
> > +   }
> > +
> > +   feature[0] = MACRONIX_RANDOMIZER_ENPGM | 
MACRONIX_RANDOMIZER_RANDEN |
> > +           MACRONIX_RANDOMIZER_RANDOPT;
> > +   ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret)
> > +      goto err;
> > +
> > +   feature[0] = 0x0;
> > +   ret = nand_prog_page_op(chip, 0, 0, feature, 1);
> 
> What is this? A comment is needed.

it's needed for a OTP bit programming flow.

> 
> > +   if (ret)
> > +      goto err;
> > +
> > +   ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret)
> > +      goto err;
> > +
> > +   feature[0] &= MACRONIX_RANDOMIZER_MODE_EXIT;
> > +   ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret)
> > +      goto err;
> > +
> > +   pr_info("Macronix NAND randomizer enable ok\n");
> 
> The pr_info "ok" could be dropped, the "failed" one would go in
> nand_onfi_init() after a check on the return code.
> 
> Then, no more goto's.

got it, will fix it.

thanks for your time and comments.

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
