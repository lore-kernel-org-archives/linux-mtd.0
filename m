Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00C7C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFgsA/dyX6GzG+gkObNj2Btvuhh3R3XRwMP7tr5RpvU=; b=HUtBhA3YrgO+D4
	NsxGnke10TabFo+4prpKSxV6CNhEmJgyI0lAtviqqOVnGZ/rRht5WklfWattwiuMiyNS5VrD5RpOn
	xWC0jXZV0+V8F0w40oGvsLaj7rgCf3uoXFc+acK6N78X8h/kPS3+2zgG8SzgENKRq//cvGYsip/nD
	IOxe+XPNYJt7MyxcpLGsd7l+38kj4ueH+xyVmB0f/DDDMA5S3TZtfbIeR6HxKMEo/efkLHsQTQAX/
	0K49RhQuHG1TYQgRGieNC3uNt/YpOWaIJaTSXuiTo8BSUdZV4te5Dcusz3jIp4TnfQRxrGoK/MAg2
	pscSA3aPgJrnP5AggGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u000x-00000006WAN-3InP;
	Wed, 02 Apr 2025 15:28:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzrr-00000006Uhb-3x2Q
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:19:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so69114105e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607142; x=1744211942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlysUqLOtsPNkV/QiNl3yOcjs2Ox34WviGlejoVRthA=;
        b=y2BWQh3QggKFnshk2raZsY1+K9lO74XUJ4AQe0LwM8qYxOycmSP2ZeNWA0iFdCquL9
         /16LZGwkAQlNNlXUGFoMTyGs4ELFIuYkLhAugGL+nm+Om94iht5cjO/M/wAqxQ17PoFm
         W0JwB/DM8NZgGTJTV+6+06VrO6KVtxYwwTlEIgDPJGRp7tYfjkIJAdVT5WE3wFWlERGw
         LCqKGZShNu3oV3x6gb/unF8PguXNUUS0jf1eUuDeor4Y8itQkNx3J1opqxciqMwSlL/N
         Cq7o52KzJVYy0VkoWiNp30jaerpVVYgi+gefCBesHV3VQlLiPrUd8M7fHZCODSsyTqfV
         +Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607142; x=1744211942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlysUqLOtsPNkV/QiNl3yOcjs2Ox34WviGlejoVRthA=;
        b=iq4TBm+42djNoFvTacvLVHsoh3uSQtDyO7QWlTJaafQQUGdTYgf3FbM6nelerLOjXH
         FVHRRYKpcLT7cuzq/c95fjo1P2q+4yxcn+33YrM1xzTK1X8mvzFUDry+oeXwBZYwL5iO
         jTkWxmhUx2DuHe9GYudXjprBjWVIiajiUf35yj1PYkMqCnTj723UYGYhyXrNRgB9LB1S
         Yp6oyK6gy/nkC63KmlK9mV7wf9qgZAvngAmfUE7AGkvIAME9wOgDyMDaQRjBwYZyK7MU
         h4nh4URLS46xdinMFdjz0IvRfjEsjiQ8i6lo1WW/AjHX5IpL7PwdHiwtOahXegLN93C9
         x3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVkoDjjFE/nQrz6wk009CJgk1ARdZRpp3vY3APExpvGjQ8uiSwkDpoyZLg3koOhBq3hE+PU0pgqXso=@lists.infradead.org
X-Gm-Message-State: AOJu0YzY/cNNQAVoDtTjpJAbPfNXtdDWKjO6Wq+siQ8sUfkfmwZ8ne4d
	VtzjmDu/WCV+VlTQ6ijHIn4nuYbdWXKLAn+kGJA/iHK9ozF4r8rti+11moxQ9P4=
X-Gm-Gg: ASbGncs8XoBZYMkcb0Qrm9yfEV46six92xR26g0NvzKtBX340mWBm2Cad/3yQE9bMoo
	qKqZC3/xhNIc29rX+U1MsFhJalE016LjfBtqt5fb02tFYM1ONxJ4EnbPW+OeEdsFSnCPLNT6FFc
	nKfDrQ6lSbXjtXvFxHopkY57LjvjlcUiw+L0nbRO/9RkcyFJoG9TZRvKEBEZ2cdB4aQPVoEecx5
	d+bQoW+c69qRdrZDGkfTpdHEjRj1KK1AHsCufJXs1/KtxT3OUdgP6SCs1THFr7COaAPdKXpOFAK
	RBTKs8hKvDSbRXT/zW8W+u30jdhlEexoy0zTDMLku9AFx8ZxVXKQlg==
X-Google-Smtp-Source: AGHT+IGwv2MsdCnsG2Kqybof4F/W5PPqZj6tCbp/AEjtdMPrsS/kXPnFlt7D8CDkoHBhANFtHeAn0g==
X-Received: by 2002:a05:600c:8411:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43eb3af4581mr30858685e9.7.1743607142241;
        Wed, 02 Apr 2025 08:19:02 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd0a46sm24297325e9.9.2025.04.02.08.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:19:01 -0700 (PDT)
Message-ID: <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
Date: Wed, 2 Apr 2025 16:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081903_982355_8EE10AA7 
X-CRM114-Status: UNSURE (   6.53  )
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

Hi, Miquel,

On 3/7/25 3:08 PM, Miquel Raynal wrote:
> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,

why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
in the supported ops.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
