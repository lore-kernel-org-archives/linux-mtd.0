Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E522DC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Oct 2022 05:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4JoAPFuuK4IgLTsgV5v5jgidVwdF1oNDOwRRv4qB5Y=; b=HSP2bUqPXyASNv
	BkcsGN+IZ4XurKwjghM2Knm/IA26vNBf44capL2sjnkAK6sVIH0xiuztINU34Meq7m+xs06rK7rQa
	7rEQ1oryfC0f+lYB0EUYUEBsnsDHgiovyZa225jfidoUcxmGuDETuwDKJ3SpfflKZLs0M4XjlW7mN
	kdMgZOuVS+yt8hH63iREvMOwMxt+aoNJHE9UBAnel5MmiqZB2LOeklRBlDGzo3WvZ0xQi9XVxrGRu
	Bu6h9439XRG98YAq5CflHKc5Yy1Zo3zoQJbm8g5Ut80bQZ+xwbmuV3kZIYmL655delwbP9vC0oeVR
	TDet7V0v7l8xsR+BYdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiTvY-006qgv-8R; Wed, 12 Oct 2022 05:05:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiTvL-006qdy-Qh; Wed, 12 Oct 2022 05:04:57 +0000
Received: by mail-ej1-x62a.google.com with SMTP id qw20so35003017ejc.8;
        Tue, 11 Oct 2022 22:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWXigG1u8LRFaluOU8xYqRPb0mmmgU/QzpmUWeqEHJQ=;
        b=l0LaBghwdk7PCVJXNaOY/n6ExeGkkZuRA0FQDgOwjq/wsjF+xXFFgkG4R+uQxb4bYR
         /jcdagEmVM8UboEh9+VDBu2hGDx89ri9JA76TIjPZR/oOCIjXeNHw9w/H2dJ7ObiPNXC
         fLRe0IVTl3PSXFM4AHguYu/589Xa9Ppj8xqdcTrIphdstMZNH7X5rCfVfcufN0LnPztB
         u38KBKxvN+xbzgtHCbisVir6WHrh02h9ScGvlwX6ILo2/Hp1kOtQjCQ9EQIZiUsLV1o+
         G78R1tSUNdoYFp9oroHStleKgyrV0V1InF7sHy1y5hD3GHilNUYX+5yKwa2ZvkCghSKe
         XeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWXigG1u8LRFaluOU8xYqRPb0mmmgU/QzpmUWeqEHJQ=;
        b=XnvYh8QjeBMicQkXIQE+6W+IhTjyubTjSRXvRhf7+qYZz4T43f4x5/LCiSZ9GHNoPr
         yKV2ZRTCjP0hNyISBvCqT1MhBgcRhIwwijPEliPqQB/zTN5TDzcLGyfoZzbH+wvyDsa3
         cTLRxCLUbFzOLfq4KYcGTeTjcqkSdkSZ6WzUqQft+2dA/U5cQR/WuFvPy4XXXrqba2UF
         yvr/H3FhSuHPaZw7d9KXxaLlzUHE0XUyU9Z0P4C/w1gKThyeXtslDGigKM2DQZhnTB0w
         fLuHKsDr+baew/aAKCshbfxtLh4C5eEfecsftxF/MJ7IIS0Ws4DMfBhjk6P9wNgOLDsr
         Vaqw==
X-Gm-Message-State: ACrzQf2SBuTOtF/IAmXrC1uKnX81l9H52n80hdr+vT+8qUrF28t6pLhZ
	leFaLctWUds6lK/+pNK11AY=
X-Google-Smtp-Source: AMsMyM5QHWHvMa7BfZ8Ya1GTDp16MRllclavGWOgQ1pt0TPpuOngyrdAMCZYzNadj8Cb3a4wIk0IFA==
X-Received: by 2002:a17:907:2c67:b0:78d:49d2:6297 with SMTP id ib7-20020a1709072c6700b0078d49d26297mr21876419ejc.21.1665551092152;
        Tue, 11 Oct 2022 22:04:52 -0700 (PDT)
