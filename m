Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3D1C54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2024 02:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN1BQYNLqvwI+LbCrt4oXl+MRyBuOI0ERIl1ITfZJnU=; b=zxGIic90yHB14U
	gmr4tXR9KirdrDCDf5nP4rlZm37elAhhDnvcPSmhwK+UDzWQ4nL3sasM+mtM2gNW2lHQLXYvXCaC3
	JA37tTGknMPaTeteHrIitbPs0rXcS1/i/3JTzRD9nWNg3tBcVZB0dqsnEILNb6fqWZ43rTDBw8/Qo
	xHSe8UB7HWIkwtDTXf1Lk6RxHxDkuIsjma2eoSzNbvVjxbxtrt2fT0v6qZiOJGIj+lw63SSBS8biD
	0a2e6dvcYtJQj6Wh6ShlbY8yvAyaj030dtN71CAXK0A3JTnxQX3ySf5vN8G04xu+xysmBC2KMPf2J
	F+KqMEW4qxda6Ssu72mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkag1-0000000CfBr-3ZIc;
	Thu, 14 Mar 2024 02:18:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkafy-0000000CfAw-2UJi
	for linux-mtd@lists.infradead.org;
	Thu, 14 Mar 2024 02:18:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-29c6a917a8dso451113a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2024 19:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710382713; x=1710987513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMXxgYFB39c3JQb86pcYzX4ejK9UB61sydOSCe9B0SI=;
        b=CzgBcHtLpXUD9FyCL0Knlfax0JusXh1Du8RG5JdQA+ucbvVxvgbQzx+Wvj5UZjQ3ci
         qzma8SG7OboccGQgrtphtG3D5YF8rrpZwsmuqdfOiyRU+Z3E7z47/EZG+qFo/zNB7Wnh
         wU2NLeWc9DY88rXau1X8Y3J8iswmtqhzCiHZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710382713; x=1710987513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMXxgYFB39c3JQb86pcYzX4ejK9UB61sydOSCe9B0SI=;
        b=UlVe42+Dw796ljQOha9KQhGR/cVnR0uzZWqf/S1pIata8/Ai6g3lU0mWXJBumlYHlI
         43NEN2vRU2gMo//sq4diHRO8VxDoKGdc7RbNbG7xrWkudxvS2XMeZ7ZSGqN40T6BZ9Y2
         rbYk7U3QZ4d58OFwr3tfDfeuEH+Q/+WVrf8Nm0grCmd6VBvPkMTHrT8x5TWXpnsqhGC5
         6YC7FEZriowEZNNtMid4EFMRL8MSpdKI6izubjuyGIMqAUAtiu2Muh2+pItLozycBFN2
         dcjGXa7ofwdtx4Q+NWlXAfdewbpVCX2a4xJj2I4istoopooRpVe+zEgrHK1Tt01W8odW
         MxJA==
X-Forwarded-Encrypted: i=1; AJvYcCVUiuCC2LIg3kGizJFO1ytALNXoT9JBgXIuY8JEpxqox38As4pVA1lqdmUQdFrCoYQ4yzco0gY/L71IrhpoW8gAuJH0yRdgcGMDUdF1tA==
X-Gm-Message-State: AOJu0YxdWkhiQ9g/lHEN7YcDMZaaIft/h3HUnYwSGXKCkyY9KjJomgy0
	4cLCopzWZD6sqDmBvqgJrMk+z3jHc8/xJxUX2rbteUTPYClr8lORIskGWxwo8N/5r9SrfrCSQbw
	=
X-Google-Smtp-Source: AGHT+IEC8GLkKGjjgaPvX0/xnlGwn3qQtPhlBt8R9T5fCKZBAWzvZ9Yc2/prutcWFyDk7dnjBytK6g==
X-Received: by 2002:a17:90a:f288:b0:29a:caf9:de64 with SMTP id fs8-20020a17090af28800b0029acaf9de64mr414882pjb.40.1710382713471;
        Wed, 13 Mar 2024 19:18:33 -0700 (PDT)
Received: from chromium.org ([118.149.82.233])
        by smtp.gmail.com with ESMTPSA id o1-20020a17090aac0100b0029bc25f7181sm1993937pjq.54.2024.03.13.19.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 19:18:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
