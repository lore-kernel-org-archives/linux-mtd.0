Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F73C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E89206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Skmgzt87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E89206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxqXn2Y6wRobO9ENdOaMNuM7GOS8ndrQduz5TxeZ2+c=; b=Skmgzt87R5gbXG
	itT/LtNI+iJ3tXNlDG8zsL0UazEVmOdexm7lzYEt1aj7l3ZIXvpwN4QyXXfTO0uF+5vQTkcZSQIiq
	9o+eDPT/cKJ8TzCp3R1c76WEwQqp8ZJIAEGjRm1HSgWyAZOGdOi9PJxGK8Z/e8nDx0wDu1uE1x0fb
	qVBXEDzJrPtkjzheQj7DqSyxtg6qP5jnhkunl0luA0/tu5yLDIafAWrvTgloWNQV9coATpPVY4jo1
	GEw7CAZtUKSShEV3tkffLTGwKy+F7tzePLjDaMlzh2oqbSifYpt/kpGAzqPRCgo/7GmeUsJfHQUci
	18FLRSOE9d8QZrLqcS2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJWc-0001ae-4c; Tue, 28 Apr 2020 06:15:22 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJWX-0001LH-Hs
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:15:19 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 03S6EUUt046234;
 Tue, 28 Apr 2020 14:14:30 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 213FFAD9CBDD7EF05409;
 Tue, 28 Apr 2020 14:14:31 +0800 (CST)
In-Reply-To: <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
To: "Pratyush Yadav" <me@yadavpratyush.com>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
MIME-Version: 1.0
X-KeepSent: 18214CA5:6A9B2B30-48258558:001D894C;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 28 Apr 2020 14:14:31 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/04/28 PM 02:14:31,
 Serialize complete at 2020/04/28 PM 02:14:31
X-MAIL: TWHMLLG4.macronix.com 03S6EUUt046234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_231517_887330_35962DC3 
X-CRM114-Status: GOOD (  16.01  )
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Pratyush,

> > On Tue, 21 Apr 2020 14:39:42 +0800
> > Mason Yang <masonccyang@mxic.com.tw> wrote:
> > 
> > > Hello,
> > > 
> > > This is repost of patchset from Boris Brezillon's
> > > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].
> > 
> > I only quickly went through the patches you sent and saying it's a
> > repost of the RFC is a bit of a lie. You completely ignored the state
> > tracking I was trying to do to avoid leaving the flash in 8D mode when
> > suspending/resetting the board, and I think that part is crucial. If I
> > remember correctly, we already had this discussion so I must say I'm a
> > bit disappointed.
> > 
> > Can you sync with Pratyush? I think his series [1] is better in that 
it
> > tries to restore the flash in single-SPI mode before suspend (it's
> > missing the shutdown case, but that can be easily added I think). Of
> > course that'd be even better to have proper state tracking at the SPI
> > NOR level.
> 
> Hi Mason,
> 
> I posted a re-roll of my series here [0]. Could you please base your 
> changes on top of it? Let me know if the series is missing something you 

> need.
> 
> [0]  
https://lore.kernel.org/linux-mtd/20200424184410.8578-1-p.yadav@ti.com/


Our mx25uw51245g supports BFPT DWORD-18,19 and 20 data and xSPI profile 
1.0,
and it comply with BFPT DWORD-19, octal mode enable sequences by write CFG 
Reg2 
with instruction 0x72. Therefore, I can't apply your patches.

I quickly went through your patches but can't reply them in each your 
patches.

i.e,.
1) [v4,03/16] spi: spi-mem: allow specifying a command's extension

-                                u8 opcode;
+                                u16 opcode;

big/little Endian issue, right? 
why not just u8 ext_opcode;
No any impact for exist code and actually only xSPI device use extension 
command.


2) [v4,08/16] mtd: spi-nor: parse xSPI Profile 1.0 table

need extract more data from xSPI profile 1.0 table and no other specific 
setting. 


3) [v4,11/16] mtd: spi-nor: enable octal DTR mode when possible

+static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+                int ret;
+
+                if (!nor->params->octal_dtr_enable)
+                                return 0;
+
+                if (!(spi_nor_get_protocol_width(nor->read_proto) == 8 ||
+                      spi_nor_get_protocol_width(nor->write_proto) == 8))
+                                return 0;
+
+                ret = nor->params->octal_dtr_enable(nor, enable);
+                if (ret)
+                                return ret;
+
+                if (enable)
+                                nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
+                else
+                                nor->reg_proto = SNOR_PROTO_1_1_1;
+
+                return 0;
+}
+

it seems you enable device in Octal mode after SPI-NOR Framework is 
already
in Octal protocol.
Driver should set device by SPI 1-1-1 mode to enter Octal mode and then 
setup
Read/PP command and protocol by spi_nor_set_read/pp_setting() for Octal 
mode,
right ?


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
