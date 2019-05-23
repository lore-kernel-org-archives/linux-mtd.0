Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF0EC282DD
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 08:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBCA22081C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 08:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LayR8Dj1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBCA22081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wrrb2weangojsGB+TL50TPBuMQX87HszMQDyrUSwkE4=; b=LayR8Dj146CmHw
	Nex7OxZfsPL90tDcxLSvtuH4DhXvsJ2jiKYtW64WE8WhEQC1hWgPZ/35rWIhaPJlRKI1Y9MMZZkhZ
	YXHa+3CZEOZTtxW4aLDCMwAk2eGJAttAkCx5MkB9V/TyQDlMrmzKCgFoPbEPu5WzTBaRYEVHjviRL
	34bERr+rR3qU++aNjDrkQpTsB8O6SAYy7vqN3wS7pbHSxAZgu8uaXJftWlj8cIB77zytbf2ujLru3
	iseX5mpaDojTKpcqMDD196u0Cj2jWRUZQGqaynWrEzSgi/nHFQ4axg06Cm8Jz105ddSAlWP+9CIlp
	gSI9LhDwaZdSVY9/ceog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTjZ5-0006U3-JY; Thu, 23 May 2019 08:59:07 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTjZ2-0006Td-AQ
 for linux-mtd@lists.infradead.org; Thu, 23 May 2019 08:59:05 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x4N8w1Kv035351;
 Thu, 23 May 2019 16:58:01 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 84B201FAC184BC8B8955;
 Thu, 23 May 2019 16:58:01 +0800 (CST)
In-Reply-To: <20190520142333.390091d5@xps13>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>	<OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
 <20190520142333.390091d5@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
MIME-Version: 1.0
X-KeepSent: ADC47344:0F9941B2-48258403:002336E3;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 23 May 2019 16:58:02 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/23 PM 04:58:01,
 Serialize complete at 2019/05/23 PM 04:58:01
X-MAIL: TWHMLLG4.macronix.com x4N8w1Kv035351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_015904_635110_92BD0274 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marcel.ziswiler@toradex.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > 
> > > > +
> > > > +static void mxic_nand_select_chip(struct nand_chip *chip, int 
chipnr) 
> > > 
> > > _select_target() is preferred now 
> > 
> > Do you mean I implement mxic_nand_select_target() to control #CS ?
> > 
> > If so, I need to call mxic_nand_select_target( ) to control #CS ON
> > and then #CS OFF in _exec_op() due to nand_select_target()<in 
nand_base,c>
> > is still calling chip->legacy.select_chip ?
> 
> You must forget about the ->select_chip() callback. Now it should be
> handled directly from the controller driver. Please have a look at the
> commit pointed against the marvell_nand.c driver.

I have no Marvell NFC datasheet and have one question.

In marvell_nand.c, there is no xxx_deselect_target() or 
something like that doing #CS OFF.
marvell_nfc_select_target() seems always to make one of chip or die
#CS keep low.

Is it right ?

How to make all #CS keep high for NAND to enter 
low-power standby mode if driver don't use "legacy.select_chip()" ?

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
