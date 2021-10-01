Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3699CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBFF61A55
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECBFF61A55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UboqZiRc8m6DrkCuoFT5ht85CIF6dvjGcDOTRvUau6M=; b=WkrbTzmbrmKCnu26LxnbFfwKOJ
	S6WnMAGrIcFEEp6KQJTgyFY0Zc5YSwe6cws+i7TU5uPZOfqPIxCWBxMR8DQmcblucBsohhz5rxh/a
	vpan/IOgt9bQWKrkxZDGfyiSPRzkB43mfXAxbrBllKJFkqTSV/AyDMnPL/tzi07spwiOk/u+Za20l
	RkEwOrgM83Oi0xp6aw14ZWtmzO+p7mga0Vy52hu66mU3j9DzqBLyjspO6XHPOTOeV3LKnzIAU88o+
	gz6ytVLzouSzwPSDBgT9Kd7efvnY6mtflPI0vySYbrGNPsCrF6WqFWPkB2mf7sqvOdwOe8yeLMaTh
	EZguIfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWDWX-00Gy3J-NS; Fri, 01 Oct 2021 08:04:05 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWDWU-00Gy2H-P9
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 08:04:04 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id q189so706117ybq.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Oct 2021 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UkTV/Hx+0kC37e1L6jOI1Y69QnSHLaF5uOLMErL9pfc=;
 b=GS/7MMG8VG3EwqT0c2Lm/gYv66cowtYEkkkYVz/u6kPeC85dCTVJAaINucv6NV4anJ
 WURJMEJYRdpMlrz5j94NWwQ9/h9EsNPPOMQvJYZ/h/FlUfACMlzAtPB4tr9KyJt3RlFC
 YvVoNPusNVvTpMoSapP6s7iwHvUzyQSBmWCLJCOgbXBSkgiBw2X63DYEPPypHsNUc5ZQ
 9uz4yJSK5+fgUrG+aCQhPejDp4ryP21GSG7OvVhTHXA/AGGZog8GcSnuFzwzgdNQ5XOt
 Ba7c5OqWgWTBtS6Z0zPcD6WMIiAxOhuNYRCFLz40gs0oMj90477929zEcOZ01xc04Mqz
 s0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UkTV/Hx+0kC37e1L6jOI1Y69QnSHLaF5uOLMErL9pfc=;
 b=tA6rPHO/IUQj5XSVmdUf9WSf8zi95eYpj7H55vtBogSAoIVGnemuL5BA5O6Bx9lPGq
 Ck31x5VQ6ibHP+eI3WE4tMbjLhWA3YjZR8lFyND86rnYD1lodoDWCiFnP9Cf9CSq1Dc4
 JSdw6lMvbwbYwrr3+RZVTGfwdcdBfBQ1PrPn0SQXBlnklDVKxWkgv10EtebErW6Eox4x
 WFvtjTN8e/ZdWjStMfnGIdfDNqnZtAjgUenu0wth5ngDYlsh5x8aZx6Z5lIKEDIqOPH5
 fCQrs6tI0JX76S3dluvqtzg0YUZLzVvzgWfZfpSSRM7trmpGhgWk8CffwPrzclNyvPwT
 JRJA==
X-Gm-Message-State: AOAM533mPqBW9EtpswBsqHCtrDOcZENbY5U5+m77iC15HMEULX63UYvk
 c8GOfnJDceT7K51qRIMPXgfRiZ4JV9X1WgqflqzvXOjpAP3L7A==
X-Google-Smtp-Source: ABdhPJy4j6EHmIy0MQOCvwAUhMRlGC9OoRrjR5IIMh88aRHWKguGjBgt+bJrkUsVhzvBNTkQVHOU9teoh/blCdQzwzE=
X-Received: by 2002:a25:b7c6:: with SMTP id u6mr4323825ybj.16.1633075441369;
 Fri, 01 Oct 2021 01:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXRZNxrgmfROlJy@shikoro>
In-Reply-To: <YVXRZNxrgmfROlJy@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Oct 2021 09:03:35 +0100
Message-ID: <CA+V-a8vKogydunptYaWVBq_UUQ98UUTp-n2-T+WH8thTRL8M4Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add SPI Multi I/O Bus Controller support for RZ/G2L
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org, 
 linux-spi <linux-spi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_010402_909179_D26BDBB2 
X-CRM114-Status: GOOD (  15.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On Thu, Sep 30, 2021 at 4:01 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > This patch series adds a couple of fixes for rpc-if driver and
> > adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
> > is identical to the RPC-IF block found on R-Car Gen3 SoC's.
>
> I did some basic testing on the Falcon board with a Renesas R-Car V3U
> SoC and did not find a regression, so:
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
Thank you for testing this, I will include the Tested-by tag along
with the RB tags.

Cheers,
Prabhakar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
