Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D8DC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nC2j7CgsDnnhkqpu4b4K8muzaNR6+GcA9D9rRyGbx0=; b=titg9Kj/8Sr6FQ
	u5grAue/a0jTuZiL9YEPCyg/THLXdm+czUU4LL8jv2VthiknB51zaCIDBSJExJclQ0EV0EblfN6j4
	agdvo1t7Iy6TrppkhqXRn0e1hbX+Yv9QPVcqBOpT6I860ehSUf5UUxe8S2Uvj768iiLKOC+m+wnb+
	eeVhxdip/MuNFBOw2NZPIZAtN0BLqnra/aJ2ODFQk+SkuNz6INVIG5YUdJNXIbXGzyNhZ3San2sbU
	UgwmztImtMlDXM/+MEkSD96BdrevDjJc4bfIYKTtaSmlG1WHkJj97xsPF4x27hZkrW5+P2GpNEgVn
	BbiwJ1Wr7bcv1ScZ0LYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7f4M-0035KL-1V;
	Mon, 27 Nov 2023 17:06:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7f4J-0035Jj-1P
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 17:06:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so2566733f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 09:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701104804; x=1701709604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUGvyHUqC4wbQB6wNS0Ew7+5esmpwCZ6TsQ9QFwZ7dY=;
        b=IJmjAU5GKtDUdGTEkdFoyRu5KxOdk4Jbif2pFjlVTGGNk2PjYhNa7numdLIfMMlopd
         HyxmjLS5Cm7DekMlL6baTiPQyLf/Mec0CJrIPBPJGv0aSnHX6MlHBTGQX0jfJPzpBCW3
         0tssu6Sv1ENoN3VcVLKvAgO4U+s51gt1Ns98St5Bb8aETsExVdrG+JAArsIOMtslUT8i
         ZdnRHO1ZdrMNqLZabq6iQjdlvUcVKO1H6KvIWPPpA9eFoIKQCxKi32VglDKkcuMcscLt
         SN0sqmu6bs/K/83XWpXpef+zsvdTF3yXIWtV4mdJDViqdrLWchy6j0GDupKBUrA8w3W0
         iKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104804; x=1701709604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUGvyHUqC4wbQB6wNS0Ew7+5esmpwCZ6TsQ9QFwZ7dY=;
        b=vR0fm69aJLYSNSWjkDLxvhdKU03FwlOvErnNRWc4Gp6t31d4B0Zqzdg+lmtRaP/zBH
         ukfd7AWzScNqS4lhmTuIsgh6RrOAQCJBOpLqSn5M0DrUJ9bnYtYh1JSBAIcQRpHC1+Pl
         e3p+GltrsI8W+8fD7alGUaAy9HOPLMnMYeQLYrtuIJyaIRUikFowUFe8dXDwRqBeo7bK
         /RtZDQ36BeWEe4KZVr9gh7PQ8jFJ6WTMmynJ4utK9LAkfGFJxHFkK6lsHWwuBFIZpSnM
         a1+E+RseBz+QWGLVXL0fjvwvrfATtJbvUW6WL3kgSZ45YQKvw5jsm5t9ZmtLNoKnFEZn
         rDqg==
X-Gm-Message-State: AOJu0YwPY/iCY0ztP5VRbXkok4GGp45MDMxwaV+8Mk75OOmPoJBO9S6m
	wqgHmOfoWImOw1z1CkCmYnFKng==
X-Google-Smtp-Source: AGHT+IFyHUoGtgKtnaQiipPgrlL0s0zWp8sFsera9XNTHXdCXVpUvJ21rwAW7n94+H9yuU82VE7eLw==
X-Received: by 2002:adf:ff92:0:b0:332:eacf:c9d7 with SMTP id j18-20020adfff92000000b00332eacfc9d7mr9556636wrr.8.1701104803908;
        Mon, 27 Nov 2023 09:06:43 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b397787d3sm12065229wmo.24.2023.11.27.09.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 09:06:43 -0800 (PST)
