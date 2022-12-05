Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1974C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwIF2XFVXVYYe5og3Bq9m+WF8CYzoT1PgZDEFSMCu1g=; b=K9Z3FZGtw1XyJB
	kbNB4AmjgPU7+ezemmmTnZpW2N2+kWzV+ekscx5IkeiG3BHExZ5cXWvT4ZyAX9qmXPTuBW7lMblcD
	tM6Ko8A0C2p8drL6WmNjBn8dijm4U/OUzbO4oYf4O8kyWasa8EkUKuVMTrf6+aMApcxS/RFvpJ0z7
	1oEgwzZMlRD5n6EiaJrIMlfHGjQecIvRTcycoCIuRLxtjrNnIIqfwaQARU+TlPSGtQfkonFDBzhub
	H5hHVORcsLmeXM9HDXdQ7PRZ7Y2XCEFvyBZ/ZNYeguwmhb4fxb7ZYhL3pcOD2l/r5DSTk30ThHsHa
	bq+yWC0GQf+Hfs9Nb14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27gt-00Gzgo-FY; Mon, 05 Dec 2022 09:23:11 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27gc-00GzJE-S0
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 09:22:56 +0000
Received: by mail-lj1-x22c.google.com with SMTP id n1so12815280ljg.3
        for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2022 01:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifApAlZTQFbWg5ohlrPWCvJNXEFvsjQ5YMa0cqLSe/Q=;
        b=SMRaKuNVOMEMtKb9Ghp1P5LbxZ2NAL0PdCBOihZKAP3eyoOLXSa4aR9S/qbj0z3r8T
         T7cFDebZRT0b0vN/E23WFhNOKpi64lihKYO1rHt/APkYNJNso3Kv+0uO7VQv2WnYHLMW
         Z5Y6PuivtqO8N3JMa7TwdqZ9/H9rF41rYI+a8pkXjIIAqFUvA5wuLFpg85oxro8jtEws
         F9HU6sZnpuzQhmH3r5cRvhb7H43hB4aW1q3oeeElxjSDF+HvJ+5yhTJxms9NbPLGa7hm
         9lh89zB/V6Zy1S9+pqOFmgOe9hSVr566UMQTgYe4xuB7GgAaFYcaqhGTdZxUvKQFx6tu
         jemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifApAlZTQFbWg5ohlrPWCvJNXEFvsjQ5YMa0cqLSe/Q=;
        b=WGcdvi5vAv1vplGDkDKIKqzGGmHB5zuxxtX6Zp9LnJ/4m4cdE5GUcxdUrhmQRxlnDZ
         y23OULbQZz5iCF8rHecbjDUQWresAtfLF2HETy29h69hgBqwgqZ4al4SiWsf9DZSm4nY
         Ai3moy8eFGRxRcP0vwZetbaWgS6zlB6M3Apg/xD6V8L15sVAmLXVT/r7EysAey70EyNb
         adPldJ2cCn8LhMvI5MwIw1W/Dz7wwv5gm2EG8ZnwXrxiARxTilazR7vPa10k9297BL+H
         7ZBbmBlBfZVd0qWbv0gf0GyW7tYDw/kTUiS8OZ4uMymkrW+qs6ThOcfZsrNtex+hW/LW
         Y9FQ==
X-Gm-Message-State: ANoB5pmOxx1WMwHca8ruLEQDHMnJXhjNEXolusZki6sPySrMQxExRKfb
	RRDUuZi3R6CxUysMo5CyMYTPaA==
X-Google-Smtp-Source: AA0mqf5ubdilEPhhSGVBVAmanSy+eKOOTQiyr5re3MOtJ+WUJkcNhxnD/whPCuSsjcoLuGGPaa2jmA==
X-Received: by 2002:a05:651c:2211:b0:26c:66c1:87f9 with SMTP id y17-20020a05651c221100b0026c66c187f9mr20482455ljq.47.1670232170396;
        Mon, 05 Dec 2022 01:22:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b004b55075f813sm1304683lfo.227.2022.12.05.01.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:22:50 -0800 (PST)
Message-ID: <6ba5f4c6-d725-0bee-9fb2-eddfae5760ca@linaro.org>
Date: Mon, 5 Dec 2022 10:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 9/9] dt-bindings: mtd: ecc-mtk: Add compatible for
 MT7986
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-10-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205065756.26875-10-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_012254_930937_6DC26B48 
X-CRM114-Status: UNSURE (   8.17  )
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

On 05/12/2022 07:57, Xiangsheng Hou wrote:
> Add dt-bindings documentation of ECC for MediaTek MT7986 SoC
> platform.
> 

Now your subject prefix does not match file. Filename is
"mediatek,nand-ecc-engine." so use it instead of "ecc-mtk".


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
