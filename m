Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D37C54E41
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GavycemnHnFD0iQ6a6eBiYYJR4ekwuOWgsH1JnFPII=; b=k0COH52XkYi/I0
	4JsUhlL/PHpzSmE4EPrrmlZXv6soeT5sAODEcK3uckVrG1YvTDgaVzdnR6i2f60jhWsIHJ0uBrlj1
	bkQVjolNmthywc4n/tJgBMDJ0Gq+lu8hkv1iP/Xs72Ys/2AJ8HEsqTySUVActdSYpgC8b0Vj3C4GV
	+3HtEtjV4pYTE9XD0saUE5iIn+Lj8JF6qbjhIKE1iVgoaihrrWmSUww4UWyawiU9WLZ3JSW6Jl0fA
	wtpXeBYnCIHAPiNXHNhhifuOvkJhNaZUVrpkk5r7LbSsapcdSBmPxWpISxYrrYdEGVzq0YY2Xv8fJ
	Hg/k1zVm1GZndsxr6Kng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhu7N-000000010Sp-29xH;
	Wed, 06 Mar 2024 16:27:45 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhu7L-000000010S3-0BV8
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 16:27:44 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-51325c38d10so1007178e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2024 08:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709742461; x=1710347261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAZMCH8J07QiijNq8o/NNBXhy5JhnjDlTuZhK1cgvds=;
        b=eWH1cGi6gHlsnYN8fBLIr7gVMBshtnPfQT6LM8AIaT2NH3XyzM8i2oigmjPrhAby/O
         UsohtNMc2WbtN02+TGZb+1mJbuUfBtvNoOqZrEg1+DDX/swcdsc9v3qWdDcvRIdunbh7
         3uavBpQKHDmNd9+KafxmBGQ2NDfj+kgloJqHbPFYedGNsHVHzV8WwkFfQIWw604OURLL
         KAmK82nQB4sL7PoTFBsrla7l4hlQijHE2DXGeBIze/8yBLa/eYtdDqgK06bEv0gWD/+t
         GftEa6lOXGsw6FAgelyrDe98a64jF8IzizVQvfgIoiZg806GDXDW9yJ76KREZnOO00mk
         K+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742461; x=1710347261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAZMCH8J07QiijNq8o/NNBXhy5JhnjDlTuZhK1cgvds=;
        b=q2LRws5EAr27yE7zHbOodzxJNh+tMasv9zrqQiOh9apuWEZnceufG6s3oSnBziS0iW
         xXGlovCQ9Cr4CLMiUmJWoyZNaUChNzOnUYozemhuVmbqcpJyLaHGUGbM+V2SPIj/1Ic0
         6/bNvnkxp7m5cmNc5xW/KnQStKJtC4DX0lFroU1K+wP5rOs3fNbAs2mNM6OCOS3FXosJ
         LcrLZcSJRlpb25V7bT1+bgBDMzE+md422l5PVunh+bfCqaq639aoyQ0bqOt4LuytLEFA
         XOVB8vwzfvrX3RYvmwi87Zd8fC+MC/jwVgpdRqtATNxpqbsPCSV7WsG7qqyguGS8Z8Ly
         exFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoSK78YDuvmHCXT2cNT+wBw21dun3nxEcj0Ilji+dsug/pL9cY5JuzsB/BOC62TNIQ0GH0kYmnzC5lBicVTlfK+gy7e7HoX9p5Z0adew==
X-Gm-Message-State: AOJu0YwZaOCEm2K0dFfY+IYXEDa5eRdsjvG72eq8rxSeZpk+vWkx2apR
	hecxlnkV2rccbGug5Q3zLX5bluBsZk/SsGZ29BLbhkOeQLhZvAYrBrWIVJkGxjE=
X-Google-Smtp-Source: AGHT+IHFSt5jWo2bCyn5EXHjWo85KHHEtu2g3w+sAhUaXX7yL60kB98Uk0rzf0XF8spju2KcgjvxlQ==
X-Received: by 2002:a05:6512:ba5:b0:513:5bbe:7b29 with SMTP id b37-20020a0565120ba500b005135bbe7b29mr1708191lfv.1.1709742461054;
        Wed, 06 Mar 2024 08:27:41 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id u25-20020a196a19000000b00513588ac414sm561395lfu.161.2024.03.06.08.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:27:40 -0800 (PST)
Message-ID: <19176685-898b-4aeb-b819-fec54a126233@linaro.org>
Date: Wed, 6 Mar 2024 17:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-4-quic_mdalam@quicinc.com>
 <d1c80d3f-3b70-4630-8f7d-b00983b487dd@linaro.org>
 <f5177fad-214f-1b60-46ba-1dc0a4fb059e@quicinc.com>
 <3e544d37-b1d2-9c58-3130-9e6950430671@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3e544d37-b1d2-9c58-3130-9e6950430671@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_082743_151658_5286E0F8 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAzLzYvMjQgMDc6MDEsIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4gS29ucmFkLAo+IAo+IE9u
IDIvMjAvMjAyNCA1OjQ0IFBNLCBNZCBTYWRyZSBBbGFtIHdyb3RlOgo+Pj4+ICvCoMKgwqAgZWNj
X2NmZy0+Y2ZnMCA9IChjd3BlcnBhZ2UgLSAxKSA8PCBDV19QRVJfUEFHRQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBlY2NfY2ZnLT5jd19kYXRhIDw8IFVEX1NJWkVfQllU
RVMKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSA8PCBESVNBQkxFX1NU
QVRVU19BRlRFUl9XUklURQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAz
IDw8IE5VTV9BRERSX0NZQ0xFUwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCBlY2NfY2ZnLT5lY2NfYnl0ZXNfaHcgPDwgRUNDX1BBUklUWV9TSVpFX0JZVEVTX1JTCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDAgPDwgU1RBVFVTX0JGUl9SRUFECj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgPDwgU0VUX1JEX01PREVfQUZU
RVJfU1RBVFVTCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGVjY19jZmct
PnNwYXJlX2J5dGVzIDw8IFNQQVJFX1NJWkVfQllURVM7Cj4+Pgo+Pj4gTGV0IG1lIGludHJvZHVj
ZSB5b3UgdG8gRklFTERfUFJFUC9HRVQgYW5kIEdFTk1BU0soKS4uIE1hbnkgYXNzaWdubWVudHMK
Pj4+IGluIHRoaXMgZmlsZSBjb3VsZCB1c2UgdGhlc2UuCj4+Cj4+IMKgwqBPawo+IAo+IFdoaWxl
IGRvaW5nIHRoZSBjaGFuZ2UgaSByZWFsaXplZCB0aGF0IGl0IHdpbGwgaW1wYWN0IHJhdyBuYW5k
IGRyaXZlciBhcyB3ZWxsLgo+IFNoYWxsIEkgcG9zdCB0aGlzIGNoYW5nZSBhcyBzZXBhcmF0ZSBw
YXRjaC4gSXMgdGhpcyBvaz8gUGxlYXNlIGxldCBtZSBrbm93LgoKT25lIHBhdGNoIHBlciBmaWxl
L3RvcGljLCB5ZXMsIHBsZWFzZQoKS29ucmFkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
