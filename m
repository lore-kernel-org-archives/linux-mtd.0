Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5D6C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:22:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3523364EC3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3523364EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MP1wvE7xW//cc5+w/my5rbIQF1Yyw/K1Noo2B9WapqE=; b=YXqQmDv6LK3g7W1bDQLjk+XBX
	5+fQFLa5URVAKUPRRrJ3s0Zv4I2lVMqMni3u5H9dhy/GN84t1qzHuig0J5CfaY330DKfedkwdANIf
	cgFED4K54bWyXsPzOUUVztpSSJ8ppjBHpETgUFJ53Ral9IFo2AfK/wdst5YcSlgqagBDN/NlLMBW/
	u+IlbqAZjO9qlIc6iGWOmZLojKQAM+rtj44U8GzUYKd4KLSop6kDGCTprZTGV3wQnTZwiSSLaXpZL
	4AlgAaIiDyDBviHcMu1y76hR0DnhGqfIBooTUV/foklqODYAt4XzUCaOA6RSSoGMvouOcrL9qrQLr
	SWQNsSdFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZs1-006jzk-TD; Wed, 03 Mar 2021 22:21:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTAx-005Klo-6g
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=zK+KKzHDy96fD8Ado48n+v2+h+rSyFj7Z9Ecpa/L53g=; b=gL/aB+PXiMF0l3tSGKRPu05rzH
 HZmzfiX0G9+OazvE0NebimmwAN3sMqPFz2NGpjj9/JtZYBh6HvuCb9bv3R/436Dti4Ow6hyTf2Lft
 /SxrgWV48iHaKuYrGrM0I337iZ6AuYVQYBcYwT1LuM5v9vmfCJZ5uw5L9CrTFDDf44Id5bSMKvI+k
 4EqsPnh8Cg1tVO31m9fkGxVylFBHrYwQKK8G3TDk7BD5n7ZkxlB7WZIn2IaYMxsVjnW5CmeTgdJ5w
 zgpo8VeeWpdkqNDlftZsWhYqHgmd7O+40JXTQP3TipkSnDqzQX+1UY6nugAYL38Ue2WCchdIn4/IR
 uiqCEfYw==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8hy-00HX5i-Ep
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:21:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ci14so17714772ejc.7
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 09:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zK+KKzHDy96fD8Ado48n+v2+h+rSyFj7Z9Ecpa/L53g=;
 b=bxQ9hcxmqpIQuIT7HyUiBmiowbUr5yoAQwzUJ0yLJmKWH3dxtzvsEx3Who38HjGxMV
 sYn9UCQYWptvrBB+IrMJpvc+fu6cyrJzjxxkkjQlmBAt3fydztEECovNw6d+Wfx+EuLF
 kXlIE+6aC3EtvNiSeo7/i5NlCQdJ4a4peSR2jc6QzTYAYoy9VKxG3SKUKNrSumnC03jZ
 lOmv3gHVYafr5kKIKjg6qyZMeVgQLQpDCrcLnz4MTgMl1LeS3Jo02ak05MMsi6yb588z
 fiSQIT+yRuEjLdHs6tm+RJB9E2EA9fdyvq7/FrUcQV7kYF6yvEjYdVdjiS5Cl+tB3ezU
 XZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zK+KKzHDy96fD8Ado48n+v2+h+rSyFj7Z9Ecpa/L53g=;
 b=nXe6hq2NAYRtAHE4YJOM8ene4vm/GYqn83EtayTEKTcXI52e7tp/O4CrzfVzvKbE9B
 hR+tPjkGFmY8P/Xt+r0MzgLlvfrrCQTlkAodDs14bls1ChG6LZwk7FL7QWAyztZPfGkj
 0Wfc9M4T+n/O9H+pqIBKy7pLsA6oVIJ109iNVObBEDnxpOuNtjJRfJ7YdVWHwn65kS0p
 bxcZiu8gpmxB+3+H528XnLEId0wzk+Kiv+0knVeh2618djBk7j612hGNSVWOAocs5LmG
 PJQihAQbecdd0L4qRfnCRwZ07o/bXrLpvSUhI8u6qBSN8/C99FQV0bKPlOINiOZUrrjx
 MP5g==
X-Gm-Message-State: AOAM532aQOX/D2ydxYEIzev9C1VUr4zfw3bgiUgigdNLih4DLc9N0RPu
 Brlg0pFTKf80qykcqEzkVaU=
