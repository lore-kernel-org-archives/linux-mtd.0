Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944B9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 15:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B4960F21
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 15:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43B4960F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nKut5jyZrMj0bYGukDwen4ft4Q1ikxW/awzDopC7nII=; b=wHVAugHdK17ePW4f/BFE2OxJ5A
	rbeFnztdAO8pGU05zf3LMxqQRAUTynsin7WiLnD9+iRoDTKV6l64yioXu8/lTovZA00zugmfCUclb
	stqScc2fwfoxYgjsRNTIT92ObBmVTVBTa0oLB5sJauDIBLCdiouijXx2SeW2/O5T1Flb16/QvQqME
	qdeHme3la69iAZgRI6O4TyXUmplOmgqCWWAlValCf9TVuBZCC+ROMurCh1DajahoBOWL1ChQZnfj3
	oBf21PrI2qKymAvAtPbLXFfJqRGeS/FZWhhrOOaTBLLZDCZ8XpxtEH2CCh0wBlo08UWiSLUgHDVeY
	abJfDD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKmV-0026oJ-3L; Mon, 20 Sep 2021 15:00:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKgK-0024BW-3l
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 14:54:09 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F2B823F048
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632149645;
 bh=V0X+3uidaeyp1K6mH5laK1N1lZeTwvHcyGOGgKbVfnY=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=QmuiiiC0+HvAn+o8MOwflUeoFczT2enHuWdqs7pfd73Gj+wzjXUQzUVZr/9CmqGUZ
 QL0XOZR3hR/MopAe6o08ylOxRd3Yh+zd1pF34zFtk9gAC2LkNmPFZ7+CznS9NcVhEW
 hYPyrEmBD1YsAGDkXa9TJ5eonT40XdYfmoj0OKdPr0YTQ/JUybaFKFdxDAgZR+uwGv
 NayqQLcxLOWq5HKoPJrLqBUz1wa+u+0nTlXzdKwdugldfIrLFMlN2wKAqEsY9HBJXr
 1+9p43U3qya+ruQvxar24KbsnT4xNQwUX6+Fd+WqGhlfop5KDBU+TImlGreAo/ooYF
 bdaLMdy7OXWhA==
Received: by mail-wr1-f72.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso6308752wrn.19
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V0X+3uidaeyp1K6mH5laK1N1lZeTwvHcyGOGgKbVfnY=;
 b=2yuMia2Tm+UAznRIDoagfmaGkfywAToKg4Mi1m2tQaeL7BKeZyuRDPQ5KWj8xo6sjh
 AYtz0FnjCF8g8FwYSk2EFCWZLleg7ZZb78s5F4KNeIcTph/1Fle9+T9kZt8pcQ6EB4m8
 HkKFN+lsD6F3fJybWtyp9YTDYWtg/PJaadJoH8RWCbOdrgeZFuSDYTgZODY0EOlpH5bw
 5kyQIznZNJFJZF/tcQ2W0CzmLEhaY+oECAB9vw+3CwSTnHXx2CwG8B7EK+xEq/k3/Wab
 61hYPbL0doXRsKbRSBLIqswYshx5XjAV7JJ2/PKrNdVbVl3HjHmS7CzW7hIEK+mlPfKy
 xQiA==
X-Gm-Message-State: AOAM530r0cmFIsALYiyrOoWdO5jFiDsm1g0ZSIi4/svcBxdFLl3Lx4Kr
 a2xXgvcnWgyywI6ssY5kuQiVJrhrhqszBUQ5+Vrc5/duGFETTT1tBycplb8CQkEpfMJLDBwOouu
 P78kfsRxl5oQGmS1Wb8QpkcF1am1xhp7d6gbhTj+faNc=
X-Received: by 2002:a7b:c142:: with SMTP id z2mr30489005wmi.10.1632149645731; 
 Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKtZyLQklhvFP4E8CIP8/HFnNPR2fRGO1PTaijQfdrYO28OItWxsrb7LXGbo8xKOP7lAiUbg==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr30488997wmi.10.1632149645581; 
 Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
Received: from [192.168.2.20] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id m18sm16064557wrn.85.2021.09.20.07.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:54:05 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] riscv: dts: microchip: drop unused pinctrl-names
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
 <20210920132830.152802-4-krzysztof.kozlowski@canonical.com>
 <CAMuHMdX5vhihbKrXh4x_VyA2Cc=nR+53g_fZPHsuHVF56rBvMQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ef5771df-86fa-524a-8a5c-c519e913330b@canonical.com>
Date: Mon, 20 Sep 2021 16:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX5vhihbKrXh4x_VyA2Cc=nR+53g_fZPHsuHVF56rBvMQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_075408_314447_091C78D3 
X-CRM114-Status: GOOD (  17.11  )
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

On 20/09/2021 16:32, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, Sep 20, 2021 at 3:28 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> pinctrl-names without pinctrl-0 does not have any sense:
>>
>>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Add review.
> 
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -33,6 +33,7 @@ properties:
>>        - items:
>>            - enum:
>>                - issi,is25lp016d
>> +              - issi,is25wp256
>>                - micron,mt25qu02g
>>                - mxicy,mx25r1635f
>>                - mxicy,mx25u6435f
> 
> This one looks like an accidental addition?

Thanks, I screwed up something during rebase... I'll send a v3.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
