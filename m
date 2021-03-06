Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8345AC433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 19:58:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC5A64FE8
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 19:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC5A64FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xxzyQUZ/X9X7REzPTYNWiwY2hKPQax1tvyeM2ZN7BVM=; b=WyMXbB41Cie4d5EPFX+IGMI1W
	n1g9Dav2aOMkPmBOa6XTHA4R7SJ4rzhBfSGX1Gl7rFmS2qajUgdMC5rBoY1plAjR2eGU50QOCWle/
	Nofq2sU08sHBiOaaRnVIja3/u60RrFxG2W6ot218j3Eg2GdrB/1x/nbcjXuYro7fdsW4vkbSx4jbV
	pVjUGOlBVQPnRkde7yW1b3ve10HymJGRJj4SYELgjJAKFO2dK8itBDudegdPn+Icg8hAq/Bs9pS+n
	Pl5hOGz3HpVvvdc+2iWNsL+Q6SNRkChbKhAv5zXvlzLjWcw6TKJ/9BhTQt7KEB/A2yLGILXILEOSP
	qoTfX5SRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lId3Y-004X3M-Ki; Sat, 06 Mar 2021 19:57:44 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lId3R-004X0R-Gt; Sat, 06 Mar 2021 19:57:39 +0000
Received: by mail-pg1-f176.google.com with SMTP id e6so3712759pgk.5;
 Sat, 06 Mar 2021 11:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KQqY8QPhXFTEar+Ux6aNIB5JucD1ppbDhSjCP3APe8w=;
 b=UchvyPGQ7BPlVpZ/g4OJH3793g8sSyeXMQ8tYv5jNRVkM9R83JYeqvQ7NmtusJ5yjc
 xBZAOzEOSQmvzS7frbUjXYrCjA6yXdDvAj7F8hpeBNqml+ilcMSTMIJxuNjKedToWRcT
 7O96gEOoBv9+t0ojpsy8UXeTIZetKRlDuazUQPuKoN7BBRYYNC658RJEvRvkbFxt2LGg
 FPVZKDnxdu2j72ecHxRbU9dKtAvkbyFxjOMiCAk8AioCj7dURsOgHsolP/QpwqzY5GgX
 ST/JNfJxOoV7PkVw+Y0Xy/pYwdGPcSY5CERi6W3bBr/LR9fOadA0klCrhF17eJ7edJsO
 gA9w==
X-Gm-Message-State: AOAM532/8RbCylnc3V6P6LEAf7J0V9XKXvvWCV7ZrCy3ZPVmoJHoBgRt
 W7X+amTDVuurfuJDCitoPketd5CVSyo7
X-Google-Smtp-Source: ABdhPJz1DsAX/KAMSJdNpzi8tpKb/zdwy3rRKYSV+TEJqGpEzjIoWXc/yGtoSU2EN0X4DhjrSEfd1g==
X-Received: by 2002:a05:6a00:1693:b029:1ec:b0af:d1d with SMTP id
 k19-20020a056a001693b02901ecb0af0d1dmr14493676pfc.42.1615060655654; 
 Sat, 06 Mar 2021 11:57:35 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id k64sm6295171pga.52.2021.03.06.11.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:57:34 -0800 (PST)
Received: (nullmailer pid 1119603 invoked by uid 1000);
 Sat, 06 Mar 2021 19:56:45 -0000
Date: Sat, 6 Mar 2021 11:56:45 -0800
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210306195645.GA1112592@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
 <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_195737_718144_E13E6053 
X-CRM114-Status: GOOD (  23.84  )
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

On Tue, Feb 23, 2021 at 02:26:57AM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> > On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > > the clock is disabled and all i.MX6 functionality depending on
> > > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > > watchdog it seems to likely trigger a lot earlier than configured.
> > > > 
> > > > The proper solution would be to describe this dependency in DT,
> > > > but that will result in a deadlock. The kernel will see, that
> > > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > > the kernel's perspective this is a chicken-and-egg problem.
> > > > 
> > > 
> > > Reading the previous paragraph, I was going to suggest describing the
> > > dependency and wondering whether this would cause a circular dependency.
> > > I guess this will keep being an issue for clocks on an I2C or SPI bus...
> 
> Yes, it is a circular dependency on this particular system on
> module. It only works because the RTC enables the clock by
> default. The i.MX6 CKIL is expected to be always enabled.

I think you should describe the circular clocking and then provide a way 
to break the dependency. It's a somewhat common issue.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
