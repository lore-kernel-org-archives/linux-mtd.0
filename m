Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB7C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qm5xnI8r1UdAphpENJON/kuj2B3D6XQNRex19fzKgig=; b=wOP8K+DBaDmhp5
	+hRGUvVZ/rqwSBjqy41MceHfDI9rQVc8GqrZV1W0kFMU6LmngZrOfzpb/fjF8zVAv9ZI5GEO2VlCq
	lzl8gl8zY5gozaVMm9sRQ/fFLdgXA1EpERROOTau3bNhEn/DcqgCYE7AwQLUUnuZW2Sg6snlhBvvG
	UbFbzTIOg1sYaFoO1ghFQygF5meZMGNx7iIjW7ASe1JqTcf0tM5iNqqtf3im068esBrp1crmE32Q0
	O0SsVBVzwsxID+ANcx/pdZX8kVYxMSkFTCVF/EhCfl9QnQXvTMVMs//eINJpRnp7iA/+Rdy6nPTja
	o/yYvoqXplN1tJ7ZWbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pr4-00G6mX-Vm; Thu, 30 Jun 2022 08:48:55 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pr1-00G6lH-VS
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 08:48:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id z19so25536929edb.11
        for <linux-mtd@lists.infradead.org>; Thu, 30 Jun 2022 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KJ6oqzacpWT0tfg5DNbwZFGWq7BtF7yMtkVN7HxcDnk=;
        b=tNO+oZo9shQdh1rhNWDOTosr5geu8ztqOhGSN7j0kUgWKRvrTDNpKMMQTxwugbtmoO
         eTQkFwTN5/tFn8QUJ9KoVI+ocrRCGUBL00/1JEOeHcl8PW0KwQv/rvIJe4EgJ9vbbNDq
         3YCN25Rm7P4ptDfHHe/qjx2zazpEJbfRq1r/Ud0YyjKBppd4eBph+AtNEGkqt20bU3pB
         AHiJoIOTXky5f8d6vG5gO6foGmgLQTNzQ9HB77R0gNExx6L3GKaebwFGQY3ZatD3hVYa
         BSfnovPSQAsQ+vn+kI8/vwt0vdt/brsr8BuVk27z4bOXYjlhTu+e82O16agQGYg7qd0N
         nrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KJ6oqzacpWT0tfg5DNbwZFGWq7BtF7yMtkVN7HxcDnk=;
        b=rd/dILXmrW7Cv2WvRKC+OxekwArqJHfZOK7WNi+rZvUoWme+XNNaKa3v7aBb8ruEiN
         37P2BYq/qNH0+Tpd5lieE40RhmSR3hTV9bbV8a70MECe3vcIq9/m4kTfOYPVfD37S9lE
         bODUoQzCfD+7WT/RJs4WO6fBFmTKYnSCIRfO1osagJQPLNoxJsqnsrVvdU3lstFPTz/U
         JSkkxz1W4/zQBs4UHntPcKF7vP67hFvbSfiW7z+JpQWbwZxJFF1UDRWOvepQzwb8PtzE
         ngTQZGA+xt9qh5IVJNWR8UfqsBKoRx1dlnr4UVKnubI+zVE69nAEbLp+ATEAbqFL9od9
         uQTg==
X-Gm-Message-State: AJIora+rntm9Pbqnibjiv9AJ8Id0e9XuOjhK90DVD5d+TSPBFC88GbbL
	2Z5eWCLw9K03pSctreN1yYS8nA==
X-Google-Smtp-Source: AGRyM1sYlD7GgYsvG4haXeZ+OfvqtO8Fd9dImoUw0WI2NrSxwKr0gKtRg+uGeYRy9i0ZqtRk4XeXtQ==
X-Received: by 2002:a05:6402:11d1:b0:435:d76d:f985 with SMTP id j17-20020a05640211d100b00435d76df985mr9900795edw.8.1656578928360;
        Thu, 30 Jun 2022 01:48:48 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709060f0400b00722f069fd40sm8714366eji.159.2022.06.30.01.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 01:48:47 -0700 (PDT)
Message-ID: <c04c3691-7be3-afc5-4f95-2b06ee402c0d@linaro.org>
Date: Thu, 30 Jun 2022 10:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to
 .probe()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1656341824.git.geert+renesas@glider.be>
 <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
 <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
 <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
 <bab4d845-330e-c7f0-5dac-a96caa93a39e@linaro.org>
 <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_014852_060016_1E6CE382 
X-CRM114-Status: GOOD (  16.25  )
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

On 29/06/2022 20:48, Geert Uytterhoeven wrote:
>>
>> You sure? Except rebasing I don't see that. rpcif_sw_init() received the
>> rpcif so it had access to all fields.
> 
> Yes I am, don't be misguided by the name of the local variable.
> The rpcif structure is allocated by the HF or SPI child driver,
> and thus not available in the RPC core driver's .probe() function.
> The rpc_priv structure (as of patch 4) is allocated by the RPC core driver.
> 
>>> I agree patches 1-3 could be moved later, if you think it is worthwhile.
>>
>> This would not be enough, it has to be first patch to be backportable.
> 
> I can make it second? ;-)

Why? The point is that this commit should have Fixes or Cc-stable tag.
If you make it depending on other non-backportable commit, stable folks
cannot pull it automatically.

> Note that that still precludes (easily) backporting s2ram support.

But S2R is a feature so it won't be backported...

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
