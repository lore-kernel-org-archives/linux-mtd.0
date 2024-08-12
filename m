Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA07C52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01XwdgCSHFgncGy7t7rEeDBmPwsrarzX2k6Gsr1kerc=; b=MV1Ik9zuezBtDP
	qkiOVj+JB5pE4onj0yiSv9oeilTBLhGAHv0D745/7QgpbDbIPrrd5T5wvf0jbyJJN5HPOccBOFaen
	EL/6gyzCaWqavDO8hr3d8r+3QV13yQbN2DInc74XEM9H8padzRr1ADg5q7EhlHqWsK2rm+BVA0Uuh
	VIw/F4oB/HViwbcMGk8KXaAzF0DFjeAwXL8qkuNYbtznQZUMWuZsQAXk88dwtIIZC5kGlWzvDheVr
	gVzizUCmZBJqsmimNf8hJWhTobqlbpSUP376fS/0Kgv60VPZx9K8vLjJPBaFyMLOBcx+KSCb93d7o
	OyPtCi0Zlfn0t6l+z5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRXc-0000000HUIy-3EVJ;
	Mon, 12 Aug 2024 09:40:40 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRX1-0000000HU5q-0fYR;
	Mon, 12 Aug 2024 09:40:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7aa7703cf08so2871600a12.2;
        Mon, 12 Aug 2024 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723455602; x=1724060402; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OztDY7ZPfTGf5Muvo37QHTCCUOwm+trCdPseFsE1yRA=;
        b=muCqaSkH5RQor47vxb8XWGzL4SMOOa+P7trU90Y64/7W57rIVe+BKZLZGfrPQZHZdR
         5gHXI5fCfrLH0UE/h2RNHuHyyCRCjPyVjs/897J773jFFdUDSV2DFum5OkIBFWzVkwVs
         S5lGGneLovXYf8U+l3rRI1sJEPLWIqn0XlsUPduozI6lPvEhRuealiII1PYcJtJ7vk8V
         RY7igU76iQ2gO1y3mxLy4IV2xth+OQ2vEVErU+8b47gz/yu8AC7hRhnjwwi8XB3SI5VA
         fcsD2h87c9QoJcPtSD2F4eeQ2pOCfzmP0LIWyQG/lSAVk1WauwJ84DUmDuOi0Aja5dY0
         g7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723455602; x=1724060402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OztDY7ZPfTGf5Muvo37QHTCCUOwm+trCdPseFsE1yRA=;
        b=rJC4l2XvPDKX0TsGv7rMeHyfgt4TjWxC/Xj+XnLYVuNBw9s6cNaZBcpyKkm1aFdr9o
         /4/3XFCbNC8wURtuj/CAeHeZJqchLmz8DDSPXy/f3DG44p7DONEwiaTXhVUhpfq5o4dY
         Cz+0IqlG0edyShaj2/s0OMEXOknAYL3GmdwFwi6lDRgD0lZxV0gQWMALF8u77mNJzVVg
         ANA+mYZdi/PTSStqGOTCWgKm90qpaxnOULIosqr0uiSZoHN12v4Dx3aljyGOmVxQsTyg
         ExA2ooXfwxcVnJ3UrvLfKdgUCoLVTdfkI5jImliiISSdynRDUr1D5pEUVKJjMsdjk+Ar
         xsOg==
X-Forwarded-Encrypted: i=1; AJvYcCULlAHwOrYE1vsmPKDl7C2xx3PrLMGE6zUVIgfhdMdNNPeCADcUC+hoNlNanTgADqpnj/9diENZMMezgfQ8mKv+llpFr17I5bAF9F93bQ==
X-Gm-Message-State: AOJu0YzwYD35mJ0BA0uCxT7Xm2N/Z4BEC34T0XMCA77J6tZdoAHPWZSB
	W6U/BdkHHl34oYhTM0/d2N/gvG/bq1jMwteVKS6gj9jr8pdZWsXk
X-Google-Smtp-Source: AGHT+IF8GalHrE+IH6YmoY+AWa/Rdr4SG6ZeFor8rn3B92ikuRnTgV5mAn7M3QFJgEWdF8wkCr2t8g==
X-Received: by 2002:a05:6a20:d817:b0:1c4:2134:dd54 with SMTP id adf61e73a8af0-1c8a0137366mr13333355637.45.1723455602341;
        Mon, 12 Aug 2024 02:40:02 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bbb49fb7sm33981255ad.293.2024.08.12.02.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:40:02 -0700 (PDT)
Message-ID: <26c61825-3488-4a9c-9426-b804c1e00b07@gmail.com>
Date: Mon, 12 Aug 2024 17:39:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-2-hpchen0nvt@gmail.com>
 <7a8b9bdf-f4df-4da0-83ca-157175817e99@kernel.org>
 <203578df-11a6-425a-b2be-cc09dae62f8f@gmail.com>
 <1f823600-68c4-418f-b2bf-6d5d64a1ee56@kernel.org>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <1f823600-68c4-418f-b2bf-6d5d64a1ee56@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_024003_225145_7EC8706E 
X-CRM114-Status: GOOD (  10.97  )
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

RGVhciBLcnp5c3p0b2YsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKCk9uIDIwMjQvOC8x
MiDkuIvljYggMDU6MTIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMTIvMDgvMjAy
NCAxMTowMiwgSHVpLVBpbmcgQ2hlbiB3cm90ZToKPj4KPj4+PiArCj4+Pj4gKyAgICAgIG5hbmQt
ZWNjLXN0ZXAtc2l6ZToKPj4+PiArICAgICAgICBlbnVtOiBbNTEyLCAxMDI0XQo+Pj4gTm8gZGVm
YXVsdHM/IFNvIGlzIHRoaXMgcmVxdWlyZWQ/Cj4+IFRoaXMgaXMgcmVxdWlyZWQsIGJ1dCBJIHdp
bGwgYWxzbyBhZGQgYSBkZWZhdWx0Lgo+IElmIHRoaXMgaXMgcmVxdWlyZWQgYW5kIHNob3VsZCBi
ZSBpbiByZXF1aXJlZDogbGlzdC4gRGVmYXVsdCBkb2VzIG5vdAo+IG1ha2Ugc2Vuc2UgdGhlbi4u
LiBpdCBjb250cmFkaWN0cyB0aGUgcG9pbnQgb2YgYmVpbmcgcmVxdWlyZWQuCgpJIHdpbGwgYWRk
IGl0IHRvIHRoZSByZXF1aXJlZCBsaXN0LgoKCgo+Pgo+Pgo+Pj4+ICsKPj4+PiArICAgICAgbmFu
ZC1lY2Mtc3RyZW5ndGg6Cj4+Pj4gKyAgICAgICAgZW51bTogWzgsIDEyLCAyNF0KPj4+IE5vIGRl
ZmF1bHRzPyBTbyBpcyB0aGlzIHJlcXVpcmVkPwo+PiBUaGlzIGlzIHJlcXVpcmVkLCBidXQgSSB3
aWxsIGFsc28gYWRkIGEgZGVmYXVsdC4KPiBEaXR0bwoKSSB3aWxsIGFkZCBpdCB0byB0aGUgcmVx
dWlyZWQgbGlzdC4KCgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpCZXN0IHJlZ2Fy
ZHMsCgpIdWktUGluZyBDaGVuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
