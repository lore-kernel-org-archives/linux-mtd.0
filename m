Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B7C54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 20:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lGG6cnac0HjTgHH7EcNe1xYzOJDVj9SuiJsua/rs3Ro=; b=dDTxTMX/Gf6I57
	XtvMrWK+LEvf2JJ7V6/HX42ProGj3rw4S97i9oaJab0/pGs4VoD4M2Wl2ZOmDaPBQYek/lsKlYGU9
	pByxzNITPw4Z0YCg7ZNa/15dy+1+iI4Ulh73VGaLuBlZYtftAm6m5QL1bimJGxrEP/ZMKt3bdxRib
	pwrfk4GH/AOzNaCM59mb6l8xwU82NZ1NBwGx6Jq9gGeXNa9fTAethwlTP0RNNdsk4Ei8m875SA4Zz
	l6DtegxLv+3UredhTqZQavVF2MUxgeiKXVfuONH/a7SvUQeXdG9+R7eh5XNBXDJRK7wQoSoF1PDas
	tqebDzMJJGTihsrgFBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEQt-00000001Wbz-1QPd;
	Fri, 15 Mar 2024 20:45:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEQn-00000001WZk-2UL9
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 20:45:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-29a5f100c1aso1652817a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2024 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710535532; x=1711140332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQYzUNy+Emf54idwje5yghrSqUUAVlujONdk1QB+Gj0=;
        b=kFigFWRe15FqoOtJ5C3+2Yu7t9Pm4tKOEyfrYSRhHKD4M1UnaiUhfiq2MXOhkg1Fhq
         aaBlYWhyFO944BgZNlO/P8/m6+CBvt0Z8SDfvKRVMFOY5aMVit+bvUDlF44h6satBnxs
         EWQshwfx7dbPBVNKEqkb4i0zU2/tZwPAWH1l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710535532; x=1711140332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQYzUNy+Emf54idwje5yghrSqUUAVlujONdk1QB+Gj0=;
        b=vn3NkldmvvuWZm8Wqx0+SgtUzVe3vP4KLMZeek3N5em7Vtl3LipfhThHLcihWwc1b+
         ab61iggdYwXWqefOOcYB/b7C9eYy6OSihYFaYpYgL33QZNqotTQxUsw5EEMTDu96c7Dq
         /TeQ1tKWHr39CroGtcryC8VhRY08+UOw3l+2m0yPzy1xP71VWnN9lKEFV6FOZbqAxpVD
         XSVRUgbl5B+8fh3cq/WrEDqUj1E2BriY3qDnl8NiFsTOmglAlkieWvYC1iNFjE65fVzb
         dvKmAv1MKAyjPwCvy67Kq0Dc/sA9wbKc1JlNoyQjU5sPGxEj82DXWTZL+eR3tDCZUlLl
         W7uQ==
X-Gm-Message-State: AOJu0Yz+DF6GP/ZtGR0YJmaxO40EVNiPwVJagq5h0hjyFMdU5SU2UGem
	0ICz0iJeQ39o+5c6V0jlIxda6eTZsIXj6aEMsbfwHgR2Q9WwZFVLUZPLtA7AfA==
X-Google-Smtp-Source: AGHT+IH/pFa5YIqgsiUamutpDbRvNzKqE9dmF23la891oWrgMUNBg5Q/k7AEKz1zDJwE6FXGMdb+PA==
X-Received: by 2002:a17:90b:180c:b0:29e:5ed:eada with SMTP id lw12-20020a17090b180c00b0029e05edeadamr1838341pjb.37.1710535531667;
        Fri, 15 Mar 2024 13:45:31 -0700 (PDT)
Received: from chromium.org ([202.144.206.254])
        by smtp.gmail.com with ESMTPSA id iq3-20020a17090afb4300b0029bb8ebdc23sm3400516pjb.37.2024.03.15.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 13:45:31 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
