Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D59E82CCF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFOlAG9dUP01RG9/+79a4pdVqK45xiTirmONL1mdq+o=; b=oZF9qZmwxu06eX
	L0/6WB2DzevEj0qifGcWwt8iQG9AnTVIB6XoVthZvV8lwX++k2P7Y3yqQYLeR+3K3C0UNPvVIApBr
	X6a00eL1HtYZnxvCu/zXn23v5l7BDYwXtRhKrlaUCpcFdcdgSZchvDfgDhIt2+eXw4Yn1m8J8EcX2
	7GU7+p/oE34gt8vRiVi3T/TzU4nauMQXA/IXDClDNTDTu292Vl55FWtnHdLwYyRXa0VUluRfqeYXJ
	v37dZvP4eDGl9pdf/vo0SNZWsUNjUrTBbJUeUlGLX6zYUqCTs/S2TqCXIVbI8ljXfcbk0ESGOxKbT
	1a7UlAlijh2T8IanxCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb21-001iuM-3B;
	Wed, 27 Sep 2023 20:21:14 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb1x-001itC-2Y
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 20:21:12 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-79f909071c3so409711539f.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695846068; x=1696450868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIjs+rwErzRuI8OpZgfCnKlE1NGemok/NR/4pjhGmqU=;
        b=nrhvMdKE+GtXiTJ/2+Z1ErjKtAn78B+Y3oiKFTw0SH0GlqrHzfPn+nauFU4K1hcl5x
         +pNOCJXJ7IFKd1odCzsDI9mDMtkaJ4cf7uBO8zFFLUP4P6lHJ4ugC9pkLqDoBPO86yoR
         nEGO5NGnjtj8uWrexFKJj65eYJXdjtj8JRZFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846068; x=1696450868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIjs+rwErzRuI8OpZgfCnKlE1NGemok/NR/4pjhGmqU=;
        b=hVeAEcN5ZnnpXtmKgkt9cv7d2nbwQCLFRVFz/1vZrT/dLSPqzJLaF6TdZ8bfOyhl+8
         +oqG1ckesYkBvxjPsgIzGLF4ryAdGxPWYKVTIJoQwWTzgjfD3Bnt4jnvQDWlhhYufBmc
         J2VYq5yJ/W/SQy6+Ag7AEGgs2W4q/RzLkMCHgMJQwVHFcFhrfeNXWH0X/6nsxuKOgpWu
         i3qhX13UAvJpfVq/Bl1pxQyODMhOf4aYkoKHNZU5W0fjTMHQwoZ2dxivP+8GKOMYEc5A
         vrKIfIBv5CwJb63c5w9zt9GmJIOvff4Tpph0e1dYGxU/+TGQm/Wle6TUzOqQKByrizLM
         mSIw==
X-Gm-Message-State: AOJu0YzaixAtIdyTCFqMZRfWxZvkM8GkzsrE6KYyhIA557YzzPUbW7ej
	LIZDb7eWrtfjkhIB9oUjXySZOA==
X-Google-Smtp-Source: AGHT+IE/xm+sDlsbj5TMwcIX6s89wG1zzgEzTIKDltB0ZdFPBg7kOF1N3Y/GeFEAB8keQ7aPZmfbKQ==
X-Received: by 2002:a5e:dd02:0:b0:79a:b526:2f1c with SMTP id t2-20020a5edd02000000b0079ab5262f1cmr3230494iop.21.1695846067982;
        Wed, 27 Sep 2023 13:21:07 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:5d4f:fe51:5575:6f76])
        by smtp.gmail.com with ESMTPSA id ei15-20020a05663829af00b0042fec8620e4sm4113299jab.57.2023.09.27.13.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:21:07 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dhruva Gole <d-gole@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <ptyadav@amazon.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
