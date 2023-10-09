Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B3CD6137
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8MaFM4usnguEPdpUpTHjOKvQ7Mq/uUBR03YMdcu9rg=; b=2kMpK8hV4k1HgC
	rVMlkdeu0pB/imT8CSQ1XGMKi9pRqCt08Azlv20zuAJs8QBvdDFSLfJ7YSQG0oO1DlYrGOdRRVn4Q
	weVZYhZ4uX4dMui6ctojJ3PulVHWzzjmuLz0T8Vaj+R6Im/LNMLxd64nnC0/e36EAfmNc8UMTrC9n
	D9wr5KTxm02X/L7uILKRJSWg8Qeyh2RgehyP0kxga2pP0AI3QDW5cEtPzaeOcY9+jL12oBm9sdSPF
	JGWTpCvoHEyRDmmfQzWjHmVa/hlyZB+Yn/w06AUMFmxUScGEu2C2jCUQvaAriapsxSYNwr8PNeeUK
	A4+3R4C1oFocHuxNciOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwa5-00BY7l-11;
	Mon, 09 Oct 2023 20:10:21 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwa1-00BY5I-1Y
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 20:10:19 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-79fe6da0049so206229839f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696882216; x=1697487016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDwYllgCxpOVaDPdnj1bCUl1esI4hxS9Uu4gTGnxNxA=;
        b=Xmx0a8Ix0NzlicZ+8c7gxljTpFvlh41iZldypXL9vbPVLj4Nzumwofn6BJZqb2JvXn
         CTKs1VmS6qb9zAvQasS7IwBEy8mSG3yRMeziH1wf0zwQ6lXMsoDFzrxOybyj8JO2P+Gn
         k7z5tvXRVyEfbpNDx1oz/WWiz4rmezy0/9mFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696882216; x=1697487016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDwYllgCxpOVaDPdnj1bCUl1esI4hxS9Uu4gTGnxNxA=;
        b=pU9kQnzOtU7HQrXAz/cG67bHYKJtpsk0y1C3i5d6ZU4MkDTKjWYBCCxEwNSem+WoOx
         mvnz9Ds9+uUPcguU46WpekfMiN6WBdK37i/2fPD+FJld4SLvfahhZpOuzTBHLEC4pwyD
         vIQZ4niD3WbcYFoM7WayyQqu3w5YGeh+aKGcxl1mQZ3WhMtGySEYXA0ojqE0OumPKFWs
         YCnKV3tk4WCfmPK7N9wqgtIt9+ucv/Iy47OjtRdVQmJCrFUxzTdeqJUvFSsTVZDnSO30
         53+hTnJ+mD2Z6MgMBHOQtNcHFs2PsU4/UmSsKUZEp/5ckHRqSmXrdnwFiGeECP4ECoIC
         y9IQ==
X-Gm-Message-State: AOJu0Yx9bkepDQWq25BL53z77C9Fks/J904w3+1mr0RB420xvMa/4b0m
	NuAS0vQCCo1HXIOH7hB0Z5e8pMFcDQEDhHZVlso=
X-Google-Smtp-Source: AGHT+IHjoREuIigG/5nvr4t3n4+H6A6edPXnoWQ1VFc16alunnV8mOAw+XYEKhJX2GRZPWJattFpfw==
X-Received: by 2002:a6b:651a:0:b0:780:ce72:ac55 with SMTP id z26-20020a6b651a000000b00780ce72ac55mr20002656iob.10.1696882216398;
        Mon, 09 Oct 2023 13:10:16 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:138c:cf57:c18d:20f5])
        by smtp.gmail.com with ESMTPSA id q21-20020a02a315000000b0042b2df337ccsm2215294jai.76.2023.10.09.13.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:10:16 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Mon,  9 Oct 2023 14:10:01 -0600
