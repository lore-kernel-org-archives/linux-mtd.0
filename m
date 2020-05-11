Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D5AC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 03:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1382220661
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 03:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P9/se1Bn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1382220661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DV3hGrNmpyHfQi+ZSvwK5LkgVzFwdXrU2X7Sta5hEU=; b=P9/se1BnWjaPte
	CrDqhq4e5C8fC5RXYKg+nYN3+eSVejVgJgBUlkLGUfphZt50x0BMCZZtRs9cgNTZ+JGpIU4F1VObq
	whvANkC5V+ud4feW3Et59hDfhNkbVcoPF7RTJMBYTEetVZ3cgwLO1gARHauACa/Rh9U2xa9qllKED
	JoIybPiDtAfSw/BHy8dLHr5TbJdbuc0ffRzGm+qtZYSGpQRL3BhaLagHEDzKvSYIg+jr6haeNMLrv
	p8l4f8qrni8A64FWk0YcboC7ce6d0Cfz8TEnhgmTJUxs3UHPHa/3lsIFX2Ug94KbuPPwV7GBRJcpv
	t58l7jvY8Dhyx7oJt8xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXz3I-0006Vw-BY; Mon, 11 May 2020 03:24:24 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXz3E-0006VB-OU
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 03:24:22 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 04B3NVVL077104;
 Mon, 11 May 2020 11:23:31 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 1866BA869F7CCFC0A268;
 Mon, 11 May 2020 11:23:32 +0800 (CST)
In-Reply-To: <3e33ffae-3267-015a-8535-6e1667b03e39@ti.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>
 <OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
 <3e33ffae-3267-015a-8535-6e1667b03e39@ti.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
MIME-Version: 1.0
X-KeepSent: 8A6B0341:0CDED2CF-48258565:000F3369;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF8A6B0341.0CDED2CF-ON48258565.000F3369-48258565.0012A22D@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 11 May 2020 11:23:32 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/11 AM 11:23:32,
 Serialize complete at 2020/05/11 AM 11:23:32
X-MAIL: TWHMLLG3.macronix.com 04B3NVVL077104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_202421_045641_46C251C3 
X-CRM114-Status: GOOD (  16.57  )
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
Cc: tudor.ambarus@microchip.com, juliensu@mxic.com.tw, richard@nod.at,
 Pratyush Yadav <me@yadavpratyush.com>, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Vignesh,

> >>>
> >>> Our mx25uw51245g supports BFPT DWORD-18,19 and 20 data and xSPI 
> > profile 
> >>> 1.0,
> >>> and it comply with BFPT DWORD-19, octal mode enable sequences by 
write 
> > CFG 
> >>> Reg2 
> >>> with instruction 0x72. Therefore, I can't apply your patches.
> >>
> >> I didn't mean apply my patches directly. I meant more along the lines 
of 
> > 
> >> edit your patches to work on top of my series. It should be as easy 
as 
> >> adding your flash's fixup hooks and its octal DTR enable hook, but if 
my 
> > 
> >> series is missing something you need (like complete Profile 1.0 
parsing, 
> > 
> >> which I left out because I wanted to be conservative and didn't see 
any 
> >> immediate use-case for us), let me know, and we can work together to 
> >> address it.
> > 
> > yes,sure!
> > let's work together to upstream the Octal 8D-8D-8D driver to mainline.
> > 
> > The main concern is where and how to enable xSPI octal mode?
> > 
> > Vignesh don't agree to enable it in fixup hooks and that's why I 
patched
> > it to spi_nor_late_init_params() and confirmed the device support xSPI 

> > Octal mode after BFPT DWORD-19 and xSPI pf 1.0 have been parsed.
> > 
> 
> My suggestion was to use SFDP wherever possible.. E.g: it is possible to
> get opcode extension type from BFPT...
> 
> But using BFPT DWORD-19 is not correct for switching to 8D-8D-8D mode:
> 
> Per JESD216D.01 Bits 22:20 of  19th DWORD of BFPT:
> 
> Octal Enable Requirements:
> 
> This field describes whether the device contains a Octal Enable bit used
> to enable 1-1-8 and 1-
> 8-8 octal read or octal program operations.
> 
> So, this cannot be used for enabling 8D-8D-8D mode... Flashes that only
> support 1S-1S-1S and 8D-8D-8D will set this field to 0.

yes, you are right, the bits 22~20 your mentioned are for 1-1-8 and 1-8-8 
mode enable requirements and they are zero if Flash only supports 
1S-1S-1S,
8S-8S-8S and 8D-8D-8D, just like mx25xx series.

There are bits 8~4 for 8S-8S-8S and 8D-8D-8D mode enable sequences and
I have patched these in this patches. 

By bits 8~4 in 19 th DWORD of BFPT, driver will know enable 8S-8S-8S or
8D-8D-8D by either issue two instruction (06h and E8h) or 
by Write CFG Reg 2.

mx25xx series supports enable Octal 8S-8S-8S/8D-8D-8D mode by Write CFG 
Reg 2.


> 
> There is a separate table to enable 8D mode called
> "Command Sequences to Change to Octal DDR (8D-8D-8D) mode". But if flash
> does not have the table or has bad data, fixup hook is the only way...
> 
> If mx25* supports above table, please build on top of Pratyush's series
> to add support for parsing this table. Otherwise, macronix would have to
> use a fixup hook too...

mx25xx series also supports "Command Sequences to Change to Octal DDR 
(8D-8D-8D) mode" for sure. I will patch them in next version.

For mx25* series, a fixup hook will only setup specific dummy cycles to 
device for various frequency after xSPI 1.0 table has been parsed.


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
