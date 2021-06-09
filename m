Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44ABC48BD1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 16:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784BA610A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 16:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784BA610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K7Y65O4a+nYJVXdnOfiw4iJnWRroNRMeDLnOkmUSotU=; b=Jep4cUWSLU4BQ2RuPIAV3ckJYY
	s1awBM+Iu0u2kpY1mm/IxAJAan3nqFzr6VVAEoGqI7DK3CWI4Y8PN8yZmTIYKXzUh6tY3zoTGLim6
	AAJwAUVor9iC2gUarri8JLIHjckuxRfwojEE9f6JSx9e9XnU3jCXOE3RSrXWx5MwuopxYljqhN1GM
	TjjUcrl/vh6OqZajCUEJ3bmb2stTd0KObQ0QOWSmnrGoEJ2Tn9aK+R0JbEHhEZn9B5wCatyAFAYav
	iSjJ1gl0KYi8hO7C9khPRtGztPinqEnsDbVxoaaYzw2FlY7JWFQCt4vWiJQJ9DR7Cr2O79VvY1rfx
	BypRgTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr1FG-00Eznv-O6; Wed, 09 Jun 2021 16:39:59 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr06U-00EaZf-1g
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 15:26:51 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lr06P-0000IX-Mu
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 15:26:45 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 f186-20020a1c1fc30000b02901aaa08ad8f4so2654287wmf.8
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 08:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uc80ffGUW4bvL26aSzQf5lcnkR5pCyi0tKOquETfeS4=;
 b=KhiovZ+wZqR95xGyxXRxkya30ybaj270vtwMuRQmHJSCbfaB7MPEXkFVAeHbJTn7Qe
 cOYCx0fTiXH/iZWpQEhKtAM2bj/FtRRxW+/nQSmpGdHU94VKOcjcbTPHyVPvSy0BQ707
 J29ceI4wYNZiF8RrnIqNQZVrlNAiro1RXCl17frdMgWt8zpHESb9IItffBCYeYWzMQP0
 /e7VIqRfm37wHolPUiNbqEkv9kiSXZ7tjIDDC5DUXR8tnXa97J9GhwylE0+ndWw/Attf
 UeLAcDku2o1lI7sb79loU+hpNXmzd9guEQTFT/StmSy7CuhgDsyrh1KzW13S0feQYz1B
 CIjA==
X-Gm-Message-State: AOAM530+X6EV1diKSc76Ekflf5oUOd7lr/rhxSiL96gz7n1vmUWeg8Dg
 IVT++U0mS/sCuE6D0FsoovYC0QXnuriovzAYj5fKjiivIUdNuj5NNvCMGVjunYbR0YS3148nelb
 jIkdE9GygrkIfbIu0AxrMmG1CYs0M2chZnGReUocVgk8=
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr424023wro.164.1623252405365; 
 Wed, 09 Jun 2021 08:26:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhA14PyEmBvm9o5LBw9p40ein5C/0++XCyNMvnaDvIOg27HB9rKWvzvpDI5U68qhBmz6kV4A==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr423998wro.164.1623252405214; 
 Wed, 09 Jun 2021 08:26:45 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id k42sm7937283wms.0.2021.06.09.08.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 08:26:44 -0700 (PDT)
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
 <e431d594-05cd-27b8-fcbe-11c310b99cd3@canonical.com>
 <20210609153410.53eadf8e@xps13>
 <77db74d3-c44a-6aa3-1b61-f6bed565fa04@canonical.com>
 <20210609161128.16cdf5ec@xps13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <32c7adf2-6f4e-ef2d-a137-a9674f9e6baa@canonical.com>
Date: Wed, 9 Jun 2021 17:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609161128.16cdf5ec@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_082650_153380_F8DCC953 
X-CRM114-Status: GOOD (  18.46  )
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

On 09/06/2021 16:11, Miquel Raynal wrote:
> Hi Krzysztof, Rob,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> Jun 2021 15:54:19 +0200:
> 
>> On 09/06/2021 15:34, Miquel Raynal wrote:
>>> Hi Krzysztof,
>>>
>>> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
>>> Jun 2021 14:12:40 +0200:
>>>   
>>>> On 09/06/2021 10:01, Miquel Raynal wrote:  
>>>>> Convert this binding file to yaml schema.
>>>>>
>>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>> ---
>>>>>  .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
>>>>>  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
>>>>>  2 files changed, 133 insertions(+), 45 deletions(-)
>>>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>>>>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..1de6f87d4986
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>>>>> @@ -0,0 +1,133 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/memory-controllers/arm,pl353-smc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: ARM PL353 Static Memory Controller (SMC) device-tree bindings
>>>>> +
>>>>> +maintainers:
>>>>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>>>>> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
>>>>> +
>>>>> +description:
>>>>> +  The PL353 Static Memory Controller is a bus where you can connect two kinds
>>>>> +  of memory interfaces, which are NAND and memory mapped interfaces (such as
>>>>> +  SRAM or NOR).
>>>>> +
>>>>> +# We need a select here so we don't match all nodes with 'arm,primecell'
>>>>> +select:
>>>>> +  properties:
>>>>> +    compatible:
>>>>> +      contains:
>>>>> +        enum:
>>>>> +          - arm,pl353-smc-r2p1    
>>>>
>>>> That's a const... but also I don't get the need for select.  
>>>
>>> I think this is needed to ensure this binding is not enforced against
>>> arm,primecell compatible nodes which are not featuring the
>>> arm,pl353-smc-r2p1 compatible.  
>>
>> Which seems to be result of unusual compatible match, so once you
>> convert to regular match, this select is not needed.
> 
> I don't think so, I received a hint from Rob some time ago, he told
> me to add this additional select line as in all other arm,primecell
> binding.
> 
> Rob, any additional info regarding this?

Hmm, I think you' are right. Since arm,primecell is used in many other
compatibles (including ones without schema yet), the select is needed.

In such case the select can be only:

select:
  properties:
    compatible:
      contains:
        const: arm,pl353-smc-r2p1


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
