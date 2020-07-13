Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D847C433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 05:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B13B20674
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 05:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B2fpvXV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B13B20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fqLtv7dOFH3E75gyk5hE5W0tS6oYylbieOY5IQF3Ys0=; b=B2fpvXV5krO9rirobfyyd0/0w
	CL58wmmts4kbCWCXyR8tlqarZR9DuCKOdl3ReYTq+yuHxKJWtQwQOZt2OO+uL9w/DoZkM/+/kzD3O
	JWr4nW7yqDeO/nvypvnYAfeC2zMnKnJg2fTkhrAyhXYnResE9dqLNmM3czJBRfEnftSFsvHhP02cU
	iYzft+QQiaWdp4EUDfr/Nk5lHXhfgxpEFROv1tFwo1pu4+xhZFd9HswSJDmL2jF1gQ4GM5Sh0/2/W
	H6upmipOys7OxsJwrEwNDc9ZUXhRF93kx+v/NsTYCEQSq43aVxQQU7W0Nd22Pvm+33JhBM6D5I/MD
	87eVmk8Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurKN-0005wD-Mw; Mon, 13 Jul 2020 05:48:35 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurKK-0005un-9w
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 05:48:33 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 06D5lxWN013791;
 Mon, 13 Jul 2020 13:47:59 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id CD64D56BB534C3CED3CB;
 Mon, 13 Jul 2020 13:47:59 +0800 (CST)
In-Reply-To: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
To: ycllin@mxic.com.tw
Subject: Re: [PATCH v4 0/7] mtd: spi-nor: add xSPI Octal DTR support
MIME-Version: 1.0
X-KeepSent: 489B498F:FD7A0610-482585A4:001F9CFA;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF489B498F.FD7A0610-ON482585A4.001F9CFA-482585A4.001FDC15@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 13 Jul 2020 13:47:59 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/07/13 PM 01:47:59,
 Serialize complete at 2020/07/13 PM 01:47:59
X-MAIL: TWHMLLG4.macronix.com 06D5lxWN013791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_014832_713939_9FE8EF6E 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, matthias.bgg@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


+ YC Lin in loop,

YC(ycllin@mxic.com.tw)will take over this patch set.


> Subject
> 
> [PATCH v4 0/7] mtd: spi-nor: add xSPI Octal DTR support
> 
> Hello,
> 
> JESD216C has defined specification for Octal 8S-8S-8S and 8D-8D-8D.
> Based on JEDEC216C Basic Flash Parameter Table (BFPT) driver extract
> DWORD-18: command and command extension type.
> DWORD-20: Maximum operation speed of device in Octal mode.
> 
> xSPI profile 1.0 table:
> DWORD-1: Read Fast command, the number of dummy cycles and address 
nbytes
>     for Read Status Register command.
> DWORD-2: Read/Write volatile Register command for CFG Reg2.
> DWORD-4 and DWORD-5: dummy cycles used for various frequencies based on
> maximum speed of device from BFPT 20th DWORD.
> 
> Ccommand sequences to change to octal DTR mode:
> The length of each command sequence is 8 per byte for single SPI mode 
and
> patching driver to parse and execute these sequences for octal DTR mode.
> 
> By Vignesh's comments, this patches set is dependency on Pratyush's
> [1][2][5][7][8] and [10][12].
> 
> Tested on Macronix's Zynq PicoZed board with Macronix's SPI controller
> (spi-mxic.c) driver patched on mx25uw51245g Octal flash.
> 


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