Received: from localhost.lan ([194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e11-20020a170906314b00b0073ddb2eff27sm573916eje.167.2022.10.11.22.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 22:04:51 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	bcm-kernel-feedback-list@broadcom.com,
	John Crispin <john@phrozen.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] mtd: parsers: add TP-Link SafeLoader partitions table parser
Date: Wed, 12 Oct 2022 07:04:42 +0200
Message-Id: <20221012050442.6815-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012050442.6815-1-zajec5@gmail.com>
References: <20221012050442.6815-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_220455_916286_73B3EAE1 
X-CRM114-Status: GOOD (  22.37  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBwYXJzZXIgZGVh
bHMgd2l0aCBtb3N0IFRQLUxpbmsgaG9tZSByb3V0ZXJzLiBJdCByZWFkcyBpbmZvIGFib3V0CnBh
cnRpdGlvbnMgYW5kIHJlZ2lzdGVycyB0aGVtIGluIHRoZSBNVEQgc3Vic3lzdGVtLgoKU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KVjI6IEZpeCB0
eXBlcyAodGhhbmtzIGtlcm5lbCB0ZXN0IHJvYm90KQogICAgRml4IG9mZi1ieS1vbmUgd2hlbiBz
ZXR0aW5nICdcMCcKLS0tCiBkcml2ZXJzL210ZC9wYXJzZXJzL0tjb25maWcgICAgICAgICAgICAg
fCAgMTUgKysrCiBkcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlICAgICAgICAgICAgfCAgIDEg
KwogZHJpdmVycy9tdGQvcGFyc2Vycy90cGxpbmtfc2FmZWxvYWRlci5jIHwgMTUwICsrKysrKysr
KysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNjYgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL3BhcnNlcnMvdHBsaW5rX3NhZmVsb2FkZXIuYwoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL3Bh
cnNlcnMvS2NvbmZpZwppbmRleCBhYWEwNjA1MGM5YmMuLmMyNThiYTJhM2E2ZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9LY29uZmlnCisrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMv
S2NvbmZpZwpAQCAtMTIzLDYgKzEyMywyMSBAQCBjb25maWcgTVREX0FGU19QQVJUUwogCSAgZm9y
IHlvdXIgcGFydGljdWxhciBkZXZpY2UuIEl0IHdvbid0IGhhcHBlbiBhdXRvbWF0aWNhbGx5LiBU
aGUKIAkgICdwaHlzbWFwJyBtYXAgZHJpdmVyIChDT05GSUdfTVREX1BIWVNNQVApIGRvZXMgdGhp
cywgZm9yIGV4YW1wbGUuCiAKK2NvbmZpZyBNVERfUEFSU0VSX1RQTElOS19TQUZFTE9BREVSCisJ
dHJpc3RhdGUgIlRQLUxpbmsgU2FmZWxvYWRlciBwYXJ0aXRpb25zIHBhcnNlciIKKwlkZXBlbmRz
IG9uIE1URCAmJiAoQVJDSF9CQ01fNTMwMVggfHwgQVRINzkgfHwgU09DX01UNzYyMCB8fCBTT0Nf
TVQ3NjIxIHx8IENPTVBJTEVfVEVTVCkKKwloZWxwCisJICBUUC1MaW5rIGhvbWUgcm91dGVycyB1
c2UgZmxhc2ggcGFydGl0aW9ucyB0byBzdG9yZSB2YXJpb3VzIGRhdGEuIEluZm8KKwkgIGFib3V0
IGZsYXNoIHNwYWNlIGxheW91dCBpcyBzdG9yZWQgaW4gYSBwYXJ0aXRpb25zIHRhYmxlIHVzaW5n
IGEKKwkgIGN1c3RvbSBBU0NJSS1iYXNlZCBmb3JtYXQuCisKKwkgIFRoYXQgZm9ybWF0IHdhcyBm
aXJzdCBmb3VuZCBpbiBkZXZpY2VzIHdpdGggU2FmZUxvYWRlciBib290bG9hZGVyIGFuZAorCSAg
d2FzIG5hbWVkIGFmdGVyIGl0LiBMYXRlciBpdCB3YXMgYWRhcHRlZCB0byBDRkUgYW5kIFUtQm9v
dAorCSAgYm9vdGxvYWRlcnMuCisKKwkgIFRoaXMgZHJpdmVyIHJlYWRzIHBhcnRpdGlvbnMgdGFi
bGUsIHBhcnNlcyBpdCBhbmQgY3JlYXRlcyBNVEQKKwkgIHBhcnRpdGlvbnMuCisKIGNvbmZpZyBN
VERfUEFSU0VSX1RSWAogCXRyaXN0YXRlICJQYXJzZXIgZm9yIFRSWCBmb3JtYXQgcGFydGl0aW9u
cyIKIAlkZXBlbmRzIG9uIE1URCAmJiAoQkNNNDdYWCB8fCBBUkNIX0JDTV81MzAxWCB8fCBBUkNI
X01FRElBVEVLIHx8IFJBTElOSyB8fCBDT01QSUxFX1RFU1QpCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9wYXJzZXJzL01ha2VmaWxlIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9NYWtlZmlsZQppbmRl
eCAyM2ZhNGRlNDAxNmYuLjBlNzBiNjIxYTFkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvcGFy
c2Vycy9NYWtlZmlsZQorKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlCkBAIC0xMCw2
ICsxMCw3IEBAIG9mcGFydC0kKENPTkZJR19NVERfT0ZfUEFSVFNfQkNNNDkwOCkJKz0gb2ZwYXJ0
X2JjbTQ5MDgubwogb2ZwYXJ0LSQoQ09ORklHX01URF9PRl9QQVJUU19MSU5LU1lTX05TKSs9IG9m
cGFydF9saW5rc3lzX25zLm8KIG9iai0kKENPTkZJR19NVERfUEFSU0VSX0lNQUdFVEFHKQkrPSBw
YXJzZXJfaW1hZ2V0YWcubwogb2JqLSQoQ09ORklHX01URF9BRlNfUEFSVFMpCQkrPSBhZnMubwor
b2JqLSQoQ09ORklHX01URF9QQVJTRVJfVFBMSU5LX1NBRkVMT0FERVIpCSs9IHRwbGlua19zYWZl
bG9hZGVyLm8KIG9iai0kKENPTkZJR19NVERfUEFSU0VSX1RSWCkJCSs9IHBhcnNlcl90cngubwog
b2JqLSQoQ09ORklHX01URF9TRVJDT01NX1BBUlRTKQkJKz0gc2NwYXJ0Lm8KIG9iai0kKENPTkZJ
R19NVERfU0hBUlBTTF9QQVJUUykJCSs9IHNoYXJwc2xwYXJ0Lm8KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3BhcnNlcnMvdHBsaW5rX3NhZmVsb2FkZXIuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMv
dHBsaW5rX3NhZmVsb2FkZXIuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjIzNTg0YTQ3NzM5MQotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMv
dHBsaW5rX3NhZmVsb2FkZXIuYwpAQCAtMCwwICsxLDE1MCBAQAorLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQorLyoKKyAqIENvcHlyaWdodCDCqSAyMDIyIFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KKyAqLworCisjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+CisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvbXRkL210ZC5o
PgorI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+CisjaW5jbHVkZSA8bGludXgvb2Yu
aD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKKyNkZWZpbmUgVFBMSU5LX1NBRkVMT0FERVJf
REFUQV9PRkZTRVQJCTQKKyNkZWZpbmUgVFBMSU5LX1NBRkVMT0FERVJfTUFYX1BBUlRTCQkzMgor
CitzdHJ1Y3Qgc2FmZWxvYWRlcl9jbW5faGVhZGVyIHsKKwlfX2JlMzIgc2l6ZTsKKwl1aW50MzJf
dCB1bnVzZWQ7Cit9IF9fcGFja2VkOworCitzdGF0aWMgdm9pZCAqbXRkX3BhcnNlcl90cGxpbmtf
c2FmZWxvYWRlcl9yZWFkX3RhYmxlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQoreworCXN0cnVjdCBz
YWZlbG9hZGVyX2Ntbl9oZWFkZXIgaGRyOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7CisJc2l6
ZV90IGJ5dGVzX3JlYWQ7CisJc2l6ZV90IG9mZnNldDsKKwlzaXplX3Qgc2l6ZTsKKwljaGFyICpi
dWY7CisJaW50IGVycjsKKworCW5wID0gbXRkX2dldF9vZl9ub2RlKG10ZCk7CisJaWYgKG10ZF9p
c19wYXJ0aXRpb24obXRkKSkKKwkJb2Zfbm9kZV9nZXQobnApOworCWVsc2UKKwkJbnAgPSBvZl9n
ZXRfY2hpbGRfYnlfbmFtZShucCwgInBhcnRpdGlvbnMiKTsKKworCWlmIChvZl9wcm9wZXJ0eV9y
ZWFkX3UzMihucCwgInBhcnRpdGlvbnMtdGFibGUtb2Zmc2V0IiwgKHUzMiAqKSZvZmZzZXQpKSB7
CisJCXByX2VycigiRmFpbGVkIHRvIGdldCBwYXJ0aXRpb25zIHRhYmxlIG9mZnNldFxuIik7CisJ
CWdvdG8gZXJyX3B1dDsKKwl9CisKKwllcnIgPSBtdGRfcmVhZChtdGQsIG9mZnNldCwgc2l6ZW9m
KGhkciksICZieXRlc19yZWFkLCAodWludDhfdCAqKSZoZHIpOworCWlmIChlcnIgJiYgIW10ZF9p
c19iaXRmbGlwKGVycikpIHsKKwkJcHJfZXJyKCJGYWlsZWQgdG8gcmVhZCBmcm9tICVzIGF0IDB4
JXp4XG4iLCBtdGQtPm5hbWUsIG9mZnNldCk7CisJCWdvdG8gZXJyX3B1dDsKKwl9CisKKwlzaXpl
ID0gYmUzMl90b19jcHUoaGRyLnNpemUpOworCisJYnVmID0ga21hbGxvYyhzaXplICsgMSwgR0ZQ
X0tFUk5FTCk7CisJaWYgKCFidWYpCisJCWdvdG8gZXJyX3B1dDsKKworCWVyciA9IG10ZF9yZWFk
KG10ZCwgb2Zmc2V0ICsgc2l6ZW9mKGhkciksIHNpemUsICZieXRlc19yZWFkLCBidWYpOworCWlm
IChlcnIgJiYgIW10ZF9pc19iaXRmbGlwKGVycikpIHsKKwkJcHJfZXJyKCJGYWlsZWQgdG8gcmVh
ZCBmcm9tICVzIGF0IDB4JXp4XG4iLCBtdGQtPm5hbWUsIG9mZnNldCArIHNpemVvZihoZHIpKTsK
KwkJZ290byBlcnJfa2ZyZWU7CisJfQorCisJYnVmW3NpemVdID0gJ1wwJzsKKworCW9mX25vZGVf
cHV0KG5wKTsKKworCXJldHVybiBidWY7CisKK2Vycl9rZnJlZToKKwlrZnJlZShidWYpOworZXJy
X3B1dDoKKwlvZl9ub2RlX3B1dChucCk7CisJcmV0dXJuIE5VTEw7Cit9CisKK3N0YXRpYyBpbnQg
bXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9wYXJzZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwK
KwkJCQkJICAgICAgY29uc3Qgc3RydWN0IG10ZF9wYXJ0aXRpb24gKipwcGFydHMsCisJCQkJCSAg
ICAgIHN0cnVjdCBtdGRfcGFydF9wYXJzZXJfZGF0YSAqZGF0YSkKK3sKKwlzdHJ1Y3QgbXRkX3Bh
cnRpdGlvbiAqcGFydHM7CisJY2hhciBuYW1lWzY1XTsKKwlzaXplX3Qgb2Zmc2V0OworCXNpemVf
dCBieXRlczsKKwljaGFyICpidWY7CisJaW50IGlkeDsKKwlpbnQgZXJyOworCisJcGFydHMgPSBr
Y2FsbG9jKFRQTElOS19TQUZFTE9BREVSX01BWF9QQVJUUywgc2l6ZW9mKCpwYXJ0cyksIEdGUF9L
RVJORUwpOworCWlmICghcGFydHMpIHsKKwkJZXJyID0gLUVOT01FTTsKKwkJZ290byBlcnJfb3V0
OworCX0KKworCWJ1ZiA9IG10ZF9wYXJzZXJfdHBsaW5rX3NhZmVsb2FkZXJfcmVhZF90YWJsZSht
dGQpOworCWlmICghYnVmKSB7CisJCWVyciA9IC1FTk9FTlQ7CisJCWdvdG8gZXJyX291dDsKKwl9
CisKKwlmb3IgKGlkeCA9IDAsIG9mZnNldCA9IFRQTElOS19TQUZFTE9BREVSX0RBVEFfT0ZGU0VU
OworCSAgICAgaWR4IDwgVFBMSU5LX1NBRkVMT0FERVJfTUFYX1BBUlRTICYmCisJICAgICBzc2Nh
bmYoYnVmICsgb2Zmc2V0LCAicGFydGl0aW9uICU2NHMgYmFzZSAweCVsbHggc2l6ZSAweCVsbHgl
em5cbiIsCisJCSAgICBuYW1lLCAmcGFydHNbaWR4XS5vZmZzZXQsICZwYXJ0c1tpZHhdLnNpemUs
ICZieXRlcykgPT0gMzsKKwkgICAgIGlkeCsrLCBvZmZzZXQgKz0gYnl0ZXMgKyAxKSB7CisJCXBh
cnRzW2lkeF0ubmFtZSA9IGtzdHJkdXAobmFtZSwgR0ZQX0tFUk5FTCk7CisJCWlmICghcGFydHNb
aWR4XS5uYW1lKSB7CisJCQllcnIgPSAtRU5PTUVNOworCQkJZ290byBlcnJfZnJlZTsKKwkJfQor
CX0KKworCWlmIChpZHggPT0gVFBMSU5LX1NBRkVMT0FERVJfTUFYX1BBUlRTKQorCQlwcl93YXJu
KCJSZWFjaGVkIG1heGltdW0gbnVtYmVyIG9mIHBhcnRpdGlvbnMhXG4iKTsKKworCWtmcmVlKGJ1
Zik7CisKKwkqcHBhcnRzID0gcGFydHM7CisKKwlyZXR1cm4gaWR4OworCitlcnJfZnJlZToKKwlm
b3IgKGlkeCAtPSAxOyBpZHggPj0gMDsgaWR4LS0pCisJCWtmcmVlKHBhcnRzW2lkeF0ubmFtZSk7
CitlcnJfb3V0OgorCXJldHVybiBlcnI7Cit9OworCitzdGF0aWMgdm9pZCBtdGRfcGFyc2VyX3Rw
bGlua19zYWZlbG9hZGVyX2NsZWFudXAoY29uc3Qgc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBwYXJ0
cywKKwkJCQkJCSBpbnQgbnJfcGFydHMpCit7CisJaW50IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwg
bnJfcGFydHM7IGkrKykKKwkJa2ZyZWUocHBhcnRzW2ldLm5hbWUpOworCisJa2ZyZWUocHBhcnRz
KTsKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRkX3BhcnNlcl90cGxp
bmtfc2FmZWxvYWRlcl9vZl9tYXRjaF90YWJsZVtdID0geworCXsgLmNvbXBhdGlibGUgPSAidHBs
aW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucyIgfSwKKwl7fSwKK307CitNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtdGRfcGFyc2VyX3RwbGlua19zYWZlbG9hZGVyX29mX21hdGNoX3RhYmxlKTsKKwor
c3RhdGljIHN0cnVjdCBtdGRfcGFydF9wYXJzZXIgbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRl
ciA9IHsKKwkucGFyc2VfZm4gPSBtdGRfcGFyc2VyX3RwbGlua19zYWZlbG9hZGVyX3BhcnNlLAor
CS5jbGVhbnVwID0gbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9jbGVhbnVwLAorCS5uYW1l
ID0gInRwbGluay1zYWZlbG9hZGVyIiwKKwkub2ZfbWF0Y2hfdGFibGUgPSBtdGRfcGFyc2VyX3Rw
bGlua19zYWZlbG9hZGVyX29mX21hdGNoX3RhYmxlLAorfTsKK21vZHVsZV9tdGRfcGFydF9wYXJz
ZXIobXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcik7CisKK01PRFVMRV9MSUNFTlNFKCJHUEwi
KTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
