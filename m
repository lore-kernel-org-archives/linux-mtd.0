Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE78D35662
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnUgMVpFcHaSCR2i8n9vkbmyqzkIxA/uyrm86Rk4/Iw=; b=dUDsYnrRg79uqi
	mBmhZEGtKcVAMhYQEni6IjYu4J7VKG4LcLz+oIy09JXsqmhZPb1xw9JDG2RPFxRvfBimZiMM4W/qF
	GiipY7NWOgCxU31m6fHfcDVpwLkIdjUL5JUgekjxDBwkbWYymoIgQ6Ejlik+d7f1YT88WwGMgf6O3
	xn7LGkR+bm5jwyI8pJKfpcFs/DPQODrsEkU3no5id2+s8+BCZr1a8rP5ki+2xRZ5DV59taA2bNIz/
	iieKNuwXrCkTqJFwo6DwXe75ppi/z4MACC/WQ2JzejLiFkMb/YO7YH2GokTV9u8t//uEziHS8wmnj
	uxmWBhKVuZynV9ihrktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0QE-0000000Fcay-2POY;
	Wed, 28 Jan 2026 07:57:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0QC-0000000Fcad-3SZ8
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 07:57:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0834769f0so43353125ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2026 23:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769587023; x=1770191823; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3u2MzCpVX36oZ3vWzsYnd96x6eghsy01E0RtbVLfR8=;
        b=YfChYnYhKDOo5eBS2rvMJoWrMmOx4dlFXi0DptqHgeKhjcX7noTe3Jg0vbZX20xwCZ
         gK646U7Imxh8v85XY+2/Rwh8dCyCiuz6FicmGHugjUw2hkta33G2GuqTNFhfOF5dW9yl
         /nN6amiC9xgkds+nYGAc1NfL5wf9GQzggeccBRFqeMUjdaUhCdjF5FG84TKhhFL6Xh/o
         2nrNbxFnylhLJYpbJtsV7uuYsxZ44xWlh1myWmQeL1oFyiczeE7dlLoyfJE9V7iyyqEJ
         nsSq3YyxMAjWchlPbJTjKSu28Ot7hTsQM96UpFLVXGUFqT+QfUZSp8iXwTVoF5LSWUKB
         43eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769587023; x=1770191823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3u2MzCpVX36oZ3vWzsYnd96x6eghsy01E0RtbVLfR8=;
        b=qC9Isu/lMnKNUh7X0mbaQQUG9GxFIgF5rgQgIJ0nC0twO/fj8kmK9gjx3vF8d/XkMD
         fdz9AuAtYL99aKUWgMc3hRRbLIn1uCDv17vlpYhd4Woe05jjiaYKAk8L4d3fyQPR27b8
         /MgM4EbYUUD240yVPRpqRRe9ZbkTbMLCszfLcYa23kpTsXAn3mKlxpx3G3+qb1ykobFL
         7a4sNSJDtAsU/FKkcXWhzlOQKDnJh5yrb17sacHmxQ8l6TZSaP9Lv/Ji04jC5l4BlsCX
         xveXfbP0ZrCqdSNleIpt3QdvCeAcoRwsROkF1OhtL3eUdhKTbqCa8EYgWWyrX9toX354
         nhFA==
X-Forwarded-Encrypted: i=1; AJvYcCVwP+ANvH7ySMime/6svQr1kkQvfXRG3vlLEbwMkH1TLIM3tgt3JZ+7tdjUwqFhNeQTXha+DZ5TvcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcgwFo0+Zgn38vi4WQ49g+oJwoVs6ZAXL4rXfqVP0kQ+UBbyBf
	NXXnjWYXuiDR3XxRonAqHBBBT9t0l9KhRXZVysYjyTBGVriuTMsvjvQV
X-Gm-Gg: AZuq6aJEM9FPURkEXQLE3nj0WbDr94+cNuLYim1UIMbwufKhQRDysAzw4l7df9WDzob
	aaIua0tqyj0P/quJGf/KnHHQ4xnSMpAwH8M06gZmitOfqXNtTPLNNdztQgQQdBbUlvAyDrsn76w
	JrZYP5IIY/DE/BiaZJyC/ejZoysV8/FWj5swmf65WvVgqfQyHddVmKr0apbXjhhHxCm39Gw2as8
	utcxR0AWMX6pzKsFQtY7p6/xWsuJFxpTNfMp34Q6NPktgbmLw0e8UtHrXz6SrbB6y90k1pN/spx
	KEYbn6nCbrAj3In3b18OWI81Z2paFO6JxS9vC66H3RpxN8SoiE8C6XP3cMMpOMrS0SybHY4cPAh
	0Vnt3JaSULtaGqE5C4l4TpO79iLunVPbJcTO7oUT0AncfHM5/d3cbJSG1xdHFEvWC5StSnmH8/v
	+bczRtDZKHX1PrmKnKn2rREeZ2WJPv4Sf2yDTpunxGi/sHuGGcwG1nzkdXbxpegordyw==
X-Received: by 2002:a17:903:3d05:b0:2a7:9b6e:33df with SMTP id d9443c01a7336-2a870dd5732mr51694565ad.35.1769587023240;
        Tue, 27 Jan 2026 23:57:03 -0800 (PST)
Received: from ?IPV6:2401:4900:88cc:7d63:fcd9:6ef6:26f:677? ([2401:4900:88cc:7d63:fcd9:6ef6:26f:677])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413c1asm14222915ad.28.2026.01.27.23.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 23:57:02 -0800 (PST)
Message-ID: <6eb5bb46-9c67-4cd2-87b0-511b792f9bbd@gmail.com>
Date: Wed, 28 Jan 2026 13:26:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: mxic,multi-itfc-v009-nand-controller:
 convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com>
 <20260127161850.GA1968054-robh@kernel.org>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260127161850.GA1968054-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_235704_872871_00B3630E 
X-CRM114-Status: GOOD (  16.92  )
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


On 27-01-2026 21:48, Rob Herring wrote:
> On Mon, Jan 26, 2026 at 11:09:20AM +0000, Akhila YS wrote:
>> Convert Macronix Raw NAND Controller Device Tree binding to DT Schema.
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>  .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 79 ++++++++++++++++++++++
>>  .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
>>  2 files changed, 79 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
>> new file mode 100644
>> index 000000000000..97baac8b405a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/mxic,multi-itfc-v009-nand-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Macronix Raw NAND Controller
>> +
>> +maintainers:
>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>> +  - Richard Weinberger <richard@nod.at>
> Should be someone with the h/w. Perhaps the driver author Mason Yang 
> <masonccyang@mxic.com.tw>.


Sure.

>
> Though the driver has zero driver specific changes since added in 2019 
> and there are no .dts files using it. Maybe it is unused and should be 
> dropped instead.
>
> But otherwise, the schema looks good.


Thanks for the review.


>
> Rob

-- 
Best Regards,
Akhila.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
