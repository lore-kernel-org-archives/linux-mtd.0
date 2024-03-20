Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFD4C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 05:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j+gemHIFkk1SeWn/ILhlCSsB2BEcLeIJbqQE1WioVnQ=; b=V+upLAt3fnejyL
	+GwuMQHYl6voLNwv64WO9dXdgyFOTJ2WGadCEDfMgtLXtvfnXnO+KNkJWrv9NSgZlkqBSDTkun2cZ
	z6HGV8W4RmlekyWBvVdcrmpA1KzCRVHCwqUx6qy8rQ3vgjVftFpZJ3rh/xW4ZTnixnR/mfBhFHbt4
	d6HjX8dOzoD7RsZTuEErnPlxkQXJpZpDoMPjO4AKxL/wGBHHnEvD8Zl9yq2I3BO2PrmhpAg8AfZOT
	cS8PTqNYbGMnx/2SgxpazCKzZwg5OETCr6AqN7OhpdmXWntObmbN9yxhkV9ux46AyCGgZ3AgavIms
	IPAmMovHgz3y7Rjo0IYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmoRr-0000000FUzG-2r1R;
	Wed, 20 Mar 2024 05:25:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmoRo-0000000FUuR-1J70
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 05:25:10 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6aa5c5a6fso6024445b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2024 22:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710912300; x=1711517100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6C65Xih+p3VE132AwQb8aSpe0F0WPcTiDrQW5UHg7s=;
        b=YhwSpNm3kZQcAs6/mZLLOGOwNUvabWdLBNkTnAl5n568ZXnA+EDtYcFK/FS9+1Q5ui
         TYXmy/5qvYTavvF2KTGhyfFCArZcAhxHDSzUlkSjNm/eaAjxEWnbgRB+rEsuhvo3O8eW
         brGh5hc9WwS03+xbDBRXXTIADzP5nLHbDHJF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912300; x=1711517100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6C65Xih+p3VE132AwQb8aSpe0F0WPcTiDrQW5UHg7s=;
        b=IU3sTstfZlXlZAeW85c8EgyB+Pr/jA67GeNRmspFCSL4Y7+tj1/4ptyF7o3GkqFkLc
         NM7WY6E+JLMbNUqYjxL7plCdjdWMYWu4BekiLVNoVxvIyl1neIZd0BPfor05A41zvRln
         rbRI9Liwbiz9jOdUk9mIYplBccRPNv3CtAxdArjyCS1fMA0ZCAnh8IZapNtLGj9osw6o
         vRHmMmUAT2X1nJNC/nuSh73uMnhGuykJE/JnJSXp0E1g+bMiXjQr9+lmMTNCSvtufoPt
         tS1V1ZH9EghdhBfNYI98F4MVzOsuM79m2D5n/u4kbTRkJCsKUaPtmjZKuEDdqy19MX4m
         sGnQ==
X-Gm-Message-State: AOJu0YxsodNyFb86DLvEFIvPlembVnKEqFALcVMEPi8U6fglw0Rw48W2
	nT11fTX6TM2Sy3jEQbrDxm2gVO5bFwjqggD6RPKwZc3O/R5oI2Ess6eBZel8og==
X-Google-Smtp-Source: AGHT+IGsHqqJIAPjFPjRAtgKAljffZjP7ejm8HcysZ8aeHp7Kmx5hQH5j0ux4Flud82CZIzyswbhEA==
X-Received: by 2002:a05:6a20:9f4f:b0:1a3:115b:acb5 with SMTP id ml15-20020a056a209f4f00b001a3115bacb5mr18621969pzb.21.1710912300158;
        Tue, 19 Mar 2024 22:25:00 -0700 (PDT)
Received: from chromium.org ([202.144.206.254])
        by smtp.gmail.com with ESMTPSA id sb14-20020a17090b50ce00b0029ffba4bf0esm572355pjb.19.2024.03.19.22.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 22:24:59 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
Date: Wed, 20 Mar 2024 18:24:48 +1300
Message-Id: <20240320052449.175786-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_222508_404389_70C0874E 
X-CRM114-Status: GOOD (  21.96  )
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

