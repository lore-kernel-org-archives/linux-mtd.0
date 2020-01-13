Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA908C33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 18:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D55B2080D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 18:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3iyFCSw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXHlDgiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D55B2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaPQZiXQZ68qp/xkSs5EpPJ2/lC1RuTXaDXhFCAlfi8=; b=J3iyFCSwGb0BD2
	Skb+ADVEzpOQPPPgqsrzBKPPiKsKClFb3O8TtxU4HZqF38dG7XvB9GHD4NAZeD9Oi/+Ck3GerTrY5
	wmn+rZSzLM3HCS2oZyqw9u8yfTmONkWOtJbKul/6lQypbTsvle4aMhx7c96VWVMcCkagrxiBvuJmF
	J8gdJzzZaPRJ9EKvpKdYaPNKtsiHMw5Pe6iYGh21LqzDsoOztrdY/GEwdp8suTSQ3g8J1PEt8yw86
	gYAWS3zmld6l3TnvxSSujP9vnP84ZxAcZmKTMuwO3u9jOZiGiuGVpn9BQ1hRNWkDjLkEkCeZdzG1m
	NwtXGWQWYxJeuqxOQWaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir4XT-0007FX-SN; Mon, 13 Jan 2020 18:34:11 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir4XG-00075Q-7g; Mon, 13 Jan 2020 18:33:59 +0000
Received: by mail-wm1-x344.google.com with SMTP id d139so509412wmd.0;
 Mon, 13 Jan 2020 10:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZXLr4jt3Z0ly6bJlY2S1K+QAkB0UsTXiQL9zQoG2s4c=;
 b=mXHlDgiSO7p/uX3R9XNTgDdGIu/YGZA6qA1uL9FgkaEBt6vhBsjXg3YO9i7CMOhB3j
 MuaaxXJs/7qCYAEOy2rl0yDccD8H+XsP1E4tFJlOvdnNzUnD0BS58a3jfG/MalY4chV0
 dOr1o8A8uUET4aVYVcbOfbaTOTLCHvjclGvrZHrFOgqByKRWF+qdD17NoRYOZLFIxhHw
 dVpVKw9JiDqQN8uveu+hdDr0HHc1vnPKJI8ooC9hXAW2MKWtxD6feQNOS4M+xLC11235
 ln/lgNKbndSLF+653ME1m/3cWrD6ygFqw8OM/mUwQF8A2ApvzcXk4Bt4GOH+ySRbDtCN
 hmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZXLr4jt3Z0ly6bJlY2S1K+QAkB0UsTXiQL9zQoG2s4c=;
 b=AGxaw+4ex+TvPz0GR0V32vMI7q97rpHSnUZZFiLGxqy/NRChIdn5h+bLyGdCSIMXi7
 by3yyOg7J/GcCH2ooYhDkRslxb+sMVinRXx4zZmHUM25SSMxWjhR5N3TS7dVlS4HOf7k
 7EC3fgX8s/DELM9ghC+ym/6/FKhbJouAxjSMYcM2bexllPY65UbP7R9y19gV5CGq6Zyp
 USq1uV8z7BXapNXnjsaJAKcY9UPAMKnFtI1mThlrbH/432nLSd55tM5AbOntYUo9+oFc
 CzfIvxR+6bxduDpeO8mmH+AI8h8BopYwjCdwcs9kdcnWXpQYEAJsQ7Km+KGIIRq8S5Fe
 y14g==
X-Gm-Message-State: APjAAAV8MLKhd6lGU3tZxwx99zpFPdtJdEbBhVRUG6QAB2GWd8BD/jlC
 0CSqUW/0RaMf6TjdZYnzhkA=
X-Google-Smtp-Source: APXvYqyGePBR9ORItEnsI4A/VolH7tK5HABxUgERqXN9F5gLMCg+0OuRxmIZVKfdKncZ1preY0W6VA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr21557885wmk.172.1578940433124; 
 Mon, 13 Jan 2020 10:33:53 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id n1sm15518360wrw.52.2020.01.13.10.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 10:33:52 -0800 (PST)
Subject: =?UTF-8?Q?Re=3a_=5bRFC_PATCH_v1_00/10=5d_Enable_RK3066_NANDC_for_MK?=
 =?UTF-8?B?ODA444CQ6K+35rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNl?=
 =?UTF-8?Q?s+shawn=2elin=3drock-chips=2ecom=40lists=2einfradead=2eorg?=
 =?UTF-8?B?5Luj5Y+R44CR?=
To: Shawn Lin <shawn.lin@rock-chips.com>, miquel.raynal@bootlin.com
References: <20200108205338.11369-1-jbx6244@gmail.com>
 <aad92eb5-00ed-5071-c206-491eff243537@rock-chips.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <73cb4b1a-aad3-c613-a642-1887905e3932@gmail.com>
Date: Mon, 13 Jan 2020 19:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <aad92eb5-00ed-5071-c206-491eff243537@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_103358_277669_7FFCD5E6 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Shawn,

Thank you for your notice.
In that case I think that I produce a version 2 "light",
where I address only a small amount of the TODO's and leave all other
things up to you, so that you can do what suits you best.
Hope that RK3066 support for MTD can be included.(Linux and Uboot)

Thanks

On 1/13/20 2:55 AM, Shawn Lin wrote:

> 
> Hi Johan,
> 
> I loop in the author of the original NANDC driver who is now gonna to
> develop a new version of NANDC driver in near future that supports more
> features like bad block supoort. Maybe he could share his TODO.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
