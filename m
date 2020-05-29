Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC931C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 05:27:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BAF12072D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 05:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkyKPoWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BAF12072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoZPYJh0zZ2KT/l582xs0fsCoGHknaHRANlxb6naWCE=; b=kkyKPoWe3IokDb
	DMp0gFZRhBXIniurvZVAqLCY8AHZD2LznjzBDUDXXnjzKx+dSkJ130h2pIIsmx5Ey55yDyjhU/lfu
	AONaW81H2NyyyAu3im6BpD2aQpVf99c1biP2a2F2iYnO3AWREVqg6yZ7MQgkAyFNnoaDIpTj+065c
	Jyb7GncJtIeuYY5BcCO7em7V4v5uMEiebGvcZWF6/CPzqd0NPwtVWljNhMZ/TW/tXkyvkBYAdA3xZ
	k/VKqJ1rFB+tiGdwzwKPaC+gIHSle8qcI08H+Fjc2F6jih7sQGvBNee0HQAhEPo+BcxYCX7MJUP97
	kBk7YV+6FT8E35KFIq7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeXYN-0007CA-6s; Fri, 29 May 2020 05:27:35 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeXYK-0007BW-Fz
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 05:27:34 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 04T5R3iF028507;
 Fri, 29 May 2020 13:27:03 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id EE1F313970D7BAF9D89B;
 Fri, 29 May 2020 13:27:03 +0800 (CST)
In-Reply-To: <20200528102609.0dbb59a5@collabora.com>
References: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
 <20200528102609.0dbb59a5@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 00/14] mtd: spi-nor: add xSPI Octal DTR support
MIME-Version: 1.0
X-KeepSent: 584CB594:BEA39E9B-48258577:001D866D;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF584CB594.BEA39E9B-ON48258577.001D866D-48258577.001DF14F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 29 May 2020 13:27:03 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/29 PM 01:27:03,
 Serialize complete at 2020/05/29 PM 01:27:03
X-MAIL: TWHMLLG3.macronix.com 04T5R3iF028507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_222732_783311_106480C4 
X-CRM114-Status: GOOD (  14.86  )
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
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Boris,

> > 
> > 
> > Summary of change log
> > v3:
> > Add support command sequences to change octal DTR mode and based on
> > part of Pratyush's patches set.
> > 
> > v2: 
> > Parse BFPT & xSPI table for Octal 8D-8D-8D mode parameters and enable 
Octal
> > mode in spi_nor_late_init_params().
> > Using Macros in spi_nor_spimem_read_data, spi_nor_spimem_write_data 
and
> > so on by Vignesh comments.
> > 
> > v1:
> > Without parsing BFPT & xSPI profile 1.0 table and enter Octal 8D-8D-8D
> > mode directly in spi_nor_fixups hooks.
> > 
> > 
> > thnaks for your time and review.
> > best regards,
> > Mason
> > 
> > --
> > Mason Yang (7):
> >   mtd: spi-nor: sfdp: get octal mode maximum speed from BFPT
> >   mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
> >   mtd: spi-nor: sfdp: parse command sequences to change octal DTR mode
> >   mtd: spi-nor: core: add configuration register 2 read & write 
support
> >   spi: mxic: patch for octal DTR mode support
> >   mtd: spi-nor: core: execute command sequences to change octal DTR 
mode
> >   mtd: spi-nor: macronix: Add Octal 8D-8D-8D supports for Macronix
> >     mx25uw51245g
> > 
> > Pratyush Yadav (7):
> >   spi: spi-mem: allow specifying whether an op is DTR or not
> >   spi: spi-mem: allow specifying a command's extension
> >   mtd: spi-nor: add support for DTR protocol
> >   mtd: spi-nor: sfdp: prepare BFPT parsing for JESD216 rev D
> >   mtd: spi-nor: sfdp: get command opcode extension type from BFPT
> >   mtd: spi-nor: core: use dummy cycle and address width info from SFDP
> >   mtd: spi-nor: core: enable octal DTR mode when possible
> 
> Why are you doing that?! This series is being actively worked on by
> Pratyush, and all you gain by sending it on your own is more
> confusion. If you have patches on top of a series that's not been
> merged yet, mention the dependency in the cover letter, but don't
> resend patches that have already been sent and are being reviewed.

okay, much thank for your comments.
Will re-submit and mention the dependency in my cover letter.

Hi Pratyush,
Sorry if these patches make you uncomfortable.

> 
> I think it's time you spend a bit of time learning about the submission
> process, because that's not the first mistake you do, and I'm pretty
> sure I already mentioned that in my previous reviews.

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