QWRkIHRocmVlIHByb3BlcnRpZXMgZm9yIGNvbnRyb2xsaW5nIGFsaWdubWVudCBvZiBwYXJ0aXRp
b25zLCBha2EKJ2VudHJpZXMnIGluIGZpeGVkLXBhcnRpdGlvbi4KCkZvciBub3cgdGhlcmUgaXMg
bm8gZXhwbGljaXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3Qg
dGhlICdmaXhlZC1wYXJ0aXRpb25zJyBub2RlLgoKVGhlc2UgbmV3IHByb3BlcnRpZXMgYXJlIGlu
cHV0cyB0byB0aGUgQmlubWFuIHBhY2thZ2luZyBwcm9jZXNzLCBidXQgYXJlCmFsc28gbmVlZGVk
IGlmIHRoZSBmaXJtd2FyZSBpcyByZXBhY2tlZCwgdG8gZW5zdXJlIHRoYXQgYWxpZ25tZW50CmNv
bnN0cmFpbnRzIGFyZSBub3QgdmlvbGF0ZWQuIFRoZXJlZm9yZSB0aGV5IGFyZSBwcm92aWRlZCBh
cyBwYXJ0IG9mCnRoZSBzY2hlbWEuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNo
cm9taXVtLm9yZz4KLS0tCgpDaGFuZ2VzIGluIHY5OgotIE1vdmUgYmluZGluZyBleGFtcGxlIHRv
IG5leHQgYmF0Y2ggdG8gYXZvaWQgYnVpbGQgZXJyb3IKCkNoYW5nZXMgaW4gdjc6Ci0gRHJvcCBw
YXRjaCAnQWRkIGJpbm1hbiBjb21wYXRpYmxlJwotIFB1dCB0aGUgYWxpZ25tZW50IHByb3BlcnRp
ZXMgaW50byB0aGUgZml4ZWQtcGFydGl0aW9uIGJpbmRpbmcKCkNoYW5nZXMgaW4gdjY6Ci0gQ29y
cmVjdCBzY2hlbWEtdmFsaWRhdGlvbiBlcnJvcnMgbWlzc2VkIGR1ZSB0byBvbGRlciBkdC1zY2hl
bWEKICAoZW51bSBmaXggYW5kIHJlZyBhZGRpdGlvbikKCkNoYW5nZXMgaW4gdjU6Ci0gQWRkIHZh
bHVlIHJhbmdlcwotIENvbnNpc3RlbnRseSBtZW50aW9uIGFsaWdubWVudCBtdXN0IGJlIHBvd2Vy
LW9mLTIKLSBNZW50aW9uIHRoYXQgYWxpZ25tZW50IHJlZmVycyB0byBieXRlcwoKQ2hhbmdlcyBp
biB2MjoKLSBGaXggJ2EnIHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UKCiAuLi4vYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgfCA1MSArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24u
eWFtbAppbmRleCAxZWJlOWUyMzQ3ZWEuLjM5YzdkNzY3Mjc4MyAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9w
YXJ0aXRpb24ueWFtbApAQCAtNTcsNiArNTcsNTcgQEAgcHJvcGVydGllczoKICAgICAgIHVzZXIg
c3BhY2UgZnJvbQogICAgIHR5cGU6IGJvb2xlYW4KIAorICBhbGlnbjoKKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBtaW5pbXVtOiAxCisgICAg
bWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxlT2Y6IDIKKyAgICBkZXNjcmlwdGlvbjoK
KyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRyeSBpbiBieXRlcy4KKwor
ICAgICAgVGhlIGVudHJ5IG9mZnNldCBpcyBhZGp1c3RlZCBzbyB0aGF0IHRoZSBlbnRyeSBzdGFy
dHMgb24gYW4gYWxpZ25lZAorICAgICAgYm91bmRhcnkgd2l0aGluIHRoZSBjb250YWluaW5nIHNl
Y3Rpb24gb3IgaW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWduID0KKyAgICAgIDwxNj7igJkgbWVh
bnMgdGhhdCB0aGUgZW50cnkgd2lsbCBzdGFydCBvbiBhIDE2LWJ5dGUgYm91bmRhcnkuIFRoaXMg
bWF5CisgICAgICBtZWFuIHRoYXQgcGFkZGluZyBpcyBhZGRlZCBiZWZvcmUgdGhlIGVudHJ5LiBU
aGUgcGFkZGluZyBpcyBwYXJ0IG9mCisgICAgICB0aGUgY29udGFpbmluZyBzZWN0aW9uIGJ1dCBp
cyBub3QgaW5jbHVkZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5nIHRoYXQKKyAgICAgIGFuIGVtcHR5
IHNwYWNlIG1heSBiZSBjcmVhdGVkIGJlZm9yZSB0aGUgZW50cnkgc3RhcnRzLiBBbGlnbm1lbnQK
KyAgICAgIG11c3QgYmUgYSBwb3dlciBvZiAyLiBJZiDigJhhbGlnbuKAmSBpcyBub3QgcHJvdmlk
ZWQsIG5vIGFsaWdubWVudCBpcworICAgICAgcGVyZm9ybWVkLgorCisgIGFsaWduLXNpemU6Cisg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisgICAgbWlu
aW11bTogMQorICAgIG1heGltdW06IDB4ODAwMDAwMDAKKyAgICBtdWx0aXBsZU9mOiAyCisgICAg
ZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMgdGhlIGFsaWdubWVudCBvZiB0aGUgZW50cnkg
c2l6ZSBpbiBieXRlcy4gSXQgbXVzdCBiZSBhIHBvd2VyCisgICAgICBvZiAyLgorCisgICAgICBG
b3IgZXhhbXBsZSwgdG8gZW5zdXJlIHRoYXQgdGhlIHNpemUgb2YgYW4gZW50cnkgaXMgYSBtdWx0
aXBsZSBvZiA2NAorICAgICAgYnl0ZXMsIHNldCB0aGlzIHRvIDY0LiBXaGlsZSB0aGlzIGRvZXMg
bm90IGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlCisgICAgICBlbnRyeSB3aXRoaW4gYmlubWFu
IGl0c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9ybWVkIG9ubHkgd2hlbiBpdHMKKyAgICAgIHBh
cmVudCBzZWN0aW9uIGlzIGFzc2VtYmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlIGVu
dHJ5IGVuZHMKKyAgICAgIHdpdGggdGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDi
gJhhbGlnbi1zaXpl4oCZIGlzIG5vdCBwcm92aWRlZCwKKyAgICAgIG5vIGFsaWdubWVudCBpcyBw
ZXJmb3JtZWQuCisKKyAgYWxpZ24tZW5kOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06IDEKKyAgICBtYXhpbXVtOiAweDgwMDAw
MDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBzZXRz
IHRoZSBhbGlnbm1lbnQgKGluIGJ5dGVzKSBvZiB0aGUgZW5kIG9mIGFuIGVudHJ5IHdpdGggcmVz
cGVjdAorICAgICAgdG8gdGhlIGNvbnRhaW5pbmcgc2VjdGlvbi4gSXQgbXVzdCBiZSBhIHBvd2Vy
IG9mIDIuCisKKyAgICAgIFNvbWUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhleSBlbmQgb24gYW4g
YWxpZ25tZW50IGJvdW5kYXJ5LAorICAgICAgcmVnYXJkbGVzcyBvZiB3aGVyZSB0aGV5IHN0YXJ0
LiBUaGlzIGRvZXMgbm90IG1vdmUgdGhlIHN0YXJ0IG9mIHRoZQorICAgICAgZW50cnksIHNvIHRo
ZSBjb250ZW50cyBvZiB0aGUgZW50cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0aGUgYmVnaW5uaW5n
LgorICAgICAgQnV0IHRoZXJlIG1heSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQuIFdoaWxlIHRoaXMg
ZG9lcyBub3QgYWZmZWN0IHRoZQorICAgICAgY29udGVudHMgb2YgdGhlIGVudHJ5IHdpdGhpbiBi
aW5tYW4gaXRzZWxmICh0aGUgcGFkZGluZyBpcyBwZXJmb3JtZWQKKyAgICAgIG9ubHkgd2hlbiBp
dHMgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1bHQgaXMgdGhhdCB0
aGUKKyAgICAgIGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZyBieXRlcywgc28gbWF5IGdyb3cu
IElmIOKAmGFsaWduLWVuZOKAmSBpcyBub3QKKyAgICAgIHByb3ZpZGVkLCBubyBhbGlnbm1lbnQg
aXMgcGVyZm9ybWVkLgorCiBpZjoKICAgbm90OgogICAgIHJlcXVpcmVkOiBbIHJlZyBdCi0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