X-Google-Smtp-Source: ABdhPJw8v7voB0M6C4fWLSnzAXN/gXoc7QDPY/Irgd8F0TkInhF7apTUHh+FcZ0/2d+GalG1n5WEQw==
X-Received: by 2002:a17:907:9e6:: with SMTP id
 ce6mr21277639ejc.207.1614705616358; 
 Tue, 02 Mar 2021 09:20:16 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-10-16-239.retail.telecomitalia.it. [87.10.16.239])
 by smtp.gmail.com with ESMTPSA id a9sm218574edt.82.2021.03.02.09.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:20:15 -0800 (PST)
Date: Tue, 2 Mar 2021 05:50:07 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/3] mtd: partitions: ofpart: skip subnodes parse with
 compatible
Message-ID: <YD3D/zwfLlRITdHj@Ansuel-xps.localdomain>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-2-ansuelsmth@gmail.com>
 <d504a4df-b1f7-b7c9-e62a-599d114d8a18@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d504a4df-b1f7-b7c9-e62a-599d114d8a18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_172121_572717_CCFC30AD 
X-CRM114-Status: GOOD (  27.12  )
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

T24gVHVlLCBNYXIgMDIsIDIwMjEgYXQgMDU6NTM6NTRQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDE2LjAyLjIwMjEgMjI6MjYsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IElm
IGEgcGFydGl0aW9ucyBzdHJ1Y3R1cmUgaXMgbm90IHVzZWQsIHBhcnNlIGRpcmVjdCBzdWJub2Rl
cyBhcwo+ID4gZml4ZWQtcGFydGl0aW9ucyBvbmx5IGlmIGEgY29tcGF0aWJsZSBpcyBub3QgZm91
bmQgb3IgaXMgb2YgdHlwZQo+ID4gZml4ZWQtcGFydGl0aW9uLiBBIHBhcnNlciBjYW4gYmUgdXNl
ZCBkaXJlY3RseSBvbiB0aGUgc3Vibm9kZSBhbmQKPiA+IHN1Ym5vZGVzIHNob3VsZCBub3QgYmUg
cGFyc2VkIGFzIGZpeGVkLXBhcnRpdGlvbnMgYnkgZGVmYXVsdC4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBk
cml2ZXJzL210ZC9wYXJzZXJzL29mcGFydC5jIHwgNSArKysrKwo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJz
ZXJzL29mcGFydC5jIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9vZnBhcnQuYwo+ID4gaW5kZXggZGFm
NTA3YzEyM2U2Li40YjM2M2RkMDMxMWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9wYXJz
ZXJzL29mcGFydC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydC5jCj4gPiBA
QCAtNTAsNiArNTAsMTEgQEAgc3RhdGljIGludCBwYXJzZV9maXhlZF9wYXJ0aXRpb25zKHN0cnVj
dCBtdGRfaW5mbyAqbWFzdGVyLAo+ID4gICAJCQkgbWFzdGVyLT5uYW1lLCBtdGRfbm9kZSk7Cj4g
PiAgIAkJb2ZwYXJ0X25vZGUgPSBtdGRfbm9kZTsKPiA+ICAgCQlkZWRpY2F0ZWQgPSBmYWxzZTsK
PiA+ICsKPiA+ICsJCS8qIFNraXAgcGFyc2luZyBkaXJlY3Qgc3Vibm9kZXMgaWYgYSBjb21wYXRp
YmxlIGlzIGZvdW5kIGFuZCBpcyBub3QgZml4ZWQtcGFydGl0aW9ucyAqLwo+ID4gKwkJaWYgKG5v
ZGVfaGFzX2NvbXBhdGlibGUob2ZwYXJ0X25vZGUpICYmCj4gPiArCQkgICAgIW9mX2RldmljZV9p
c19jb21wYXRpYmxlKG9mcGFydF9ub2RlLCAiZml4ZWQtcGFydGl0aW9ucyIpKQo+ID4gKwkJCXJl
dHVybiAwOwo+ID4gICAJfSBlbHNlIGlmICghb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUob2ZwYXJ0
X25vZGUsICJmaXhlZC1wYXJ0aXRpb25zIikpIHsKPiA+ICAgCQkvKiBUaGUgJ3BhcnRpdGlvbnMn
IHN1Ym5vZGUgbWlnaHQgYmUgdXNlZCBieSBhbm90aGVyIHBhcnNlciAqLwo+ID4gICAJCXJldHVy
biAwOwo+IAo+IEkgYWRtaXQgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBvbGQgYmluZGluZywg
c28gbGV0IG1lIGtub3cgaWYgbXkKPiB1bmRlcnN0YW5kaW5nIGlzIGluY29ycmVjdC4KPiAKPiBJ
dCBzZWVtcyB0byBtZSBob3dldmVyIHRoYXQgeW91ciBjaGFuZ2Ugd2lsbCBicmVhayBwYXJzaW5n
IGluIGNhc2VzCj4gbGlrZToKPiAKPiBzcGktZmxhc2hAMCB7Cj4gCWNvbXBhdGlibGUgPSAiamVk
ZWMsc3BpLW5vciI7Cj4gCXJlZyA9IDwweDA+Owo+IAo+IAlwYXJ0aXRpb25AMCB7Cj4gCQlsYWJl
bCA9ICJib290bG9hZGVyIjsKPiAJCXJlZyA9IDwweDAgMHgxMDAwMDA+Owo+IAl9Owo+IH07Cj4g
Cj4gbmFuZGNzQDAgewo+IAljb21wYXRpYmxlID0gImJyY20sbmFuZGNzIjsKPiAJcmVnID0gPDA+
Owo+IAo+IAlwYXJ0aXRpb25AMCB7Cj4gCQlsYWJlbCA9ICJib290bG9hZGVyIjsKPiAJCXJlZyA9
IDwweDAwMDAwMDAgMHgxMDAwMD47Cj4gCX07Cj4gfTsKPiAKPiBEaWQgd2UgZXZlciB1c2UgImZp
eGVkLXBhcnRpdGlvbnMiIHdpdGhvdXQgcGFydGl0aW9ucyB7IH0gc3Vibm9kZT8KCkhpLCB2ZXJ5
IGdvb2QgcG9pbnQuIFlvdSBhcmUgcmlnaHQgYW5kIEkgZGlkaW4ndCB0aGluayBhYm91dCB0aGlz
IGNhc2UuCkkgZG9uJ3Qgd2FudCB0byBhc3N1bWUgZmFsc2Ugc3RhdGVtZW50LCBidXQgc2luY2Ug
dGhlIG9mcGFydCBwYXJzZXIgYW5kCnRoZSBwYXJ0aXRpb25zIHN0cnVjdHVyZSBzaG91bGQgaGF2
ZSBiZWVuIHB1c2hlZCBhdCB0aGUgc2FtZSB0aW1lLCB0aGVyZQpzaG91bGRuJ3QgYmUgYW55IHVz
ZSBvZiAiZml4ZWQtcGFydGl0aW9ucyIgd2l0aG91dCBwYXJ0aXRpb25zIHsgfQpzdWJub2Rlcy4g
V2l0aCB0aGlzIGFzc3VtdGlvbiwgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gbG9va3MgdG8g
YmUgdGhlIApjbGVhbmVzdCB3YXkgdG8gc2tpcCBwYXJzaW5nLiAoaWYgdGhlIHBhcnNpbmcgaXMg
ZHViaW91cywgZG9uJ3QgcGFyc2UgYXQKYWxsLi4uIFRoZSBpZGVhIHdhcyB0aGF0KQpUaGUgaGFj
a3kgYW5kIElNSE8gZGlydHkgd2F5IHRvIHNvbHZlIHRoaXMgaXMgYWRkIGEgYm9vbCB0byBkaXJl
Y3RseQpza2lwIHRoZSBzdWJub2RlIHBhcnNpbmcgYW5kIGNoZWNrIGZvciB0aGF0LiBTb21ldGhp
bmcgbGlrZQoibm8tZml4ZWQtcGFydGl0aW9uIiB0aGF0IHdvdWxkIGRpc2FibGUgdGhlIG9mbm9k
ZSBwYXJzZXIgd2l0aCBubwpwYXJ0aXRpb25zIHsgfSBzdWJub2RlIHdvdWxkIGFjY29tcGxpc2gg
dGhlIHNhbWUgcmVzdWx0IG9mIHRoaXMgcGF0Y2gKYW5kIGtlZXAgY29tcGF0aWJpbGl0eSB3aXRo
IG5vZGVzIHNjaGVtZSB5b3UgcG9pbnRlZCBvdXQuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
