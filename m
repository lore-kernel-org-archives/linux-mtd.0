Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239A3C54E67
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 20:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I7Al6mLvG112NJLAOJJxMCQD4FAdbi+7Trae2yP3rH0=; b=HCiVSd+yxkSKPY
	c32RI1OuEYK+93m6TjR6jNfBzdfd2e0qr1JqDY0eqAiXTa+5tlRm2kBCI1VQFRoW43qiUOlkX0RMx
	7oFyKRDEAqoVtDvXItDGoaxGTknXYT6By7PjkyMk2awEl+rga2fiWr+5tcFbmU8jpK1mppG6M5j3k
	sDGNljpIetcgBK4vuxhpYY+ExDGlRsdFz8CqbzoxnPcDAnPd9VY6y1qbi2Cui/AqxRf9FNtcNTxaq
	nVqR3MVLtSzPtzcGkhzK9d0mSTR/TTyt5y6Z1LbzWYbZOeOQw5z86lKeoRhzjZQJTlpzEg0gNQ1E7
	UEYGotcHyScYbhQ0wKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpD4T-00000006G5q-4A4t;
	Tue, 26 Mar 2024 20:06:57 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpD4Q-00000006G4N-21td
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 20:06:56 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36894e0aaabso9441015ab.2
        for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2024 13:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711483612; x=1712088412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lOoqtTXqNB7CbouRAVSQd0zkiIBmv+wfES6PKWSZxek=;
        b=UxuHphK/kF8toGkaN0vS7HiPOdQj6cdg4BovULYeGzYACJT/P1OElWt+RItbE3PhnG
         BUmU60uyh5g2t/Q992KS13EponglkGEdqfIaN0na8hlYFH3Eztna5r0m79h8sFfpbkUn
         TJ2DzlbYbyc/FNDrc8wpcFSkdRUpRAlLn3So4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711483612; x=1712088412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOoqtTXqNB7CbouRAVSQd0zkiIBmv+wfES6PKWSZxek=;
        b=gW3ezMmuJwTKStLEq+FcVQzubKUt4C2H8jsQVx/gHpoxFANMd/IwvKya4m9rdxOYbk
         OY5T98hhJ+cdkU5oQYNi8+2c4RX4jVtLy+0u/0XuTRxxUiGKKwe/mxnxBq1C0SRr++GI
         7PTit3Y5+/TiYiud/l+ErLm7AFSXoTDbiYaSlsClBgkdqIqcXki6XtJVuiOMrHZ2cDp9
         PdAhllze/Ox9gsIYQNBnDwhWt26r8MsNtCkWHljPZU+SMvDL4X5bn0ppQmIqtNQ4kDBv
         2WzC8ekGcVdsDKcYfNlJhwvXCRjwqQMooA+ns15JXordmYbidj5d5JlBc8PPxcW4nkiU
         dynw==
X-Forwarded-Encrypted: i=1; AJvYcCWcB46B/W9DcJ5v1wdMj52pSdmeb9rjLmZPqfbZ0pxNU6f1itcR18Vs3p0zmW2mA1E7Qmf6bukTJODD2NDhorooqeSmJWDe4TBRSnmbpg==
X-Gm-Message-State: AOJu0Yx69hyF72wqYeCihvkbTROnJVaOALYTmtZ7YDzxGPFfIPpC2vFQ
	TjH5IVwFNEPQQ3xFGMSdb5eLR3jHykNwwytwCjzz5mtwBVPfsOn8hpcFItq5Og==
X-Google-Smtp-Source: AGHT+IHTocnVcq9cstKtXGBQJuOibTyGsdLxHD14zpbkXXj+IHMGiLoZQLlFXo7FItBICbelmkTerw==
X-Received: by 2002:a92:ce50:0:b0:365:e274:5e55 with SMTP id a16-20020a92ce50000000b00365e2745e55mr908968ilr.7.1711483612066;
        Tue, 26 Mar 2024 13:06:52 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id f4-20020a92cb44000000b0036896f76593sm1002343ilq.85.2024.03.26.13.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:06:51 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
