Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04FEC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Nov 2022 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwvI56qv+EA5yBxyCWxgxEx4eEgKCUvTRc5wr+Pz84g=; b=fwSrLTlkWwcX6m
	o1RJkY4YcdR2qb56stpCiM2sr5Vs0WEwe4qg1Ab1cCr1W3vgq06QyHFQd4OVy0LdqWImYNrigXQU+
	zwHxI0dCF/dYQF1fwTLMhBu8xYeC66VMNwCbGBDb03duvdkr6ISxG0WjD4njmXrF/QcRnw+wgnHxW
	3xhu1f9xTeuiMnDHa9zuIK27gWVfkyxFosrceLGffvp+tnIZF1Cm4ZwTlD+cZQluH79t1xCrbGcJ7
	kTo91Wfp6K33Pz7GVekoQSA0I262rpb643jBpp8X6YeZiGymysZgpf4gKnnBy6kx5BPx1zApBkOsd
	DZehtQX3R4cYc6jITcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMFi-006RP7-9G; Wed, 16 Nov 2022 17:31:10 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLCq-005pS7-5t
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2022 16:24:09 +0000
Received: by mail-oi1-f169.google.com with SMTP id v81so19037604oie.5
        for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2022 08:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nf9WQg2FkfIb1IV76Hu2KxdCX8Rw6eiA2sNg43ap2ik=;
        b=ha37qCcrKxp16RKCFCOfsAaKGiQYMhgvEAxbat/Fhq0fdyL5E83LRFUFanbQNS6Fd3
         5P3PFYYiLngvahw6/2IuEHzl4+EB8dw8FEwNvDNq5bmdjUCGSN0uxvMz1ig2JWG0AbCp
         FwADGbBTU5CZt35hG0sO96MoALxD3vo5WBZhNAuoBP5N3cdKtABpGzdOww4XjNWFT44g
         t3mRo6WK+ZPyMj0v24vspBfdjJpZRvhY9nl61ifulRq3BuB4u1xa95fdmRx6MTCfLS+6
         ewAVgscNrFjgzgS2mDBuS5QDDcLNmEBGC98TcTnQvavmINgPXjaw0U29S1oTruEVENeF
         UfTw==
X-Gm-Message-State: ANoB5plmK4oePJ81hFvqGT1DhfnZoloCj+HZgiUtATVk4snR2X1/PHfs
	3RGpf3tSpCI0PRK8TfmW9hbwmMI6Ug==
X-Google-Smtp-Source: AA0mqf63F8fJfNFaCeq//Z+5DQukbsqhZ1K2yR/pTOP8NP0eL3/E7c3SIt1g0qkbgVYaDx0ITpquyA==
X-Received: by 2002:aca:b4c5:0:b0:35a:cf84:d834 with SMTP id d188-20020acab4c5000000b0035acf84d834mr2071107oif.41.1668615845549;
        Wed, 16 Nov 2022 08:24:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s17-20020a056830439100b006619533d1ddsm6717938otv.76.2022.11.16.08.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:24:05 -0800 (PST)
Received: (nullmailer pid 193065 invoked by uid 1000);
	Wed, 16 Nov 2022 16:24:07 -0000
Date: Wed, 16 Nov 2022 10:24:07 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH mtd/next] dt-bindings: mtd: partitions: allow SafeLoader
 dynamic subpartitions
Message-ID: <166861584651.193009.6897512029403663195.robh@kernel.org>
References: <20221108093102.8360-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108093102.8360-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_082408_239731_56CA7463 
X-CRM114-Status: GOOD (  10.10  )
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

Ck9uIFR1ZSwgMDggTm92IDIwMjIgMTA6MzE6MDIgKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVFAtTGlu
ayBTYWZlTG9hZGVyIHBhcnRpdGlvbmluZyBtZWFucyBmbGFzaCBjb250YWlucyBtdWx0aXBsZSBw
YXJ0aXRpb25zCj4gZGVmaW5lZCBpbiB0aGUgb24tZmxhc2ggdGFibGUuIFNvbWUgb2YgdGhvc2Ug
cGFydGl0aW9ucyBtYXkgaGF2ZSBhCj4gc3BlY2lhbCBtZWFuaW5nIGFuZCBtYXkgcmVxdWlyZSBk
ZXNjcmliaW5nIGFkZGl0aW9uYWxseS4gQWxsb3cgdGhhdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gIC4uLi9tdGQvcGFydGl0
aW9ucy90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwgICAgICB8IDggKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
