Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A126DECAAA3
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Aug 2022 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8BzlTpydtsJfTcNtsuE0IsMKK/bpFvwc4uJ+0HTi2w=; b=h2H2Y3zMfUB9s86+ZM4KNsIy37
	yd9wfOPku9DRBjt9sgPU1d1FT4Lh0ChjjRhhbcXrK0rfnkXHn3mseC84M16ems5KzWJGeUbHLIYoW
	Uwx99mjXzxwJIyPeolRuzose7zfS9fSl/31Qtbk3CBlFyaBn9nDBWvY96y3JiaEwP/kLAJUirNmNk
	93e5ZciaP6JiL7immN0egR8Li88KkIwSS0/Fa0aZ6DcFbTP2aPUL6FD/PZBMDHfvh1Q6ZkHQnbTjq
	FD1xD6c9U3ekhkPYXVnEeShbcjSC+nR0xOYGRufyIfuhV3yZTvbjDvuIP16abcO3hx8oO5or1MM26
	HX3+ehHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUVy-00GsjQ-Lb; Fri, 26 Aug 2022 08:16:30 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUVl-00GsKB-Mt; Fri, 26 Aug 2022 08:16:19 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1844F402B;
	Fri, 26 Aug 2022 10:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661501772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYNkW/xHpAgk1nrcO4FJOnWLgD0dwYS942MxgxMADVg=;
	b=ibgQnPuJQxdddEiyOpCPcp4EyUM2+ItJGhAR5Few5nDl3ZN3BqFPu5zY/DNhwiMT/FKHsj
	5HvGF9JPOF75j+aWyLNd0FPKSCtC3yzpow9736CofUZ8/1g5LKPyWn6zS3yBKb3DsyK7PM
	IrG9Z5U/ksvzbOcCwz+KC8vqqaWwglw0x+1Jpcs8M8v6i9epMKl4Cud8Od+JndP96zt94F
	ojltn7kqvYNEzVkWfSHYehDnrv3ZTqEaQqR0u/WKTONGdY02CL1+qgvyj/bDyLWs4JLblH
	JZxS6oBkpsFwXmhkLFor/k6QCq4nPKOKOyh38fF0QNJNt7AyqzEY5q+jVMA+IA==
MIME-Version: 1.0
Date: Fri, 26 Aug 2022 10:16:11 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 06/14] nvmem: core: introduce NVMEM layouts
In-Reply-To: <20220825214423.903672-7-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-7-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <51cbe913705a6d4484bca640f591ecec@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_011617_946805_3B9E7C46 
X-CRM114-Status: UNSURE (   4.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-08-25 23:44, schrieb Michael Walle:

> +struct nvmem_layout {
> +	const char *name;
> +	const struct of_device_id *of_match_table;
> +	int (*add_cells)(struct nvmem_device *nvmem, struct nvmem_layout 
> *layout);

This must be:
int (*add_cells)(struct device *dev, struct nvmem_device *nvmem, struct 
nvmem_layout *layout);

> +	struct list_head node;
> +};
> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
