Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4403C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 23:02:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6650B613C9
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 23:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6650B613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tr7uILdg5lxWNeb00cG4qpTzgLt9LjIjK8LAmBze8wA=; b=JEdT9YE9DEWWwHpZuEDYpaFfj
	KgWE8QayqyylxDVWAqemccYFvy8/eV0Uqq28jed51lll2R0OZbQHgLnqITsOtIcxrciCXpPT2vs8e
	NLKDSRjZkB6jfZ7VJAYvr0dX7iL+C19fLerMblZVBA0+6Xr4WC6EnBToI8dz5J4QgtLmu0BrpqEca
	jfJf9Anscx+acKeEei7PZYlJGy+ECoUjYAxOXqhAfgqd8gp1Nn6XqXRNXZJgII9a+DE0sbzH7bb1v
	jzgt/NIjOBkAT3c50/fdTvTTyESBzaHYjt5rDsmyB0TUARSN4Coh23HFLzaZ11KnnwYbQs7e6RU9X
	crSdyJT9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leQWO-002XpN-Di; Wed, 05 May 2021 23:01:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leQW1-002Xnr-70; Wed, 05 May 2021 23:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2t7KI7LfK5f/FnHiV9rDrMTIJlm24ZGWJejB3IMlcwI=; b=mR/vYRUZ8SE9arZzzEpJ5hg6FR
 RCI5lmA6H7G1Ypmo1sHb/m+FkhmVu+cxIHl0T3hgki+7Da9wCbF/jyCvCDllvugwPrRf1yECZ4aN9
 I8K+1x2Xz5CagG2jsEQL4245SwS0DR48Qy9lQ4QX/JofbYLgcu3oymqs0ceHLtCFxEfA1Lh3HPYii
 QwyeaAwzF0KElgDIWpXuuvEbJAyV5k81B0Wp0S8s3rzOH6pxF7jll0Qig1Ji+0D5IEFcrj64prDBo
 QIIzMnFkknjKScKW/ZBulqa0pBkeckyuBQG1r/raabpUPfnNzGe2j6ILwzZZz0MAeo96S2DwjjQXP
 dTKwM1CQ==;
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leQVy-005NGr-Ty; Wed, 05 May 2021 23:01:12 +0000
Received: by mail-oi1-f180.google.com with SMTP id k25so3759970oic.4;
 Wed, 05 May 2021 16:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2t7KI7LfK5f/FnHiV9rDrMTIJlm24ZGWJejB3IMlcwI=;
 b=dpu6Pqs43PmjFjucchuILhLaeql+yqvmTb7iZoWuLZdfp96XPam99dSYX25QXkpiVs
 Lzjk3rq3WIN8rCa0nTwtAIcDuN56JrEMcvkaUJY2sbV93mYZSJ9YcTLlLrVhFpnukY0Z
 TVz4rYNNl27cFv7EC19HpWrgi3wLGFeM7oN25P7wsim7J0sdHeTIZBA6UUREaBlJjTt5
 BC7pvJLqmgARhIyMzoUgSQZfRmZJ0dcb9bAA4ha+axiyJ2/syTfDEjYIMmN2ybjP0ZFQ
 IJgiSkiPSeuGb0PHD7ZyaZJan9EdSC0EpCFcBJtUcy4EgQa8sxWrsbfMpH7o3GplaSbO
 gMxA==
X-Gm-Message-State: AOAM533mXL+VUGrmWYhMK1j7FY3A5eDJ82wQAcE49g8tqRGGeu6shHHC
 vOPzFw1VYJJ07hNrW1E+QA==
X-Google-Smtp-Source: ABdhPJwqSOXRvGO7rMRB/1QA3ZzGYWjxV1j2PQ/ar6QmazCIHQeBzFb80UuwGfZaOP8RQ6MfH1OcLA==
X-Received: by 2002:aca:48d5:: with SMTP id v204mr8307187oia.7.1620255669496; 
 Wed, 05 May 2021 16:01:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m67sm190792otm.69.2021.05.05.16.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 16:01:08 -0700 (PDT)
Received: (nullmailer pid 3001472 invoked by uid 1000);
 Wed, 05 May 2021 23:01:06 -0000
Date: Wed, 5 May 2021 18:01:06 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-rtc@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 kernel@collabora.com, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCHv2 3/5] dt-bindings: vendor-prefixes: add congatec
Message-ID: <20210505230106.GA3001442@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-4-sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_160110_985021_5D96919C 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

On Thu, 29 Apr 2021 00:29:51 +0200, Sebastian Reichel wrote:
> Document binding for congatec.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
