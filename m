Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9393C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UADp79MqHIu93kQAF4oxUGyBYqsAX+m8fW86BHiQGKI=; b=PWPQuXos3g9b5r
	i55WRfa2mvIIqe3ntK9EMxOMRfrASY4rDmSIOvHUY0AIkMNqm9NQK1ZsZ77vdR07MvlykARTGp6/D
	5W16KlgDuzGeyTTbb+Ud3uBoIB14EEJ8tL1wSpewrgcweolClOfGDX6Vg9/h2Oei1+WQWY4z6Rwsb
	msL1r8vmU0ursaQiqXitdLrmX8x7lVUKthv4tiPq8QZcCDMreCpNAksgpHdhR9fDEDLHtESxC3XQC
	1sgbGgaMiw1hKonI6lB//iskDWgG9X2Gy8RvFXPjt+yNIHpu345qCLkpzvaRMrqSOImat+q5iy1bs
	78KqnLePa1EbmL5+1xIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcPr-00AQ3k-MG; Wed, 26 Jan 2022 07:08:27 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcPP-00APsH-Th; Wed, 26 Jan 2022 07:08:01 +0000
Received: by mail-lj1-x22a.google.com with SMTP id z14so18576127ljc.13;
 Tue, 25 Jan 2022 23:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PfYCVcr1In8W9+MgZIF3icYx9fo+vY33A1S1gqsP34=;
 b=n42hCN/HYREN+SnwV2Pnhw036LJMATzNeFmmCSTpPlPLVZP+xX/SiBljHM+4/HQLCX
 cg5nyQZ+DfVwXaOwyZD305PfQyWsPViZiXvJ0RsA3VfNkS2P9VPkRVV1RUQIHfNxxIjJ
 t1Bl+NcHbBo8vSFaNrZlqzPW849DR+X5smwiKgGq6G6Xw18osN5AkH9XXaKvdtB8MToj
 njnhh9sJ3mfRxa/0tPC6AsKUfEBpm6yilKDaIMG0JAjlEsoQ0d683oOeNMQAr7uxssWa
 xiLj0LLPA2OkGot+jljqWodIyT3vjuWoY04DUrx47em876KalbN8JbQV0IKLz6GZfPlc
 oPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PfYCVcr1In8W9+MgZIF3icYx9fo+vY33A1S1gqsP34=;
 b=Fjs/mmXx7U8xSNFOCVvQDzQLy1I9pJqYF4ATnpZ+Q0BcTomF8k1tLEWZr8o3Q7w8On
 X6X15UbAFdWl7nij7I4OnEdp11fH2T329zbuIshGT9cMDqxdTIrEsbm/wSvUm9j5LY83
 cpsGOHraYBjf1iVOm8Ilzs3yTqaVBFL7sV5bF12hR43ava1HiIAxV07XExW9f0hniMyt
 TevD/OnzqtFft7JfZE01FZ2GWV+KAs1Swxam6m9dXPww9ABmlSs9X7mrLit7EeH3IY7S
 JLlFmdryEcTfbmbeVap3jtGTxUGICKI/+jVFlGqOUfj/gmGXFftHxtD9IqCtmnqsqLe0
 55Hg==
X-Gm-Message-State: AOAM531wwGm+tyodtzE2ZcUKBG1lRMvUNItqiQB9vDjZ9gRRMKh24Ulc
 hSxJU3AhutAOBThkeSfelPI=
X-Google-Smtp-Source: ABdhPJz/pMWKdr30TUV8F5L8mcYQkfbr49L33tXc0XYI5XxtaBk2w0Bnf6pcTZlX0EVFBGP1mrPOBQ==
X-Received: by 2002:a05:651c:93:: with SMTP id
 19mr5357663ljq.175.1643180873008; 
 Tue, 25 Jan 2022 23:07:53 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id b39sm1465764ljr.88.2022.01.25.23.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:07:52 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH REBASED 1/2] dt-bindings: nvmem: extract NVMEM cell to
 separated file
