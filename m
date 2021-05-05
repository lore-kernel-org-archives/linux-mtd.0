Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68132C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 23:03:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E251613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 23:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E251613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mlFBADX4G3iDofaa0eVI+mS02wmqzjBQel4oYi6p8mY=; b=Y3TfIpgSpNEooYVYq/ir9cVSi
	yreNvipxUIwAAAGf0gGLvmsXCUGUbOiXcVKCFzANPUv+NSQeeCxn3TOoLaxtDbGaD2+Gp2R91zvxS
	bHERsWm0SNzQPXoiwMrxQmLKomOaVIhVKhOTvF/2M4yIgiJMWeRL+4aX8cajhQHvJIJOshYP34kPk
	zrn0Tn++m1OOL9Sgao6Xgi2FpvsIzq2EOpztE9WKl8RK6KoI23rNqoBDGNnlWVfAmsa7zqmQWOdWM
	0jqMzj43yvzcRFW6vfaxCVbdVIeO6HfPqB6Ig+EeEkw5H7Ng5U5jwPWK1mrCgcHhqtfsOKS8hKofi
	2RUzMb1Bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leQXp-002Y7g-UN; Wed, 05 May 2021 23:03:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leQXn-002Y7D-KM; Wed, 05 May 2021 23:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c5gJIQptNbwhzfSNPQQCVwvZ2lAYCY0SqfJ3dG+5h4k=; b=Dg1/dE89MLhF8CfRphgqhrJQIL
 gJStiTkRa/H7//iSHOV0VOrdqAdYWWtiWalIYx4DPYLjqECBiXhxRo8Q7cyD6InIwxB6WKTmEL0uf
 OkEyHghi4desoAoWMkOR/5mav3eF+aeBfxRGFB5Ktu9L6AaBO2dxD0hTeLBF/yQbEy13bGEEvr2fa
 hV/0UEQhb41x3xlCIwZJe0P7TFvPjThvhxdMwIHRs0vk6uZZ6nSwo7pwro05Lc0L9OQ7OGTnpcl01
 H4lkTD+18KwP1ZsY7mKtzisBqkBKaIVW0RVUhQEsgyqfc59WWGq7AFX34kIjQ6awBKUr3HWbRWF+Q
 fjtHcyOw==;
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leQXl-005NQM-8X; Wed, 05 May 2021 23:03:02 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 b5-20020a9d5d050000b02902a5883b0f4bso3259941oti.2; 
 Wed, 05 May 2021 16:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5gJIQptNbwhzfSNPQQCVwvZ2lAYCY0SqfJ3dG+5h4k=;
 b=o+LKoZEnaKQ6OOzUTxZKhHPrO9fQfCQUPlWlp3T6VQf49Xngjs3yacFIn+LEjIdDea
 Dsb4eev4vn0PcgHhKA7kTcqBH7qNa8R3NBz5mdnZLVS02OCIhpItoCSIq87cs+HY91MZ
 tneOAQeI/t5Edzl5tyQNbLaRTO7YQ3KjFXIwQGQKWdjv+btc0fZSlOkPKUuXUVxehcCD
 O3M+LNA3uzm6xk6sexIh+tl0IjZxV6BoZyAS65uvewCmEIS7gACAsBoerCncneNYAzij
 CKsZnQHRGWj78vDv9q4hE8UZ8VI050ZYd2PE7iJQo055IL1zG7Al7iFiiZlXMPYYE7p+
 +XGg==
X-Gm-Message-State: AOAM530k8+36/4pvAXJfXK9h9KxKQSBYScnludZ3VV5nwVxm7hyBjZpk
 bn4W/oZgIcuSOieAfdvDOA==
X-Google-Smtp-Source: ABdhPJwnGdYO6xivVdQOTOmieNJgXZf1cUHMK+GAA2Aak1nTUeuiCm+657685gZmMaAIiSTqypesLQ==
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr895769otp.34.1620255780165; 
 Wed, 05 May 2021 16:03:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e67sm126328oia.5.2021.05.05.16.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 16:02:59 -0700 (PDT)
Received: (nullmailer pid 3004478 invoked by uid 1000);
 Wed, 05 May 2021 23:02:58 -0000
Date: Wed, 5 May 2021 18:02:58 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kernel@collabora.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCHv2 4/5] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Message-ID: <20210505230258.GA3004449@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-5-sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_160301_320425_EED06F4D 
X-CRM114-Status: UNSURE (   8.33  )
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

On Thu, 29 Apr 2021 00:29:52 +0200, Sebastian Reichel wrote:
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
