Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312A6C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXBRkTqLPVnlT3EmzshjmiNymmpfhcmKG/sCWJrXiHw=; b=jO5fuetaenR+vo
	whSmwFZmMD55++Y6qNBY7SoWebjJDD8gWfsmdE/RNzOUyUPLdZP7CbSyySv+b80b3BhbHeQUyx9Zk
	Ymtw5cEkUhvbIJdWpAMn/stkfvwMouI1qzb90tL1lXpOe2tWDvI1Er3TUW29lXaqVQ7vHG0AfL9xk
	oNJOr/bofBsEPn5rpX+RLhMokQq6TW5POaF2nPwZh57cEuxDcWjYqE2/+at0nLkZVQIDh3lIV2XAm
	6Ab4BBE2qb/MoAE8TM8jMAZ0WaDhSR054vZjdBKw3mmD1DykMR74rY6A83msGvVtXJgoVHsstoST/
	DL+HgYjLVtQNVbbkqImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLpc-0039zM-UB; Fri, 13 Jan 2023 15:19:00 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLpa-0039y0-4n
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 15:18:59 +0000
Received: by mail-oi1-f176.google.com with SMTP id s66so17284776oib.7
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 07:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieDDnBbNB9JJsaMwpNzXJlERKk1wwpqLtOrBhJRfGpo=;
        b=ufsrGbUGPw/RK3fx5Ot/wgYG6Y/5c9cfbUPz6//JgAfIEKOoyeUDORajyzV2W7RuBY
         AyPnDnaT/k2i0AsxLNKRjlSQteIlHhTDi/kbev4gfWIwTv7ziMJgL0ojwQASJpC1rRMg
         FffWDm/eAFVMZs1hsKSlOx/5kICOnk7ChNLywYC80vSfauMYN7ATufecA6LfOm9xs2Uf
         +ymxknRNi6eGLsPzAW9mfrHRRvGT3++9t+8VS53M0zpPHFZVHG3vZFF/0iPC/iXU42gK
         DnjoEGcfV1CcIPBks/ZUaQSrf3qmFuYUrniz4dTcUqA7CCfcKvkiP5tSna0MyHnaupRl
         lWQg==
X-Gm-Message-State: AFqh2kox0KPJaw6/cw5MyEH1pAg/7obSPSSSymZKgdhviWyyeI6hpH48
	cC1JtNAQUPt4t3E5LMW0iA==
X-Google-Smtp-Source: AMrXdXvKjUuXqtnMP8HRUWF6KklExF2oSAG2rWu9CjnEqT3LUV2kOArvIgWmH2DzIBq+esFLR8R2ag==
X-Received: by 2002:a05:6808:996:b0:364:c003:e1ba with SMTP id a22-20020a056808099600b00364c003e1bamr517132oic.46.1673623135307;
        Fri, 13 Jan 2023 07:18:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w11-20020a0568080d4b00b0035c422bb303sm9298016oik.19.2023.01.13.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:18:54 -0800 (PST)
Received: (nullmailer pid 2206759 invoked by uid 1000);
	Fri, 13 Jan 2023 15:18:53 -0000
Date: Fri, 13 Jan 2023 09:18:53 -0600
From: Rob Herring <robh@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
Subject: Re: remove arch/sh
Message-ID: <20230113151853.GA2184281-robh@kernel.org>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_071858_213615_50BDB144 
X-CRM114-Status: GOOD (  13.78  )
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

On Fri, Jan 13, 2023 at 07:23:17AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> arch/sh has been a long drag because it supports a lot of SOCs, and most
> of them haven't even been converted to device tree infrastructure.  These
> SOCs are generally obsolete as well, and all of the support has been barely
> maintained for almost 10 years, and not at all for more than 1 year.
> 
> Drop arch/sh and everything that depends on it.
> 
> Diffstat:
>  Documentation/sh/booting.rst                             |   12 
>  Documentation/sh/features.rst                            |    3 
>  Documentation/sh/index.rst                               |   56 
>  Documentation/sh/new-machine.rst                         |  277 -
>  Documentation/sh/register-banks.rst                      |   40 

Can you please also remove:

Documentation/devicetree/bindings/mtd/flctl-nand.txt
Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
Documentation/devicetree/bindings/spi/jcore,spi.txt
Documentation/devicetree/bindings/timer/jcore,pit.txt

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