Date: Wed, 26 Jan 2022 08:07:44 +0100
Message-Id: <20220126070745.32305-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125180114.12286-1-zajec5@gmail.com>
References: <20220125180114.12286-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_230800_066772_39DAA807 
X-CRM114-Status: GOOD (  16.16  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyB3aWxsIGFsbG93
IGFkZGluZyBiaW5kaW5nIGZvciBtb3JlIHNwZWNpZmljIGNlbGxzIGFuZCByZXVzaW5nCihzaGFy
aW5nKSBjb21tb24gY29kZS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxscy9jZWxs
LnlhbWwgfCAzNCArKysrKysrKysrKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9u
dm1lbS9udm1lbS55YW1sICAgICAgfCAyMiArLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MzUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxzL2NlbGwueWFtbAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxscy9j
ZWxsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMv
Y2VsbC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYWRmYzJl
NjM5ZjQzCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL2NlbGxzL2NlbGwueWFtbApAQCAtMCwwICsxLDM0IEBACisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1lbS9jZWxscy9jZWxsLnlh
bWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKKwordGl0bGU6IE5WTUVNIGNlbGwKKworbWFpbnRhaW5lcnM6CisgIC0gU3Jpbml2YXMgS2Fu
ZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgorCitkZXNjcmlwdGlvbjog
TlZNRU0gY2VsbCBpcyBhIGRhdGEgZW50cnkgb2YgTlZNRU0gZGV2aWNlLgorCitwcm9wZXJ0aWVz
OgorICByZWc6CisgICAgbWF4SXRlbXM6IDEKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIE9mZnNl
dCBhbmQgc2l6ZSBpbiBieXRlcyB3aXRoaW4gdGhlIHN0b3JhZ2UgZGV2aWNlLgorCisgIGJpdHM6
CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5
CisgICAgaXRlbXM6CisgICAgICAtIG1pbmltdW06IDAKKyAgICAgICAgbWF4aW11bTogNworICAg
ICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICBPZmZzZXQgaW4gYml0IHdpdGhpbiB0aGUgYWRk
cmVzcyByYW5nZSBzcGVjaWZpZWQgYnkgcmVnLgorICAgICAgLSBtaW5pbXVtOiAxCisgICAgICAg
IGRlc2NyaXB0aW9uOgorICAgICAgICAgIFNpemUgaW4gYml0IHdpdGhpbiB0aGUgYWRkcmVzcyBy
YW5nZSBzcGVjaWZpZWQgYnkgcmVnLgorCityZXF1aXJlZDoKKyAgLSByZWcKKworYWRkaXRpb25h
bFByb3BlcnRpZXM6IHRydWUKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS9udm1lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL252bWVtLnlhbWwKaW5kZXggNDNlZDdlMzJlNWFjLi5iNzliNTFlOThlZTggMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55
YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55
YW1sCkBAIC00MSwyNyArNDEsNyBAQCBwcm9wZXJ0aWVzOgogCiBwYXR0ZXJuUHJvcGVydGllczoK
ICAgIkBbMC05YS1mXSsoLFswLTddKT8kIjoKLSAgICB0eXBlOiBvYmplY3QKLQotICAgIHByb3Bl
cnRpZXM6Ci0gICAgICByZWc6Ci0gICAgICAgIG1heEl0ZW1zOiAxCi0gICAgICAgIGRlc2NyaXB0
aW9uOgotICAgICAgICAgIE9mZnNldCBhbmQgc2l6ZSBpbiBieXRlcyB3aXRoaW4gdGhlIHN0b3Jh
Z2UgZGV2aWNlLgotCi0gICAgICBiaXRzOgotICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkKLSAgICAgICAgaXRlbXM6Ci0gICAgICAgICAg
LSBtaW5pbXVtOiAwCi0gICAgICAgICAgICBtYXhpbXVtOiA3Ci0gICAgICAgICAgICBkZXNjcmlw
dGlvbjoKLSAgICAgICAgICAgICAgT2Zmc2V0IGluIGJpdCB3aXRoaW4gdGhlIGFkZHJlc3MgcmFu
Z2Ugc3BlY2lmaWVkIGJ5IHJlZy4KLSAgICAgICAgICAtIG1pbmltdW06IDEKLSAgICAgICAgICAg
IGRlc2NyaXB0aW9uOgotICAgICAgICAgICAgICBTaXplIGluIGJpdCB3aXRoaW4gdGhlIGFkZHJl
c3MgcmFuZ2Ugc3BlY2lmaWVkIGJ5IHJlZy4KLQotICAgIHJlcXVpcmVkOgotICAgICAgLSByZWcK
KyAgICAkcmVmOiBjZWxscy9jZWxsLnlhbWwjCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVl
CiAKLS0gCjIuMzEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
