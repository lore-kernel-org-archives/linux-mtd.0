Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A63EEE25C
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++wauPHS0gx27oKPrT5EPCwUrZ5J/1fQg5SLgI+RT58=; b=CqqRPAD2XbNAPL
	9W9kZr+MUrhjLLAtHEA9SUvonPiTxLSY7KTBNxEPyW0FBZClV5SZL9Q8IOnAqfziiPS1MWBRuHXVL
	yA4TpVfyDLVQx0eEbOTpW+ihoZZ/3HWfvbL4Tthq/IgKQ2fubyZzJWyXopB6QFkyzd4TZCx8OiSte
	1cT1XzZwafuLxld4erFUzqTkaWDkPaMUKEi37xLxKl6KHstc4uNcoWXvnv0GSkqzfszwuKfuElXRx
	EwghI4nJ1bg83iX9JDfXKTNXOPa1AG0BolRhWlDMqescBWCdF+G6/ImrRC0eH8FDM82FfiITcVdPw
	bK5giBB2XVhcAu3k2ZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcR5-000000084L5-2eO4;
	Fri, 02 Jan 2026 10:31:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcR3-000000084Kg-17DC
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 10:31:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29efd139227so157680925ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 02:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767349868; x=1767954668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TKEBOHU1OTn7j5uqcfYXSCBQDYOd+pIPDRtQ6wvDEbY=;
        b=PqStZEglus2NIK2K3c/CGf/YYs8vQj0I2acEnRCemV1/ETydCRw4C60RPG+9wf5QP/
         f3Ve6B0Jjf0F3rGvA+KJ0OUOViusPaxsLKABeb+0iz6KDBz+1wBYkvCiNsfd36AKmvjp
         M/3zDUmTcBUXMWdq7gmQ28f5ai3/H9jJi6z7bkSARsed5Q4Ovy3RRcj/sa34vBqqA/aJ
         qZo10QZvDRsG2F9ok3rQU1Yd4IB4tsKXSHsfF+DK69Htwkv90BJ6TpB8+X+VeF3ud/+o
         ANaL/LMAECVC+555IA90jv+Wls8Nv2dU7Kgu4ltYY1zCe1Oz2nBSeCkxM4L3x+70kpBx
         y7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767349868; x=1767954668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKEBOHU1OTn7j5uqcfYXSCBQDYOd+pIPDRtQ6wvDEbY=;
        b=h4koAgxP7kesF9FPoX7Uz0ficnqFk7D7iMK9t0S/lBuey95n8aWctc8aMQmQkseRbu
         19WoWL/5hj9QfkkFPZJjV0mpcnrUFMo5sDw3q9Ls/yqGV9pbVp00bGw5zC4Nkg7bdBZh
         7mpLCOmqIuQ2kHZY745EoHbKWzKgkCS1eMLLYEp0HajUdWsvbb9oVkg0bhRxkCP01hqH
         5qdeZd7/a9ucWKRsQ8k3S02xIhZTQMVQQlSO+px/Nj7aqP6hP83jGJPyIv1P++/lZqKR
         FymYY88ATloROGzLdmr04eBnmZJYAh7Nf+SmiI8+V05NgHH+tdxqY0wWjWL9bf8SVRdr
         15yw==
X-Forwarded-Encrypted: i=1; AJvYcCWCpuzWqP6aTt0a9Xh/oTGZlwOQMxVSMn3qhI48qbwoomcTSIDPvcbY9C5397/819L4gbo1i3bVA30=@lists.infradead.org
X-Gm-Message-State: AOJu0YxV/fgj4anIrAateoFNhIzXUCOW+u/3POdFb9+O4KTM8BuIOrf5
	JHhIMigX9G4ZjeDJXCUjydBho/FlN2smQmxndJcPr/GzjsfxTl4mrMwR
X-Gm-Gg: AY/fxX5t7bURuZ1w7y5sGQdbZg3J/zUJkHfxGDUuiKComhVvQbUI0ie+FMSqEKzga0i
	lZ4NTy+UW1nrU5byuT3ndylIivG2KrLE1zoQYdxAsXSErKnOKVH5JDLuY+n2M3vkj++QkrFiAQy
	2TFO/xOUnnDiDbb+U2XaOZevVuF7vUJgERe/Au/P1PvEKxSg4C5Hm5gwI3DovN5i3tJa4WB4z/h
	S6ZnVZBCqMKg89SmXzx90orRL3dJ9I6fksKesghOlTfjmizxRuWR6ClpygQcOMFeV2UCnd0Zzb2
	IqAkyMn9DOiXj+C4koYXkKeammeMr4bwpdb0KFkR4jFAH5TwbLaWbBZwSqJO50GcLwnXdqC6H5u
	qfQytlGSsgjzZPlgJnVuEewWXOuqUWw+2ybXQxs3OX7oK4xjj4n4krgv+7ueKoHix+i/fhWO3tC
	EuEwUMwKaRZ+qk0WCUFIPs2jgQ8pcrCmS4LF07z62KilymrjTZg/SusCZapg9yea5bb3msyJs=
X-Google-Smtp-Source: AGHT+IEpEdWke4q2sIAs7xY6ekNENqiKkIEdw7so/gFmVP+bZpB5dWdqj/1/vSx5XDAA/98HJmjRZA==
X-Received: by 2002:a17:902:e785:b0:2a1:47e:1a34 with SMTP id d9443c01a7336-2a2f1f6a1c4mr412841345ad.0.1767349868080;
        Fri, 02 Jan 2026 02:31:08 -0800 (PST)
Received: from ?IPV6:2401:4900:883b:60a8:c545:bc1e:eac1:a2b4? ([2401:4900:883b:60a8:c545:bc1e:eac1:a2b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm379067495ad.56.2026.01.02.02.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 02:31:07 -0800 (PST)
Message-ID: <dd7fcfb8-a47e-4e3c-9769-714659e002a7@gmail.com>
Date: Fri, 2 Jan 2026 16:01:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229-nxp-v1-1-a415fe0080a8@gmail.com>
 <20251230-kagu-of-scientific-enrichment-6fcd4c@quoll>
 <0363ac61-0872-42da-91b8-78966a2537ce@gmail.com>
 <baa3ff2a-6569-4b36-aed1-651f83fa175b@kernel.org>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <baa3ff2a-6569-4b36-aed1-651f83fa175b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_023109_316233_4F6F328C 
X-CRM114-Status: GOOD (  12.80  )
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


On 02-01-2026 15:48, Krzysztof Kozlowski wrote:
> On 02/01/2026 09:17, Akhila YS wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - microchip,mchp23k256
>>>> +      - microchip,mchp23lcv1024
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 1
>>> Pretty incomplete. Old binding and above cells claim there can be child
>>> nodes, so please add them and test. Works? No. Shall work? Yes... so
>>> either old binding was incorrect or new binding is incomplete. I did not
>>> check the driver, though.
>>
>> Size cells and Address cells are not required as there is no child node
> Then what is the point of address/size cells if you do not have children?
>
> Anyway, read carefully old binding and the driver code.


Yes, I will remove the above cells in the next revision.

>
> Best regards,
> Krzysztof

-- 
Best Regards,
Akhila.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
