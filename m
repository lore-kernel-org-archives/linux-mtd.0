Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6ABCCA476
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Oct 2025 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOUYW74Vdk7GNeljuSL8r2lDThKU8x3NAnGmJIcZWe8=; b=h+lD0HbJ2JHfAF
	rAY0a7ROp85ztrful+H/ATzaLHUpZIYAs64WyGV8x1la4oVUrSl7ktSLRDOs+Fwv2AlegoVB1A6It
	sGdvxGKEc8AT5yku08mpaXnecLXEAXQswZNuPfwKpwYv7Qi/azdWx5TccCmZoMJTpiMWATPd7Mhxf
	9ptrhlqrfZS0dR3M9yhIBQt9r5lKpLti80yVFq0UpUTSLehjF1sABqILnn6G3Qhdccik50CrjFrTm
	lSmUEYpOFE3hoMVd63qXHnA6WcJBVrIh/v3IbxutPCy5yOiwDLglBleyyRWbn69MEMffv+yesrTCR
	Yw28z6GL9t6IbH0TV3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WvM-0000000A2WR-3tDU;
	Sat, 11 Oct 2025 10:34:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WvK-0000000A2Vg-1UsW
	for linux-mtd@lists.infradead.org;
	Sat, 11 Oct 2025 10:34:03 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b4c89df6145so464675366b.3
        for <linux-mtd@lists.infradead.org>; Sat, 11 Oct 2025 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178840; x=1760783640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=;
        b=N+BCSg2ZnzgoSGhdXx+QyaLNNWrITMdFEDXyj04m1+s5hFnAXVt11RNqlYbbaYr59N
         V2ABPIZbTQN5JvYEFbVndL52bvzY1V9gpg5Ks9meAu0KDXPIDaWlK5J39ZlN/lD7k/kb
         1MXDwz58ngUxZ1xRbtn/1v1e9mhe9aQ2NrU7/B53FhwzzKPWO+ugjHKZ7A4Tl2/xWQ07
         wkcXGujtQK5h5Q4GAQKkTl8xsKm40ZvI5GnsvDHfF55NEfN8LitQHDh5BeoqyU5y/TI0
         jln6mQlBSfyv+ABuEtzpULJmcX2Eb+b6yf9pSKWkr8bNNWt8Fhql+x3XVhXPmAUpnHd1
         1Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178840; x=1760783640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYAPdYV4D3yX5RzlvX7A+6gcHuPHfoEYTyIdk9OJfZs=;
        b=lDwAHo2rnz0qPQ77oBR2yj9HThH0FrTld9VkZ9Y1acBs7pi87RJzZUmB/1HGsMyQbv
         izNbaiMt9v6E1kNMMSIgUeYOtGrO87WrgWu62gf/6lBixk7yF0Vr9uKGVCNtrMTU18Lb
         Qkeg7NUOCSHysLrdVUpC13z7dQHeBhEMSFmW3he3D39Djj0gv9tzOYAMHV0K+3JitHFZ
         XRmW1oVJ+pl0cQhj2VyfLSr2FwtzPxE0/i8Cntqzc8Wnx5Mjo8kvzDpqQtiux4MNyHJz
         Dhz92owHzGZ6V7SDImi3m0MfgBEFu1fY5swdo+5JLo4j33jApxvaVrK3pcBFQpeT49MP
         ibXA==
X-Forwarded-Encrypted: i=1; AJvYcCWeAnh3hsBC27wTzcve28IQuJopyvpWnSGuQOpqYyRc1GZANU+1zZXYkqzZx4hkB+1Q+RvWmZxBA6U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3M272WHiJLh3weCJYzNIFPELkp47k6JfUWbOvcdR0VeOzZarx
	3zOaxoFnKM5GO/4KCG8IvXTpzktrm+05bRHDSEoZQimqO+Eo+zbIpEOj
