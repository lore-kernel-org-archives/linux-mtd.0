Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD076C4743F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 07:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6316D61208
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 07:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6316D61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pS4nx9FAm4TCEeRIvvOoPWnOkaAn0zLlKmtiTwAsI9A=; b=IBt/Cm9mB0iThO
	QwpmyVLdkJOdnL7XiFR//1n3Cho1Ur6H76sqn3QDlkTDbwuzwMTFgBe9CAzu4jhDdi313ZYhtR5ZE
	lbp4ybMBViQsvvaAvXwfgsl1kljNpzRSNQAlNlVKqBTZ/zhRoToNPBsVxYK+kajTy0gECWePGanNM
	SPTbB6qvcV8EZ7twl2D9u71bzv/BZSWUQ5VWErV4YI101fCIuokKSUOYIg6e2YXTGgfYwJSOZ44Uw
	NzKzU7ORiYKlyYk3Urm9TH6EmsilrTtKDoHQYmxhfSm8tQXJjMWqdXIJ42xJiXncnNizaxWeBnhx6
	l1asSdxytD2aG6Cm9wMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9Ez-001rjH-9o; Mon, 07 Jun 2021 07:00:05 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9CG-001qNH-5p
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 06:57:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4E9BAE000E;
 Mon,  7 Jun 2021 06:57:12 +0000 (UTC)
Date: Mon, 7 Jun 2021 08:57:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: ensure return variable is initialized
Message-ID: <20210607085711.65c64c58@xps13>
In-Reply-To: <20210601121401.GY1955@kadam>
References: <20210527145048.795954-1-colin.king@canonical.com>
 <20210527170309.4d99bc31@xps13> <20210601121401.GY1955@kadam>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235716_400280_F9559E0C 
X-CRM114-Status: GOOD (  24.78  )
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

SGkgRGFuLAoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cm90ZSBv
biBUdWUsIDEgSnVuIDIwMjEKMTU6MTQ6MDIgKzAzMDA6Cgo+IE9uIFRodSwgTWF5IDI3LCAyMDIx
IGF0IDA1OjAzOjA5UE0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBDb2xpbiwK
PiA+IAo+ID4gQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPiB3cm90ZSBvbiBU
aHUsIDI3IE1heSAyMDIxCj4gPiAxNTo1MDo0OCArMDEwMDoKPiA+ICAgCj4gPiA+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPiA+IAo+ID4gPiBDdXJy
ZW50bHkgdGhlcmUgYXJlIGNvcm5lciBjYXNlcyB3aGVyZSBzcGVjX3RpbWVzIGlzIE5VTEwgYW5k
Cj4gPiA+IGNoaXAtPnBhcmFtZXRlcnMub25maSBvciB3aGVuIGJlc3RfbW9kZSBpcyB6ZXJvIHdo
ZXJlIHJldCBpcyAgCj4gPiAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgXgo+ID4gc29tZXRo
aW5nIGlzIG1pc3NpbmcgaGVyZSwgdGhlIHNlbnRlbmNlIGlzIG5vdCBjbGVhcgo+ID4gICAKPiA+
ID4gbm90IGFzc2lnbmVkIGEgdmFsdWUgYW5kIGFuIHVuaW5pdGlhbGl6ZWQgcmV0dXJuIHZhbHVl
IGNhbiBiZQo+ID4gPiByZXR1cm5lZC4gRml4IHRoaXMgYnkgZW5zdXJpbmcgcmV0IGlzIGluaXRp
YWxpemVkIHRvIC1FSU5WQUwuICAKPiA+IAo+ID4gSSBkb24ndCBzZWUgaG93IHRoaXMgc2l0dWF0
aW9uIGNhbiBoYXBwZW4uCj4gPiAKPiA+IEluIGJvdGggY2FzZXMsIG5vIG1hdHRlciB0aGUgdmFs
dWUgb2YgYmVzdF9tb2RlLCB0aGUgZm9yIGxvb3Agd2lsbAo+ID4gYWx3YXlzIGV4ZWN1dGUgYXQg
bGVhc3Qgb25lIHRpbWUgKG1vZGUgMCkgc28gcmV0IHdpbGwgYmUgcG9wdWxhdGVkLgo+ID4gCj4g
PiBNYXliZSB0aGUgcm9ib3QgZG9lcyBub3Qga25vdyB0aGF0IGJlc3RfbW9kZSBjYW5ub3QgYmUg
bmVnYXRpdmUgYW5kCj4gPiBzaG91bGQgYmUgZGVmaW5lZCB1bnNpZ25lZCwgYnV0IHRoZSBjdXJy
ZW50IHBhdGNoIGlzIGludmFsaWQuCj4gPiAgCj4gCj4gUGVvcGxlIHRoaW5rIGxpc3QgY291bnRl
ciB1bnNpZ25lZCBpcyBhIGdvb2QgaWRlYSwgYnV0IGl0J3MgYSB0ZXJyaWJsZQo+IGlkZWEgYW5k
IGhhcyBjYXVzZWQgaHVuZHJlZHMgb2YgYnVncyBmb3IgbWUgdG8gZml4L3JlcG9ydCBvdmVyIHRo
ZQo+IHllYXJzLiAgKmdydW1ibGUqLgo+IAo+IEFueXdheSwgSSB3YXMgcmV2aXNpdGluZyB0aGlz
IGNvZGUgYmVjYXVzZSBpdCBzaG93ZWQgdXAgYXMgYSBTbWF0Y2gKPiB3YXJuaW5nIGFuZCB0aGUg
YnVnIGFwcGVhcnMgdG8gYmUgcmVhbC4KPiAKPiAJYmVzdF9tb2RlID0gZmxzKGNoaXAtPnBhcmFt
ZXRlcnMub25maS0+c2RyX3RpbWluZ19tb2RlcykgLSAxOwo+IAo+IFRoZSAib25maS0+c2RyX3Rp
bWluZ19tb2RlcyIgY29tZXMgZnJvbSB0aGUgaGFyZHdhcmUgaW4gbmFuZF9vbmZpX2RldGVjdCgp
Cj4gYW5kIG5vdGhpbmcgY2hlY2tzIHRoYXQgaXQgaXMgbm9uLXplcm8gc28gImJlc3RfbW9kZSA9
IGZscygwKSAtIDE7IiBpcwo+IG5lZ2F0aXZlIGFuZCAicmV0IiBpcyB1bmluaXRpYWxpemVkLgoK
SW4gdGhlIE9ORkkgc3BlY2lmaWNhdGlvbiwgdGhlIHNkcl90aW1pbmdfbW9kZSBmaWVsZCBpcyBk
ZWZpbmVkIGFzCmZvbGxvdzoKClNEUiB0aW1pbmcgbW9kZSBzdXBwb3J0CkJJVCAgVkFMVUUgTUVB
TklORwo2LTE1IE4vQSAgIFJlc2VydmVkICgwKQo1ICAgIDEgICAgIHN1cHBvcnRzIHRpbWluZyBt
b2RlIDUKNCAgICAxICAgICBzdXBwb3J0cyB0aW1pbmcgbW9kZSA0CjMgICAgMSAgICAgc3VwcG9y
dHMgdGltaW5nIG1vZGUgMwoyICAgIDEgICAgIHN1cHBvcnRzIHRpbWluZyBtb2RlIDIKMSAgICAx
ICAgICBzdXBwb3J0cyB0aW1pbmcgbW9kZSAxCjAgICAgMSAgICAgc3VwcG9ydHMgdGltaW5nIG1v
ZGUgMCwgc2hhbGwgYmUgMQoKSU9XIHNkcl90aW1pbmdfbW9kZXMgKmNhbm5vdCogYmUgMCwgb3Ig
aXQgaXMgYSB0cnVseSBkZWVwIGFuZCBjcmF6aWx5CmltcGFjdGluZyBoYXJkd2FyZSBidWcgKHNv
IGZhciBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgY2hpcCBub3QgcmV0dXJuaW5nCnRoZSByaWdodCB0
aW1pbmcgbW9kZSAwIHZhbHVlKS4gSGVuY2UgbXkgcHJvcG9zYWwgdG8gdHVybiBiZXN0X21vZGUg
YXMKdW5zaWduZWQuIEkgaG9uZXN0bHkgZG9uJ3Qga25vdyB3aGF0IGlzIHRoZSBiZXN0IG9wdGlv
biBoZXJlIGFuZCBhbQpmdWxseSBvcGVuIHRvIG90aGVyIHN1Z2dlc3Rpb25zIHRvIHNpbGVuY2Ug
dGhlIHJvYm90LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
