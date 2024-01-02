Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6694C46CD2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J8Lz/Qgbk4JFVG6ukILhaMAPcqaws5CQhupcxA5BrKA=; b=RDhYF2SdrukjtfRUkBhqcX46yI
	vLaQM9Ig6jeg9q9ZefKpZgKplw6htUGdjYzpnJfLvdcUXrHiuntMKTQlIZP7RJ9/vP77OMqqIOUGk
	C4s4nMUaR3DZgeLKQmlCQV9R2gNXf8M85fJIeb8Xn5MvbsfowON3wuQohNiHfqcnZm/xZJmT1HB1s
	LDP+YGxRyOoA4JwEfjLRgualyNIIdBn9fvGNhjb0ebPyDgdf8nhs8+IqAJIw969MeiP0Zz2HlDF+S
	PVQL5eFDnH/3sozkzVyGVCu3fo7JE9Re3upLo5L4FRntlEM8OIX54YxaGhc6GPKKgcEwpiYA/lFwU
	rwbvUSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKldv-008xRW-2B;
	Tue, 02 Jan 2024 20:45:43 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKldr-008xQu-1l
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 20:45:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 92C7B626FAFD;
	Tue,  2 Jan 2024 21:45:33 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id c26r3h03Ykk4; Tue,  2 Jan 2024 21:45:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B57AE626FAFC;
	Tue,  2 Jan 2024 21:45:32 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bn0u2smvcOuc; Tue,  2 Jan 2024 21:45:32 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 914E4626FAFB;
	Tue,  2 Jan 2024 21:45:32 +0100 (CET)
