Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F60C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:22:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 174E361372
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 174E361372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWNrvMCY9nY6RYIYnyp3/8uyWLWcSVJ7KgQM78J/MrE=; b=w4cy1V/7EOLJ8L
	kuFjUWkzK76UYFAT+8foajS0S7c0OK9bhX3gCtMaZlErxaxtS7q3TmCs037evtsR3dOA/mK8747Ws
	/qfppU+R0+mCFRpPy70Ryy+n8yUv4g8ESEZF9deRS4EvDibAxUB1gAhqtnOoWi8RprX7hyFwg2MOt
	TzMh7avx0i9YfmirT9QnZ3bHcucXLEIhVOkGEI2/M9IXrpvGNrN/XBtzG3d9sD+mzpSbEtkvSqvQt
	X0ne/FXkzJWNd6sbvbcMltlgUVD4M3M8Jk1Z3BeyqWTuY11d5q4SsOOrRTSSVnw2yHUfQplHJZRbP
	ABcEFDSoVCM4A3pxCGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIApz-00HDwS-MY; Mon, 23 Aug 2021 14:22:07 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIApl-00HDtc-82; Mon, 23 Aug 2021 14:21:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 16FF140007;
 Mon, 23 Aug 2021 14:21:49 +0000 (UTC)
Date: Mon, 23 Aug 2021 16:21:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] mtd: spinand: add support for Foresee FS35ND0*G parts
Message-ID: <20210823162148.35a24183@xps13>
In-Reply-To: <CAFr9PXnna+b3ChVUftT7YbU1kYR=5JDcik3bMNqzKK-LW=GQzw@mail.gmail.com>
References: <20210811084924.52293-1-daniel@0x0f.com>
 <20210816101143.2a64d7b9@xps13>
 <CAFr9PXnna+b3ChVUftT7YbU1kYR=5JDcik3bMNqzKK-LW=GQzw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_072153_596360_9D4ED855 
