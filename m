Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B83EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jun 2023 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G65zMQE7CAjoNyQYSj6UuYJDqM8aVFiG0YnjWBUQj0w=; b=UFOd2Kz8HzaivA
	ppY6hgMJabyvS/EmQtcWV5jxWTDzTBS0XhsIbcKZnJWwTD7YsoXQULcRWPJD2wwxPpifrFbF95mTW
	8GF7ytvovrkCL1oU87n9KHzDHV09NhMCnT4oXSIPrjVEFrYxt3WcbSQptwb9HLn4JzCOao4GFqlng
	GgSJ+yIx4WbGeYgvC7o+eosGjs63cUUev2/CgXfocF+9sCp7sezU09ATMxXr0H/cLsoQPBRvXyVIv
	Ts0FF022LrKNGZuOw7n/R57qOCueYpN+FyT1tLA6O6oyghO9GTvOtVNP+gA96Q81iEqKHfFGJ9ep4
	UkT+sn/Y4ifM1EMuVbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuHL-001VNi-2D;
	Thu, 29 Jun 2023 16:13:55 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuHJ-001VN1-0n;
	Thu, 29 Jun 2023 16:13:54 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-783549ef058so35570539f.2;
        Thu, 29 Jun 2023 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688055230; x=1690647230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFdEMQN79kKvi2kqq2FWX13+T3/lc6iF08TGlcclIMM=;
        b=Wos8kXnv3QKfwQmdc/nBtMKcNcsT1asmAk8ZXCmomc4WvpBENkPJ2ZbSFOm2I5lX2O
         JdUvFJBkDF31FfnVDkDDSL5iWmEtalg/ASrLVuSq+S8UNBu6T2+WfugkMY0U2qCdLetL
         jHXTvoNYleE9X/sg5gWI8qjzytJwui+N5ROJP9US+Gb+To/97ejctnkYQlCWxVgZsAFj
         QmUyU5K4ilOMnXfxFnMV9iMKKWrR31SnGK252yYjJyxH88+p7kVCrX2vd96zquWB4yn2
         nP+k9n0VL53kFQmU32Uws4TPwAphvUlwwAeyBqK7QaE5OzbgbzZjqRvK3VhRXZwrHA13
         grhQ==
X-Gm-Message-State: AC+VfDyqUrayiYTb2gGhs0IyiDN2zXDUI5eRlDU/lTNYLFZYru40Hs/3
	FSsYCd0/O8cxgM0XZ9laJw==
X-Google-Smtp-Source: ACHHUZ7L2K0rZJQWVeqYf2S62Sl0/yPlkbfb3EeaeI4ZoJX8fp5J5T7DRDWdMHB2JIzwO9Yj9chBGQ==
X-Received: by 2002:a5e:c606:0:b0:785:cb8d:f1c5 with SMTP id f6-20020a5ec606000000b00785cb8df1c5mr15334iok.12.1688055230020;
        Thu, 29 Jun 2023 09:13:50 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k5-20020a02cb45000000b0040bbcee6b57sm1708532jap.133.2023.06.29.09.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 09:13:49 -0700 (PDT)
Received: (nullmailer pid 3129978 invoked by uid 1000);
	Thu, 29 Jun 2023 16:13:47 -0000
Date: Thu, 29 Jun 2023 10:13:47 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Christian Marangi <ansuelsmth@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH V4] dt-bindings: nvmem: fixed-cell: add compatible for
 MAC cells
