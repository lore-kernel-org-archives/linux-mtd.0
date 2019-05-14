Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE80EC04AA7
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 02:16:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3C72085A
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 02:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lORmXbVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3C72085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSWCkNcIYcmiuQmdNmLwY9KmP4avmBzYqi+1DyvWcQo=; b=lORmXbVTnWlsDz
	oJY1/d2JRdTfZQvnylevKenluxUzzu1IkaEfsay006xUBBilDLgSHF/3uV6wIf9cffr24NGQgUd74
	Qa2WNebwAyKa4jkjT11UJkaUU6rKUx9aSCXGRgdFDMy1D2XlfN4064lY9otiS74lORzKPfna+Z9Ef
	B2wWLPSn6mRimXc74+pbqK238BAke/NaXDQRvQfu6iZJs9I+4BwVxlMh19rEYPa6DRdIniHYzGYqz
	CEpeKeTqXazmCvjT2lR8NT7w+pbIYTFiea5PC2Ypxm+/6E1cTyouFzDvRWPY+8FjxjVdbWNsqvaqk
	jbGDUX21NYcgsoL4KLEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQMzd-0006dQ-B0; Tue, 14 May 2019 02:16:37 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQMza-0006d5-5J
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 02:16:35 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x4E2G96p098155;
 Tue, 14 May 2019 10:16:09 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id E5D371E015FA3816775F;
 Tue, 14 May 2019 10:16:09 +0800 (CST)
In-Reply-To: <20190513115926.3e862566@xps13>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>	<20190510094528.6008e8da@xps13>
 <OF5E2BF75D.98A43E33-ON482583F6.002E7A65-482583F6.0030A2DE@mxic.com.tw>	<20190510111121.54f42e70@xps13>
 <OF3A216E48.80ABBB8A-ON482583F9.002A09DA-482583F9.002AD40E@mxic.com.tw>
 <20190513115926.3e862566@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
MIME-Version: 1.0
X-KeepSent: C9B66DDF:FF9E0953-482583FA:000BD165;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFC9B66DDF.FF9E0953-ON482583FA.000BD165-482583FA.000C7714@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 14 May 2019 10:16:09 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/14 AM 10:16:09,
 Serialize complete at 2019/05/14 AM 10:16:09
X-MAIL: TWHMLLG3.macronix.com x4E2G96p098155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_191634_487584_99C20131 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,
 
> > > > > > +
> > > > > > +      if (mxic->reliability_func & MACRONIX_READ_RETRY_BIT) {
> > > > > > +         chip->read_retries = MACRONIX_READ_RETRY_MODE + 1; 
> > > > > 
> > > > > Why +1 here, I am missing something? 
> > > > 
> > > > 
> > > > Without + 1, read retry mode is up to 4 rather than 5.
> > > > But this NAND device support read retry mode up to 5.
> > > > 
> > > 
> > > If there are 5 modes, you need to set 5 to chip->read_retries, not 
6.
> > > 
> > > If only 4 modes are used, there is probably a bug in the core that
> > > must be fixed, please do not workaround it in the driver! 
> > 
> > 
> > It seems some patches is needed in nand_base.c
> > 
-------------------------------------------------------------------------------------
> > diff --git a/drivers/mtd/nand/raw/nand_base.c 
> > b/drivers/mtd/nand/raw/nand_base.c
> > index ddd396e..56be3a9 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -3101,7 +3101,8 @@ static int nand_setup_read_retry(struct 
nand_chip 
> > *chip, int retry_mode)
> >  {
> >         pr_debug("setting READ RETRY mode %d\n", retry_mode);
> > 
> > -       if (retry_mode >= chip->read_retries)
> > +       if (retry_mode > chip->read_retries)
> 
> If I understand correctly, chip->read_retries is the total number of
> 'modes' so the last valid mode is indeed chip->read_retries -1.
> 
> I thought the problem would come from the core but I was wrong, you
> actually need a MACRONIX_NUM_READ_RETRY_MODES set to 6. Please have two
> defines if you need both (the first one being something like
> MACRONIX_MAXIMUM_READ_RETRY_MODE set to 5).

I have checked one of Micron's datasheet and it defined read-retry number 
= 8,
mode 0 ~ 7, 0 mean to disable read-retry.
Therefore, I will patch MACRONIX_NUM_READ_RETRY_MODES = 6.

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
