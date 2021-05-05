Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CCBC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 23:02:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB40B6112D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 23:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB40B6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dOA4r2cLfIBkPblwpvQqCOVqR7V1cLWVtd5OijyFA4Y=; b=g+CL6MR6w8wo7uYQeMONrMIPm
	SB0XTgkTkMs9lbt3VVma7dBEMZdr/dgtnerqfMlyFmF9vC0QfOfA6jIGcqylhu5sPaN13OZqlXEES
	+MffIT/GogrhJi3JD8gKZtitAAPnYdK69yjPDUdEi5RYU45NXrsCnqn0lxLfIC/Vhf51SWUqm+2oz
	OAZvZKTP9i9/63EsXYnsC44F9I8G9HiMqWcM04HeXkmj+pkwBGJ8QKnjDkM43baLSisEUjEut/LOa
	FzhZN5b32ZOZ8Ext05VaWVj0c8LU7do45I8uR2HDdHzlbTQ0KEZQBeCe2mi674T3qxdXgOqSpeLYY
	iTAP0OnSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leQW9-002Xoe-Hm; Wed, 05 May 2021 23:01:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leQVx-002XnY-HF; Wed, 05 May 2021 23:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XnP8SPohUuOUrcF5CvnUQpW+7Amf898SU0gjNiJgV3k=; b=nrYzqA2rnvNPs9AsAGRceEmDoA
 7dEa5L4SOLk0FlxMleocnkQXRfZt1P8gsBLg3rvXMtcLemM89xJ1qV6bt/LP5tBDRPYqLzliAL7Ju
 N08Aqdg9KDJ2Q7cib9k4mqhDWcJl5Fh8Pf1BFLSQeyVSLIEZbd+ml5UFhOsb1J79M+vNIVH9JZEN8
 mGKARsOdxRIyAf+Kii0DdA8vjZRh2eBctl6Dn1aw7/uyonHxXKFCQ5os2Mnb66dVmt4ty5Ws6DMAG
 ClWy6yEmF9HTvhSk1IvSdxuCKtkeWdVtnDOFwxMj9fRV7K6DAZRzi27npteT27WrEpDhvteDqHX7Z
 tlLMgQig==;
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leQVr-005NFO-Sp; Wed, 05 May 2021 23:01:06 +0000
Received: by mail-oi1-f182.google.com with SMTP id d21so3716526oic.11;
 Wed, 05 May 2021 16:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XnP8SPohUuOUrcF5CvnUQpW+7Amf898SU0gjNiJgV3k=;
 b=N2poi3z9r/u6MBPdLVLeDwDTDqm2wR512uhwJSXxoNS1L4vZYr57BZMXtCJyXJE1sY
 z2s+MEVfJl+O1oFbl9XzX1XNWx5aNL5NLv8Q8Y8wtXs/8DZHFRIzAVoSK4mkILdFewM2
 xtkeqAn1a/6EnCzu/V6GWBrxaaL+wV1SFommJOxrYKLzEJlxRsemPO4DR9JmN7XEmsV4
 42Ly6QOJd5N8VXurqE5+sSPDj3DZRmzO0LViwe3XUSJbIAwU4NjpJnfPPeAZaKo+4hbH
 mQAzyDoTsA/6uibpidvG7YsQlKMyI/8c956HoRTWr7EEjNUUvVtg6go2J0EouaUYgJqZ
 aGRw==
X-Gm-Message-State: AOAM533WKY82KF3I6VBay6pXUsKQ4k9jk5qUnzt28u+i/Wmh3tcihzCH
 oYXqOPB1fU5Wq5h229Io7Q==
X-Google-Smtp-Source: ABdhPJy83Puha7n6Ax2Emr94H3gEDoAwjFI7ehiaGvyyZXu6y2E6RKtqEpMdVrTxovKDHLwWEbBcpg==
X-Received: by 2002:aca:2813:: with SMTP id 19mr8842971oix.23.1620255660629;
 Wed, 05 May 2021 16:01:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r14sm217795oth.3.2021.05.05.16.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 16:00:59 -0700 (PDT)
Received: (nullmailer pid 3001129 invoked by uid 1000);
 Wed, 05 May 2021 23:00:57 -0000
Date: Wed, 5 May 2021 18:00:57 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Saravana Kannan <saravanak@google.com>,
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, kernel@collabora.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
Message-ID: <20210505230057.GA3001067@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-2-sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_160103_944231_647E57B2 
X-CRM114-Status: GOOD (  16.33  )
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

On Thu, 29 Apr 2021 00:29:49 +0200, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. For example when using
> the hardware watchdog the system will likely do arbitrary reboots.
> 
> Referencing the m41t62 directly results in a deadlock. The kernel
> will see, that i.MX6 system clock needs the RTC clock and do probe
> deferral. But the i.MX6 I2C module never becomes usable without the
> i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
> 
> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case an something (e.g. an unpatched kernel) disabled this
> incorrectly.
> 
> A workaround for this issue is describing the square wave pin
> as fixed-clock, which is registered early and basically how
> this pin is used on the i.MX6.
> 
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
>  drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