Date: Thu, 14 Mar 2024 15:17:54 +1300
Message-Id: <20240314021754.84557-2-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314021754.84557-1-sjg@chromium.org>
References: <20240314021754.84557-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_191834_686705_1BB603A3 
X-CRM114-Status: GOOD (  22.82  )
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
cm9taXVtLm9yZz4KLS0tCgpDaGFuZ2VzIGluIHY3OgotIERyb3AgcGF0Y2ggJ0FkZCBiaW5tYW4g
Y29tcGF0aWJsZScKLSBQdXQgdGhlIGFsaWdubWVudCBwcm9wZXJ0aWVzIGludG8gdGhlIGZpeGVk
LXBhcnRpdGlvbiBiaW5kaW5nCgpDaGFuZ2VzIGluIHY2OgotIENvcnJlY3Qgc2NoZW1hLXZhbGlk
YXRpb24gZXJyb3JzIG1pc3NlZCBkdWUgdG8gb2xkZXIgZHQtc2NoZW1hCiAgKGVudW0gZml4IGFu
ZCByZWcgYWRkaXRpb24pCgpDaGFuZ2VzIGluIHY1OgotIEFkZCB2YWx1ZSByYW5nZXMKLSBDb25z
aXN0ZW50bHkgbWVudGlvbiBhbGlnbm1lbnQgbXVzdCBiZSBwb3dlci1vZi0yCi0gTWVudGlvbiB0
aGF0IGFsaWdubWVudCByZWZlcnMgdG8gYnl0ZXMKCkNoYW5nZXMgaW4gdjI6Ci0gRml4ICdhJyB0
eXBvIGluIGNvbW1pdCBtZXNzYWdlCgogLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRp
dGlvbi55YW1sICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKaW5kZXggMWViZTll
MjM0N2VhLi4zZGYxMmRmMDYxMTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKQEAg
LTU3LDYgKzU3LDU3IEBAIHByb3BlcnRpZXM6CiAgICAgICB1c2VyIHNwYWNlIGZyb20KICAgICB0
eXBlOiBib29sZWFuCiAKKyAgYWxpZ246CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvdWludDMyCisgICAgbWluaW11bTogMQorICAgIG1heGltdW06IDB4ODAwMDAw
MDAKKyAgICBtdWx0aXBsZU9mOiAyCisgICAgZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMg
dGhlIGFsaWdubWVudCBvZiB0aGUgZW50cnkgaW4gYnl0ZXMuCisKKyAgICAgIFRoZSBlbnRyeSBv
ZmZzZXQgaXMgYWRqdXN0ZWQgc28gdGhhdCB0aGUgZW50cnkgc3RhcnRzIG9uIGFuIGFsaWduZWQK
KyAgICAgIGJvdW5kYXJ5IHdpdGhpbiB0aGUgY29udGFpbmluZyBzZWN0aW9uIG9yIGltYWdlLiBG
b3IgZXhhbXBsZSDigJhhbGlnbiA9CisgICAgICA8MTY+4oCZIG1lYW5zIHRoYXQgdGhlIGVudHJ5
IHdpbGwgc3RhcnQgb24gYSAxNi1ieXRlIGJvdW5kYXJ5LiBUaGlzIG1heQorICAgICAgbWVhbiB0
aGF0IHBhZGRpbmcgaXMgYWRkZWQgYmVmb3JlIHRoZSBlbnRyeS4gVGhlIHBhZGRpbmcgaXMgcGFy
dCBvZgorICAgICAgdGhlIGNvbnRhaW5pbmcgc2VjdGlvbiBidXQgaXMgbm90IGluY2x1ZGVkIGlu
IHRoZSBlbnRyeSwgbWVhbmluZyB0aGF0CisgICAgICBhbiBlbXB0eSBzcGFjZSBtYXkgYmUgY3Jl
YXRlZCBiZWZvcmUgdGhlIGVudHJ5IHN0YXJ0cy4gQWxpZ25tZW50CisgICAgICBtdXN0IGJlIGEg
cG93ZXIgb2YgMi4gSWYg4oCYYWxpZ27igJkgaXMgbm90IHByb3ZpZGVkLCBubyBhbGlnbm1lbnQg
aXMKKyAgICAgIHBlcmZvcm1lZC4KKworICBhbGlnbi1zaXplOgorICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06IDEKKyAgICBtYXhp
bXVtOiAweDgwMDAwMDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAg
ICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5IHNpemUgaW4gYnl0ZXMuIEl0
IG11c3QgYmUgYSBwb3dlcgorICAgICAgb2YgMi4KKworICAgICAgRm9yIGV4YW1wbGUsIHRvIGVu
c3VyZSB0aGF0IHRoZSBzaXplIG9mIGFuIGVudHJ5IGlzIGEgbXVsdGlwbGUgb2YgNjQKKyAgICAg
IGJ5dGVzLCBzZXQgdGhpcyB0byA2NC4gV2hpbGUgdGhpcyBkb2VzIG5vdCBhZmZlY3QgdGhlIGNv
bnRlbnRzIG9mIHRoZQorICAgICAgZW50cnkgd2l0aGluIGJpbm1hbiBpdHNlbGYgKHRoZSBwYWRk
aW5nIGlzIHBlcmZvcm1lZCBvbmx5IHdoZW4gaXRzCisgICAgICBwYXJlbnQgc2VjdGlvbiBpcyBh
c3NlbWJsZWQpLCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZSBlbnRyeSBlbmRzCisgICAgICB3
aXRoIHRoZSBwYWRkaW5nIGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tc2l6ZeKAmSBp
cyBub3QgcHJvdmlkZWQsCisgICAgICBubyBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCisgIGFs
aWduLWVuZDoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzIKKyAgICBtaW5pbXVtOiAxCisgICAgbWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxl
T2Y6IDIKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IChp
biBieXRlcykgb2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QKKyAgICAgIHRvIHRo
ZSBjb250YWluaW5nIHNlY3Rpb24uIEl0IG11c3QgYmUgYSBwb3dlciBvZiAyLgorCisgICAgICBT
b21lIGVudHJpZXMgcmVxdWlyZSB0aGF0IHRoZXkgZW5kIG9uIGFuIGFsaWdubWVudCBib3VuZGFy
eSwKKyAgICAgIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhleSBzdGFydC4gVGhpcyBkb2VzIG5vdCBt
b3ZlIHRoZSBzdGFydCBvZiB0aGUKKyAgICAgIGVudHJ5LCBzbyB0aGUgY29udGVudHMgb2YgdGhl
IGVudHJ5IHdpbGwgc3RpbGwgc3RhcnQgYXQgdGhlIGJlZ2lubmluZy4KKyAgICAgIEJ1dCB0aGVy
ZSBtYXkgYmUgcGFkZGluZyBhdCB0aGUgZW5kLiBXaGlsZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0
aGUKKyAgICAgIGNvbnRlbnRzIG9mIHRoZSBlbnRyeSB3aXRoaW4gYmlubWFuIGl0c2VsZiAodGhl
IHBhZGRpbmcgaXMgcGVyZm9ybWVkCisgICAgICBvbmx5IHdoZW4gaXRzIHBhcmVudCBzZWN0aW9u
IGlzIGFzc2VtYmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlCisgICAgICBlbnRyeSBl
bmRzIHdpdGggdGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1lbmTi
gJkgaXMgbm90CisgICAgICBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKwog
aWY6CiAgIG5vdDoKICAgICByZXF1aXJlZDogWyByZWcgXQpAQCAtNjcsMyArMTE4LDI0IEBAIHRo
ZW46CiAKICMgVGhpcyBpcyBhIGdlbmVyaWMgZmlsZSBvdGhlciBiaW5kaW5nIGluaGVyaXQgZnJv
bSBhbmQgZXh0ZW5kCiBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQorCitleGFtcGxlczoKKyAg
LSB8CisgICAgcGFydGl0aW9ucyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0
aW9ucyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwxPjsKKworICAgICAgICBwYXJ0aXRpb25AMTAwMDAwIHsKKyAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAidS1ib290IjsKKyAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMCAweGYwMDAwMD47
CisgICAgICAgICAgICBhbGlnbi1zaXplID0gPDB4MTAwMD47CisgICAgICAgICAgICBhbGlnbi1l
bmQgPSA8MHgxMDAwMD47CisgICAgICAgIH07CisKKyAgICAgICAgcGFydGl0aW9uQDIwMDAwMCB7
CisgICAgICAgICAgICBjb21wYXRpYmxlID0gInRmYS1ibDMxIjsKKyAgICAgICAgICAgIHJlZyA9
IDwweDIwMDAwMCAweDEwMDAwMD47CisgICAgICAgICAgICBhbGlnbiA9IDwweDQwMDA+OworICAg
ICAgICB9OworICAgIH07Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
