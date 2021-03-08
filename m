Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE99C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:49:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26405651B6
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26405651B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h6FNfdw9x6GP/edT13KutjtqUeb8+0K9DBUs8tz9PXg=; b=Dx3f1s6zE3uAV9Xqdp7RtbGxL
	G2VCiYsC37WhitQtLox4hJ4yf5u0dEnRaxfoFLqHnL42nmKjaDQQcDva2xkF7SURnu6dSO76cJUMT
	EQeibVDJZTXZBkV5GQZqqz/hINEPG6n/4ugFQoe5uBeTJ73WDR9VDWpV2EOzpXFhDG/14HFi5xHJW
	lYACaExypPszKEPbMgnkqlb9qrxozjyN5+eULdTCucIaxeYoM26veajD9FRlrp4svhzXbkxDexVi4
	Bt4KqwwB4W71fZutE0cG8IUNPP6KrKvEJuL8EeMBSIIsCYjPnhKcex1IHItStVIape9gI2d7qU3l6
	trJ1vkWiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCVC-00GGGV-Rw; Mon, 08 Mar 2021 09:48:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCV8-00GGFB-To
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:48:36 +0000
Received: by mail-lf1-x130.google.com with SMTP id k9so19977024lfo.12
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 01:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yMPvvaC1VpKQ+IQEg4AP1RTQAfaMhDgcAf2MjnMXhso=;
 b=XKrsvsrYEOZlVjswIB+hcBruPgK5CRnwqeWBTzS5AXVZ8iFrdMP5ahzdhj6Lu54U6s
 PF0d4b+fzSRL8xUVrvsyCkVvOqlPFp6UUdww9zA9g2PnnxsIZOmeVwaDPB8sYCBtbhSw
 ns4O66xw/oNspASfX5f4jYLD4WVVjjrN2or2kbO6Z5s0X0ptW2yt/sEahtE+VHPrkAC8
 Qjpr5cN9r2uWGI36QSJhTlta8Zs9IjrDLGBwE5jDmhyMP/ryNqURTXX5+pg1NVjRwwP3
 3bcz+6pXUbVBKN9ij95vJ/WV/hIPd30pv23K+ILFlpDqdMx7Ee75TcUHkM9xTwfpDyJL
 jFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yMPvvaC1VpKQ+IQEg4AP1RTQAfaMhDgcAf2MjnMXhso=;
 b=nTlcWxpv1XTuREYo0Miu4SdfxPwRLy3MGohVZvzZAIdP4shesaM1yXAy5KCwfyQSWa
 Sr5LrTGk8/GjJba+dA6QPdbc2i4JGKWm+u4kNyyKLHPyUtwYpO+llQXxxQKjqMddIo+V
 JhpnFrGgCD3cIkU/h8rveDkpKK3z169qp8671GL74CsPVtedtZ77vquLCbNHffpXitdB
 8sZYHwKWpQfWHrJwBWmhHj/p4z+nKtx0H7VysiAq7Xf3kj9N1ZH3fW1MterRIAw0AYcK
 CC9GzrPBjn/K0JdGtraWADBaHv/2QplYuutXHMyAxPfFpSQgeX2hk/UysV+ruO1Q2srR
 2pGw==
X-Gm-Message-State: AOAM532xa3/YKTYca8F5n/Jr9LwH6mk96ZI/FAG1IuhozsblDYf9al0C
 OvuJcs1eRuwzCIhQZ7J9lSw=
X-Google-Smtp-Source: ABdhPJxzpWbGWi4U0nZEVpAIZqLD56P7BXiW9bEVNlH8CrOYd48qYmJL+wwls6N6OqVRNzfDSyR4TQ==
X-Received: by 2002:a19:6109:: with SMTP id v9mr14344228lfb.546.1615196914072; 
 Mon, 08 Mar 2021 01:48:34 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id m3sm1331901lfo.190.2021.03.08.01.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 01:48:33 -0800 (PST)
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of nvmem-partitions
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <ee596471-db9b-43e4-c085-9bd938101587@gmail.com>
Date: Mon, 8 Mar 2021 10:48:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210216212638.28382-4-ansuelsmth@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_094835_088465_8BC10882 
X-CRM114-Status: GOOD (  13.02  )
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

On 16.02.2021 22:26, Ansuel Smith wrote:
> Document nvmem-partitions compatible used to treat mtd partitions as a
> nvmem provider.

I'm just wondering if "nvmem-partitions" is accurate enough. Partitions
bit sounds a bit ambiguous in the mtd context.

What do you think about "mtd-nvmem-cells" or just "nvmem-cells"?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