Message-ID: <20231009201005.1964794-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231009201005.1964794-1-sjg@chromium.org>
References: <20231009201005.1964794-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_131017_517583_52B9071D 
X-CRM114-Status: GOOD (  21.95  )
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
aXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3QgdGhlICdiaW5t
YW4nIG5vZGUuCgpUaGVzZSBuZXcgcHJvcGVydGllcyBhcmUgaW5wdXRzIHRvIHRoZSBwYWNrYWdp
bmcgcHJvY2VzcywgYnV0IGFyZSBhbHNvCm5lZWRlZCBpZiB0aGUgZmlybXdhcmUgaXMgcmVwYWNr
ZWQsIHRvIGVuc3VyZSB0aGF0IGFsaWdubWVudApjb25zdHJhaW50cyBhcmUgbm90IHZpb2xhdGVk
LiBUaGVyZWZvcmUgdGhleSBhcmUgcHJvdmlkZWQgYXMgcGFydCBvZgp0aGUgc2NoZW1hLgoKU2ln
bmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Ci0tLQoKKG5vIGNoYW5n
ZXMgc2luY2UgdjIpCgpDaGFuZ2VzIGluIHYyOgotIEZpeCAnYScgdHlwbyBpbiBjb21taXQgbWVz
c2FnZQoKIC4uLi9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwgICAgICB8IDM5
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKaW5kZXggNzU0ZjgwNDUy
NGE1Li4zNTAwMTRhOTNkYTQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRp
b24ueWFtbApAQCAtMjcsNiArMjcsNDIgQEAgcHJvcGVydGllczoKICAgICAgICAgLSB1LWJvb3Qg
ICAgICAgIyB1LWJvb3QuYmluIGZyb20gVS1Cb290IHByb2plYzZ0CiAgICAgICAgIC0gYXRmLWJs
MzEgICAgICMgYmwzMS5iaW4gb3IgYmwzMS5lbGYgZnJvbSBURi1BIHByb2plY3QKIAorICBhbGln
bjoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAg
ICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRy
eS4gVGhlIGVudHJ5IG9mZnNldCBpcyBhZGp1c3RlZAorICAgICAgc28gdGhhdCB0aGUgZW50cnkg
c3RhcnRzIG9uIGFuIGFsaWduZWQgYm91bmRhcnkgd2l0aGluIHRoZSBjb250YWluaW5nCisgICAg
ICBzZWN0aW9uIG9yIGltYWdlLiBGb3IgZXhhbXBsZSDigJhhbGlnbiA9IDwxNj7igJkgbWVhbnMg
dGhhdCB0aGUgZW50cnkgd2lsbAorICAgICAgc3RhcnQgb24gYSAxNi1ieXRlIGJvdW5kYXJ5LiBU
aGlzIG1heSBtZWFuIHRoYXQgcGFkZGluZyBpcyBhZGRlZCBiZWZvcmUKKyAgICAgIHRoZSBlbnRy
eS4gVGhlIHBhZGRpbmcgaXMgcGFydCBvZiB0aGUgY29udGFpbmluZyBzZWN0aW9uIGJ1dCBpcyBu
b3QKKyAgICAgIGluY2x1ZGVkIGluIHRoZSBlbnRyeSwgbWVhbmluZyB0aGF0IGFuIGVtcHR5IHNw
YWNlIG1heSBiZSBjcmVhdGVkIGJlZm9yZQorICAgICAgdGhlIGVudHJ5IHN0YXJ0cy4gQWxpZ25t
ZW50IHNob3VsZCBiZSBhIHBvd2VyIG9mIDIuIElmIOKAmGFsaWdu4oCZIGlzIG5vdAorICAgICAg
cHJvdmlkZWQsIG5vIGFsaWdubWVudCBpcyBwZXJmb3JtZWQuCisKKyAgYWxpZ24tc2l6ZToKKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBkZXNj
cmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRyeSBzaXpl
LiBGb3IgZXhhbXBsZSwgdG8gZW5zdXJlCisgICAgICB0aGF0IHRoZSBzaXplIG9mIGFuIGVudHJ5
IGlzIGEgbXVsdGlwbGUgb2YgNjQgYnl0ZXMsIHNldCB0aGlzIHRvIDY0LgorICAgICAgV2hpbGUg
dGhpcyBkb2VzIG5vdCBhZmZlY3QgdGhlIGNvbnRlbnRzIG9mIHRoZSBlbnRyeSB3aXRoaW4gYmlu
bWFuCisgICAgICBpdHNlbGYgKHRoZSBwYWRkaW5nIGlzIHBlcmZvcm1lZCBvbmx5IHdoZW4gaXRz
IHBhcmVudCBzZWN0aW9uIGlzCisgICAgICBhc3NlbWJsZWQpLCB0aGUgZW5kIHJlc3VsdCBpcyB0
aGF0IHRoZSBlbnRyeSBlbmRzIHdpdGggdGhlIHBhZGRpbmcKKyAgICAgIGJ5dGVzLCBzbyBtYXkg
Z3Jvdy4gSWYg4oCYYWxpZ24tc2l6ZeKAmSBpcyBub3QgcHJvdmlkZWQsIG5vIGFsaWdubWVudCBp
cworICAgICAgcGVyZm9ybWVkLgorCisgIGFsaWduLWVuZDoKKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRo
aXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbmQgb2YgYW4gZW50cnkgd2l0aCByZXNwZWN0
IHRvIHRoZQorICAgICAgY29udGFpbmluZyBzZWN0aW9uLiBTb21lIGVudHJpZXMgcmVxdWlyZSB0
aGF0IHRoZXkgZW5kIG9uIGFuIGFsaWdubWVudAorICAgICAgYm91bmRhcnksIHJlZ2FyZGxlc3Mg
b2Ygd2hlcmUgdGhleSBzdGFydC4gVGhpcyBkb2VzIG5vdCBtb3ZlIHRoZSBzdGFydAorICAgICAg
b2YgdGhlIGVudHJ5LCBzbyB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdpbGwgc3RpbGwgc3Rh
cnQgYXQgdGhlCisgICAgICBiZWdpbm5pbmcuIEJ1dCB0aGVyZSBtYXkgYmUgcGFkZGluZyBhdCB0
aGUgZW5kLiBXaGlsZSB0aGlzIGRvZXMgbm90CisgICAgICBhZmZlY3QgdGhlIGNvbnRlbnRzIG9m
IHRoZSBlbnRyeSB3aXRoaW4gYmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMKKyAgICAgIHBl
cmZvcm1lZCBvbmx5IHdoZW4gaXRzIHBhcmVudCBzZWN0aW9uIGlzIGFzc2VtYmxlZCksIHRoZSBl
bmQgcmVzdWx0IGlzCisgICAgICB0aGF0IHRoZSBlbnRyeSBlbmRzIHdpdGggdGhlIHBhZGRpbmcg
Ynl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1lbmTigJkKKyAgICAgIGlzIG5vdCBwcm92
aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKwogYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCiAKIGV4YW1wbGVzOgpAQCAtMzksMTAgKzc1LDEzIEBAIGV4YW1wbGVzOgogICAgICAg
ICBwYXJ0aXRpb25AMTAwMDAwIHsKICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290IjsK
ICAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMCAweGYwMDAwMD47CisgICAgICAgICAgICBhbGln
bi1zaXplID0gPDB4MTAwMD47CisgICAgICAgICAgICBhbGlnbi1lbmQgPSA8MHgxMDAwMD47CiAg
ICAgICAgIH07CiAKICAgICAgICAgcGFydGl0aW9uQDIwMDAwMCB7CiAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImF0Zi1ibDMxIjsKICAgICAgICAgICAgIHJlZyA9IDwweDIwMDAwMCAweDEwMDAw
MD47CisgICAgICAgICAgICBhbGlnbiA9IDwweDQwMDA+OwogICAgICAgICB9OwogICAgIH07Ci0t
IAoyLjQyLjAuNjA5LmdiYjc2ZjQ2NjA2LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
