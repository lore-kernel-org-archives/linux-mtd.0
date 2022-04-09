Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E668C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSa3gYTIUfkiqGt28GuzTKH/5hrYffzkpCR6epNdArk=; b=TAaPRS/4kEvJUR
	RfCkeMHnexvAHwx239lTiK3A6Whm9UUU3Lqrp7IUH/zmKUNDxcWJxHL9oSKAGyjfeKB1Nk4Qze8fG
	Imj1BxPqeUE1H+BeeM7jW7wwPbXBIlW7pwdX4QqQzEzpax5bwIfHUCwOngPOs6Dhh5BuDe8IM76da
	XiXO4OZ2nPlPuJc3Ia/BZU6ZoKTuhTZMaqsGPIMzVXvhKxucLjpMW7bwsfAZtGDCs6KU+H0KLCG0B
	vIHguMuTnkmSBd6IjLF/qh6xsK16W0XSD4jVY6hM4NgQ6iTo9FT1LPbPIes5hjAsWA6eiKwrAvM0M
	ixnavAoOUJJnlW+zMI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndAXV-0037xx-8n; Sat, 09 Apr 2022 12:50:05 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndAXS-0037x0-3J
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 12:50:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id u15so3545441ejf.11
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mZ2Ei9Pw71xChRYUdbzHz+g7cxbDuw0G+n2AKi4cwrM=;
 b=fbcRIrQpcbSQPL7/+1JHVXWGoEk4lhGwvpVASn7a9/Tfpu6VnXHYOeVBe4fK8hw3+J
 dxJ9ExO4khrVA0HvVPr+MGAMC/YfMuL5KRfEHRhjtHynycN+4Ahg2P6t2Ds3sGE/CHnC
 HukO24gnPUXM7EKqn4VV22kUJzB2M0UH6oA67FiNT7XpntuTq5MhwVzKLRu2ae8EdLO3
 wcCZnv1xkRJyPFBLlWMQ+QR2EQ0eo7clJ4I/TILzXHBxFFpMrRS2kUTAQYccaRWqGal8
 CPh8ELTgIrg7IXQwsCtYGpzTJzBTtpNVgnKpeN+j+uXXNTE+qo565XQk8XqrI083m8lF
 HRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mZ2Ei9Pw71xChRYUdbzHz+g7cxbDuw0G+n2AKi4cwrM=;
 b=j7j+AZPwsxYLeHDPPUT6y3oEwY9pwx0JQ5A2PkgDUf6ShcQK0eJcnGuRrj+ffT70Kv
 cOkiN8osZAd/p93jhew8FjQsWb06IaqCSRFIacKmHz4sdjTgzgWACBl/GbBlINF8pIUH
 xz9E37cSr4TzkKZq2wWqkbeb+EtOiElx4+wGzIrftSo44OAj1T75EdVlfUuypYL/8biz
 qiuMSzC36bccoEVGsu0vudFauG+4lY7MtIHPyEz7fM+0DtIe+CeqimuAJbFXsg/6TVfF
 bOU72hkSSYUNCKEDnEcKsVMBUWE0fsZrE0ZtPTrRu7ZxeSlDFukGqoSXfXCrEwjnlYFc
 flLg==
X-Gm-Message-State: AOAM530lyHAEKHySTvaZwcCdLP+t106D/uprZbKADPAsJOwqoyOQwGNJ
 /aNff0IOC6RbzeIlSRvd7jwT1Q==
X-Google-Smtp-Source: ABdhPJxMQS6Xs91cG5pLCViSOliYY8Gc+cfaZTEhqJevdonVPQzdQaHXnqHvQ+kKOZbJ4dSdVCca/A==
X-Received: by 2002:a17:907:9724:b0:6e8:4421:c760 with SMTP id
 jg36-20020a170907972400b006e84421c760mr9397722ejc.658.1649508599735; 
 Sat, 09 Apr 2022 05:49:59 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 s10-20020a50daca000000b0041cc361b1c9sm8822949edj.68.2022.04.09.05.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 05:49:59 -0700 (PDT)
Message-ID: <aea5e032-5cd0-7480-13c1-2af924237532@linaro.org>
Date: Sat, 9 Apr 2022 14:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Karim <Karimdplay@gmail.com>, NOGUCHI Hiroshi <drvlabo@gmail.com>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <1649339427.653492.795407.nullmailer@robh.at.kernel.org>
 <9cf4e596-83d7-00cc-afcc-585309cb4852@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9cf4e596-83d7-00cc-afcc-585309cb4852@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_055002_282268_C6003A53 
X-CRM114-Status: GOOD (  14.53  )
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

On 09/04/2022 14:35, Mikhail Zhilkin wrote:
> Hello Rob,
> 
> On 4/7/2022 4:50 PM, Rob Herring wrote:
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
> 
> Thanks for your great explanation how to test! I found and fixed a mistake.

One? Apart of broken compilation, there were other mistakes. When you
run the tests, you will see all of them.

> How I have only one WARNING: 
> "added, moved or deleted file(s), does MAINTAINERS need updating?"
> 
> I hope it doesn't require additional change. What do you think?

This is not related to dt_binding_check. if you ask about checkpatch,
then no, this does not require fixing.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
