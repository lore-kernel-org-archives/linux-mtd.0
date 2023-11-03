Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C5C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqF93KZDjb5N+ofMWdqC/fVwTTmS6JW2dv6Zkls3+K8=; b=1oO92rExzVWJXn
	44O6KzT2r2fsK3QYRVWKLK8uofkkGY3kaufx3BXN5c1l/JxxK6T9MrgDyJP8WEXn7kWV8TP800JD4
	B57vh/gQjH3Nlfl2rjFGUCHFQa7OgzIZ0EuWdf2Cgznw/JHFCmABZDKwTBDQT4VE59AjJ/FCgsT0Q
	t70G6Rii9HJXBUO3ltlFk6ydbofRPCDLNI6szIHXTWXW7JYVcLbZC3gwlvluY+xpIF1BY4Mk24yEK
	jg2Yscm0gsVfVVHsv2nl8XaIajAKFZ9EU9vS+KuFQeTSBLNxeQLluqkvQpcEpiBpO73UbuAkhzOal
	xOP06RZmnaHVTmMo6WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysyk-00BNWm-0v;
	Fri, 03 Nov 2023 12:08:46 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysyf-00BNVr-0D
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 12:08:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so3309195a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 05:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699013316; x=1699618116; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQUXSSXDWf9O1ssKwFXZ1JWlwQ9YDFgCPxScbGwQ65A=;
        b=pR7nwiG89ZdefRoEkZHWcngk47NE88ZkSvS2krDPm+ucIvoJDE5SZG6uzi/3YLPSV0
         3SIwoG+0VUdoWtaChRHnhxyPumQEQBRHg8B1gADwWUUR3WoDV/d++cKEKOhHk4fqAeBJ
         yEcSHld1qlNMdRDZPWQ3Lm+/JWu9ii5LUSxt13uabysbZSPi1O4caYJkB1500j23c2/W
         Z63HzjZujZ6WwIu++o4+I3R3a3ExlG3J4YQBqwASVvKpvOssgCsCa8wz9MQ7QoR96fCY
         rwsPvbmPafec93iqkSr21lnAfdzahvRgtl66DfVYxc7sdD2e7cknOKuaFOSjchW6goky
         OSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699013316; x=1699618116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQUXSSXDWf9O1ssKwFXZ1JWlwQ9YDFgCPxScbGwQ65A=;
        b=tOajSEYjKFjv83vBrv7xbINhSHqOnl2PXTkmf8YmRxdZYaFi6YlhYgJw/gR1ZU1zcJ
         XVNUabVCNOMlGIlx9N1qdr6RWT0mLhlaH0POtiHZ9sNh/4KhaFhCjgp5sAGBAkZKFsMR
         BFL7AEx+Fry1zyH9b57vy6T/+Jm0Kff14x3C+4jswIIDAyCnTaKX8gI3TytaW5p+vuvu
         FoELsw0JnQSRaH2q9PGm/kg+VByGahp09iEYFsa+/VTuoriWgayzcX0FZ/HL+lRqUwBy
         6e8Elsh8I7dgdssqeHkQEOrBnmRmH0CinetgarahLrP5iusZ4WYDsvGbH7Q80YupUtQe
         reIw==
X-Gm-Message-State: AOJu0Yw2eblrNxVdHByjrRZ+BorhgmI65jh9hV4USyDch6Lo5Q+Ixgir
	XTyoL6KncDQm7WXUyFfeFRdEPg==
X-Google-Smtp-Source: AGHT+IH6djsJrEYQK9Zg+RHUpk3YjucMP/0VonD9TrvobbOjOy7gyX14XNAE1shLFUaXCWxOEp3D8A==
X-Received: by 2002:a17:906:fd8a:b0:9d3:8d1e:ceb with SMTP id xa10-20020a170906fd8a00b009d38d1e0cebmr6865065ejb.23.1699013316570;
        Fri, 03 Nov 2023 05:08:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906251200b0099e12a49c8fsm836659ejb.173.2023.11.03.05.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 05:08:36 -0700 (PDT)
Message-ID: <38db75d7-7d8a-44df-944e-3eca9c11ab00@linaro.org>
Date: Fri, 3 Nov 2023 13:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] mtd: nand: ecc-qcom: Add support for ECC Engine
 Driver
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, quic_srichara@quicinc.com, qpic_varada@quicinc.com
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-2-quic_mdalam@quicinc.com>
 <20231031162856.1d9e3246@xps-13>
 <02a67a6d-30fd-4b15-349d-1cd8afab13ca@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <02a67a6d-30fd-4b15-349d-1cd8afab13ca@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_050841_130278_67DF5F98 
X-CRM114-Status: UNSURE (   8.96  )
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

On 03/11/2023 13:06, Md Sadre Alam wrote:
> 
> 
> On 10/31/2023 8:58 PM, Miquel Raynal wrote:
>> Hi,
>>
>> quic_mdalam@quicinc.com wrote on Tue, 31 Oct 2023 17:33:03 +0530:
>>
>> Commit log is missing.
> 
> Having a separate device node for ECC was NAK-ed
> https://www.spinics.net/lists/linux-arm-msm/msg177596.html

It was NAKed because it was not ready for submission. Please perform
internal review, which will fix such trivial issues, before posting on
mailing lists.

Since you did not post any bindings, we could not have even discussion
whether this is acceptable or not...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
