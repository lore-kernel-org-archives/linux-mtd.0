Return-Path: <SRS0=zmh0=2J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE33C43603
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 20:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FD42467F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 20:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvCyPHL7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17FD42467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5DXUIOUC87evRdrRO8sDiWdeHh+i+94MgTjjKhj0/M=; b=VvCyPHL72UgIHC
	JJvQO0FRGzBnQNn5HHLkDe65fuPxx8tdikv1JZFHtroRDBxvuSJyk4Vi2AJDIVXyWxVA80QhRgAsY
	pJysxTjDEAMB7gCinh2KD9ktKcv4XUyLdXzFsjj+7kVHE0Zxv5embAtNii/zvRkpQwDAMZJZF4Aq1
	1k5v1bf++asG5qRwpVCAvm3LVsqmuCK+ML6Q6EYS7vgipzLW26qN+35pxpyjGFLsBB/u3wQym4w70
	dDspY8382VTTa16rnoylyGXv2Sybek8ys60rKp17YZY2cq/B7N5ii+6oeZBMaRrRGAlsQEkq2EgSL
	d3InyHxdxvti3ujob1qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii25A-0001tw-CF; Thu, 19 Dec 2019 20:07:36 +0000
Received: from mail-yw1-f66.google.com ([209.85.161.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii255-0001sP-0U
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2019 20:07:33 +0000
Received: by mail-yw1-f66.google.com with SMTP id 192so2666118ywy.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2019 12:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fYs9YV+R6ZChQu7K5kraIQcgs+ufLWziDdpBF76nsa8=;
 b=n53NvecVJnXOS9kICkScV/I9gSMDeLGzokdvdlC6ovDg5rM2308DqAmtUzke32Fe1A
 yP/jD7wS220ca6ztHdSDQGd+psHHYrrt4FbdlGPz1AQBLjs0N0sms/01SpkTzQJOonZq
 grequQvgyggc9G/miEOqAhO9E9Bht40ZILrK3glEHH1ijeq8HRpwAoX1+WsOwQ5eZzmy
 61nVp9ypFvyMhkMVc3+Ru7+nMTI7Sx618yG9zvkyfGpqIWQvB7ZwJEW8EBxuwsArQtNw
 j7713NOLl4Qt8JshoUbTVH/or2XwomgICOH1pBUzfEaDZosqmugwOxI9SRK3VeEyQ9l0
 djHA==
X-Gm-Message-State: APjAAAXEI/3S1LlTdelodEmnd/v0i87sjF7qQ5GwbScLLv4bamQ/NrDv
 CSFZkKxpI6ZKcH4ELfi8WErrhtgFsg==
X-Google-Smtp-Source: APXvYqwJjv7J5Gr8OJGkc6rGWBTU0vrDBs3+PxtxHOMedvJ+yysUWFZ4i5JnjUAZYg5iPrMMOMquow==
X-Received: by 2002:a81:3208:: with SMTP id y8mr2497299ywy.231.1576786049885; 
 Thu, 19 Dec 2019 12:07:29 -0800 (PST)
Received: from localhost ([172.58.139.89])
 by smtp.gmail.com with ESMTPSA id d199sm2988688ywh.83.2019.12.19.12.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 12:07:29 -0800 (PST)
Date: Thu, 19 Dec 2019 14:07:26 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: denali: add reset controlling
Message-ID: <20191219200154.GA27949@bogus>
References: <20191210091453.26346-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210091453.26346-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_120731_845874_1E65FFF8 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 10 Dec 2019 18:14:53 +0900, Masahiro Yamada wrote:
> According to the Denali User's Guide, this IP has two reset signals.
> 
>   rst_n:     reset most of FFs in the controller core
>   reg_rst_n: reset all FFs in the register interface, and in the
>              initialization sequence
> 
> This commit supports controlling those reset signals, although they
> might be often tied up together in actual SoC integration.
> 
> One thing that should be kept in mind is the automated initialization
> sequence (a.k.a. 'bootstrap' process) is kicked off when reg_rst_n is
> deasserted.
> 
> When the reset is deasserted, the controller issues a RESET command
> to the chip select 0, and attempts to read out the chip ID, and further
> more, ONFI parameters if it is an ONFI-compliant device. Then, the
> controller sets up the relevant registers based on the detected
> device parameters.
> 
> This process is just redundant for Linux because nand_scan_ident()
> probes devices and sets up parameters accordingly. Rather, this hardware
> feature is annoying because it ends up with misdetection due to bugs.
> 
> So, commit 0615e7ad5d52 ("mtd: nand: denali: remove Toshiba and Hynix
> specific fixup code") changed the driver to not rely on it.
> 
> However, there is no way to prevent it from running. The IP provides
> the 'bootstrap_inhibit_init' port to suppress this sequence, but it is
> usually out of software control, and dependent on SoC implementation.
> As for the Socionext UniPhier platform, LD4 always enables it. For the
> later SoCs, the bootstrap sequence runs depending on the boot mode.
> 
> I added usleep_range() to make the driver wait until the sequence
> finishes. Otherwise, the driver would fail to detect the chip due
> to the race between the driver and hardware-controlled sequence.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt   |  7 ++++
>  drivers/mtd/nand/raw/denali_dt.c              | 40 ++++++++++++++++++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
