Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4075E74901
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z137fLj4wxF0fhGSTZGzMBeu8SRDi+nz6D7pzS6HZrQ=; b=RhXGZPlYWxzlpS
	evJaH9xgxbuEuf8eoxXsx9sqLnQepD0LEkVNaHeU+9bKORNxW/lyPGAv4wIgs27m/fFhKfg50QL1M
	ptmdJsdxJ08QNUo/Xo3yIR6sk15RSl9nYNN05UXSC5FGojZ6i5bSBxK0CWj8hF5NPFfH/DTfeIQTB
	KQlTcHqDRCr42Zt4ORKM66ELt1X1NIonZ1O9pjsd6+Ae7LfxbAbHWd8k9v51lRl30Xfz0SGTShw0G
	10RSClC8n5yfMRKamMzVZwuM46twdUzDHsm+ew7bbp2Z6kB6y8nrsD79lHTuKCHPkZgacY7eI0G/R
	y5mvDQfs7PUg1c25Lcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnN43-00DAU7-22;
	Mon, 02 Oct 2023 17:50:39 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnN41-00DATY-0P
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 17:50:38 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7a2a9e5451bso364539f.1
        for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2023 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696269036; x=1696873836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LS+wV2LMgqbRwabaSq2Ufumv4REcBt1Upfkm2T5IrI=;
        b=aNFSgNqu92xDgEDXM82h4VXLbO9THDEA6SWVHYVQgBpHiPEB/he2/oDDvBYk1Os1yh
         gutWsmLhIehNLMIjWNilHqX8DX/i5SF/BLjf5VmKCy6cQzzSRaU5ZzuW18SM99/Sm1BB
         HoEFHltzn4+tBuRLBXgjcqVupCc6sfqjlnv/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269036; x=1696873836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LS+wV2LMgqbRwabaSq2Ufumv4REcBt1Upfkm2T5IrI=;
        b=R5UPDbAX8zrxHlYVV8Cdoz3wvWVDv7bieWn+Ckrrfv5029nfr38lS8WmM5ej/GiFld
         bOQX0rVGjS4Sp1efXbcDTefeKJXfnjwIYDjFD679UUBQkGBEnaE6J17rP0StXT9goLjd
         lQQKNgmYBZDTCKdfbJAeOyK7mxwa8s3TKKBG/hm3QykcmW4Zn9FwCOBjymhPr1K29XuK
         8mB91zzBaS3bwrX/K9X1mL3Shh/1MCHqBJK8/tqHR5qW5bGya0WD9P60DYCACJnpvk+A
         LcPZY6W9Wn1j5aiulnAvJsDlWHwYNEVHbXCxVQgK+5lvFH3SG7zJCglruLiXPlwszoBT
         PgMw==
X-Gm-Message-State: AOJu0YxyXOQOUCtp1Vkdn1V9vYz2s4CvZsP89Shanu03nZq9QhCfb0TI
	iWhPXlpT05XhAJ3BHWy6W5ArJA==
X-Google-Smtp-Source: AGHT+IEB8T0cVFcTkDZ346OUm4Ky/z+eBGTNEVGMP1RopagjT/hUSHBfrulem4VbVa2WRYXv7OLtOg==
X-Received: by 2002:a05:6e02:1d16:b0:349:3756:b1ce with SMTP id i22-20020a056e021d1600b003493756b1cemr14675384ila.2.1696269035979;
        Mon, 02 Oct 2023 10:50:35 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:63cd:2673:520:2e9])
        by smtp.gmail.com with ESMTPSA id s23-20020a02c517000000b0042b2e309f97sm6919562jam.177.2023.10.02.10.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:50:35 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Mon,  2 Oct 2023 11:49:42 -0600