Message-ID: <168805522630.3129899.14135828731809373225.robh@kernel.org>
References: <20230627204630.9476-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230627204630.9476-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_091353_302501_FBA18609 
X-CRM114-Status: GOOD (  21.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIFR1ZSwgMjcgSnVuIDIwMjMgMjI6NDY6MzAgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gQSBsb3Qg
b2YgaG9tZSByb3V0ZXJzIGhhdmUgTlZNRU0gZml4ZWQgY2VsbHMgY29udGFpbmluZyBNQUMgYWRk
cmVzcyB0aGF0Cj4gbmVlZCBzb21lIGZ1cnRoZXIgcHJvY2Vzc2luZy4gSW4gfjk5JSBjYXNlcyBN
QUMgbmVlZHMgdG8gYmU6Cj4gMS4gT3B0aW9uYWxseSBwYXJzZWQgZnJvbSBBU0NJSSBmb3JtYXQK
PiAyLiBJbmNyZWFzZWQgYnkgYSB2ZW5kb3ItcGlja2VkIHZhbHVlCj4gCj4gVGhlcmUgd2FzIGFs
cmVhZHkgYW4gYXR0ZW1wdCB0byBkZXNpZ24gYSBiaW5kaW5nIGZvciB0aGF0IGF0IE5WTUVNCj4g
ZGV2aWNlIGxldmVsIGluIHRoZSBwYXN0LiBJdCB3YXNuJ3QgYWNjZXB0ZWQgdGhvdWdoIGFzIGl0
IGRpZG4ndCByZWFsbHkKPiBmaXQgTlZNRU0gZGV2aWNlIGxheWVyLgo+IAo+IFRoZSBpbnRyb2R1
Y3Rpb24gb2YgTlZNRU0gZml4ZWQtY2VsbHMgbGF5b3V0IHNlZW1zIHRvIGJlIGFuIG9wcG9ydHVu
aXR5Cj4gdG8gcHJvdmlkZSBhIHJlbGV2YW50IGJpbmRpbmcgaW4gYSBjbGVhbiB3YXkuCj4gCj4g
VGhpcyBjb21taXQgYWRkcyBhICpnZW5lcmljKiBjb21wYXRpYmxlIHN0cmluZzogIm1hYy1iYXNl
Ii4gQXMgYWx3YXlzIGl0Cj4gbmVlZHMgdG8gYmUgY2FyZWZ1bGx5IHJldmlld2VkLgo+IAo+IE9w
ZW5XcnQgcHJvamVjdCBjdXJyZW50bHkgc3VwcG9ydHMgfjMwMCBob21lIHJvdXRlcnMgdGhhdCBo
YXZlIE5WTUVNCj4gY2VsbCB3aXRoIGJpbmFyeS1zdG9yZWQgYmFzZSBNQUMuVCBob3NlIGRldmlj
ZXMgYXJlIG1hbnVmYWN0dXJlZCBieQo+IG11bHRpcGxlIHZlbmRvcnMuIFRoZXJlIGFyZSBUUC1M
aW5rIGRldmljZXMgKDc2IG9mIHRoZW0pLCBOZXRnZWFyICgxOSksCj4gRC1MaW5rICgxMSksIE9w
ZW5NZXNoICg5KSwgRW5HZW5pdXMgKDgpLCBHTC5pTmV0ICg4KSwgWlRFICg3KSwKPiBYaWFvbWkg
KDUpLCBVYmlxdWl0aSAoNikgYW5kIG1vcmUuIFRob3NlIGRldmljZXMgZG9uJ3Qgc2hhcmUgYW4K
PiBhcmNoaXRlY3R1cmUgb3IgU29DLgo+IAo+IEFub3RoZXIgMjAwIGRldmljZXMgaGF2ZSBiYXNl
IE1BQyBzdG9yZWQgaW4gYW4gQVNDSUkgZm9ybWF0IChub3QgYWxsCj4gdGhvc2UgZGV2aWNlcyBo
YXZlIGJlZW4gY29udmVydGVkIHRvIERUIHRob3VnaCkuCj4gCj4gSXQgd291bGQgYmUgaW1wcmFj
dGljYWwgdG8gcHJvdmlkZSB1bmlxdWUgImNvbXBhdGlibGUiIHN0cmluZ3MgZm9yIE5WTUVNCj4g
bGF5b3V0cyBvZiBhbGwgdGhvc2UgZGV2aWNlcy4gSXQgc2VlbXMgbGlrZSBhIHZhbGlkIGNhc2Ug
Zm9yIGFsbG93aW5nIGEKPiBnZW5lcmljIGJpbmRpbmcgaW5zdGVhZC4gRXZlbiBpZiB0aGlzIGJp
bmRpbmcgd2lsbCBub3QgYmUgc3VmZmljaWVudCBmb3IKPiBzb21lIGZ1cnRoZXIgZGV2aWNlcyBp
dCBzZWVtcyB0byBiZSB1c2VmdWwgZW5vdWdoIGFzIGl0IGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBWMjogRHJvcCAibWFj
LWFzY2lpIiBhcyBsZW5ndGggY2FuIGJlIGNoZWNrZWQgaW5zdGVhZAo+ICAgICBGaXggImFsbE9m
IiBieSBhZGRpbmcgcmVxdWlyZWQ6IFsgY29tcGF0aWJsZSBdCj4gVjM6IEZpeCBjZWxsIGxlbmd0
aCBpbiAiZGVzY3JpcHRpb24iICh0aGFuayB5b3UgUm9iISkKPiBWNDogRml4IGNlbGwgbGVuZ3Ro
ICgxMiDihpIgNikgaW4gZml4ZWQtbGF5b3V0LnlhbWwgZXhhbXBsZSBhcyB3ZWxsCj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWNlbGwueWFtbCAgICB8IDI2ICsrKysr
KysrKysrKysrKysrKysKPiAgLi4uL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0
LnlhbWwgIHwgMTIgKysrKysrKysrCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252
bWVtLnlhbWwgICAgICB8ICA1ICsrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