X-Gm-Gg: ASbGncudm8Xxld2g+G8scj8LToFcnUDz52nKxYLIt/4CG8V0QOuKnTIjfRUEWR5kTtx
	i4deAn+PcC7DVMiS7+7nRRaGJoyVAuwhG46D1uj8GlTrDrudrgBPFA9OnOKiN92I2vgu3ZIgGzO
	WVrqcowdDwhLcuWi9PduBIMWGaZAXoTyIveoNBX9anSvOhk+pSHSxb57zqXESW/tilerZE64cG2
	XsY7a3vOQs6MqgP6BWV5Mb6sESB4JmBzBkT3SATkVzQ6HfdHrLgEKIRo7ajYZaVQq6WlXO4vbpg
	fM+whfSg40DhuKajsDTLfOniESFQe6U+kcidKT0/gtCQ2ae1NfMu3U1LLx9CzB9Q3SPaHy2dyY9
	XJCk/z3zgvk9t8MO97iz6w0nNKIDN1DVy+SsbiN7aQje53FgrW55UN1ACsnnoH6dIRI1H2aZCtw
	==
X-Google-Smtp-Source: AGHT+IFFycSQY4Q0kx0MQ3fB8e1/4xrhlffbTRZSX2gxi2804bwlqcuj20iB5WX1bDTyi44c3l+bjA==
X-Received: by 2002:a17:907:6d07:b0:b41:79ff:250c with SMTP id a640c23a62f3a-b50aaa96ba5mr1457625766b.23.1760178840185;
        Sat, 11 Oct 2025 03:34:00 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124a8sm454690166b.51.2025.10.11.03.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:33:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
Date: Sat, 11 Oct 2025 12:33:58 +0200
Message-ID: <4682810.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251010084042.341224-4-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_033402_438953_C66A7DC8 
X-CRM114-Status: GOOD (  15.19  )
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

