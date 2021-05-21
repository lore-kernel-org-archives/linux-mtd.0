Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D725AC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 11:54:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19704613D0
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 11:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19704613D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDntGv9s3fwjB3x5Mv29Xc8RbZmSf345pqeiCrrIXig=; b=gDixgy74G1P+hcg6no/HQ/9vzv
	P+X2z8WgGrRPx0KK34Cd3yFJhVHbhzJ3naeRgyn2HJVXNexc+EhO2etx5U+D7vWar2mip/NlSgsOW
	sQaguBsY7SiAiL6C0ks8g1X/3ZdLZ/4yrev63sQ9UD+MCPyFbloQfpd25pfKgPaB3Hwvv/2X5DCD5
	jHb+8wwvG6aoqiQNJ/UVhjQ3aMPFIOMIuw/Ls1AxbwHuJUUW2uOg9PTdlbeGnOw9nAJjdUVHN9WS3
	PVXO4GzQhJq2LWgEBJuIWN24EjvO5nk856qcTHEp/ho389nhN3YF/4cmNthZwJJ7qIoT9mbLeYSH7
	Fv6kvsjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk3jC-005EG3-6I; Fri, 21 May 2021 11:54:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk3jA-005EFf-4W
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 11:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DvQ7SKabV/R8glu4bqGCCk9ngXCX7lDLYLAo8j+61y0=; b=0r3zYAxa9EpaIyyeGpKZAsW68g
 9wgkEVGuwRbzQCdzXWRoj7klSPBQb9TuNJ7Pn4IM2MP3gJiNZv0WVSWUwnHZOBTfFtNmCi0X++Zsh
 ZnRmWC7/14JRkbPAHWGArAYBw7KJjfaLNrKPgy1FQ/b4d2Gfp88Uf6z8mDor9rwbFvU6dDzDqDRv7
 j5W105MT32Yd1nfl8mnjhUd1j202PR9INUuommrG9IY88xAHb2cW3UP//bFnaCKOYMfbJ4001kfkt
 TktIrnUdxzOJ+Rwq5fKFO9BPA3OugSIpmymiMxJzPEnVjhgkjvrrHx7bO2HYTvM1/6EEHdS5uKBuZ
 Rqhht1Ww==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk3j7-00H4yw-46
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 11:54:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r12so20804842wrp.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 May 2021 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DvQ7SKabV/R8glu4bqGCCk9ngXCX7lDLYLAo8j+61y0=;
 b=cCNZ4MjiwhRppRwUO/inCngfg/IMLdqXDSLO8xzit9uuKdvF436WDunosINL8QYGJo
 RPAWX671m6G2Skuf59FB1sKYTXe66NxhIlh1uYPt9x2/ZoYAHiYnUqSmjwH4ER1bAtVj
 R2tOXmQcpcfup659k4i88EmPltTw2XicTdLkhlXP/oUjf/UpKAJG2CoEvZUJmZGVwhM2
 3aYAO5jP04/blW/nDbl1TH53XGhFiaXwEu63Y2GHO7Z/iU/O4KGn0fnh937x/6iMt6H7
 B3zDQKi9IJJ2bB2fFx80BTzHxjcueSIPYPqBXLEB6WvqXQgH2RnFiaF/tRhQDW7zTNc8
 4ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DvQ7SKabV/R8glu4bqGCCk9ngXCX7lDLYLAo8j+61y0=;
 b=qNXbWbBufxLzkOn2b6Rp4iVqUyIecpcr7tJ43fd1GTy80T4w+25ab9tDJG1dcm35gZ
 i4ctmC5BPDn4rzWu/nrdPnZmHLpag4LEoPbXvTBConxmUuEwIz0Plq0gQxGos9kMoMyQ
 T0p3B3H4AIqrHC347UBCEfN4h2bYihDI5rleppsi4wyktNXI4UymbfkVr8x9lrPkMXjp
 KMleny3BLYoJWIZwuwWvSiB9z0qVOE9C22IFIWO1dGREgSJQgPLOCD/Ntx03hJ8Jz88K
 S4Q3I+NzHdY+hy7EStmUTA8r+pN7WmnP3KLCOo5SDt8fcJKxOEaLt+DhBXaDcqrjTtPv
 WQjQ==
X-Gm-Message-State: AOAM533M+317MyCdX2UC/UkWmeMwQmBbZJX9BnWMUYza+fT1Yt5SPbPP
 IcG2JTBQ9bOo+wlUUQq3+nmqhA==
X-Google-Smtp-Source: ABdhPJzts29baPG1no9Hywg2wjet+xDmTPIijEIUhwvu6JXk9YEBcLDwLzhvwNU5Pm67gr1jLympFw==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr8962117wrs.411.1621598039287; 
 Fri, 21 May 2021 04:53:59 -0700 (PDT)
Received: from ntb.petris.klfree.czf (snat2.klfree.cz. [81.201.48.25])
 by smtp.gmail.com with ESMTPSA id u16sm1346976wrn.61.2021.05.21.04.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:53:58 -0700 (PDT)
Date: Fri, 21 May 2021 13:53:50 +0200
From: Petr Malat <oss@malat.biz>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using
 SFDP
Message-ID: <20210521115350.GA7908@ntb.petris.klfree.czf>
References: <20210520160701.28176-1-oss@malat.biz>
 <20210521095503.qw3aivg4zklupwcj@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521095503.qw3aivg4zklupwcj@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_045401_249449_E2822F86 
X-CRM114-Status: GOOD (  31.45  )
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

Hi!
On Fri, May 21, 2021 at 03:25:05PM +0530, Pratyush Yadav wrote:
> On 20/05/21 06:07PM, Petr Malat wrote:
> > This change allows adding a support for flashes with correct SFDP
> > without recompilation of the kernel by setting sfdp-compatible property
> > in their node. Alternatively, sfdp_compatible module option can be used
> > to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
> > be used to match all JEDEC IDs.
> 
> I have skimmed through the patch. Before I look at it more closely, I 
> want to understand the use case for this patch. Why would you not want 
> to recompile the kernel when adding support for new hardware? Do you 
> want the ability to support flashes on devices that have already been 
> deployed in the field? Is it something that comes up frequently?
In my case the kernel is loaded from a USB mass storage device, which
can be preproduced and on stock (with the kernel already on it). With
my patch I can change the flash vendor without the need of updating
the image on already existing USB mass storage devices.

The patch is also useful for people who use distribution kernel as they
will not have to wait until (and if) the distribution updates it.

> Then comes the question of how do you get the flash to probe if it is 
> not present in device tree? And if you are able to update the device 
> tree then you should also be able to update the kernel.
If one sets sfdp-compatible flag in the device tree and replaces one
flash with another, he doesn't need to update the device tree. It
extends what is already possible now - if I make "jedec,spi-nor" node
and the JEDEC ID is known to the driver I can replace the flash with
a different one whose JEDEC ID is known as well and it will work
without touching the device tree.

> Have you tested this with any flash? If so, with which one?
I have tested it with n25q128a11 by removing it from the driver.

> > 
> > Signed-off-by: Petr Malat <oss@malat.biz>
> > ---
> >  .../devicetree/bindings/mtd/jedec,spi-nor.txt |  3 +
> 
> This file has been converted to yaml since at least 5.12-rc1. Please 
> update your kernel sources and rebase your patches.
OK, I will rebase.
  Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