Date: Tue, 26 Mar 2024 14:06:44 -0600
Message-Id: <20240326200645.1182803-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_130654_702003_177202B0 
X-CRM114-Status: GOOD (  22.20  )
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
cm9taXVtLm9yZz4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0t
LQoKQ2hhbmdlcyBpbiB2MTA6Ci0gVXBkYXRlIHRoZSBtaW5pbXVtIHRvIDIKCkNoYW5nZXMgaW4g
djk6Ci0gTW92ZSBiaW5kaW5nIGV4YW1wbGUgdG8gbmV4dCBiYXRjaCB0byBhdm9pZCBidWlsZCBl
cnJvcgoKQ2hhbmdlcyBpbiB2NzoKLSBEcm9wIHBhdGNoICdBZGQgYmlubWFuIGNvbXBhdGlibGUn
Ci0gUHV0IHRoZSBhbGlnbm1lbnQgcHJvcGVydGllcyBpbnRvIHRoZSBmaXhlZC1wYXJ0aXRpb24g
YmluZGluZwoKQ2hhbmdlcyBpbiB2NjoKLSBDb3JyZWN0IHNjaGVtYS12YWxpZGF0aW9uIGVycm9y
cyBtaXNzZWQgZHVlIHRvIG9sZGVyIGR0LXNjaGVtYQogIChlbnVtIGZpeCBhbmQgcmVnIGFkZGl0
aW9uKQoKQ2hhbmdlcyBpbiB2NToKLSBBZGQgdmFsdWUgcmFuZ2VzCi0gQ29uc2lzdGVudGx5IG1l
bnRpb24gYWxpZ25tZW50IG11c3QgYmUgcG93ZXItb2YtMgotIE1lbnRpb24gdGhhdCBhbGlnbm1l
bnQgcmVmZXJzIHRvIGJ5dGVzCgpDaGFuZ2VzIGluIHYyOgotIEZpeCAnYScgdHlwbyBpbiBjb21t
aXQgbWVzc2FnZQoKIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCAg
ICB8IDUxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9w
YXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCmluZGV4IDFlYmU5ZTIzNDdlYS4uNjU2
Y2EzZGIxNzYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCkBAIC01Nyw2ICs1Nyw1
NyBAQCBwcm9wZXJ0aWVzOgogICAgICAgdXNlciBzcGFjZSBmcm9tCiAgICAgdHlwZTogYm9vbGVh
bgogCisgIGFsaWduOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQzMgorICAgIG1pbmltdW06IDIKKyAgICBtYXhpbXVtOiAweDgwMDAwMDAwCisgICAgbXVs
dGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1l
bnQgb2YgdGhlIGVudHJ5IGluIGJ5dGVzLgorCisgICAgICBUaGUgZW50cnkgb2Zmc2V0IGlzIGFk
anVzdGVkIHNvIHRoYXQgdGhlIGVudHJ5IHN0YXJ0cyBvbiBhbiBhbGlnbmVkCisgICAgICBib3Vu
ZGFyeSB3aXRoaW4gdGhlIGNvbnRhaW5pbmcgc2VjdGlvbiBvciBpbWFnZS4gRm9yIGV4YW1wbGUg
4oCYYWxpZ24gPQorICAgICAgPDE2PuKAmSBtZWFucyB0aGF0IHRoZSBlbnRyeSB3aWxsIHN0YXJ0
IG9uIGEgMTYtYnl0ZSBib3VuZGFyeS4gVGhpcyBtYXkKKyAgICAgIG1lYW4gdGhhdCBwYWRkaW5n
IGlzIGFkZGVkIGJlZm9yZSB0aGUgZW50cnkuIFRoZSBwYWRkaW5nIGlzIHBhcnQgb2YKKyAgICAg
IHRoZSBjb250YWluaW5nIHNlY3Rpb24gYnV0IGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgZW50cnks
IG1lYW5pbmcgdGhhdAorICAgICAgYW4gZW1wdHkgc3BhY2UgbWF5IGJlIGNyZWF0ZWQgYmVmb3Jl
IHRoZSBlbnRyeSBzdGFydHMuIEFsaWdubWVudAorICAgICAgbXVzdCBiZSBhIHBvd2VyIG9mIDIu
IElmIOKAmGFsaWdu4oCZIGlzIG5vdCBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzCisgICAgICBw
ZXJmb3JtZWQuCisKKyAgYWxpZ24tc2l6ZToKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBtaW5pbXVtOiAyCisgICAgbWF4aW11bTogMHg4MDAw
MDAwMAorICAgIG11bHRpcGxlT2Y6IDIKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0
cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRyeSBzaXplIGluIGJ5dGVzLiBJdCBtdXN0IGJlIGEg
cG93ZXIKKyAgICAgIG9mIDIuCisKKyAgICAgIEZvciBleGFtcGxlLCB0byBlbnN1cmUgdGhhdCB0
aGUgc2l6ZSBvZiBhbiBlbnRyeSBpcyBhIG11bHRpcGxlIG9mIDY0CisgICAgICBieXRlcywgc2V0
IHRoaXMgdG8gNjQuIFdoaWxlIHRoaXMgZG9lcyBub3QgYWZmZWN0IHRoZSBjb250ZW50cyBvZiB0
aGUKKyAgICAgIGVudHJ5IHdpdGhpbiBiaW5tYW4gaXRzZWxmICh0aGUgcGFkZGluZyBpcyBwZXJm
b3JtZWQgb25seSB3aGVuIGl0cworICAgICAgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwg
dGhlIGVuZCByZXN1bHQgaXMgdGhhdCB0aGUgZW50cnkgZW5kcworICAgICAgd2l0aCB0aGUgcGFk
ZGluZyBieXRlcywgc28gbWF5IGdyb3cuIElmIOKAmGFsaWduLXNpemXigJkgaXMgbm90IHByb3Zp
ZGVkLAorICAgICAgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKworICBhbGlnbi1lbmQ6Cisg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisgICAgbWlu
aW11bTogMgorICAgIG1heGltdW06IDB4ODAwMDAwMDAKKyAgICBtdWx0aXBsZU9mOiAyCisgICAg
ZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMgdGhlIGFsaWdubWVudCAoaW4gYnl0ZXMpIG9m
IHRoZSBlbmQgb2YgYW4gZW50cnkgd2l0aCByZXNwZWN0CisgICAgICB0byB0aGUgY29udGFpbmlu
ZyBzZWN0aW9uLiBJdCBtdXN0IGJlIGEgcG93ZXIgb2YgMi4KKworICAgICAgU29tZSBlbnRyaWVz
IHJlcXVpcmUgdGhhdCB0aGV5IGVuZCBvbiBhbiBhbGlnbm1lbnQgYm91bmRhcnksCisgICAgICBy
ZWdhcmRsZXNzIG9mIHdoZXJlIHRoZXkgc3RhcnQuIFRoaXMgZG9lcyBub3QgbW92ZSB0aGUgc3Rh
cnQgb2YgdGhlCisgICAgICBlbnRyeSwgc28gdGhlIGNvbnRlbnRzIG9mIHRoZSBlbnRyeSB3aWxs
IHN0aWxsIHN0YXJ0IGF0IHRoZSBiZWdpbm5pbmcuCisgICAgICBCdXQgdGhlcmUgbWF5IGJlIHBh
ZGRpbmcgYXQgdGhlIGVuZC4gV2hpbGUgdGhpcyBkb2VzIG5vdCBhZmZlY3QgdGhlCisgICAgICBj
b250ZW50cyBvZiB0aGUgZW50cnkgd2l0aGluIGJpbm1hbiBpdHNlbGYgKHRoZSBwYWRkaW5nIGlz
IHBlcmZvcm1lZAorICAgICAgb25seSB3aGVuIGl0cyBwYXJlbnQgc2VjdGlvbiBpcyBhc3NlbWJs
ZWQpLCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZQorICAgICAgZW50cnkgZW5kcyB3aXRoIHRo
ZSBwYWRkaW5nIGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tZW5k4oCZIGlzIG5vdAor
ICAgICAgcHJvdmlkZWQsIG5vIGFsaWdubWVudCBpcyBwZXJmb3JtZWQuCisKIGlmOgogICBub3Q6
CiAgICAgcmVxdWlyZWQ6IFsgcmVnIF0KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