RG5lIHBldGVrLCAxMC4gb2t0b2JlciAyMDI1IG9iIDEwOjQwOjMwIFNyZWRuamVldnJvcHNraSBw
b2xldG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYxNiBoYXMg
YSBOQU5EIGNvbnRyb2xsZXIgcXVpdGUgc2ltaWxhciB0byB0aGUgQTEwL0EyMyBvbmVzLCBidXQK
PiB3aXRoIHNvbWUgcmVnaXN0ZXIgZGlmZmVyZW5jZXMsIG1vcmUgY2xvY2tzIChmb3IgRUNDIGFu
ZCBNQlVTKSwgbW9yZSBFQ0MKPiBzdHJlbmd0aHMsIHNvIHRoaXMgcmVxdWlyZXMgYSBuZXcgY29t
cGF0aWJsZSBzdHJpbmcuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBOQU5EIGNvbnRyb2xsZXIg
bm9kZSBhbmQgcGlucyBpbiB0aGUgZGV2aWNlIHRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlj
aGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGJvb3RsaW4uY29tPgo+IC0tLQo+ICAuLi4vYXJt
NjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNjE2LmR0c2kgfCA1MCArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNjE2LmR0c2kgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYxNi5kdHNpCj4gaW5kZXggY2VlZGFl
OWUzOTliLi42MDYyNmViYTdmN2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bjUwaS1oNjE2LmR0c2kKPiBAQCAtMjc4LDYgKzI3OCwzNyBAQCBpcl9yeF9waW46
IGlyLXJ4LXBpbiB7Cj4gIAkJCQlmdW5jdGlvbiA9ICJpcl9yeCI7Cj4gIAkJCX07Cj4gIAo+ICsJ
CQluYW5kX3BpbnM6IG5hbmQtcGlucyB7Cj4gKwkJCQlwaW5zID0gIlBDMCIsICJQQzEiLCAiUEMy
IiwgIlBDNSIsICJQQzgiLCAiUEM5IiwKPiArCQkJCSAgICAgICAiUEMxMCIsICJQQzExIiwgIlBD
MTIiLCAiUEMxMyIsICJQQzE0IiwKPiArCQkJCSAgICAgICAiUEMxNSIsICJQQzE2IjsKPiArCQkJ
CWZ1bmN0aW9uID0gIm5hbmQwIjsKPiArCQkJfTsKPiArCj4gKwkJCW5hbmRfY3MwX3BpbjogbmFu
ZC1jczAtcGluIHsKPiArCQkJCXBpbnMgPSAiUEM0IjsKPiArCQkJCWZ1bmN0aW9uID0gIm5hbmQw
IjsKPiArCQkJCWJpYXMtcHVsbC11cDsKPiArCQkJfTsKPiArCj4gKwkJCW5hbmRfY3MxX3Bpbjog
bmFuZC1jczEtcGluIHsKPiArCQkJCXBpbnMgPSAiUEMzIjsKPiArCQkJCWZ1bmN0aW9uID0gIm5h
bmQwIjsKPiArCQkJCWJpYXMtcHVsbC11cDsKPiArCQkJfTsKPiArCj4gKwkJCW5hbmRfcmIwX3Bp
bjogbmFuZC1yYjAtcGluIHsKPiArCQkJCXBpbnMgPSAiUEM2IjsKPiArCQkJCWZ1bmN0aW9uID0g
Im5hbmQwIjsKPiArCQkJCWJpYXMtcHVsbC11cDsKPiArCQkJfTsKPiArCj4gKwkJCW5hbmRfcmIx
X3BpbjogbmFuZC1yYjEtcGluIHsKPiArCQkJCXBpbnMgPSAiUEM3IjsKPiArCQkJCWZ1bmN0aW9u
ID0gIm5hbmQwIjsKPiArCQkJCWJpYXMtcHVsbC11cDsKPiArCQkJfTsKPiArCj4gIAkJCW1tYzBf
cGluczogbW1jMC1waW5zIHsKPiAgCQkJCXBpbnMgPSAiUEYwIiwgIlBGMSIsICJQRjIiLCAiUEYz
IiwKPiAgCQkJCSAgICAgICAiUEY0IiwgIlBGNSI7Cj4gQEAgLTQ0MCw2ICs0NzEsMjUgQEAgbW1j
MjogbW1jQDQwMjIwMDAgewo+ICAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiAgCQl9Owo+ICAKPiAr
CQluZmM6IG5hbmQtY29udHJvbGxlckA0MDExMDAwIHsKCk5vZGVzIGFyZSBzb3J0ZWQgYnkgbWVt
b3J5IGFkZHJlc3MuIFNvIHRoaXMgb25lIHNob3VsZCBiZSBtb3ZlZCBiZWZvcmUKbW1jMiBhbmQg
cG9zc2libHkgb3RoZXJzLgoKPiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2
MTYtbmFuZC1jb250cm9sbGVyIjsKPiArCQkJcmVnID0gPDB4MDQwMTEwMDAgMHgxMDAwPjsKPiAr
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQlj
bG9ja3MgPSA8JmNjdSBDTEtfQlVTX05BTkQ+LCA8JmNjdSBDTEtfTkFORDA+LAo+ICsJCQkJPCZj
Y3UgQ0xLX05BTkQxPiwgPCZjY3UgQ0xLX01CVVNfTkFORD47Cj4gKwkJCWNsb2NrLW5hbWVzID0g
ImFoYiIsICJtb2QiLCAiZWNjIiwgIm1idXMiOwo+ICsJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVT
X05BTkQ+Owo+ICsJCQlyZXNldC1uYW1lcyA9ICJhaGIiOwo+ICsJCQlkbWFzID0gPCZkbWEgMTA+
Owo+ICsJCQlkbWEtbmFtZXMgPSAicnh0eCI7Cj4gKwkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7Cj4gKwkJCXBpbmN0cmwtMCA9IDwmbmFuZF9waW5zPiwgPCZuYW5kX2NzMF9waW4+LAo+ICsJ
CQkJPCZuYW5kX2NzMV9waW4+LCA8Jm5hbmRfcmIwX3Bpbj4sCj4gKwkJCQk8Jm5hbmRfcmIxX3Bp
bj47CgpBcmUgeW91IHN1cmUgdGhhdCBlYWNoIG5hbmQgZGV2aWNlIHdpbGwgdXNlIGV4YWN0bHkg
dGhpcyBwaW4gY29uZmlndXJhdGlvbj8KSUlVQywgbm90IGFsbCBjaGlwcyB3aWxsIGhhdmUgdHdv
IENTIGFuZCB0d28gUkIgcGlucy4gSWYgc28sIHBpbmN0cmwgbm9kZXMKc2hvdWxkIGJlIG1vdmVk
IHRvIGRldmljZSBEVCBhbmQgcGlucyBzdWJub2RlcyBzaG91bGQgYmUgbWFya2VkIHdpdGgKL29t
aXQtaWYtbm8tcmVmLy4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+ICsJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwkJfTsKPiArCj4gIAkJdWFydDA6
IHNlcmlhbEA1MDAwMDAwIHsKPiAgCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsK
PiAgCQkJcmVnID0gPDB4MDUwMDAwMDAgMHg0MDA+Owo+IAoKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