Date: Sat, 16 Mar 2024 09:45:20 +1300
Message-Id: <20240315204521.28613-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_134533_752003_232F5A4E 
X-CRM114-Status: GOOD (  22.29  )
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
cm9taXVtLm9yZz4KLS0tCgoobm8gY2hhbmdlcyBzaW5jZSB2NykKCkNoYW5nZXMgaW4gdjc6Ci0g
RHJvcCBwYXRjaCAnQWRkIGJpbm1hbiBjb21wYXRpYmxlJwotIFB1dCB0aGUgYWxpZ25tZW50IHBy
b3BlcnRpZXMgaW50byB0aGUgZml4ZWQtcGFydGl0aW9uIGJpbmRpbmcKCkNoYW5nZXMgaW4gdjY6
Ci0gQ29ycmVjdCBzY2hlbWEtdmFsaWRhdGlvbiBlcnJvcnMgbWlzc2VkIGR1ZSB0byBvbGRlciBk
dC1zY2hlbWEKICAoZW51bSBmaXggYW5kIHJlZyBhZGRpdGlvbikKCkNoYW5nZXMgaW4gdjU6Ci0g
QWRkIHZhbHVlIHJhbmdlcwotIENvbnNpc3RlbnRseSBtZW50aW9uIGFsaWdubWVudCBtdXN0IGJl
IHBvd2VyLW9mLTIKLSBNZW50aW9uIHRoYXQgYWxpZ25tZW50IHJlZmVycyB0byBieXRlcwoKQ2hh
bmdlcyBpbiB2MjoKLSBGaXggJ2EnIHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UKCiAuLi4vYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgfCA3MiArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0
aXRpb24ueWFtbAppbmRleCAxZWJlOWUyMzQ3ZWEuLjNkZjEyZGYwNjExNiAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlv
bi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9wYXJ0aXRpb24ueWFtbApAQCAtNTcsNiArNTcsNTcgQEAgcHJvcGVydGllczoKICAgICAg
IHVzZXIgc3BhY2UgZnJvbQogICAgIHR5cGU6IGJvb2xlYW4KIAorICBhbGlnbjoKKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBtaW5pbXVtOiAx
CisgICAgbWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxlT2Y6IDIKKyAgICBkZXNjcmlw
dGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRyeSBpbiBieXRl
cy4KKworICAgICAgVGhlIGVudHJ5IG9mZnNldCBpcyBhZGp1c3RlZCBzbyB0aGF0IHRoZSBlbnRy
eSBzdGFydHMgb24gYW4gYWxpZ25lZAorICAgICAgYm91bmRhcnkgd2l0aGluIHRoZSBjb250YWlu
aW5nIHNlY3Rpb24gb3IgaW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWduID0KKyAgICAgIDwxNj7i
gJkgbWVhbnMgdGhhdCB0aGUgZW50cnkgd2lsbCBzdGFydCBvbiBhIDE2LWJ5dGUgYm91bmRhcnku
IFRoaXMgbWF5CisgICAgICBtZWFuIHRoYXQgcGFkZGluZyBpcyBhZGRlZCBiZWZvcmUgdGhlIGVu
dHJ5LiBUaGUgcGFkZGluZyBpcyBwYXJ0IG9mCisgICAgICB0aGUgY29udGFpbmluZyBzZWN0aW9u
IGJ1dCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5nIHRoYXQKKyAgICAgIGFu
IGVtcHR5IHNwYWNlIG1heSBiZSBjcmVhdGVkIGJlZm9yZSB0aGUgZW50cnkgc3RhcnRzLiBBbGln
bm1lbnQKKyAgICAgIG11c3QgYmUgYSBwb3dlciBvZiAyLiBJZiDigJhhbGlnbuKAmSBpcyBub3Qg
cHJvdmlkZWQsIG5vIGFsaWdubWVudCBpcworICAgICAgcGVyZm9ybWVkLgorCisgIGFsaWduLXNp
emU6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisg
ICAgbWluaW11bTogMQorICAgIG1heGltdW06IDB4ODAwMDAwMDAKKyAgICBtdWx0aXBsZU9mOiAy
CisgICAgZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMgdGhlIGFsaWdubWVudCBvZiB0aGUg
ZW50cnkgc2l6ZSBpbiBieXRlcy4gSXQgbXVzdCBiZSBhIHBvd2VyCisgICAgICBvZiAyLgorCisg
ICAgICBGb3IgZXhhbXBsZSwgdG8gZW5zdXJlIHRoYXQgdGhlIHNpemUgb2YgYW4gZW50cnkgaXMg
YSBtdWx0aXBsZSBvZiA2NAorICAgICAgYnl0ZXMsIHNldCB0aGlzIHRvIDY0LiBXaGlsZSB0aGlz
IGRvZXMgbm90IGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlCisgICAgICBlbnRyeSB3aXRoaW4g
YmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9ybWVkIG9ubHkgd2hlbiBpdHMKKyAg
ICAgIHBhcmVudCBzZWN0aW9uIGlzIGFzc2VtYmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQg
dGhlIGVudHJ5IGVuZHMKKyAgICAgIHdpdGggdGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93
LiBJZiDigJhhbGlnbi1zaXpl4oCZIGlzIG5vdCBwcm92aWRlZCwKKyAgICAgIG5vIGFsaWdubWVu
dCBpcyBwZXJmb3JtZWQuCisKKyAgYWxpZ24tZW5kOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06IDEKKyAgICBtYXhpbXVtOiAw
eDgwMDAwMDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhp
cyBzZXRzIHRoZSBhbGlnbm1lbnQgKGluIGJ5dGVzKSBvZiB0aGUgZW5kIG9mIGFuIGVudHJ5IHdp
dGggcmVzcGVjdAorICAgICAgdG8gdGhlIGNvbnRhaW5pbmcgc2VjdGlvbi4gSXQgbXVzdCBiZSBh
IHBvd2VyIG9mIDIuCisKKyAgICAgIFNvbWUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhleSBlbmQg
b24gYW4gYWxpZ25tZW50IGJvdW5kYXJ5LAorICAgICAgcmVnYXJkbGVzcyBvZiB3aGVyZSB0aGV5
IHN0YXJ0LiBUaGlzIGRvZXMgbm90IG1vdmUgdGhlIHN0YXJ0IG9mIHRoZQorICAgICAgZW50cnks
IHNvIHRoZSBjb250ZW50cyBvZiB0aGUgZW50cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0aGUgYmVn
aW5uaW5nLgorICAgICAgQnV0IHRoZXJlIG1heSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQuIFdoaWxl
IHRoaXMgZG9lcyBub3QgYWZmZWN0IHRoZQorICAgICAgY29udGVudHMgb2YgdGhlIGVudHJ5IHdp
dGhpbiBiaW5tYW4gaXRzZWxmICh0aGUgcGFkZGluZyBpcyBwZXJmb3JtZWQKKyAgICAgIG9ubHkg
d2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1bHQgaXMg
dGhhdCB0aGUKKyAgICAgIGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZyBieXRlcywgc28gbWF5
IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmSBpcyBub3QKKyAgICAgIHByb3ZpZGVkLCBubyBhbGln
bm1lbnQgaXMgcGVyZm9ybWVkLgorCiBpZjoKICAgbm90OgogICAgIHJlcXVpcmVkOiBbIHJlZyBd
CkBAIC02NywzICsxMTgsMjQgQEAgdGhlbjoKIAogIyBUaGlzIGlzIGEgZ2VuZXJpYyBmaWxlIG90
aGVyIGJpbmRpbmcgaW5oZXJpdCBmcm9tIGFuZCBleHRlbmQKIGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiB0cnVlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAgICAgY29t
cGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHBhcnRpdGlvbkAxMDAw
MDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1LWJvb3QiOworICAgICAgICAgICAgcmVn
ID0gPDB4MTAwMDAwIDB4ZjAwMDAwPjsKKyAgICAgICAgICAgIGFsaWduLXNpemUgPSA8MHgxMDAw
PjsKKyAgICAgICAgICAgIGFsaWduLWVuZCA9IDwweDEwMDAwPjsKKyAgICAgICAgfTsKKworICAg
ICAgICBwYXJ0aXRpb25AMjAwMDAwIHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGZhLWJs
MzEiOworICAgICAgICAgICAgcmVnID0gPDB4MjAwMDAwIDB4MTAwMDAwPjsKKyAgICAgICAgICAg
IGFsaWduID0gPDB4NDAwMD47CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuMzQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