Message-ID: <20231002174948.1015223-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231002174948.1015223-1-sjg@chromium.org>
References: <20231002174948.1015223-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_105037_164413_9E965DD4 
X-CRM114-Status: GOOD (  21.72  )
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
b25zLCBha2EKJ2VudHJpZXMnIGluIGJpbm1hbi4KCkZvciBub3cgdGhlcmUgaXMgbm8gZXhwbGlj
aXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3QgdGhlICdmaXhl
ZC1wYXJ0aXRpb25zJyBub2RlLgoKVGhlc2UgbmV3IHByb3BlcnRpZXMgYXJlIGlucHV0cyB0byB0
aGUgcGFja2FnaW5nIHByb2Nlc3MsIGJ1dCBhcmUgYWxzbwpuZWVkZWQgaWYgdGhlIGZpcm13YXJl
IGlzIHJlcGFja2VkLCB0byBlbnN1cmUgdGhhdCBhbGlnbm1lbnQKY29uc3RyYWludHMgYXJlIG5v
dCB2aW9sYXRlZC4gVGhlcmVmb3JlIHRoZXkgYXJlIHByb3ZpZGVkIGFzIHBhcnQgb2YKdGhlIHNj
aGVtYS4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgotLS0K
CkNoYW5nZXMgaW4gdjI6Ci0gRml4ICdhJyB0eXBvIGluIGNvbW1pdCBtZXNzYWdlCgogLi4uL210
ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbCAgICAgIHwgMzkgKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLXBh
cnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbAppbmRleCA0MDZhODk5N2QzZTQuLmJlNzI3M2E0
YzlhYyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9w
YXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLXBhcnRpdGlvbi55YW1sCkBAIC0y
Nyw2ICsyNyw0MiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAtIHUtYm9vdCAgICAgICAjIHUtYm9v
dC5iaW4gZnJvbSBVLUJvb3QgcHJvamVjNnQKICAgICAgICAgLSBhdGYtYmwzMSAgICAgIyBibDMx
LmJpbiBvciBibDMxLmVsZiBmcm9tIFRGLUEgcHJvamVjdAogCisgIGFsaWduOgorICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9u
OgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5LiBUaGUgZW50cnkg
b2Zmc2V0IGlzIGFkanVzdGVkCisgICAgICBzbyB0aGF0IHRoZSBlbnRyeSBzdGFydHMgb24gYW4g
YWxpZ25lZCBib3VuZGFyeSB3aXRoaW4gdGhlIGNvbnRhaW5pbmcKKyAgICAgIHNlY3Rpb24gb3Ig
aW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWduID0gPDE2PuKAmSBtZWFucyB0aGF0IHRoZSBlbnRy
eSB3aWxsCisgICAgICBzdGFydCBvbiBhIDE2LWJ5dGUgYm91bmRhcnkuIFRoaXMgbWF5IG1lYW4g
dGhhdCBwYWRkaW5nIGlzIGFkZGVkIGJlZm9yZQorICAgICAgdGhlIGVudHJ5LiBUaGUgcGFkZGlu
ZyBpcyBwYXJ0IG9mIHRoZSBjb250YWluaW5nIHNlY3Rpb24gYnV0IGlzIG5vdAorICAgICAgaW5j
bHVkZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5nIHRoYXQgYW4gZW1wdHkgc3BhY2UgbWF5IGJlIGNy
ZWF0ZWQgYmVmb3JlCisgICAgICB0aGUgZW50cnkgc3RhcnRzLiBBbGlnbm1lbnQgc2hvdWxkIGJl
IGEgcG93ZXIgb2YgMi4gSWYg4oCYYWxpZ27igJkgaXMgbm90CisgICAgICBwcm92aWRlZCwgbm8g
YWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKworICBhbGlnbi1zaXplOgorICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOgorICAg
ICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5IHNpemUuIEZvciBleGFtcGxl
LCB0byBlbnN1cmUKKyAgICAgIHRoYXQgdGhlIHNpemUgb2YgYW4gZW50cnkgaXMgYSBtdWx0aXBs
ZSBvZiA2NCBieXRlcywgc2V0IHRoaXMgdG8gNjQuCisgICAgICBXaGlsZSB0aGlzIGRvZXMgbm90
IGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdpdGhpbiBiaW5tYW4KKyAgICAgIGl0
c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9ybWVkIG9ubHkgd2hlbiBpdHMgcGFyZW50IHNlY3Rp
b24gaXMKKyAgICAgIGFzc2VtYmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlIGVudHJ5
IGVuZHMgd2l0aCB0aGUgcGFkZGluZworICAgICAgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhh
bGlnbi1zaXpl4oCZIGlzIG5vdCBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzCisgICAgICBwZXJm
b3JtZWQuCisKKyAgYWxpZ24tZW5kOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBh
bGlnbm1lbnQgb2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QgdG8gdGhlCisgICAg
ICBjb250YWluaW5nIHNlY3Rpb24uIFNvbWUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhleSBlbmQg
b24gYW4gYWxpZ25tZW50CisgICAgICBib3VuZGFyeSwgcmVnYXJkbGVzcyBvZiB3aGVyZSB0aGV5
IHN0YXJ0LiBUaGlzIGRvZXMgbm90IG1vdmUgdGhlIHN0YXJ0CisgICAgICBvZiB0aGUgZW50cnks
IHNvIHRoZSBjb250ZW50cyBvZiB0aGUgZW50cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0aGUKKyAg
ICAgIGJlZ2lubmluZy4gQnV0IHRoZXJlIG1heSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQuIFdoaWxl
IHRoaXMgZG9lcyBub3QKKyAgICAgIGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdp
dGhpbiBiaW5tYW4gaXRzZWxmICh0aGUgcGFkZGluZyBpcworICAgICAgcGVyZm9ybWVkIG9ubHkg
d2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1bHQgaXMK
KyAgICAgIHRoYXQgdGhlIGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZyBieXRlcywgc28gbWF5
IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmQorICAgICAgaXMgbm90IHByb3ZpZGVkLCBubyBhbGln
bm1lbnQgaXMgcGVyZm9ybWVkLgorCiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhh
bXBsZXM6CkBAIC0zOSwxMCArNzUsMTMgQEAgZXhhbXBsZXM6CiAgICAgICAgIHBhcnRpdGlvbkAx
MDAwMDAgewogICAgICAgICAgICAgbGFiZWwgPSAidS1ib290IjsKICAgICAgICAgICAgIHJlZyA9
IDwweDEwMDAwMCAweGYwMDAwMD47CisgICAgICAgICAgICBhbGlnbi1zaXplID0gPDB4MTAwMD47
CisgICAgICAgICAgICBhbGlnbi1lbmQgPSA8MHgxMDAwMD47CiAgICAgICAgIH07CiAKICAgICAg
ICAgcGFydGl0aW9uQDIwMDAwMCB7CiAgICAgICAgICAgICBsYWJlbCA9ICJhdGYtYmwzMSI7CiAg
ICAgICAgICAgICByZWcgPSA8MHgyMDAwMDAgMHgxMDAwMDA+OworICAgICAgICAgICAgYWxpZ24g
PSA8MHg0MDAwPjsKICAgICAgICAgfTsKICAgICB9OwotLSAKMi40Mi4wLjU4Mi5nOGNjZDIwZDcw
ZC1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
