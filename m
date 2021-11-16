Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBC7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:12:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0016063213
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0016063213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyFy8sJpTmmz9bc0WJS3diddeDwH89/J+psKWhTcCdk=; b=bCgs2V93CnfzLv
	ugJ8mx40IHLpl734VZhii7fL/P9jKqJ24m4Lwf9BWk+Jz7ZFMlkTL8/VyTf67drxVO9+3DQB4GY/Q
	6BBzbRWuUfe+DuTFZiRjJU5l7awIiDUciR53F+KNU/wbPsLENN/yYdiAjNU7T24ep/511CnHJ6WR1
	8ikvF8yN+0YqES/RKbJQmS7p5fUq73wW13eY5sZ7GtppmbJq/RIrY5kt5RJ8KLC6QsEFjUuLb/teN
	q7vM9n71gS4XTF4fKy18YjaTgEuXeFqvMQRP1u14Pd7R/CUXXvThzA8nlMiqnT6JZqqn2dst0Z4hC
	PxMNpqEM2Ef1l8YNa/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwN3-001LYI-PP; Tue, 16 Nov 2021 11:11:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwMs-001LW4-Pg
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 11:11:16 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 06F4F405F4
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637061073;
 bh=1lQZ2TW8TNK2thcDuVmU0UKGgRdlQUfKTNcFYQ2+bY0=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=pre47VRNY9GAYlt58AnK7UlW8XqG6qLpysTBzrHXqS0w9gTZcSVCQjn9RFSQvtfFc
 oUOA3MGokCBZySZx0K+QAuNW67iUDCkiomZalp3Jo8eTv2jHJkN/AgHtxiqNU8Lw88
 NrCXOjXp6BoRF8oaeVl03VQKmgbU9ile3yzxqr1O7ABPFUcgYEo784Fiie/Q1YKn3n
 9gtDrGeBMZWwMLO/EpPAlnC0RqTqtaDg9IBinYYmaCHcbl5YcOPoE5LZF56b1blUsU
 wHXvwE1diRMWfvukD1vk+3MuH0V6mAH+mrxSRWXyqzwOl8AeRvoj1BqB9UfSq2raqg
 I5i9Mhpneb1Pg==
Received: by mail-lj1-f200.google.com with SMTP id
 u28-20020a2ea17c000000b0021126b5cca2so4226955ljl.19
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 03:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1lQZ2TW8TNK2thcDuVmU0UKGgRdlQUfKTNcFYQ2+bY0=;
 b=AR7i8bjgTdPwW+/he0pBw1wSgke43j+U9jyqfXaV5On9Z+O6R2M2DhQuayQVMvHyxP
 k9tDJasnF6GZq3s2hao4/43oDnHS4YOhKThflccGh0zqNFNFqEp2vgblnJg1PtzxoS9l
 wWujyAlBwnY0MS0IG+rv1/c7JtrhPDyGF3DOs1AkpfyzEn/caDzVasnpLIjcfMoVPb/8
 kbAS59i07q1HvLvRL683j2/5NdEgE1CMadpPO0KETaHZrz0tPhuedav+/zFmBWA0lIll
 ZUzP6gN0AYaOiYib0Q1MOZzi1Ik5nrDiZEhN+schMLSCFr1KjPfw72ViYbIhDM57DdyE
 0UCw==
X-Gm-Message-State: AOAM530NYZO50dmrbGMJ2vdcquIg9FSK1Tc3dHjlfl3A4Foq7gwsYVhw
 k5O1PKup+Stt6WM7OHnyRiBbeWUl3KXxs45AyIWgpJzByGFgAirBtIwwnRf1oAsIRjkB0TpUXZE
 vXbKZOd9nuJm6S4EYddj0IE2DP6Egz+IInjKGj3vFKBI=
X-Received: by 2002:a05:6512:3f2:: with SMTP id
 n18mr5810327lfq.646.1637061072248; 
 Tue, 16 Nov 2021 03:11:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl1qT20gjCKhmll8gsTUY3IyV/g1PKCe5fjVwz+LIGyWqxXMdDjQm+955DJ+O3odXNwgS4KQ==
X-Received: by 2002:a05:6512:3f2:: with SMTP id
 n18mr5810291lfq.646.1637061072055; 
 Tue, 16 Nov 2021 03:11:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 h14sm1724427lfu.195.2021.11.16.03.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:11:11 -0800 (PST)
Message-ID: <0b8ea25e-eb53-f5ba-0707-c121e90348a0@canonical.com>
Date: Tue, 16 Nov 2021 12:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 0/7] Add SPI Multi I/O Bus Controller support for RZ/G2L
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a8b126e6-62e7-7979-01cb-b7a1ce4ae8d1@canonical.com>
 <CA+V-a8t=JsMJ=w9dDpeUfdTUwFhnHrZ-eWdpTmvOxC0uvOz4Wg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CA+V-a8t=JsMJ=w9dDpeUfdTUwFhnHrZ-eWdpTmvOxC0uvOz4Wg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_031115_024495_26926FC7 
X-CRM114-Status: GOOD (  19.06  )
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

On 16/11/2021 11:40, Lad, Prabhakar wrote:
> Hi Krzysztof,
> 
> On Tue, Nov 16, 2021 at 10:33 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 25/10/2021 22:56, Lad Prabhakar wrote:
>>> Hi All,
>>>
>>> This patch series adds a couple of fixes for rpc-if driver and
>>> adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
>>> is identical to the RPC-IF block found on R-Car Gen3 SoC's.
>>>
>>> Cheers,
>>> Prabhakar
>>>
>>> Changes for v2:
>>> * Rebased the patches on linux-next
>>> * Split patch 5 from v1
>>> * Included RB tags
>>> * Fixed review comments pointed by Wolfram
>>>
>>> v1:
>>> https://patchwork.kernel.org/project/linux-renesas-soc/cover/
>>> 20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>>>
>>> Lad Prabhakar (7):
>>>   dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
>>>   dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
>>>   spi: spi-rpc-if: Check return value of rpcif_sw_init()
>>>   mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
>>>   memory: renesas-rpc-if: Return error in case devm_ioremap_resource()
>>>     fails
>>>   memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
>>>   memory: renesas-rpc-if: Add support for RZ/G2L
>>>
>>
>> Applied parts 1, 2, 5 and 6. I think 7 is going to have a new version
>> due to Wolfram's comments?
>>
> Thank you for queuing up the patches, wrt patch 7/7 this can also be
> picked up, after the internal discussion it was clear that we cannot
> use the R-car hw manual for RZ/G2L (we will have to live with magic
> values). Wolfram has agreed on this and has already Acked patch 7/7.
> 

OK, applied now. Thanks!


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
