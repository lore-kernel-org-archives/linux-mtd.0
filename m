Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B9C25B47
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 21:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly1M3Glpg59Md1L+zZGrVf2Vt70rHgr+MiNIvh/+WRY=; b=MgwD9OuIlw489n
	Xvl2lrb75kgaaaWk3I+tfK9qUKkYgyL3o4fMyZk/QnVRZ3iG9AD2SbClxvtttecS27sV7ZneGBjWs
	UjwZ1kTlB7/ar6bTJyP4p550qGcjfBEacbj4afxbP4UzSAeGeTXmCe516zYkIiSKkALAF9XS43OA/
	HrMuKshjIK143WIsEskWRNnU84CMxiPFAi34l3AWy02PEydGOksKDfss9LtIZzMB0Z0u+r4HIXSkk
	acP1/ycKLUsqg/QxMZEU2yrmq0L/l+4NJz1/lFUOEPlhkm/edO17+oYHoilYHDzG9qgLYqRX6r+24
	kE61jSNNVbE3BeR0WZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP9T-00Atw6-1C;
	Tue, 24 Oct 2023 21:41:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP9Q-00Atu6-1g
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 21:41:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fb85afef4so4253076b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 14:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698183683; x=1698788483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aochEXBDpOVdwQRDyloN4dJAYsQ0xcQP5GM4jBPJ4+0=;
        b=hCul7rcsXaEVOBYmwEDN8wZh5f0OOQ3KkoutD87rkbMSDlzv/MdbpZBnG6sLfIH1ZP
         ZEDOb1pt3wDveLrRYGZR6SE0VibnwhNXxMC52PYyF5AR77gpOFs34krrPYg5u7hdH6mY
         729fE2D2O0dds8TY3ymGhGGJdFaBwl2RrodKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698183683; x=1698788483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aochEXBDpOVdwQRDyloN4dJAYsQ0xcQP5GM4jBPJ4+0=;
        b=q5G4If3XF1TTRw4TcIjhGwu9/Ek2Wt4Axog+UAI50y1lKLWmbEfEDO/bOwpFssu1HB
         eqRrbEabddJ41vSkhKOF8xApmvPTSv7IIF4GhvGoyQ6DC0eMzNCnuf3wawEUvgjMbLEV
         HBl+je+b3RPdCiU8XWrl89fExRdrzH23PabJ1RNGJQ8i2tDmjgG8fD8MrTGvOUuYShK0
         7aRnt3IgKLxZoeAEflFspB27ZTViDO5eedd+yketYozlARGg0SExRgIVOd9/mPN0oqKl
         42y4fMFQYYKheXcONdrK3nma+ckboJMUOPy3A3OSDGZrbGdT69CxxnAse8pR4DqUJVi9
         PlOQ==
X-Gm-Message-State: AOJu0Yyl+5y0O1eWFbl1LViSHOuUGqC8/AIykkdsIBgTIJLQgND5dSNx
	sBcSnItZ9VVd/nDLGrf48yVfTQ==
X-Google-Smtp-Source: AGHT+IHg7NIAL+/vq1uVaLXguXuYCzXyJKM8i2wy6dmakFvVWfsSo7C499cy58klAxaY3feF/mh9VA==
X-Received: by 2002:a05:6a21:164a:b0:151:7d4c:899c with SMTP id no10-20020a056a21164a00b001517d4c899cmr3632385pzb.25.1698183682801;
        Tue, 24 Oct 2023 14:41:22 -0700 (PDT)
Received: from sjg1.roam.corp.google.com ([202.144.206.130])
        by smtp.gmail.com with ESMTPSA id 18-20020a170902c21200b001c5f7e06256sm7861055pll.152.2023.10.24.14.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:41:22 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Wed, 25 Oct 2023 10:39:18 +1300
