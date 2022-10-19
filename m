Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F60C43217
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrpLhV4HCahzSdLNtRPZIBAKfyvWHKMgFVK4gAYdLWU=; b=j/zMHB23GfkF8h
	1ljZGTE0lXFJA1VdoOTmotvsf68FZSjKciqT44Me7k6Jk1eh7k4LoRSiV6R8t7BZRdFxz3BRi4YIj
	l6hXG2Vt5F/nWrYX43gbco/HlwlHMRryunApfupa9/AiQFygVpgxbe0R5M6ZgdPkQyHbuRzQq7C2y
	0h6YTjj9aiZGPqqaf3KKVYxreYVKqOoMS75MefeH7dBVTPJc+TM/NFtXtwPRe7c0XYU7rfMqAFLdw
	izFxHSgAHuOhjVOPYK9UJvhPzHxVK+wI50ldyKmTwr9/TeDxRgFNi8AHwHjQfv/yLZxhYj1BrysT/
	HDi0QnfhisX7GfFvEQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7dS-0013Xl-4t; Wed, 19 Oct 2022 11:53:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7dP-0013Vn-G8
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 11:53:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id sc25so39277142ejc.12
        for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2022 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEslt1RuSXUcyMvZuWV2zoIP99mcfhq4IT43n7JtoN8=;
        b=CHDCVUQxhP5zedafe5Fy0AcTvPDy2APY6prls4+epl+l8eKvD/foanWlFtPyvPmIbk
         vyETXKgyJh32IvytlFx2z1FOFTA4UYbxs3vA9Lbs2XOSO6Wh7aNK+rntsIz70A6k852r
         j8Zs3AFWu4AFeAnu9RcvgtS5eaUHzubhG0BM7jVIFfYvdQpb+zYvZPysCvg4pJCUwCLc
         5jXHEMa02Uuoz28IKa1Aorlg2n5MffTr4vz0Y2sJtheV/s7NmP4OZiqekpuvZpF3rKZE
         31ePzg8TjiXRFMQRU1spjaDXC1LcHmJpxZuBH0BenmJ83v66XJxoSb8Pqq7JbglGgbz0
         gg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MEslt1RuSXUcyMvZuWV2zoIP99mcfhq4IT43n7JtoN8=;
        b=NtuLq2GwgTyns5VUtshQ26x65b8zmeT7et+diB2dysoExnedpgOPyR2SBPvlfuW2+Q
         yMOV2KX8uOsm91ZxRbiIMkJcspjyGOBQyM9VD4mvocVUJWQ++xa+LPXdAcSdiC4DFW+Q
         hN5zATgkBUaisIHM/7xYQ7gVHoH2dt5QQCbyKjDEDQFyYxRGx6L4NDSlItfd2XXpDo6R
         ldRqze4sSgxmy4gyuIZW2d8MqBrn+44Vf2JcvlXdcCk1mhhKSPcHVq2Y2jlUoX5F+2cw
         YOHEbdpbkyAIbUt3w37XB5SZhjGbGs6CXk+N90bSuYBY+HWOIR/Yh9HKsjh8j0nh7mB1
         J4Gg==
X-Gm-Message-State: ACrzQf0UCFEfSiPxbmUGjHo7PQiLsDV9hpEzSFtYouDnvfVOnmguvryP
	Pin19jLcjj7VpmXIwWfZM0Y=
X-Google-Smtp-Source: AMsMyM4gLXcYIkULuHyL9C32E1bcJWwX7brePnpuiphaKMj+qGQE5gfjVZ/3+0hBVMaCfCSsbeCZPA==
X-Received: by 2002:a17:907:6e0e:b0:78e:1385:c06 with SMTP id sd14-20020a1709076e0e00b0078e13850c06mr6518840ejc.485.1666180397196;
        Wed, 19 Oct 2022 04:53:17 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id ey4-20020a0564022a0400b00459148fbb3csm10430043edb.86.2022.10.19.04.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 04:53:16 -0700 (PDT)
Message-ID: <c8d12dd0-7504-0198-dacb-b3723d82fc60@gmail.com>
Date: Wed, 19 Oct 2022 13:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 2/2] mtd: core: set ROOT_DEV for partitions marked as root
 devices in DT
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20221019114855.31639-1-zajec5@gmail.com>
 <20221019115041.31805-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20221019115041.31805-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_045319_560352_D2944242 
X-CRM114-Status: GOOD (  21.78  )
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

T24gMTkuMTAuMjAyMiAxMzo1MCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGFkZHMgc3VwcG9ydCBmb3Ig
ImxpbnV4LHJvb3QtZGV2aWNlIiBiaW5kaW5nIHRoYXQgaXMgdXNlZCB0byBtYXJrCj4gcm9vdCBk
ZXZpY2UgTVREIHBhcnRpdGlvbi4gSXQncyB1c2VmdWwgZm9yIGRldmljZXMgdXNpbmcgZGV2aWNl
IHRyZWUKPiB0aGF0IGRvbid0IGhhdmUgYm9vdGxvYWRlciBwYXNzaW5nIHJvb3QgaW5mbyBpbiBj
bWRsaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDcgKysrKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCAwNzI0OWFmNGY4OTAu
LjAzNGIwNmFmZjY2MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtMjgsNiArMjgsNyBAQAo+ICAgI2luY2x1ZGUg
PGxpbnV4L2xlZHMuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gICAjaW5jbHVk
ZSA8bGludXgvbnZtZW0tcHJvdmlkZXIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Jvb3RfZGV2Lmg+
Cj4gICAKPiAgICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
bXRkL3BhcnRpdGlvbnMuaD4KPiBAQCAtNzM1LDYgKzczNiwxMiBAQCBpbnQgYWRkX210ZF9kZXZp
Y2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gICAJCW5vdC0+YWRkKG10ZCk7Cj4gICAKPiAgIAlt
dXRleF91bmxvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gKwo+ICsJaWYgKG9mX2ZpbmRfcHJvcGVy
dHkobXRkX2dldF9vZl9ub2RlKG10ZCksICJsaW51eCxyb290ZnMiLCBOVUxMKSkgewoKSSBmb3Jn
b3QgdG8gcmUtZG8gImZvcm1hdC1wYXRjaCIgYWZ0ZXIgImNvbW1pdCAtLWFtZW5kIi4Kcy9saW51
eCxyb290ZnMvbGludXgscm9vdC1kZXZpY2UvCgpJJ2xsIGZpeCB0aGF0IGluIFYyIGFmdGVyIGdp
dmluZyB0aGlzIHBhdGNoc2V0IHNvbWUgdGltZSB0byByZXZpZXcuCgoKPiArCQlwcl9pbmZvKCJt
dGQ6IHNldHRpbmcgbXRkJWQgKCVzKSBhcyByb290IGRldmljZVxuIiwgbXRkLT5pbmRleCwgbXRk
LT5uYW1lKTsKPiArCQlST09UX0RFViA9IE1LREVWKE1URF9CTE9DS19NQUpPUiwgbXRkLT5pbmRl
eCk7Cj4gKwl9Cj4gKwo+ICAgCS8qIFdlIF9rbm93XyB3ZSBhcmVuJ3QgYmVpbmcgcmVtb3ZlZCwg
YmVjYXVzZQo+ICAgCSAgIG91ciBjYWxsZXIgaXMgc3RpbGwgaG9sZGluZyB1cyBoZXJlLiBTbyBu
b25lCj4gICAJICAgb2YgdGhpcyB0cnlfIG5vbnNlbnNlLCBhbmQgbm8gYml0Y2hpbmcgYWJvdXQg
aXQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
