Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B98BCF64B1
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Nov 2025 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQwW1wifqr9i55hkQ3PTHhSjL8M7+okbpVZm+FicjhM=; b=0uXVRNG7RUNspw
	nTNObPwpJw9zxUnjZqItM8Y966IKjiR3pAuodD07Sw9F9KDgVXW2IPRONDnPu67x44K5CudHvZdIY
	SnPRv6to3jhuLs1fapcH2KgVxQMy+V6aZFLBr87EJ3q+rn9k/HbkttZY3JPhq/xW5k1pmqk6Vijsh
	Fx4czyF6QtwRaJs34jFdLsKw67x8we29P7Uffel6Nrx00tKuIdaRTkpdrnXwzAZz0tDWy+AxoNORc
	hF/NJlzrNV427BO3LyFVRluxiAPFYrHSjpedzAiKw1+5b7v/0sSxAKTT73qkhdCq3AGD32CiGYVML
	nUVaPnUm0lKsZJtyF0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlpR-00000009VJD-1BO1;
	Sat, 22 Nov 2025 11:30:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlpP-00000009VIo-3B2X;
	Sat, 22 Nov 2025 11:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE29D6013B;
	Sat, 22 Nov 2025 11:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C871EC4CEF5;
	Sat, 22 Nov 2025 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763811054;
	bh=wrwqhdFSmRHFPHwVpL5Z/tLTITU5aRbOkeIbdOHN3hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1x4E8earpihvpn8f81tbqyWQc7odBC+S0Nkend+pVMUFjYmIafNN6Ym/glFgGjH3
	 kITBRQ0u9Z3OvnMFFoKpmmAwhEA1dqxQtgXoXuB44xmJj7eS7Q9fYhgjkj4n2s1cYj
	 tM6kuvB8CU+5vfswINwR3WXvytZABQYutxhkiGkpXkH7Ofm0YIks3SQYjJMrM4JdTw
	 kQOuKXugEN5T0GzWWXC1n8ss59zpNK9RwwZ/BnL5NJQ6jz3e5Zlk1nrtk8M1a36VQ1
	 guDXOgxP3qTIcboI6/CQWhUK8Ru6G7qsZrVkc6nOz8/kzpPT54yBWNzO9lIHksdsXg
	 ecetv0PX1SonA==
Date: Sat, 22 Nov 2025 12:30:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/3] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <20251122-spicy-chupacabra-of-joy-ec1ee0@kuoka>
References: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
 <20251121-mtd-memregion-v2-1-c5535fdcebe4@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-mtd-memregion-v2-1-c5535fdcebe4@bootlin.com>
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

On Fri, Nov 21, 2025 at 04:42:35PM +0100, Gregory CLEMENT wrote:
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by index and fill an array of struct resource pointers for the entries.
> + *
> + * Returns the number of resources filled in @res on success.
> + * Returns -ENODEV if 'memory-region' is missing or unavailable,
> + * -EINVAL for any other error.
> + */
> +int of_reserved_mem_region_to_resource_array(struct device *dev, const struct device_node *np,
> +					     unsigned int idx, struct resource **res)
> +{
> +	struct reserved_mem *rmem[MAX_RESERVED_REGIONS];
> +	int count, i;
> +	struct resource *r;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);

Odd cleanup placement. Please read cleanup.h. Also please run checkpatch
because it told you this - marked it as ERROR.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