Message-ID: <20231024213940.3590507-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024213940.3590507-1-sjg@chromium.org>
References: <20231024213940.3590507-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_144124_556770_3F92923B 
X-CRM114-Status: GOOD (  23.49  )
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
bmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Ci0tLQoKQ2hhbmdlcyBp
biB2NToKLSBBZGQgdmFsdWUgcmFuZ2VzCi0gQ29uc2lzdGVudGx5IG1lbnRpb24gYWxpZ25tZW50
IG11c3QgYmUgcG93ZXItb2YtMgotIE1lbnRpb24gdGhhdCBhbGlnbm1lbnQgcmVmZXJzIHRvIGJ5
dGVzCgpDaGFuZ2VzIGluIHYyOgotIEZpeCAnYScgdHlwbyBpbiBjb21taXQgbWVzc2FnZQoKIC4u
Li9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwgICAgICB8IDU0ICsrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1h
bi1wYXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKaW5kZXggMzdhNDEzNDY0YjBjZTUuLmNi
MWVkZDgzZWQyOWE5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLXBhcnRpdGlvbi55YW1sCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlh
bWwKQEAgLTI5LDYgKzI5LDU3IEBAIHByb3BlcnRpZXM6CiAgICAgICAgIC0gdS1ib290ICAgICAg
ICMgdS1ib290LmJpbiBmcm9tIFUtQm9vdCBwcm9qZWN0CiAgICAgICAgIC0gdGZhLWJsMzEgICAg
ICMgYmwzMS5iaW4gb3IgYmwzMS5lbGYgZnJvbSBURi1BIHByb2plY3QKIAorICBhbGlnbjoKKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBtaW5p
bXVtOiAxCisgICAgbWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxlT2Y6IDIKKyAgICBk
ZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRyeSBp
biBieXRlcy4KKworICAgICAgVGhlIGVudHJ5IG9mZnNldCBpcyBhZGp1c3RlZCBzbyB0aGF0IHRo
ZSBlbnRyeSBzdGFydHMgb24gYW4gYWxpZ25lZAorICAgICAgYm91bmRhcnkgd2l0aGluIHRoZSBj
b250YWluaW5nIHNlY3Rpb24gb3IgaW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWduID0KKyAgICAg
IDwxNj7igJkgbWVhbnMgdGhhdCB0aGUgZW50cnkgd2lsbCBzdGFydCBvbiBhIDE2LWJ5dGUgYm91
bmRhcnkuIFRoaXMgbWF5CisgICAgICBtZWFuIHRoYXQgcGFkZGluZyBpcyBhZGRlZCBiZWZvcmUg
dGhlIGVudHJ5LiBUaGUgcGFkZGluZyBpcyBwYXJ0IG9mCisgICAgICB0aGUgY29udGFpbmluZyBz
ZWN0aW9uIGJ1dCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5nIHRoYXQKKyAg
ICAgIGFuIGVtcHR5IHNwYWNlIG1heSBiZSBjcmVhdGVkIGJlZm9yZSB0aGUgZW50cnkgc3RhcnRz
LiBBbGlnbm1lbnQKKyAgICAgIG11c3QgYmUgYSBwb3dlciBvZiAyLiBJZiDigJhhbGlnbuKAmSBp
cyBub3QgcHJvdmlkZWQsIG5vIGFsaWdubWVudCBpcworICAgICAgcGVyZm9ybWVkLgorCisgIGFs
aWduLXNpemU6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyCisgICAgbWluaW11bTogMQorICAgIG1heGltdW06IDB4ODAwMDAwMDAKKyAgICBtdWx0aXBs
ZU9mOiAyCisgICAgZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMgdGhlIGFsaWdubWVudCBv
ZiB0aGUgZW50cnkgc2l6ZSBpbiBieXRlcy4gSXQgbXVzdCBiZSBhIHBvd2VyCisgICAgICBvZiAy
LgorCisgICAgICBGb3IgZXhhbXBsZSwgdG8gZW5zdXJlIHRoYXQgdGhlIHNpemUgb2YgYW4gZW50
cnkgaXMgYSBtdWx0aXBsZSBvZiA2NAorICAgICAgYnl0ZXMsIHNldCB0aGlzIHRvIDY0LiBXaGls
ZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlCisgICAgICBlbnRyeSB3
aXRoaW4gYmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9ybWVkIG9ubHkgd2hlbiBp
dHMKKyAgICAgIHBhcmVudCBzZWN0aW9uIGlzIGFzc2VtYmxlZCksIHRoZSBlbmQgcmVzdWx0IGlz
IHRoYXQgdGhlIGVudHJ5IGVuZHMKKyAgICAgIHdpdGggdGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1h
eSBncm93LiBJZiDigJhhbGlnbi1zaXpl4oCZIGlzIG5vdCBwcm92aWRlZCwKKyAgICAgIG5vIGFs
aWdubWVudCBpcyBwZXJmb3JtZWQuCisKKyAgYWxpZ24tZW5kOgorICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06IDEKKyAgICBtYXhp
bXVtOiAweDgwMDAwMDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAg
ICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgKGluIGJ5dGVzKSBvZiB0aGUgZW5kIG9mIGFuIGVu
dHJ5IHdpdGggcmVzcGVjdAorICAgICAgdG8gdGhlIGNvbnRhaW5pbmcgc2VjdGlvbi4gSXQgbXVz
dCBiZSBhIHBvd2VyIG9mIDIuCisKKyAgICAgIFNvbWUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhl
eSBlbmQgb24gYW4gYWxpZ25tZW50IGJvdW5kYXJ5LAorICAgICAgcmVnYXJkbGVzcyBvZiB3aGVy
ZSB0aGV5IHN0YXJ0LiBUaGlzIGRvZXMgbm90IG1vdmUgdGhlIHN0YXJ0IG9mIHRoZQorICAgICAg
ZW50cnksIHNvIHRoZSBjb250ZW50cyBvZiB0aGUgZW50cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0
aGUgYmVnaW5uaW5nLgorICAgICAgQnV0IHRoZXJlIG1heSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQu
IFdoaWxlIHRoaXMgZG9lcyBub3QgYWZmZWN0IHRoZQorICAgICAgY29udGVudHMgb2YgdGhlIGVu
dHJ5IHdpdGhpbiBiaW5tYW4gaXRzZWxmICh0aGUgcGFkZGluZyBpcyBwZXJmb3JtZWQKKyAgICAg
IG9ubHkgd2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1
bHQgaXMgdGhhdCB0aGUKKyAgICAgIGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZyBieXRlcywg
c28gbWF5IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmSBpcyBub3QKKyAgICAgIHByb3ZpZGVkLCBu
byBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
IAogZXhhbXBsZXM6CkBAIC00MSwxMCArOTIsMTMgQEAgZXhhbXBsZXM6CiAgICAgICAgIHBhcnRp
dGlvbkAxMDAwMDAgewogICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1LWJvb3QiOwogICAgICAg
ICAgICAgcmVnID0gPDB4MTAwMDAwIDB4ZjAwMDAwPjsKKyAgICAgICAgICAgIGFsaWduLXNpemUg
PSA8MHgxMDAwPjsKKyAgICAgICAgICAgIGFsaWduLWVuZCA9IDwweDEwMDAwPjsKICAgICAgICAg
fTsKIAogICAgICAgICBwYXJ0aXRpb25AMjAwMDAwIHsKICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAidGZhLWJsMzEiOwogICAgICAgICAgICAgcmVnID0gPDB4MjAwMDAwIDB4MTAwMDAwPjsKKyAg
ICAgICAgICAgIGFsaWduID0gPDB4NDAwMD47CiAgICAgICAgIH07CiAgICAgfTsKLS0gCjIuNDIu
MC43NTguZ2FlZDAzNjhlMGUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
