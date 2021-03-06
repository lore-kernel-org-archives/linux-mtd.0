Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA848C433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 19:59:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E74650D0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 19:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E74650D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7l+vQIYzfhyoCKq0XJqq8mocCrKYmPPlG1LMDzL7SEc=; b=F8m9FJtaMZ7kboEsW7TmY0SHN
	w9LNW4eUkq24by/4HiUZe0YTmoskVBEH+rivyQaRXUqIWO6bYZroBdW7dWDlJhOEd59a5JjqQ0TAK
	Q9tjrJ18rj6G4o+Pk4DJMNn13MtEzvOCsx863WIcbeNMuzNQp5oyOwUmO13Vx7sAbYRQKfCFkrm9g
	gWOiAsDMBPVLgW/R9YNFs++0zs+9Z0C+7qxdEj5SgAnRFyq/j3tHbmftJfbBxhxYbyAwF7UGgHt7m
	/Hx4Hc6dAewhdYHwHe55w+JYSzu2Gnc5tQA8TQoJ4q6yG99//1yLKgSxmjEi9hWngaWH59Eg0jdjI
	e0aLYqrgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lId3u-004XCJ-Un; Sat, 06 Mar 2021 19:58:07 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lId3Y-004X3d-OV; Sat, 06 Mar 2021 19:57:46 +0000
Received: by mail-pf1-f173.google.com with SMTP id l7so4585352pfd.3;
 Sat, 06 Mar 2021 11:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hmm575HorfyRVhowVRgdU0QCmJjP3xAhO8Ci7Hvo+XY=;
 b=AFy6UpRLEHj2s+7NHOzh5G3//ROjYjidBUrKXnUeMnu13nEKayXibJFqxtUX2uWTAL
 Z4Wj6u3aId/5qN1YAIClkaaFCsqsioe62Qv9nDkFkKGe+9gljdfEAYenB/KZxzerITYg
 YAncHilcw1XNSy1C1W8/MYCkGl7qEoDewu52vonz3mSXrM/GNvCRJ4+XyN1rV2P1381e
 qFp9Ph6R/DEt1DK5373v3x5xU094cUzsKgpqXs3F4PAAa3LApgy526uYtmSbruW8xVFx
 gAQGQ+TLOia0DFfGsIRJLhAbKoc7+bynN6yZwOXSisQDcD5w1fqQThCh7mio6IhoKTqD
 wvRw==
X-Gm-Message-State: AOAM532103NmjB7hCkbi5fEOZR7CNgGwVl8G287kJnH4TdYczMT2Udlj
 8RL7Mqu2RJNroKyf2MhJxA==
X-Google-Smtp-Source: ABdhPJy7//cpr20o7A74RWsGhuPkp3ptB1ZhP+ZXC1RfZ5srLIqQv3UDqt7REpXOqtDX32CEDqfP6w==
X-Received: by 2002:a62:83ca:0:b029:1ed:78d1:531a with SMTP id
 h193-20020a6283ca0000b02901ed78d1531amr14563372pfe.56.1615060663350; 
 Sat, 06 Mar 2021 11:57:43 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id r13sm5902565pfh.159.2021.03.06.11.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:57:42 -0800 (PST)
Received: (nullmailer pid 1120672 invoked by uid 1000);
 Sat, 06 Mar 2021 19:57:28 -0000
Date: Sat, 6 Mar 2021 11:57:28 -0800
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCHv1 3/6] dt-bindings: vendor-prefixes: add congatec
Message-ID: <20210306195728.GA1120548@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-4-sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_195744_863636_E5B6FEAB 
X-CRM114-Status: UNSURE (   8.78  )
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

On Mon, 22 Feb 2021 18:12:44 +0100, Sebastian Reichel wrote:
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
