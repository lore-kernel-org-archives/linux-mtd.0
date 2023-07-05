Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CAAEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiF9El5/Hq+juTNT+XUp9hI+zdDYU9rv/r3SQ5gKecA=; b=2bgFSxDT0fyQdQ
	Zeu9RZ9WhU3xb/6o7UrjboRBfvbEd4f1t7jc6mbZ8YU4Z0QCKWYR9yF0rB1QnzOhJZ6vLoOn9KBe8
	pTx6a1Z99I2UQY1+0hcAWVkj8QmtbndWpezfyA7cwExgHFkTUNBboVGl1Halr8K0iKHs7rck91DUu
	5dG1zCG0UUc2w8mb46CEtdmRJZM1u1tzNR8hqP0AmTuZFpVZAZdFKZFVxg593DCbpzvOJOQCIcbGq
	yI9xa1om71VpyVuAFw9uMw6ufAId4mSYaiEVUsL9PYsyrMOOTtqDGoh/CK+iXiRcGJXg0AI+qvgg4
	vR/9xSJkLsz5NFI2BKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzSv-00FS56-0S;
	Wed, 05 Jul 2023 10:10:29 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzSq-00FS3m-28
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 10:10:25 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so7657066276.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2023 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688551820; x=1691143820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5BiZxAdo175caCNPuZri1kWZT7Qvo2b/jAKdwh4fGo=;
        b=OfyRAr1XW7hQ3Ug5ZYV83RPlh+OQjY+hZNUlo7TXuEAiE62322BbU2bzpy3jeDrn+O
         sOHHB8tlEdgWtyhJH1G1KfEBI8Myk45vygP4UCFwK+jqZBC6bK00Lhq8ZDeFzStzOUhL
         6+8iiOlPePTBoX/A5Z3ad9IvmVebeBa3k1UMzviqOxIqabHwgApVAvr9rxb1nCunAp0N
         KYcg2t7wqpbkN+SOaW+6BSdqqJAPbUeVZWRl4KhQ0cfqmdzofbSgnNzehST4aw+vel/Z
         zE1uF6JjFzyxrD9B/X0b+pmMZtrseJpyUBVAwc8+XOcTpyuCY1CvXJ3ei5UE3xb5y8Jl
         ATIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688551820; x=1691143820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5BiZxAdo175caCNPuZri1kWZT7Qvo2b/jAKdwh4fGo=;
        b=ARt4iaJKfayALEb/0Vce9JSo00InRgAwsP1zVHgQlbt7pbiBM2gTaRPOONjZHeiOYh
         v44akvLHKuwjylVT1fKxlP2uGq0hDgh/kRwaoJtoE6gJsY1sh29Ren4C07jSjMsTzUjW
         ol4uWpZFASqlbniHUYE6DM3wAipIUrRHTGkmpDO2xubIDyqhy/eH1qjEZQ5+MV0OmeMX
         ngy66sAnA0H7IMb/zkSq2HfVEb9jKT6ZfJojEX8ThF/a4QD9iT/Jk2LhKBFl2MijPNhp
         oYon57M+UjYHZvDMaDxRnV3ZGbECDnKcvb4HmxwuvE2vZ0c8ZvdeuiyE3sWj4e2zJW/2
         XUWA==
X-Gm-Message-State: ABy/qLbMh2TESWdcnXfUua7HAJ4ASW85Q0BS+gUF8tekloVdH2F/mxZB
	AQ5ANIwpuqxQUG369CLw32+XiEq/qe/LslX+lEYJKQ==
X-Google-Smtp-Source: APBJJlE8B6kTceIEY/HjSKPVfI5dkey3d/+conMUwS2ilyTvOTa/wNNq2saaTt+P5NoFmmRDanVQ3M4oLG7R+EgRgwo=
X-Received: by 2002:a25:3621:0:b0:c65:1369:3f6c with SMTP id
 d33-20020a253621000000b00c6513693f6cmr184700yba.16.1688551820039; Wed, 05 Jul
 2023 03:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
 <20230506-seama-partitions-v1-1-5806af1e4ac7@linaro.org> <96c63925-91d5-994a-a531-2d7bdb3b642a@linaro.org>
In-Reply-To: <96c63925-91d5-994a-a531-2d7bdb3b642a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Jul 2023 12:10:08 +0200
Message-ID: <CACRpkdY5p9jVO0iyGhi7GACY+hBQ6a7OdoJ3W9hg22aUeNMvkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Add SEAMA partition bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_031024_707932_AC1E0128 
X-CRM114-Status: GOOD (  12.84  )
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgNDo1N+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+ID4gK3NlbGVjdDogZmFsc2UK
Pgo+IFlvdSBtaXNzIHVwZGF0ZSB0byBwYXJ0aXRpb25zLnlhbWwuIEFueXdheSwgZm9yIHlvdXIg
dGVzdGluZywKPiB0ZW1wb3JhcmlseSBjaGFuZ2UgaXQgdG8gdHJ1ZSwgdG8gc2VlIGVycm9ycy4K
ClRoaXMgInNlbGVjdCIganVzdCBjb25mdXNlcyBtZS4gSSBjYW4gc2V0IGl0IHRvIHRydWUgYW5k
IHRoZW4gSSBnZXQKYSBmbG9vZCBvZiBpcnJlbGV2YW50IGVycm9ycywgYW5kIHRoZSBzYW1lIGlm
IEkgY2hhbmdlIGl0IHRvIHRydWUgZm9yCmFueSBvZiB0aGUgb3RoZXIgY2hpbGRsZXNzIHBhcnRp
dGlvbnMgc3VjaCBhcyBhcm0sYXJtLWZpcm13YXJlLXN1aXRlLnlhbWwKClNvIEkgZG8gYSBiZXN0
IGVmZm9ydCBoZXJlLi4uCgo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4g
KyAgICBjb25zdDogc2VhbWEKPiA+ICsKPiA+ICsgICcjYWRkcmVzcy1jZWxscyc6IGZhbHNlCj4g
PiArCj4gPiArICAnI3NpemUtY2VsbHMnOiBmYWxzZQo+Cj4gWW91IGhhdmUgY2hpbGRyZW4sIHNv
IHRoZXNlIG11c3QgYmUgdHJ1ZS4KCk5vdCByZWFsbHksIHNlYW1hIGlzIGNoaWxkbGVzcy4KCkkg
Z3Vlc3MgdGhlIGV4YW1wbGUgd2l0aCBmaXhlZC1wYXJ0aXRpb25zCndhcyBjb25mdXNpb24sIHNl
YW1hIGNhbiBiZSBhIHN1YnBhcnRpdGlvbiBpbiBhIHNldApvZiBmaXhlZC1wYXJ0aW9ucy4KCkkn
bGwgdHJ5IHRvIHdyaXRlIHVwIHNvbWV0aGluZyBzbyBpdCdzIGNsZWFyLgoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
