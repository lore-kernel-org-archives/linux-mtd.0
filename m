Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F047CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 08:30:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC25820706
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 08:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L+vqpAh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC25820706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEvDCgWb8TfcZ+w9KDWbUGWmPR4RdRc258/XoHQ4NLs=; b=L+vqpAh7Qbe+elk4Q8eqqseGeD
	QptMV+NsPv/+iURNKN12JBoZ9Pd9qOUBFbxt27tvFlcruV6W1qz0czgUfnvRQpIs5fc2nY1PnSvSW
	U3YutUPBdXXvigPqD6MJS93PFY9tAAAZm48T0RbwmJ9FT2hh/c4yo7XBTRZL7PPBFJWIDA7v2qJcL
	B1kpwnkrNIvsbg7gG4VxjOg1vLSFztkSf7vbmlumr0jVIzGzEAUBGvzDHQZ0FC1QNuUWNet5l9M6L
	BTtn8DkYc52Y736vfwBVDEyTEbx993ABzVqGJJyy5IJLG2daKjviSG0YSFkyV+6Bb5ZvQ1ynqkzYi
	2Vcbl9kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUKz-0006G2-Oy; Tue, 25 Aug 2020 08:29:49 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUKw-0006Er-Lc; Tue, 25 Aug 2020 08:29:47 +0000
Received: by mail-wm1-f68.google.com with SMTP id y8so602454wma.0;
 Tue, 25 Aug 2020 01:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HkVGZDX8kJI9mI1G++5UxoqItzmkNicQe/GJs1RM9xw=;
 b=q1Rg6TikbyDwZtNFF6vaHkfDgNO4UbvUCGUhL6x9K4qoBCunZOUZrmzuZ81zx5qwa0
 /6xhPPte2lqwl3z4gzB0xPZlzbEDOCqndlFCXyReBRdQrWC/ce+7KEn39uRYHX6Q3GXe
 8ponyR4O74vA8nwoyOvz2/T9F8WEmaJSmiTre7CoAh3RnCyy9ebP63UAsZEfeV7jiij/
 krJP+3sdj21b/GIQy3dCjNJ3g/znFr0BrrAaxwtSHJG9d4UpJ6sGg8yYqFltr85k03hG
 /C3DLyyvlykOaUUok96Ucyo9SnAiTHsVPxJBLp+g/EjEhYGzaCaMFuzNsR+ALDw0sn+Z
 FygQ==
X-Gm-Message-State: AOAM532GB84IeMKM+Ld1Iud1OTw4GUcQsixq6mhWH1g8TFyrAOYTE29T
 2997/x6vsuNjOYi0ig8kF9o=
X-Google-Smtp-Source: ABdhPJyGZYBTYvBnIb1U6Pi6IZyfXdLtVJVjvq4o+WqdI5gMCjQzeo/6wd0xJgWYZ/5Vtdr46sQ3cw==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr940487wmb.54.1598344185330;
 Tue, 25 Aug 2020 01:29:45 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id k204sm4973101wma.21.2020.08.25.01.29.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 01:29:44 -0700 (PDT)
Date: Tue, 25 Aug 2020 10:29:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Adam Ford <aford173@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
 Li Jun <jun.li@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align
 regulator names with schema
Message-ID: <20200825082942.GB12902@kozik-lap>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824190701.8447-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_042946_717541_0C9FDD21 
X-CRM114-Status: GOOD (  10.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 09:06:48PM +0200, Krzysztof Kozlowski wrote:
> Device tree schema expects regulator names to be lowercase.  This fixes
> dtbs_check warnings like:

The subject here is not correct. Copy/paste error. I'll fix it up.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
