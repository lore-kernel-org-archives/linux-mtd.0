Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240B1C433DB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 19:59:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DCC64FDD
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 19:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1DCC64FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W/yTjSDcbCA2zAE6EQsQQ27j61oVivti6+XtvUxZ9Sw=; b=OPxdPfOBhhaAlj8wy6t2iK5u/
	cBiaLntrCdauKIIjf2Io17JPgtXXcYI9dzwsOWZKCBq1yGeaLkD3IVxzoFJ+3pAHuB7sKwwHx0Otw
	zF4FLvDoMpN7BEpWqcEIipBEwM4ek7Qis6msM/nFgTiXXvvg66gbKjDYaxGmZ4YVI6UZbMl6XkJH+
	T3ObJeoRAqudx4zz3xCJ1iaOL/E0Cu39n4PwWDrDgYGNbusADr8bQu3Pc8EOzr5IJdOqdRBOAJgYz
	aervoAqgXe6mEjUXKXG70YNcL0x4wEw1F7D3E2Y6hYa1oYlfgV07VHPM1KaDu8xFsCG9VzO+/IRBy
	P24qvt1Lg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lId4J-004XOp-Tv; Sat, 06 Mar 2021 19:58:32 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lId46-004XHU-6S; Sat, 06 Mar 2021 19:58:20 +0000
Received: by mail-pf1-f175.google.com with SMTP id a188so4575260pfb.4;
 Sat, 06 Mar 2021 11:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrwdJhhYtSH9wQZ5EXhp7heMqxOYZiFZDSvmiyJutDA=;
 b=RSlpR/ZI32UJgwHquI7x18DCgNDg4jC0IwCvDaONSWx0ffkSQu1SgZQrfCTb3WKpsP
 Oz61DBAILZ0PjpcnSvy8d1T8WCtqBhS6+ZkzxlOok03aMrM+RAMQpJq8KfoC8y8FYZh2
 3vtKBOAW56C5y/iiMvg6skw+kMhQ0iOc+vht4JMNlOOXOU5fMJ3MEYrAau2RaPoxUb6U
 0gSREv1XDrX/3/PvsSe1vYRTrVu3g++4qZl555ndHYyLU5+4j+lwSF8Mzo1Md5QSQII6
 miDFjObcpyR7LxLMaKDbvxj8V3bgIuIbrmZ7198UpOkFQfPuy8FpGQKvu6N8lbJl1sQA
 tFzQ==
X-Gm-Message-State: AOAM531us6v86y5uZkorTIvflXnymmSPiX47RFDqsBbjAtSAWjlB8c2b
 jPAeWON97trOnXGtR4QHBQ==
X-Google-Smtp-Source: ABdhPJyIkD3xwASyiv2hONK661jHJeeDgt+7b9ZQTNaf1Ja9t99WvD8XURjwe4kk7/XbL2T2N/XhCA==
X-Received: by 2002:a62:b50d:0:b029:1ed:c0d:3778 with SMTP id
 y13-20020a62b50d0000b02901ed0c0d3778mr14784437pfe.72.1615060696520; 
 Sat, 06 Mar 2021 11:58:16 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id t6sm775470pjs.26.2021.03.06.11.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:58:15 -0800 (PST)
Received: (nullmailer pid 1121697 invoked by uid 1000);
 Sat, 06 Mar 2021 19:58:08 -0000
Date: Sat, 6 Mar 2021 11:58:08 -0800
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-mtd@lists.infradead.org,
 linux-rtc@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 kernel@collabora.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCHv1 4/6] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Message-ID: <20210306195808.GA1121640@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-5-sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_195818_315531_A733069B 
X-CRM114-Status: UNSURE (   8.80  )
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

On Mon, 22 Feb 2021 18:12:45 +0100, Sebastian Reichel wrote:
> Document the compatible for GE B1x5pv2 boards.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
