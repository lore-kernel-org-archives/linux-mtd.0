Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BDBC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 19:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7549F21773
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 19:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kPIdio23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7549F21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKZRnBePub4pWqmJAB6HuiOkYRNmvLgXRj3VpNDh1KQ=; b=kPIdio23hNtgv3
	frgilzy4tPQrbM+9yf1FeVIvGSfcRFyCzuKSKEeADyIBEKrNDy/bLjKgMGKATqOGV/5VaqdZGRm4i
	VI45+MW1FvkYFqHiBtMVbEqILKvlSbviVgGejQw04+Vi2augiM4rEV+i2dAXulNiI7724s8TNg/ia
	o2VSj/VeKVC5wX2iJOTVuUksPrbCz1yhIIn3HO3ZZZou76qVts/xsEBCovyNHnyGymBrwdzNAsMbp
	DwfIaqXkTI/6tV3RwaNVXl6rP1D20sHWqKxxIiBhMVWcnD2ZMFFtd/z1WOAI3BItnqDLXBGTaw7iF
	UTdM7YjLeFLO0dO2vxZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvoTD-0008Mr-M4; Mon, 18 Feb 2019 19:20:51 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvoTA-0008MP-T9
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 19:20:50 +0000
Received: by mail-ot1-f65.google.com with SMTP id v62so21296219otb.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2019 11:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q5PP/fqqcw8lPXLf7c7x4bNqQ7ZyZBNggjfmpsk5TuA=;
 b=f7vhPHoYhUEgenbZwF5OVSZYlMSfPb/bmfG0AtbJkk55kCL2Q+XvFku8x4Y5Sl2e1X
 Ztm9M0QK5Nzh8XTt3NdU2yZjyB9xHfhs4oftZSomcuy78jO6FL5oBz5TdPLEjokz2cZ4
 NeY3vR+SKLbMpwY5RxaPoyi9ucyYYCHw3/a3isMw9ZoMJDd4B22+j5UE4NhS+QrHndXw
 XV+B72cJsYHsZVNucBPwKFpyA9E+yePkCyVXaTJiCnWptRDtduQdNKG6R9LeBQtWIjLn
 Z2SKuH2YD1yKkTNzdgma9NyFxEJwWu4V7uzncZCz7jLdBhCU49MDXZicGbEZarrwpnDg
 woBQ==
X-Gm-Message-State: AHQUAuadgoGrL3BBV8b9Vu3dOWEZBbaDROMgKRL0JHqa3iTTrNCaNBj+
 RL7GbCpNmXZRn2KtHZlgLQ==
X-Google-Smtp-Source: AHgI3Iamy8mpSiY+fCQWkRDykm8Z7Jt88LCZ+RiawaIm/zRUQFF51d03jDXbUQZCC+u3pD6ZtSzpRg==
X-Received: by 2002:aca:4c8c:: with SMTP id z134mr244587oia.158.1550517647652; 
 Mon, 18 Feb 2019 11:20:47 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s186sm6368090oif.0.2019.02.18.11.20.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Feb 2019 11:20:46 -0800 (PST)
Date: Mon, 18 Feb 2019 13:20:46 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/9] dt-bindings: mtd: ingenic: Add compatible strings
 for the JZ4740
Message-ID: <20190218192046.GA27154@bogus>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190202231926.2444-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_112048_942010_F5363D51 
X-CRM114-Status: GOOD (  15.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 Feb 2019 20:19:19 -0300, Paul Cercueil wrote:
> Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
> from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: - Change 'ingenic,jz4725b-nand' compatible string to
>       'ingenic,jz4740-nand' to reflect driver change
>     - Add 'ingenic,jz4740-bch' compatible string
>     - Document 'ingenic,oob-layout' property
> 
>  .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