X-CRM114-Status: GOOD (  25.17  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBNb24s
IDIzIEF1ZyAyMDIxIDIzOjE5OjAyCiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiA+ICsgICAg
IC8qCj4gPiA+ICsgICAgICAqIFRoZSBkYXRhc2hlZXQgc2F5cyAqc3VjY2Vzc2Z1bCogd2l0aCA0
IGJpdHMgZmxpcHBlZC4KPiA+ID4gKyAgICAgICogbmFuZGJpdGVycnMgYWx3YXlzIGNvbXBsYWlu
cyB0aGF0IHRoZSByZWFkIHJlcG9ydGVkCj4gPiA+ICsgICAgICAqIHN1Y2Nlc3NmdWwgYnV0IHRo
ZSBkYXRhIGlzIGluY29ycmVjdC4KPiA+ID4gKyAgICAgICovCj4gPiA+ICsgICAgIGNhc2UgRlMz
NU5EMDFHX1MxWTJfU1RBVFVTX0VDQ180X0JJVEZMSVBTOgo+ID4gPiArICAgICAgICAgICAgIHJl
dHVybiA0OyAgCj4gPgo+ID4gVGhpcyBpcyBhIHJlYWwgaXNzdWUuIENhbiB5b3UgdXNlIHRoZSBu
YW5kZmxpcGJpdHMgdG9vbCBmcm9tIHRoZQo+ID4gbXRkLXV0aWxzIHBhY2thZ2UgKHlvdSBzaG91
bGQgdGFrZSBhIHJlY2VudCB2ZXJzaW9uIG9mIHRoZSBwYWNrYWdlKSBhbmQKPiA+IHRyeSB0byBv
YnNlcnZlIHdoYXQgaGFwcGVucyB3aGVuIHlvdSBpbnNlcnQgYSA0dGggYml0ZmxpcCBpbiBhIHNl
Y3Rpb24/Cj4gPgo+ID4gSSBnZW5lcmFsbHkgYmVsaWV2ZSB0aGUgdG9vbCBtb3JlIHRoYW4gdGhl
IGRhdGFzaGVldCA6KSAgCj4gCj4gTWF5YmUgSSdtIHVzaW5nIGl0IGluY29ycmVjdGx5IGJ1dCBJ
IGNhbid0IGdldCBhIDQgYml0IGZsaXBwZWQKPiBzaXR1YXRpb24gdG8gaGFwcGVuLgo+IAo+IEkg
ZXJhc2VkIHRoZSBwYWdlZCBzbyBpdCdzIGFsbCAweEZGOgo+IAo+ICMgZmxhc2hfZXJhc2UgL2Rl
di9tdGQwIDB4ODAwMDAwMCAxCj4gRXJhc2luZyAxMjggS2lieXRlIEAgODAwMDAwMCAtLSAxMDAg
JSBjb21wbGV0ZQo+ICMgbmFuZGR1bXAgLS1iYj1kdW1wYmFkIC1zIDB4ODAwMDAwMCAtbCAxIC1j
IC1wIC9kZXYvbXRkMAo+IEVDQyBmYWlsZWQ6IDAKPiBFQ0MgY29ycmVjdGVkOiA2MjM0Cj4gTnVt
YmVyIG9mIGJhZCBibG9ja3M6IDAKPiBOdW1iZXIgb2YgYmJ0IGJsb2NrczogMAo+IEJsb2NrIHNp
emUgMTMxMDcyLCBwYWdlIHNpemUgMjA0OCwgT09CIHNpemUgNjQKPiBEdW1waW5nIGRhdGEgc3Rh
cnRpbmcgYXQgMHgwODAwMDAwMCBhbmQgZW5kaW5nIGF0IDB4MDgwMDAwMDEuLi4KPiBFQ0M6IDMg
Y29ycmVjdGVkIGJpdGZsaXAocykgYXQgb2Zmc2V0IDB4MDgwMDAwMDAKPiAweDA4MDAwMDAwOiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4u
Li4uLi4uLi58Cj4gMHgwODAwMDAxMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDgwMDAwMjA6IGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4u
LnwKPiAweDA4MDAwMDMwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwODAwMDA0MDogZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4
MDgwMDAwNTA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
ICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDYwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gCj4gVGhlbiB1
c2VkIG5hbmRmbGlwYml0cyB0byBmbGlwIGEgYnVuY2ggb2YgYml0cyBpbiB0aGUgZmlyc3QgYnl0
ZSBhbmQKPiB0aGVuIGEgZmV3IG90aGVyIGJ5dGVzOgo+IAo+ICMgbmFuZGR1bXAgLS1iYj1kdW1w
YmFkIC1zIDB4ODAwMDAwMCAtbCAxIC1jIC1wIC9kZXYvbXRkMAo+IEVDQyBmYWlsZWQ6IDAKPiBF
Q0MgY29ycmVjdGVkOiA2MjQ2Cj4gTnVtYmVyIG9mIGJhZCBibG9ja3M6IDAKPiBOdW1iZXIgb2Yg
YmJ0IGJsb2NrczogMAo+IEJsb2NrIHNpemUgMTMxMDcyLCBwYWdlIHNpemUgMjA0OCwgT09CIHNp
emUgNjQKPiBEdW1waW5nIGRhdGEgc3RhcnRpbmcgYXQgMHgwODAwMDAwMCBhbmQgZW5kaW5nIGF0
IDB4MDgwMDAwMDEuLi4KPiBFQ0M6IDMgY29ycmVjdGVkIGJpdGZsaXAocykgYXQgb2Zmc2V0IDB4
MDgwMDAwMDAKPiAweDA4MDAwMDAwOiBmMCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwODAwMDAxMDogZWIgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4u
fAo+IDB4MDgwMDAwMjA6IGVmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDMwOiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgw
ODAwMDA0MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
IHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDgwMDAwNTA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDYw
OiBlZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4u
Li4uLi4uLi4uLi58Cj4gCj4gQW55aG93LAo+IEkgdGhpbmsgd2Ugc2hvdWxkIHByb2JhYmx5IHJl
dHVybiAtRUJBRE1TRyBpZiB0aGUgNCBiaXQgZmxpcHMgc3RhdHVzCj4gYXBwZWFycyBhcyBuYW5k
Yml0ZXJycyBhbHdheXMgY29tcGxhaW5zIHRoYXQgdGhlIGRhdGEgaXMgd3JvbmcuCgpJIGFtIG5v
dCBzdXJlIHRvIGZvbGxvdywgYWJvdmUgdGhlIHNvZnR3YXJlIHNheXMgIjMgY29ycmVjdGVkIGJm
IiB3aGlsZQpJIHRob3VnaHQgdGhlIHByb2JsZW0gd2FzIHdoZW4gZ2V0dGluZyA0IGJmLCBidXQg
dGhlIGR1bXAgc2hvdyBtYW55Cm1vcmUuIENhbiB5b3Ugc2hvdyBtZSBob3cgaXQgYmVoYXZlczoK
KiBlcmFzZSAobGlrZSB5b3UgZGlkKQoqIGluc2VydCB7MSwgMiwgMywgNCwgNX0gYmYgYW5kIHNo
b3cgdGhlIGR1bXAgZWFjaCB0aW1lPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
