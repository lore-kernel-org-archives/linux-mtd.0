Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B74BC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 01:26:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB67623C18
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 01:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB67623C18
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q1TtqGLMgiwRM/I9BTHHjN+aN7hnzbr3QzbybYwYkTw=; b=HcRKG019eA/scHZvwWXgPhLd/
	+hbhQEh25+6X7erbEfpMhdA06d5hROdmxkT9sFSpl72s8MZmo2QHBRQV7YJCn80XffSDbYNoufs69
	cmAcPVw2+WXRkzuccknCkX90BE3dXoC+RMOf+s4f6TDUgSXddvXk6OjV0DaYz2wBn8+PTkFmuWdYU
	NjKdV6k/bsmJdEPjXETOPEqiqvLx4B5mrgAhE1uPaCt/Dt6QkSpV2jiD9quq5heBpK9AcvqPH9FBO
	2pKjCY2KhexHFsSeCmereKLt9BUS1MiEgGQglpH7UISBuqHlzy/FNSHy9IToJjJ5cUffEqf8Fv0Ai
	Fc41KbNpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXBD-0007sv-N4; Fri, 11 Dec 2020 01:25:08 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knX7Q-0005cM-9b
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 01:21:14 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 0BB1KmVG015719;
 Fri, 11 Dec 2020 09:20:48 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 9E34BAEED14616A66FEC;
 Fri, 11 Dec 2020 09:20:48 +0800 (CST)
In-Reply-To: <20201210223333.204062b1@xps13>
References: <1607570529-22341-1-git-send-email-ycllin@mxic.com.tw>	<1607570529-22341-2-git-send-email-ycllin@mxic.com.tw>
 <20201210223333.204062b1@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/2] mtd: nand: ecc-bch: Fix the size of calc_buf/code_buf
 of the BCH
MIME-Version: 1.0
X-KeepSent: CD61AB38:41A2EFE7-4825863B:0006C241;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFCD61AB38.41A2EFE7-ON4825863B.0006C241-4825863B.000765F3@mxic.com.tw>
From: ycllin@mxic.com.tw
Date: Fri, 11 Dec 2020 09:20:48 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/12/11 AM 09:20:48,
 Serialize complete at 2020/12/11 AM 09:20:48
X-MAIL: TWHMLLG4.macronix.com 0BB1KmVG015719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_202112_930756_4107E1AC 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,
> "Miquel Raynal" <miquel.raynal@bootlin.com> 
> 
> Re: [PATCH 1/2] mtd: nand: ecc-bch: Fix the size of calc_buf/code_buf of 
the BCH
> 
> Hi YouChing,
> 
> YouChing Lin <ycllin@mxic.com.tw> wrote on Thu, 10 Dec 2020 11:22:08
> +0800:
> 
(deleted)
> > The root cause is that the size of calc_buf/code_buf is limited to 64
> > bytes, although sizeof(mtd->oobsize) returns 4, kzalloc() will 
allocate
> > 64 bytes (cache size alignment).
> > 
> > So we correct the size of calc_buf/code_buf to mtd->oobsize.
> > 
> > Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>
> > ---
> >  drivers/mtd/nand/ecc-sw-bch.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/ecc-sw-bch.c 
b/drivers/mtd/nand/ecc-sw-bch.c
> > index 4d8a979..0a0ac11 100644
> > --- a/drivers/mtd/nand/ecc-sw-bch.c
> > +++ b/drivers/mtd/nand/ecc-sw-bch.c
> > @@ -237,8 +237,8 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device 
*nand)
> > 
> >     engine_conf->code_size = code_size;
> >     engine_conf->nsteps = nsteps;
> > -   engine_conf->calc_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
> > -   engine_conf->code_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
> > +   engine_conf->calc_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
> > +   engine_conf->code_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
> 
> Very nice catch! If you don't mind I will merge this fix with the
> faulty commit (still in next) and I will also bring the fix to Hamming
> which will suffer from the same error.
> 
> Then I will apply the second patch.
 
No problem, thank you for your help.


Thanks,
Youching.


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
