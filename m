Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DD8C43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 08:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF112083D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 08:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PI9fUVTH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF112083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/YJ8xBut3tp9nhhgxDOvaF5VRABgNPaK7wcH4KyqQU=; b=PI9fUVTHOojQBD
	yXyErbFox3m5kFoHY1Za/ZcBLLIdGQnVAEQ86BHUt1LL0hnS+xInTIt5pseGTM8JHej6quGeC5xiQ
	HApvT2uTGL4wD4+GC1gT8qy1RqT/icnjih5Yx4SD3gJKC/qOjBU2jMiib7BUui9135AX6gY9ototZ
	XsAZWiLNE8rsCHtnoeG49y03/5lzUPIdG7Z9LflSI7WuSMNKOGoDod6hv4lWisbWcmNEPS1pcpSW7
	0q/RDU1gTbTUiwwCVMNoM2QG+fek52iFlzNzi+N26TwgdzvjKvU00VMfGvGq/ACgnYzB9uPwdB+js
	f/pqDujR4UDy4ie3kn8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfKmd-0002XW-SM; Mon, 24 Jun 2019 08:57:03 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfKma-0002X1-AL
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 08:57:02 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x5O8te4j092345;
 Mon, 24 Jun 2019 16:55:40 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 61692E8312812FC0B8BA;
 Mon, 24 Jun 2019 16:55:41 +0800 (CST)
In-Reply-To: <20190619110643.523c1f56@collabora.com>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<20190512151820.4f2dd9da@xps13>
 <OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>	<20190520142333.390091d5@xps13>
 <OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>	<20190527144250.71908bd9@xps13>
 <OFE923A8E5.50375C30-ON48258409.0009AE1B-48258409.00119767@mxic.com.tw>	<20190617143510.4ded5728@xps13>
 <OF1C1397B4.241DC339-ON4825841D.000482A2-4825841D.0007B67E@mxic.com.tw>	<20190618081436.5d488320@collabora.com>
 <20190618092901.3bdd9f61@collabora.com>	<OF5EAF94EB.AE31CF59-ON4825841E.002A2C38-4825841E.002C60BF@mxic.com.tw>
 <20190619101519.391919ec@collabora.com>	<OF9EFE4BDE.3166D82B-ON4825841E.00307F51-4825841E.00310FB5@mxic.com.tw
 <20190619110643.523c1f56@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
MIME-Version: 1.0
X-KeepSent: C97D5691:B26644D3-48258423:002F8D47;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFC97D5691.B26644D3-ON48258423.002F8D47-48258423.00310B3E@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 24 Jun 2019 16:55:41 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/06/24 PM 04:55:41,
 Serialize complete at 2019/06/24 PM 04:55:41
X-MAIL: TWHMLLG4.macronix.com x5O8te4j092345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_015700_633804_1201F5FA 
X-CRM114-Status: GOOD (  22.60  )
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


Hi Boris,


> > > > > Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND 
> > controller
> > > > > 
> > > > > On Tue, 18 Jun 2019 08:14:36 +0200
> > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > How to make all #CS keep high for NAND to enter 
> > > > > > > > > > > low-power standby mode if driver don't use 
> > > > "legacy.select_chip()" 
> > > > > > > ? 
> > > > > > > > > > 
> > > > > > > > > > See commit 02b4a52604a4 ("mtd: rawnand: Make 
> > ->select_chip() 
> > > > > > > optional 
> > > > > > > > > > when ->exec_op() is implemented") which states:
> > > > > > > > > > 
> > > > > > > > > >         "When [->select_chip() is] not implemented, 
the 
> > core 
> > > > is 
> > > > > > > assuming 
> > > > > > > > > >    the CS line is automatically asserted/deasserted by 
the 
> > 
> > > > driver 
> > > > > > > > > >    ->exec_op() implementation." 
> > > > > > > > > > 
> > > > > > > > > > Of course, the above is right only when the controller 
 
> > driver 
> > > > 
> > > > > > > supports 
> > > > > > > > > > the ->exec_op() interface. 
> > > > > > > > > 
> > > > > > > > > Currently, it seems that we will get the incorrect data 
and 
> > 
> > > > error 
> > > > > > > > > operation due to CS in error toggling if CS line is 
> > controlled 
> > > > in 
> > > > > > > > > ->exec_op(). 
> > > > > 
> > > > > Oh, and please provide the modifications you added on top of 
this 
> > patch.
> > > > > Right now we're speculating on what you've done which is 
definitely 
> > not
> > > > > an efficient way to debug this sort of issues. 
> > > > 
> > > > The patch is to add in beginning of ->exec_op() to control CS# low 
and 
> > 
> > > > before return from ->exec_op() to control CS# High.
> > > > i.e,.
> > > > static in mxic_nand_exec_op( )
> > > > {
> > > >  cs_to_low();
> > > > 
> > > > 
> > > > 
> > > >  cs_to_high();
> > > >  return;
> > > > }
> > > > 
> > > > But for nand_onfi_detect(), 
> > > > it calls nand_read_param_page_op() and then nand_read_data_op().
> > > > mxic_nand_exec_op() be called twice for nand_onfi_detect() and
> > > > driver will get incorrect ONFI parameter table data from 
> > > > nand_read_data_op(). 
> > > 
> > > And I think it's valid to release the CE pin between
> > > read_param_page_op() (CMD(0xEC)+ADDR(0x0)) and read_data_op() (data
> > > cycles) if your chip is CE-dont-care compliant. So, either you have 
a
> > > problem with your controller driver (CS-related timings are 
incorrect)
> > > or your chip is not CE-dont-care compliant. 
> > 
> > Understood, I will try to fix it on my NFC driver.
> 
> Before you do that, can you please try to understand where the problem
> comes from and explain it to us? Hacking the NFC driver is only
> meaningful if the problem is on the NFC side. If your NAND chip does
> not support when the CS pin goes high between read_param_page_op() and
> read_data_op() the problem should be fixed in the core.

I think I have fixed the problem and the root cause is the our NFC's TX 
FIFO counter 
do a unnecessary reset in CS control function. Our NFC implement 
read-write 
buffer transfer to send command, address and data.
A unnecessary reset to TX FIFO will send a command byte out first and this 
extra
command will make something wrong to next operation.

For now, doing CS# control in ->exec_op() is OK to me.

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