Date: Wed, 27 Sep 2023 14:20:51 -0600
Message-ID: <20230927202057.3676497-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_132109_905748_0FDB4C28 
X-CRM114-Status: GOOD (  17.42  )
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

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGJpbm1hbiwgc28gd2UgY2FuIGV4dGVuZCBmaXhl
ZC1wYXJ0aXRpb25zCmluIHZhcmlvdXMgd2F5cy4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIEdsYXNz
IDxzamdAY2hyb21pdW0ub3JnPgotLS0KCiAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlu
bWFuLnlhbWwgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrCiAuLi4vbXRkL3BhcnRpdGlv
bnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAgICAgfCAgNiArKysKIC4uLi9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwgICB8ICAxICsKIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiA0IGZpbGVzIGNoYW5nZWQsIDYxIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlh
bWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zNGZkMTBjMWEzMTgK
LS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvYmlubWFuLnlhbWwKQEAgLTAsMCArMSw0OSBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorIyBDb3B5cmlnaHQgMjAyMyBH
b29nbGUgTExDCisKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sIworJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBCaW5tYW4gZmlybXdh
cmUgbGF5b3V0CisKK21haW50YWluZXJzOgorICAtIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0u
b3JnPgorCitzZWxlY3Q6IGZhbHNlCisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBiaW5tYW4gbm9k
ZSBwcm92aWRlcyBhIGxheW91dCBmb3IgZmlybXdhcmUsIHVzZWQgd2hlbiBwYWNrYWdpbmcgZmly
bXdhcmUKKyAgZnJvbSBtdWx0aXBsZSBwcm9qZWN0cy4gSXQgaXMgYmFzZWQgb24gZml4ZWQtcGFy
dGl0aW9ucywgd2l0aCBzb21lCisgIGV4dGVuc2lvbnMuCisKKyAgRG9jdW1lbnRhdGlvbiBmb3Ig
QmlubWFuIGlzIGF2YWlsYWJsZSBhdDoKKworICBodHRwczovL3UtYm9vdC5yZWFkdGhlZG9jcy5p
by9lbi9sYXRlc3QvZGV2ZWxvcC9wYWNrYWdlL2Jpbm1hbi5odG1sCisKKyAgd2l0aCB0aGUgY3Vy
cmVudCBpbWFnZS1kZXNjcmlwdGlvbiBmb3JtYXQgYXQ6CisKKyAgaHR0cHM6Ly91LWJvb3QucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbCNpbWFnZS1k
ZXNjcmlwdGlvbi1mb3JtYXQKKworYWxsT2Y6CisgIC0gJHJlZjogL3NjaGVtYXMvbXRkL3BhcnRp
dGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxl
OgorICAgIGNvbnN0OiBiaW5tYW4KKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4
YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJi
aW5tYW4iLCAiZml4ZWQtcGFydGl0aW9ucyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKKworICAgICAgICBwYXJ0aXRpb24tdS1ib290
QDEwMDAwMCB7CisgICAgICAgICAgICBsYWJlbCA9ICJ1LWJvb3QiOworICAgICAgICAgICAgcmVn
ID0gPDB4MTAwMDAwIDB4ZjAwMDAwPjsKKyAgICAgICAgfTsKKyAgICB9OwpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBh
cnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKaW5kZXggMzMxZTU2NGYyOWRjLi4xYzA0YmMy
Yjk1YWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbApAQCAt
MTQsNiArMTQsOSBAQCBkZXNjcmlwdGlvbjogfAogICBUaGUgcGFydGl0aW9uIHRhYmxlIHNob3Vs
ZCBiZSBhIG5vZGUgbmFtZWQgInBhcnRpdGlvbnMiLiBQYXJ0aXRpb25zIGFyZSB0aGVuCiAgIGRl
ZmluZWQgYXMgc3Vibm9kZXMuCiAKKyAgVGhlIEJpbm1hbiB0b29sIHByb3ZpZGVzIHNvbWUgZW5o
YW5jZWQgZmVhdHVyZXMsIHNvIHByb3ZpZGVzIGEgY29tcGF0aWJsZQorICBzdHJpbmcgdG8gaW5k
aWNhdGUgdGhhdCB0aGVzZSBhcmUgcGVybWl0dGVkLgorCiBtYWludGFpbmVyczoKICAgLSBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CiAKQEAgLTI0LDYgKzI3LDkgQEAgcHJvcGVy
dGllczoKICAgICAgIC0gaXRlbXM6CiAgICAgICAgICAgLSBjb25zdDogc2VyY29tbSxzYy1wYXJ0
aXRpb25zCiAgICAgICAgICAgLSBjb25zdDogZml4ZWQtcGFydGl0aW9ucworICAgICAgLSBpdGVt
czoKKyAgICAgICAgICAtIGNvbnN0OiBiaW5tYW4KKyAgICAgICAgICAtIGNvbnN0OiBmaXhlZC1w
YXJ0aXRpb25zCiAKICAgIiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQogCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Bh
cnRpdGlvbnMueWFtbAppbmRleCAxZGRhMmM4MDc0N2IuLjg0OWZkMTVkMDg1YyAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRp
dGlvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvcGFydGl0aW9ucy55YW1sCkBAIC0xNSw2ICsxNSw3IEBAIG1haW50YWluZXJzOgog
CiBvbmVPZjoKICAgLSAkcmVmOiBhcm0sYXJtLWZpcm13YXJlLXN1aXRlLnlhbWwKKyAgLSAkcmVm
OiBiaW5tYW4ueWFtbAogICAtICRyZWY6IGJyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwKICAg
LSAkcmVmOiBicmNtLGJjbTk0N3h4LWNmZS1wYXJ0aXRpb25zLnlhbWwKICAgLSAkcmVmOiBmaXhl
ZC1wYXJ0aXRpb25zLnlhbWwKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMK
aW5kZXggNWYxOGM2YmEzYzNjLi4zNjdjODQzZWMzNDggMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJT
CisrKyBiL01BSU5UQUlORVJTCkBAIC0zNTE3LDYgKzM1MTcsMTEgQEAgRjoJRG9jdW1lbnRhdGlv
bi9maWxlc3lzdGVtcy9iZnMucnN0CiBGOglmcy9iZnMvCiBGOglpbmNsdWRlL3VhcGkvbGludXgv
YmZzX2ZzLmgKIAorQklOTUFOCitNOglTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KK1M6
CVN1cHBvcnRlZAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL2Jpbm1hbioKKwogQklUTUFQIEFQSQogTToJWXVyeSBOb3JvdiA8eXVyeS5ub3JvdkBn
bWFpbC5jb20+CiBSOglBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4KLS0gCjIuNDIuMC41MTUuZzM4MGZjN2NjZDEtZ29vZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
