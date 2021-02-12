Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB07C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 14:46:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A470064E79
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 14:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A470064E79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SHvw90dMBtMHaylQO0O7yOlnFp9+P+bfBTDJcz9ntq4=; b=ioNm9Gs9PTGl15wk9+hfZLbQV
	OKpf9GjkJVYaa0uTyfUUoaDQgqRlkYE2cvxk+1EZBGNt72oJz7vDBCuzNrX9HayahuxzLLaRa5Rtb
	Ikl9doYN+8eTJ2thCF+nDXnd6MFIYDmJ2kp0ZcCVRLZwX65cmrD3+76arGvtzp0KdohnGBhv3tNul
	NFX/W4oQuIn9q6fKSJ2xU9g3DblJcnLZ7jwVTR2cWBIbXHI/HEmUCz7Pu80oDRe3NULu2WI1pVkBZ
	Ynra7APSmbv0vDQ3SpYZMvbHe/BFk0e3vb3mUDllo7fao3egkanOOQCy7JCdJo9hKNer9jHu2rxZW
	Uvl0PigQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAZhy-00067Q-JY; Fri, 12 Feb 2021 14:46:10 +0000
Received: from gateway22.websitewelcome.com ([192.185.46.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAZhg-0005x9-Al
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 14:45:54 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id C99556309
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2021 08:45:35 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id AZhOlehVToE4DAZhOlf7Nc; Fri, 12 Feb 2021 08:45:35 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glp60UXGarq63pZzgUg34Dew1JfJ6LOI7g6nXATFrbg=; b=DbzlqaqpCh5lkVGsYG+qA0uI+H
 c6qvssnPiz2OdGAbP0E+RpSB80hucS5kbkIaJqfb5lAgczGNVEy/2a8B21XeWZ7kRnjlO7lpUCh+z
 LuCRj/tvfVWVRSqG7xIfRMyAxI8TdxZQ2jAqPy3JM0sTdYgeasa+EzscWsychWUCGdMnkp1FZqD4W
 fPC/myn1x4LTQmpJVvGC/Zq5IFk0orULL7AtsJ0Oddv4ABabWyxidBl6yM6eGtkSKIb7VArsH6a2H
 8F6UFxysDKiTxxXy4PLf+Nv8tq0YMcVKTCfQtbFf2xjEStKn6U97Lg8bfGxctcseVCIvwHMnJsd+s
 96kHnHrQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:49096
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lAZhO-003g9n-Hs; Fri, 12 Feb 2021 08:45:34 -0600
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20210212104022.GA242669@embeddedor>
 <20210212151216.31a09ad1@xps13>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Subject: Re: [PATCH] mtd: physmap: physmap-bt1-rom: Fix unintentional stack
 access
Message-ID: <d4f2385d-bd4f-1af8-60c9-48657d046d5f@embeddedor.com>
Date: Fri, 12 Feb 2021 08:45:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212151216.31a09ad1@xps13>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lAZhO-003g9n-Hs
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:49096
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_094552_598674_FD5E29AA 
X-CRM114-Status: GOOD (  21.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyLzEyLzIxIDA4OjEyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEd1c3Rhdm8sCj4g
Cj4gIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlIG9u
IEZyaSwgMTIgRmViIDIwMjEKPiAwNDo0MDoyMiAtMDYwMDoKPiAKPj4gQ2FzdCAmZGF0YSB0byAo
Y2hhciAqKSBpbiBvcmRlciB0byBhdm9pZCB1bmludGVudGlvbmFsbHkgYWNjZXNzaW5nCj4+IHRo
ZSBzdGFjay4KPj4KPj4gTm90aWNlIHRoYXQgZGF0YSBpcyBvZiB0eXBlIHUzMiwgc28gYW55IGlu
Y3JlbWVudCB0byAmZGF0YQo+PiB3aWxsIGJlIGluIHRoZSBvcmRlciBvZiA0LWJ5dGUgY2h1bmtz
LCBhbmQgdGhpcyBwaWVjZSBvZiBjb2RlCj4+IGlzIGFjdHVhbGx5IGludGVuZGVkIHRvIGJlIGEg
Ynl0ZSBvZmZzZXQuCj4gCj4gSSBkb24ndCBoYXZlIHRoZSBzYW1lIHJlYWRpbmcuIEkgZG9uJ3Qg
c2F5IHRoYXQgQ292ZXJpdHkgcmVwb3J0IGlzCj4gd3JvbmcsIGJ1dCBsZXQncyBkaXNjdXNzIHRo
aXMgYSBiaXQgZnVydGhlci4KPiAKPiBHaXZlbiB0aGF0ICZkYXRhIGlzIG9mIHR5cGUgdTMyICos
IHlvdSBzYXkgdGhhdCAiJmRhdGEgKyBzaGlmdCIKPiBwcm9kdWNlcyBpbmNyZW1lbnRzIG9mIDQt
Ynl0ZXMsIGllLiB3ZSB3b3VsZCBhY2Nlc3MgIiZkYXRhICsgNCAqCj4gc2hpZnQiPyBCZWNhdXNl
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgY2FzZSAoYWdhaW4sIEkgbWF5IGJlIHdyb25nKS4K
ClllcDsgdGhpcyBpcyBwb2ludGVyIGFyaXRobWV0aWMuIElmIHlvdSBoYXZlIGFuIG9iamVjdCBw
dHIgb2YgdHlwZSB1MzIgKjoKCnUzMiAqcHRyOwoKYW5kIGxldCdzIHNheSBpdCBwb2ludHMgdG8g
YWRkcmVzcyAxMDAuIElmIHlvdSBpbmNyZW1lbnQgaXQgYnkgb25lOgoKcHRyKysKCnB0ciB3aWxs
IG5vdyBwb2ludCB0byBhZGRyZXNzIDEwNCwgbm90IHRvIDEwMS4KCk5vdywgaWYgaW5zdGVhZCwg
eW91IGZpcnN0IGNhc3QgcHRyIHRvICdjaGFyIConIGFuZCBpbmNyZW1lbnQgaXQgYnkgMSwKdGhl
biBpdCB3aWxsIHBvaW50IHRvIGFkZHJlc3MgMTAxLgoKPiAKPiBJJ20gc3VyZSB0aGlzIHdvdWxk
IGJlIHRoZSBjYXNlIGlmIHdlIGRlcmVmZXJlbmNlZCBkYXRhIGxpa2UKPiBkYXRhW3NoaWZ0XSB0
aG91Z2gsIGJ1dCBpbiB0aGlzIGNhc2UgSSBkb24ndCBzZWUgd2hhdCB0aGlzIGNhc3QgaXMKPiBm
aXhpbmcuIENhbiB5b3UgZW5saWdodGVuIG1lPwo+IAo+IENvdWxkIHRoZSBvdXQtb2YtYm91bmRz
IHdhcm5pbmcgY29tZSBmcm9tIHRoZSBmYWN0IHRoYXQgc2hpZnQKPiBtaWdodCBiZSBiaWdnZXIg
dGhhbiB0aGUgZGF0YSBhcnJheSBzcHJlYWQ/CgpXaGF0cyBDb3Zlcml0eSB3YW50cyB0byBzYXkg
aGVyZSBpcyBiYXNpY2FsbHkgdGhhdCB1c2luZyAmZGF0YSBhcyBhbgphcnJheSBtaWdodCBjb3Jy
dXB0IGFkamFjZW50IG1lbW9yeS4KClRoYW5rcwotLQpHdXN0YXZvCgo+IAo+PiBGaXhlczogYjNl
NzllNzY4MmUwICgibXRkOiBwaHlzbWFwOiBBZGQgQmFpa2FsLVQxIHBoeXNpY2FsbHkgbWFwcGVk
IFJPTSBzdXBwb3J0IikKPj4gQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNDk3NzY1ICgiT3V0LW9m
LWJvdW5kcyBhY2Nlc3MiKQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQt
b2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+Cj4+IC0t
LQo+PiAgZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWJ0MS1yb20uYyB8IDIgKy0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWJ0MS1yb20uYyBiL2RyaXZlcnMvbXRkL21hcHMv
cGh5c21hcC1idDEtcm9tLmMKPj4gaW5kZXggYTM1NDUwMDAyMjg0Li41ODc4MmNmYWY3MWMgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1idDEtcm9tLmMKPj4gKysrIGIv
ZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWJ0MS1yb20uYwo+PiBAQCAtNzksNyArNzksNyBAQCBz
dGF0aWMgdm9pZCBfX3hpcHJhbSBidDFfcm9tX21hcF9jb3B5X2Zyb20oc3RydWN0IG1hcF9pbmZv
ICptYXAsCj4+ICAJaWYgKHNoaWZ0KSB7Cj4+ICAJCWNodW5rID0gbWluX3Qoc3NpemVfdCwgNCAt
IHNoaWZ0LCBsZW4pOwo+PiAgCQlkYXRhID0gcmVhZGxfcmVsYXhlZChzcmMgLSBzaGlmdCk7Cj4+
IC0JCW1lbWNweSh0bywgJmRhdGEgKyBzaGlmdCwgY2h1bmspOwo+PiArCQltZW1jcHkodG8sIChj
aGFyICopJmRhdGEgKyBzaGlmdCwgY2h1bmspOwo+PiAgCQlzcmMgKz0gY2h1bms7Cj4+ICAJCXRv
ICs9IGNodW5rOwo+PiAgCQlsZW4gLT0gY2h1bms7Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
