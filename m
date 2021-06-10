Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC41C48BD1
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 21:13:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A06D613E9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 21:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A06D613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uktkzZBJj5rK+Ln9+Q9K54mI3sgPN32IqaTFEcVx6pA=; b=shV3iJNgzIhXy3DdpDn22MOnpV
	R7ivCVOq8fv2aj7Xgxi2ASZ5ESL1Ac0Yu7tNe5MeXnNtktcZPkLGCd62vyEulTufQDrD0a2Ac5hg5
	ZyL4RoZkoJL4fO06bSvkuLQUYe28t/bPo0Y4DiYL1azxOfDH8GSFXp6p4myBdm0W89/9hG1XyTN/W
	JZXiFcBeQI75bprbWwldzV5rbY3kep4eW/zcI9Mm3aKrEWU+LmyJPGbvthSWeph8eatVvCeloMMD4
	sgLvDlbYQKOvbGagb8bEjAG917tNzVjNcY6pvhEY8JFivoUSUc1Nz0kREggs+NJcspwQ5l0R/BNqi
	wbUfqUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrRyo-002WSV-3F; Thu, 10 Jun 2021 21:12:46 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrRyM-002WGh-94
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 21:12:19 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrRyK-0006Oq-GV
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 21:12:16 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 e11-20020a056000178bb0290119c11bd29eso1559794wrg.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2021 14:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DYrEI1CPfZmySk6cY9J0ohXCN4+Mz5LA/y5DlhALlNg=;
 b=AUr/VWm4vW8PP5cGHesW3n64HdodJBoh8nyd/MzwUIHtc9IhB7k+Rw5qa3cDn9FEWN
 +vy+yfou/KsZxyO4RwrlqOmyAItmnioih/o3lEdcJ2+tzVbelaHwQdkS8rBArRqbFiL5
 cpIhOm/t4LrcgijgaD4VF59r2sRuLK3NNfKiejpi4OXvhZQuuUTTIiGPoncpF8qKsRcH
 7XgcUB78xqzoDmHgQoXsBGrfZXCT/k3rYSr1eXSws3JUPhbcWY8xpR2k24NNS20PchK7
 VPNg8m4XpzEH4SG2Ei6aOSquzyWv0xf0rc8iQXc617O2skpUzgOGWec4P4M3e8KYTJD/
 6gkA==
X-Gm-Message-State: AOAM531NhFGXKpIZ8FXi8WfBZeTlJonm8JIJsANP3NpbnAV8Nd8EsRJq
 dOAqUH7axsN3GFVnFlhJ81/0/kuBG7y5IzqzAkF7tCOcnTOWa+Ie+jEzINdKHejoSalWF7cUj9I
 zK80yLI4PCXXLqAnOnhi1IqEOXIk/rIrBmOsEqsmzQIY=
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr419986wri.36.1623359536258;
 Thu, 10 Jun 2021 14:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx688A9cV+dEt1NvDmIjm1lap6cMqZBXZgUyNwhXCx9GAk5LyRDHaiwPttV7/4KtyMfj0W9sQ==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr419956wri.36.1623359535971;
 Thu, 10 Jun 2021 14:12:15 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id t66sm4005724wma.41.2021.06.10.14.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 14:12:13 -0700 (PDT)
Subject: Re: [PATCH v23 08/18] dt-binding: memory: pl353-smc: Enhance the
 description of the reg property
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-9-miquel.raynal@bootlin.com>
 <20210610155345.GA1873816@robh.at.kernel.org> <20210610180107.1cc889f3@xps13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <76a94eb1-170a-307d-e1ce-1080a7af6a0a@canonical.com>
Date: Thu, 10 Jun 2021 23:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610180107.1cc889f3@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_141218_344446_51A8F998 
X-CRM114-Status: GOOD (  20.15  )
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

On 10/06/2021 18:01, Miquel Raynal wrote:
> Hi Rob, Krzysztof,
> 
> Rob Herring <robh@kernel.org> wrote on Thu, 10 Jun 2021 10:53:45 -0500:
> 
>> On Thu, Jun 10, 2021 at 10:20:30AM +0200, Miquel Raynal wrote:
>>> The SMC bus controller features several register sets. The one pointed
>>> by the reg property is for the SMC configuration (impacts the
>>> sub-controllers configuration), while the others are meant to be used to
>>> send regular cycles on the memory bus (eg. CMD, ADDR, DATA for a NAND
>>> device). Detail this a little bit for the sake of clarity.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  .../devicetree/bindings/memory-controllers/pl353-smc.txt       | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>> index ecd46856f139..ba6a5426f62b 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>> @@ -5,7 +5,8 @@ of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
>>>  
>>>  Required properties:
>>>  - compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
>>> -- reg			: Controller registers map and length.
>>> +- reg			: SMC controller and sub-controllers configuration
>>> +			  registers.  
>>
>> I think you could just drop this patch. Otherwise, this doesn't match 
>> what's now in the yaml file.
> 
> Fine.
> 
> Krzysztof, if it's still time you can just take patch 9 which Rob
> just acked and forget about this one. I think we'll be good. Otherwise
> that will be for the next MW ;)

I skipped this one but took dtschema (9/18) so it should be in
tomorrow's linux-next.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