Date: Tue, 2 Jan 2024 21:45:32 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <535616666.192239.1704228332389.JavaMail.zimbra@nod.at>
In-Reply-To: <a145fc68-9b0a-9794-48d2-b7ad79116833@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com> <1145531757.175508.1703844362355.JavaMail.zimbra@nod.at> <13b259ca-b32f-a8d6-5e11-8bb38df72f5c@huawei.com> <642239519.177270.1703884138999.JavaMail.zimbra@nod.at> <a145fc68-9b0a-9794-48d2-b7ad79116833@huawei.com>
Subject: Re: [PATCH RFC 00/17] ubifs: Add filesystem repair support
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Add filesystem repair support
Thread-Index: zanHUD2ShtmoWAAG/yLjSang7Pf/kw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_124539_915442_62B8BE47 
X-CRM114-Status: GOOD (  19.56  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEkgY29tZSB1cCB3aXRoIGFub3RoZXIgd2F5IHRvIGlt
cGxlbWVudCBmc2NrLnViaWZzOgo+IAo+IFRoZXJlIGFyZSB0aHJlZSBtb2RlczoKPiAKPiAxLiBj
b21tb24gbW9kZShubyBvcHRpb25zKTogQXNrIHVzZXIgd2hldGhlciB0byBmaXggYXMgbG9uZyBh
cyBhIHByb2JsZW0KPiBpcyBkZXRlY3RlZC4KCk1ha2VzIHNlbnNlLgoKPiAyLiBzYWZlIG1vZGUo
LWEgb3B0aW9uKTogQXV0byByZXBhaXIgYXMgbG9uZyBhcyBubyBkYXRhL2ZpbGVzIGxvc3QoZWcu
Cj4gbmxpbmssIGlzaXplLCB4YXR0cl9jbnQsIHdoaWNoIGNhbiBiZSBjb3JyZWN0ZWQgd2l0aG91
dCBkcm9wcGluZyBub2RlcyksCj4gb3RoZXJ3aXNlIHJldHVybnMgZXJyb3IgY29kZS4KCk1ha2Vz
IHNlbnNlLgogCj4gMy4gZGFuZ2Vyb3VzIG1vZGUoLXkgb3B0aW9uKTogRml4IGlzIGFsd2F5cyBz
dWNjZXNzZnVsLCB1bmxlc3MKPiBzdXBlcmJsb2NrIGlzIGNvcnJ1cHRlZC4gVGhlcmUgYXJlIDIg
c2l0dWF0aW9uczoKClBsZWFzZSBub3QgdXNlICIteSIuIFVzdWFsbHkgIi15IiBzdGFuZHMgZm9y
ICJhbnN3ZXIgeWVzIHRvIGFsbCBxdWVzdGlvbnMiLgpCdXQgc2VsZWN0aW5nIG5hbWVzIGZvciBj
b21tYW5kIGxpbmUgZmxhZ3MgaXMgY3VycmVudGx5IG15IGxlYXN0IGNvbmNlcm4uCiAKPiAgIGEp
IFROQyBpcyB2YWxpZDogZnNjayB3aWxsIHByaW50IHdoaWNoIGZpbGUgaXMgZHJvcHBlZCBhbmQg
d2hpY2gKPiBmaWxlJ3MgZGF0YSBpcyBkcm9wcGVkCgpTb3VuZHMgYWxzbyBnb29kLgogCj4gICBi
KSBUTkMgaXMgaW52YWxpZDogZnNjayB3aWxsIHNjYW4gYWxsIG5vZGVzIHdpdGhvdXQgcmVmZXJl
bmNpbmcgVE5DLAo+IHNhbWUgYXMgdGhpcyBwYXRjaHNldCBkb2VzCgpJJ2QgbWFrZSB0aGlzIGEg
ZGlzdGluY3QgbW9kZS4KSXQgY2FuIGJlIHVzZWQgdG8gcmVidWlsZCBpbmRleCBhbmQgTEVCIHBy
b3BlcnR5IHRyZWVzLgpUaGlzIGlzIGJhc2ljYWxseSBhICJkcm9wIHRyZWVzIGFuZCByZWJ1aWxk
IiBtb2RlLgoKPiAKPiBRMTogSG93IGRvIHlvdSB0aGluayBvZiB0aGlzIG1ldGhvZD8KClNvdW5k
cyBnb29kIHNvIGZhci4KIAo+IFEyOiBNb2RlIDEsIDIgYW5kIDMoYSkgZGVwZW5kIG9uIGpvdXJu
YWwgcmVwbGF5aW5nLCBJIGZvdW5kCj4geGZzX3JlcGFpclsxXSBzaG91bGQgYmUgdXNlZCBhZnRl
ciBtb3VudGluZy91bm1vdW50aW5nIHhmcyAoTGV0IGtlcm5lbAo+IHJlcGxheSBqb3VybmFsKSwg
aWYgVUJJRlMgZG9lcyBzbywgdGhlcmUgaXMgbm8gbmVlZCB0byBjb3B5IHJlY292ZXJ5Cj4gc3Vi
c3lzdGVtIGludG8gdXNlcnNwYWNlLCBidXQgdXNlciBoYXMgdG8gbW91bnQvdW5tb3VudCBiZWZv
cmUgZG9pbmcKPiBmc2NrLiBJIGZvdW5kIGUyZnNjayBoYXMgY29waWVkIHJlY292ZXJ5IGNvZGUg
aW50byB1c2Vyc3BhY2UsIHNvIGl0IGNhbgo+IGRvIGZzY2sgd2l0aG91dCBtb3VudGluZy91bm1v
dW50aW5nLiBJZiBVQklGUyBkb2VzIHNvLCBqb3VybmFsIHJlcGxheWluZwo+IHdpbGwgdXBkYXRl
IFROQyBhbmQgTFBULCBwbGVhc2UgcmVmZXJlbmNlIFEzKDEpLiBXaGljaCBtZXRob2QgZG8geW91
Cj4gc3VnZ2VzdD8KClVCSUZTIGlzIGEgbGl0dGxlIHNwZWNpYWwgcmVnYXJkaW5nIHRoZSBqb3Vy
bmFsLgoKMS4gVGhlIGpvdXJuYWwgaXMgbm90IGFuIGFkZC1vbiBsaWtlIGl0IGlzIG9uIG1hbnkg
b3RoZXIgZmlsZSBzeXN0ZW1zLAp5b3UgaGF2ZSB0byByZXBsYXkgaXQgdG8gZ2V0IGEgY29uc2lz
dGVudCBmaWxlIHN5c3RlbS4KMi4gSm91cm5hbCByZXBsYXkgaXMgYWxzbyBuZWVkZWQgYWZ0ZXIg
YSBjbGVhbiB1bW91bnQuIFRoZSByZWFzb24gaXMgdGhhdApVQklGUyBkb2VzIG5vIGNvbW1pdCBh
dCB1bW91bnQgdGltZS4KClNvIElNSE8geW91IG5lZWQgdG8gaGF2ZSBqb3VybmFsIHJlcGxheSBj
b2RlIGluIHlvdXIgdG9vbCBpbiBhbnkgY2FzZS4KWW91IGNhbiBjb3B5IGl0IGZyb20gdGhlIGtl
cm5lbCBpbXBsZW1lbnRhdGlvbiBhbmQgYWRkIG1vcmUgY2hlY2tzLgpXaGlsZSB0aGUga2VybmVs
IGNvZGUgYWxzbyB0cmllcyB0byBiZSBmYXN0LCBmc2NrIHNob3VsZCBiZSBtb3JlIHBhcmFub2lk
LgpJZGVhbGx5IHRoZSBvdXRjb21lIGlzIGEgbGlidWJpZnMgb3Igc3VjaCB3aGljaCBjYW4gYmUg
ZGVyaXZlZCBmcm9tIHRoZQprZXJuZWwgc291cmNlIHdoaWxlIGJ1aWxkaW5nIG10ZC11dGlscy4K
Cj4gUTM6IElmIGZzY2sgZHJvcHMgb3IgdXBkYXRlcyBhIG5vZGUoZWcuIGRlbnRyeSBsb3N0IGlu
b2RlLCBjb3JyZWN0ZWQKPiBpbm9kZSkgaW4gbW9kZSAxLDIgYW5kIDMoYSksIFROQy9MUFQgc2hv
dWxkIGJlIHVwZGF0ZWQuIFRoZXJlIGFyZSB0d28KPiB3YXlzIHVwZGF0aW5nIFROQyBhbmQgTFBU
Ogo+IAo+ICAgMSkgTGlrZSBrZXJuZWwgZG9lcywgd2hpY2ggbWVhbnMgdGhhdCBtYXJrIGRpcnR5
IFROQy9MUFQgZm9yCj4gY29ycmVzcG9uZGluZyBicmFuY2hlcyBhbmQgZG9fY29tbWl0KCkuIEl0
IHdpbGwgY29weSBtdWNoIGNvZGUgaW50bwo+IHVzZXJzcGFjZSwgZWcuIHRuYy5jLCBscHQuYywg
dG5jX2NvbW1pdC5jLAo+IGxwdF9jb21taXQuYy4gSSBmZWFyIHRoZXJlIGV4aXN0cyByaXNrcy4g
Rm9yIGV4YW1wbGUsIHRoZXJlIGlzIG5vIHNwYWNlCj4gbGVmdCBmb3IgbmV3IGluZGV4IG5vZGVz
LCBnYyBzaG91bGQgYmUgcGVyZm9ybWVkPyBJZiBzbywgZ2MvbHB0IGdjIGNvZGUKPiBzaG91bGQg
YmUgY29waWVkIHRvby4KPiAKPiAgIDIpIFJlYnVpbGQgbmV3IFROQy9MUFQgYmFzZWQgb24gdmFs
aWQgbm9kZXMuIFRoaXMgd2F5IGlzIHNpbXBsZSwgYnV0Cj4gb2xkIGdvb2QgVE5DIGNvdWxkIGJl
IGNvcnJ1cHRlZCwgaXQgbWVhbnMgdGhhdCBwb3dlcmN1dCBkdXJpbmcgZnNjayBtYXkKPiBsZXQg
VUJJRlMgaW1hZ2UgbXVzdCBiZSByZXBhaXJlZCBpbiBtb2RlIDMoYikgYnV0IGl0IGNvdWxkIGJl
IHJlcGFpcmVkCj4gaW4gbW9kZSAyXDMoYSkgYmVmb3JlIGludm9raW5nIGZzY2suCj4gCj4gV2hp
Y2ggd2F5IGlzIGJldHRlcj8KClNpbmNlIHlvdSBuZWVkIHRvIGRvIGEgZnVsbCBqb3VybmFsIHJl
cGxheSBhbnl3YXkgYW5kIHBvd2VyLWN1dCBhd2FyZW5lc3MKaXMgb25lIG9mIHlvdXIgcmVxdWly
ZW1lbnRzLCBJIGZlYXIgdGhlIG9ubHkgb3B0aW9uIGlzIDEpLgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
