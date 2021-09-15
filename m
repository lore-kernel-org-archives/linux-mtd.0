Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE170C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 07:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863C060ED8
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 07:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 863C060ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=++23QnXg5uJ6y6LufVGsZg/23AShtA2OceHI5hHgydg=; b=HORDuTjj3CmEehfDmiU1BbR3Rs
	AjDO1M2qRjtqlbzZNU/zc0XTlrxMhXoBK663QdKgqkfaY7TSp44fthkHIKttYIeCgM4xBUSlcWF42
	Kgp/Yn+pYJ3lOyK34yXUISRAyeo/Ies0pjZVaIpQHaxFmf0Gzgz+JZk9ynKJCzH15rj+TF/vkZe1H
	9+y/S0juESxh9d70t8m7DN8hs/ji7EUIESI6y8RSSIBIQjxeiLojuQa4hhRjFtTeTzcZksKpXvcPt
	Ee+P5L2lpwjuQWnO0rvtywY898KBU3oW0gweTZga+Xj6YEu0ABCtcNKJyn1f9AZpKikuSswMn0674
	f7cNdG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQP5w-008H3n-2k; Wed, 15 Sep 2021 07:12:36 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQP5s-008H37-Ut
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 07:12:34 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5E77340286
 for <linux-mtd@lists.infradead.org>; Wed, 15 Sep 2021 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631689951;
 bh=191SUmgkCeF6ZQfCKm5T3c+lIG15mkBcbqwnFyOCstI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=KkDhMzcW8X8369iUkGo5nfyP5Tn/MGOOdkiPhJZ/k9+t+9rJZKuM9a+8QdP2Yj3Cn
 qJjEuHMNsnbrQ/BqIrpAmiNNmcfesF0pC3IsK+7MZxC6w8weRuYGmYqEUUUwmW7hsS
 SsodyRCz0rMeLxJOguGQroS/nCd4oX6do/gMZzZRffQ1FJKgXdtCfBOVvu8thiemlH
 e+qky4n+rapJ4iRgk7UUKyBX1KwWkJrnBslYlX3DCA9EyLer2sjzIUW0k5qb7iG3Mt
 UnGkOqCEVdYPeIrwMorEz8YRl8UmEE6K8N3TLhkfyOOww+CGmfIFTj7TOXnOW79BN3
 b/iEpnda+7Maw==
Received: by mail-ed1-f72.google.com with SMTP id
 n5-20020a05640206c500b003cf53f7cef2so1047763edy.12
 for <linux-mtd@lists.infradead.org>; Wed, 15 Sep 2021 00:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=191SUmgkCeF6ZQfCKm5T3c+lIG15mkBcbqwnFyOCstI=;
 b=IiNYAmyhojmrUsDXjOpzs60v1pf0xZF9JrwxHSkc2u8udBeoPT1gyzndGcnFd4qGAs
 /955sRXPUjLHlVoRSYPcr9OgLN35v8+pZbDDcsDVGYU+1zdNVWfl3uHVOwRfui+lB55G
 eFaNIXJH6+TS++12d4x6hKyd1JCDrRScD7OdYXiT2WiStcG8EJfOu4Kc+ZEDxdGUyxmR
 vhCjs6FiPF0MaIo8ba6HT7YcelcydfBp2jUTwSyr4a1YmaMa2A/RhyU3UpOOGsO6vb+L
 liU4vebbyLksSKS5uQ0w7DqoSbfreiIQgvOEvfDVOW59c6K8XIDcoYbe5+PRn4wWXfNw
 7tEg==
X-Gm-Message-State: AOAM532GVFst51a3gpZMnnAy/z5iI8MDxFfqHLjALGjJp+w+qd4e38Z/
 Eld5wc48g+FT2EOt2TisbEyD8RvLToxBhXeylFD6CY3f7ulEZybujqQ+coy598+iuRxcgA5yAM6
 tKFwzKi2CRv2lLqkx7oTPj8HHHc2LK2AMMgrJ0JIw/j4=
X-Received: by 2002:a17:907:1df1:: with SMTP id
 og49mr23623903ejc.35.1631689950797; 
 Wed, 15 Sep 2021 00:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5UTlhBkXQsaIUzYd+PTbm7+gO6+qavmcR/SDNB3M32OjLvLJ+G9bwfmFaihvVDi3NUULxjA==
X-Received: by 2002:a17:907:1df1:: with SMTP id
 og49mr23623889ejc.35.1631689950598; 
 Wed, 15 Sep 2021 00:12:30 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id p23sm6916478edw.94.2021.09.15.00.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:12:29 -0700 (PDT)
Subject: Re: [PATCH v4 8/8] memory: gpmc-omap: "gpmc, device-width" DT property
 is optional
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-9-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
Date: Wed, 15 Sep 2021 09:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914122705.15421-9-rogerq@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_001233_258548_77D92D68 
X-CRM114-Status: GOOD (  14.61  )
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

On 14/09/2021 14:27, Roger Quadros wrote:
> Check for valid gpmc,device-width, nand-bus-width and bank-width
> at one place. Default to 8-bit width if none present.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 

All the comments from v3 are still applicable because it seems you
ignored them. Please respond to them.

It's the second patch where the reviewer's comments got lost, so it
creates rather poor impression.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