Message-ID: <0e3d79c5-7430-4344-99a4-5f434a5f7547@linaro.org>
Date: Mon, 27 Nov 2023 17:06:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash name
 does not exist
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127100756.41605-3-jaimeliao.tw@gmail.com>
 <6d362dd698095b04dd895019d3af26d0@walle.cc> <20231127154737.534db375@xps-13>
 <848f3b2e83d363fd69adfc947b197011@walle.cc>
 <e34cc75e-3060-459f-bf09-2f2b3d99678d@linaro.org>
 <63508eaccc1dcddf1deb1245ef39f00c@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <63508eaccc1dcddf1deb1245ef39f00c@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_090647_475961_FA8B176D 
X-CRM114-Status: GOOD (  22.98  )
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

CgpPbiAxMS8yNy8yMyAxNToyOCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPj4+Pj4g
PiAobnVsbCkgd2lsbCBwcmludCB3aGVuIGZsYXNoIElEIGZvdW5kZWQgaW4gSUQgdGFibGUgYnV0
Cj4+Pj4+ID4gdGhlIGZsYXNoIG5hbWUgZGlkbid0IGluY2x1ZGUgaW4gaXQuCj4+Pj4+ID4KPj4+
Pj4gPiBNYWtlIGluZm8tPm5hbWUgb3B0aW9uYWwgaW4gdGhlIHByaW50IGZvciBzaG93aW5nIGZs
YXNoIG5hbWUKPj4+Pj4gPiBhbmQgZmxhc2ggc2l6ZS4KPj4+Pj4gPgo+Pj4+PiA+IFNpZ25lZC1v
ZmYtYnk6IEphaW1lTGlhbyA8amFpbWVsaWFvQG14aWMuY29tLnR3Pgo+Pj4+PiA+IC0tLQo+Pj4+
PiA+wqAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCAyICstCj4+Pj4+ID7CoCAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4gPgo+Pj4+PiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5jCj4+Pj4+ID4gaW5kZXggMWM0NDNmZTU2OGNmLi43MzQwNWJlZDJhNWEgMTAwNjQ0
Cj4+Pj4+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+Pj4gPiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4+PiA+IEBAIC0zNTE4LDcgKzM1MTgsNyBAQCBp
bnQgc3BpX25vcl9zY2FuKHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0Cj4+Pj4+IGNoYXIgPiAq
bmFtZSwKPj4+Pj4gPsKgwqDCoMKgwqAgLyogTm8gbXRkX2luZm8gZmllbGRzIHNob3VsZCBiZSB1
c2VkIHVwIHRvIHRoaXMgcG9pbnQuICovCj4+Pj4+ID7CoMKgwqDCoMKgIHNwaV9ub3Jfc2V0X210
ZF9pbmZvKG5vcik7Cj4+Pj4+ID4KPj4+Pj4gPiAtwqDCoMKgIGRldl9pbmZvKGRldiwgIiVzICgl
bGxkIEtieXRlcylcbiIsIGluZm8tPm5hbWUsCj4+Pj4+ID4gK8KgwqDCoCBkZXZfaW5mbyhkZXYs
ICIlcyAoJWxsZCBLYnl0ZXMpXG4iLCBpbmZvLT5uYW1lID86ICIiLAo+Pj4+Pgo+Pj4+PiBNYXli
ZSBwcmludCB0aGUgamVkZWMgaWQgaWYgdGhlIG5hbWUgaXMgZW1wdHkuCj4+Pj4KPj4+PiBXaGF0
IGFib3V0IGFsd2F5cyBwcmludGluZyB0aGUgamVkZWMgaWQgaWYgbmFtZXMgYXJlbid0IHJlbGlh
YmxlCj4+Pj4gZW5vdWdoPwo+Pj4KPj4+IEknbSBmaW5lIHdpdGggdGhhdCwgdG9vLiBBY3R1YWxs
eSBJJ3ZlIGNvbnNpZGVyZWQgdGhhdCBteXNlbGYsIGJ1dAo+Pj4gbWF5YmUgVHVkb3Igb3IgUHJh
dHl1c2ggd2FudCB0byBrZWVwIHRoZSBvdXRwdXQgYmFja3dhcmRzIGNvbXBhdGlibGUuCj4+Pgo+
Pgo+PiBXZSB3b24ndCByZW1vdmUgdGhlIG5hbWVzIGZvciBmbGFzaGVzIHRoYXQgYWxyZWFkeSBo
YXZlIGEgbmFtZSBkZWZpbmVkLAo+PiB3b24ndCB3ZT8KPiAKPiBOby4KPiAKPj4gV2UganVzdCBk
ZXByZWNhdGUgdGhlIG5hbWUgZmllbGQgYW5kIG5vdCB1c2UgaXQgYW55bW9yZSB3aXRoCj4+IG5l
dyBmbGFzaCBhZGRpdGlvbnMuIE5vIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgcHJvYmxlbS4KPiAK
PiBJIG1lYW4gaW4gdGhlIGtlcm5lbCBjb25zb2xlIG91dHB1dC4gU29tZW9uZSBvdXQgdGhlcmUg
bWlnaHQgcGFyc2UgaXQuCj4gCj4gSWYgeW91IHN3aXRjaCBmcm9tCj4gwqAgZGV2X2luZm8oZGV2
LCAiJXMgKCVsbGQgS2J5dGVzKVxuIiwgaW5mby0+bmFtZSwgLi4uKQo+IHRvCj4gwqAgZGV2X2lu
Zm8oZGV2LCAiIiUqcGhOICglbGxkIEtieXRlcylcbiIsIGlkX2xlbiwgaWQsIC4uLikKPiAKCm5v
IHByb2JsZW0gaW4gY2hhbmdpbmcgd2hhdCB3ZSBwcmludCB0byBrZXJuZWwgbG9nLCB0aGVyZSdz
IG5vCmd1YXJhbnRlZXMgYXNzb2NpYXRlZCB3aXRoIGl0LgoKPj4gQlRXLCB0aGF0IHByaW50IHNo
b3VsZCBiZSBsb3dlcmVkIHRvIGRldl9kYmcsIGxldCdzIG5vIGxvbmdlciBwb2xsdXRlCj4+IHRo
ZSBrZXJuZWwgbG9nLiBEcml2ZXJzIHNob3VsZCBiZSBxdWlldCBpZiBhbGwgZ29lcyB3ZWxsLgo+
IAo+IFdlbGwsIG9rLCB0aGF0IHdpbGwgYWxzbyBhbnN3ZXIgbXkgcXVlc3Rpb24gOikgU28gbGV0
J3MgZ28KPiB3aXRoIHRoZSBkZXZfZGJnKCkgYW5kIGlkIG9ubHkuCj4gCgpJIGxvb2tlZCBhZ2Fp
biBhbmQgSSBzYXcgdGhhdCB0b2dldGhlciB3aXRoIHRoZSBuYW1lIHdlIHByaW50ZWQgdGhlCmZs
YXNoIHNpemUgaW4gS2J5dGVzLiBCdXQgdGhlbiB0aGUgbmV4dCBwcmludCBwcmludGVkIHRoZSBz
YW1lIGZsYXNoCnNpemUgaW4gYnl0ZXMgYW5kIHRoZW4gaW4gTUJ5dGVzLiBBbmQgdGhlbiB3ZSBw
cmludGVkIHNvbWUgbXRkIGRhdGEgdGhhdApzaG91bGQgYmUgb2J0YWluZWQgd2l0aCB0aGUgbXRk
IGlvY3Rscy4gSSBkaWRuJ3QgbGlrZSB0aGF0IG1lc3MgYW5kCmVuZGVkIHVwIHJlbW92aW5nIGFs
bCB0aG9zZSBwcmludHMuIFdlIHNoYWxsIG5vdyBoYXZlIGEgZmFzdGVyIGtlcm5lbApib290IChn
b3QgcmlkIG9mIHRoZSBwcmludCBpbmZvKSwgYW5kIGNsZWFuZXIga2VybmVsIGxvZy4gQWxsIHRo
YXQgZGVidWcKZGF0YSBzaGFsbCBiZSBvYnRhaW5lZCB3aXRoIHRoZSBtdGQgaW9jdGxzIGFuZCB0
aGUgU1BJIE5PUiBzeXNmcyBhbmQKZGVidWdmcyBlbnRyaWVzLCBzbyBob3BlZnVsbHkgbW9yZSBw
ZW9wbGUgd2lsbCBzdGFydCB1c2luZyB0aGVtLgoKSGVyZSdzIHRoZSBwYXRjaCB0aGF0IEkgbWVu
dGlvbmVkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMzExMjcxNjU5MDgu
MTczNDk1MS0xLXR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZy9ULyN1CgpDaGVlcnMsCnRhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
