Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2067C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AX+yLOPDNuIZOAU/J1SIgkXaLfbydx+QkXX22qO42u8=; b=XcuTk27xxXVsnG
	wmmljxJoeLi7xr9BOXnFnKnd7ofIRw8zjeK93gBbxhM57J+S18W6GVY2iaOkxjpOak/fJPpFeY13m
	RMt6WxYXnOY6OkWxZzGiCgg5ttUMhbJYL1ESjgOKOrcRc5ljFep50fgB41hqrNrDiHIOFoGfupe8H
	Xe8dRdMli3yC4ozjxjrvHBjv32PCx4/Bzw2k2OVyDHNeRAaG0K7ST9WVTo3knSvUaDNnpkiuEYmbs
	Vjd0JgpG+PUCBs4+HGD0OnoCwP59/OtL/hkl5BdcNQL1T/vQ1hjR7XebzscWtyWAjIrEjTIxzUe82
	yDMONL1M55UYy1PdEkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFjt-00EBP4-MF; Tue, 12 Apr 2022 12:35:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFUk-00E3rn-96
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 12:19:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id r13so36989780ejd.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=B9+cI4IoL52revKm+mDw49Lnf0IFiGCiBvB1l4R4Zhs=;
 b=A6ZS7Z8yI1gNu2iwhHBbnSZ0QbwqlDVmSlNIgYrboFMCpplzOT5VRWB6uCvnftD4ED
 rA9JU84nd4w1lZ87TUCdGOodAaN/hWWeUmGfOWIikMdV2c6IrLSBBnSZGy9pETQxfNpv
 rEpYrUjQ3oi2z2VRoXouRjXsigMtkrGChaDBcTNBMnK74w713fbtoc/HFrb9RX1i7eEe
 TUsREoOo/BgbPe9u7sk1tsBXmY6a6VGYE0Yv5/t9mA9o7vClx/OIL7TxOg1qqDZNuRiJ
 47btEH27lFwN0nUpE2/xnkKki+WPoQt3EVRqd240hjir6hDDUH32RepsJNlVe395oYTD
 X+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B9+cI4IoL52revKm+mDw49Lnf0IFiGCiBvB1l4R4Zhs=;
 b=0JrsOGWYJ4DjWjT3viSt9PzHQ1pINRWd/cNZ2n/nyqkaQi1HqV0Z/elMAOYMNv12QJ
 Dh/ZkV7s7KIkYDvrvugR2gWgobHHMs2COCRu4beTlehCllR56XbYuiQg1C/eVJKMQKHN
 HyY8vZ+kQw3NKpUzojv9uS+X0px72xXuFcLlWbktlWRubt26fiD0GMVzO5/irSApsjIR
 +bZJjfCMRbBDfZyd4Pn2RVTe2urdQP/t+/8WHLC8OcXSxsclwOxlUYb1VT0c9Z+X4Dhq
 SkaTdUiJVmVwu/AkTXX51B2Q6mLaUxvMiZOqz2URkVf0JVLSjEd0slUpdtzCApyBvCcW
 F2ug==
X-Gm-Message-State: AOAM532Cp6QVaY7aZenBY49illvc0wC5Xu85rz6bU67Eswli0K6QEMZ7
 m4soDqeQ19dIUKM266waN8dAGQ==
X-Google-Smtp-Source: ABdhPJxP5FPJxSzsun3ev7AJry3+ba7d3iA+/B0jezlSiH093DYefWri2aUuJXT5chMPrfaGPZCtxQ==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr34466390ejc.459.1649765978985; 
 Tue, 12 Apr 2022 05:19:38 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 g14-20020a50e04e000000b0041cd8db541fsm12509112edl.74.2022.04.12.05.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:19:38 -0700 (PDT)
Message-ID: <16750a7d-de4b-0bba-9513-c45560d279ba@linaro.org>
Date: Tue, 12 Apr 2022 14:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] memory: renesas-rpc-if: Simplify single/double data
 register access
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
 <YlVJc3z1xXT2emIc@ninjato>
 <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
 <YlVLEnRaARVmWZnZ@ninjato>
 <CAMuHMdWAQ08K6NCdBGrY+-vBrsTQHi6UHaER4eCON1t9JEG1RA@mail.gmail.com>
 <YlVRw4ypp3+0Miz3@ninjato>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlVRw4ypp3+0Miz3@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_051942_437030_3F10C6C8 
X-CRM114-Status: GOOD (  10.75  )
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

On 12/04/2022 12:17, Wolfram Sang wrote:
> 
>> But that's not what happened. I even compared the assembler output of
>> various solutions.
> 
> I am sure you did. I just said "it looks like..." to state a reason why
> I don't think it looks prettier. But this turns to bike-shedding for me,
> just keep it if everyone else is happy.

I vote for removal of ++, because later someone might wonder why it was
incremented even if not used.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
