Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB9C7EE25
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kS4+Wz2cxO8lrSZH6vuqCyPprJRtcDnldOlL6QEAaFg=; b=4iZikZVTp6OIrs
	AFCH56tShHluqSkCwl/+GG4Ji9sGV5uu5kLUjsGdjjx//je55hdHqcr6JL/pjIFeWHOup9dMb/5mO
	5+kwtqN+jldgoimGRxDAdubmqaRJU2KOdI7KgFTPhjiwSO+VpBcHdhsKqk+9vb0eHIINF/KHXP9bn
	uw6z9KyzvW+08b5tUCLwbLCucOxFUqc1iANWrh8/0ezX3eV5qoRjQbA6LBISQP/yhAZgM72BPMDCM
	K9ccP/1IeuOWs6c66MGUsDSeyIkz2r0XnB6R5/ruFgYU3ZkpfhEmwuWqQ5cZtJJetZaDoBrpaKNrU
	cF70SriR2m+2ymk3UA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eP4-003QA0-2Q;
	Mon, 12 Jun 2023 10:04:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eP1-003Q8o-1j
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977d02931d1so610750566b.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686564238; x=1689156238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDhYdRfw+H9eDbkeyM0u9Hp7SSuCMuRm9eON/ZgbuDk=;
        b=E9uGbaWuZaBCn6Xf0OItC32sYQh9LVD2k090dtF/aQReCbqHCcL/+9h9wKEY+yv9SV
         zXOVw7UTZPvqSBd4wtUQS5QwxMYX7+dYDuGljdj0lHO/qMfRjn6VkdrNpsPtTD+xrAOv
         sraQa+vuiGa27phqRQawPab77HZtl/K3EacRAEULB78Af2jLNy05OgA/CIXrCMEvW4C3
         l8LkFja5eDHVL8khL4r4bJkrzYuac57BQue3orGeX95avRsj96yko6vRx+3ZywPrGfgF
         MDdFw2+JjsORFI4G7J7vuxO8WRw92tQP7hKTbQkh/SjJe1A3I1cG1rAEAEHW9c78tg3z
         LpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564238; x=1689156238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDhYdRfw+H9eDbkeyM0u9Hp7SSuCMuRm9eON/ZgbuDk=;
        b=F4HaP15Eg6swwIpyPgTkMWSGCxVLNeOI55mVHpYIPWvdjXkm2QVDZJvhtddPdaGJbt
         j9zEj2XfZe6n9ZxwXAkTcPG5rmq2TvLZFA3VQHsbn9f8CqqU7EwkLOO9xZg4CJ8DSuwC
         /ZukN0G/+Zhd817X2Ny6qi19heVwrchZbs4p5TrtmQG8R1DMiG16hFdhA0S7/wgoq5nz
         1/Y+myhDRY/MMu60KZSOW5QFPjdBMTaeigpRp7DAo2IpWX4BowTOHm/jkWAQwRv3+5ra
         KtrigJmA9CYkMCOcaAZwmsNDPyoEhQtHh9awSSXcUm3rwNJ8ep7ih2BuTWXUSru8MRd/
         bFrw==
X-Gm-Message-State: AC+VfDxnv+vNuZ2IgwB6JiYyBadIxftLrajm13NcYkt+FhXex8FweMno
	zHDTtSsdFw/hpyAy+mGEGRG1+g==
X-Google-Smtp-Source: ACHHUZ4LOTSs4UIZJLW3dFg+KyEBxIuTIuJZid/DofaZwV8aPAn/wWDASahUKO3Ww4EGF/hc5zOYNw==
X-Received: by 2002:a17:907:9728:b0:97d:f8db:601 with SMTP id jg40-20020a170907972800b0097df8db0601mr5935399ejc.62.1686564236878;
        Mon, 12 Jun 2023 03:03:56 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709060b0900b0097db2824c98sm3473120ejg.151.2023.06.12.03.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:03:56 -0700 (PDT)
Message-ID: <b5c403ad-f8d2-5f00-e345-ef412a706544@linaro.org>
Date: Mon, 12 Jun 2023 11:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] mtd: spi-nor: Support for another sst flash
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230609144324.850617-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030359_574223_FAD51B4C 
X-CRM114-Status: GOOD (  15.93  )
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

CgpPbiA2LzkvMjMgMTU6NDMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8gVHVkb3IsCgpI
aSwgTWlxdWVsIQoKPiAKPiBIZXJlIGFyZSBhIGNvdXBsZSBvZiBwYXRjaGVzIGFkZGluZyBzdXBw
b3J0IGZvciB0aGUgc3N0MjZ2ZjAzMmIgc3BpLW5vciwKPiBub3RoaW5nIHNwZWNpZmljIGhlcmUu
IEkgaG9wZSBJIHJhbiBhbGwgdGhlIHJlcXVpcmVkIHRlc3RzIGNvcnJlY3RseSwKPiBvdGhlcndp
c2UgbGV0IG1lIGtub3cuCgpUaGUgdGVzdHMgYXJlIGZpbmUsIHRoYW5rcy4gSSB0aGluayBpdCdz
IGRlYmF0YWJsZSB3aGV0aGVyIHdlIGluY2x1ZGUKdGhlIG91dHB1dCBvZiB0aGUgdGVzdHMgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlIG9yIGluIHRoZSBjb21tZW50cyBzZWN0aW9uCmJlbG93IHRoZSAt
LS0gbGluZSwgYnV0IEknbSBmaW5lIGVpdGhlciB3YXkuCgpJIGhhZCBzb21lIGNvbW1lbnRzIGZv
ciB0aGUgcGF0Y2hlcywgSSdsbCBsZXQgeW91IHJlYWQgdGhlbS4KQ2hlZXJzLAp0YQo+IAo+IENo
ZWVycywKPiBNaXF1w6hsCj4gCj4gTWlxdWVsIFJheW5hbCAoMik6Cj4gICBkdC1iaW5kaW5nczog
bXRkOiBzcGktbm9yOiBEb2N1bWVudCBzc3QyNnZmMHh4YiBmbGFzaCBzZXJpZXMKPiAgIG10ZDog
c3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIHNzdDI2dmYwMzJiIGZsYXNoCj4gCj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIHwgMiArLQo+
ICBkcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
