Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED20C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TSjckKkD+vACnBGvNCQGXxpvT91h79hp91JSvE7wjw=; b=asX3pOtAbBUWv3
	rfxGuP5h2WQLyBPylgffH+HP4zKLE5SsOjlGAfTn/6pF4hK3nDTBLM4xc9tF/VuOMuopn1hPCpNBR
	B8g1WYkinKNoMIF4uqfisjKz20Dv3i5SJhmruQB/o/rjlD/Nna2aBvQmg3yNR/yLN226FJysh+79h
	aKIzdW6MsOllQnyQ3oUfddjnefoBxhwP3yDNqhWE0spFU44+UgM8XhDhS7I8RPaoOPOwOArC/v0j7
	dRHmtWYd7gNRu4tLA+/hvDk39BGKluEuX6jmdVvmkYVeCE1WCCURee9iB+aCd0x65nBtZLVHnT/Si
	hle0HBrKGloQ5zCkpwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7gO-007a4A-GP; Fri, 03 Jun 2022 13:49:44 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7gK-007a1g-3r
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 13:49:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 667701BF208;
	Fri,  3 Jun 2022 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654264177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiUwik3EhO3JFdFLVKOMNj1TCjCKUI8ClkdISKetXBM=;
	b=ZitsYbiDmmu0QEQK0tHpWRWxB7TnWCpnSoq+I8d/Yfc1w3sKzRu52h9LAQSX3QtsiTl4yW
	RfP1AIS5Ni/6TnYd7o6XZy49Wk9HcVTkBZok3zncudqlUJjpTvUK8vsRz5wd78QethutFq
	dLa2BLrsBHb76V05calbgIZQ+t1d+Sm+1DnUiM7ciXsMY9MspfTQEWNbecXprMnwd58/0e
	bFqsUzOchOw+jNW5/N7uS90b5+5eAS08VeFMLT1865QackX9G017RfeWTnGGNBruv/P2Em
	rBcOeXkxqak6EQ1TyuwG9i+rdzOUtSDsbGRL7k7K330Sl8Hf27EEHsXQfIwv3A==
Date: Fri, 3 Jun 2022 15:49:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add support for unprotected spare data page
Message-ID: <20220603154934.521c57ab@xps-13>
In-Reply-To: <20220519190112.6344-1-ansuelsmth@gmail.com>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_064940_512796_EA5227EB 
X-CRM114-Status: GOOD (  27.19  )
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

SGksCgphbnN1ZWxzbXRoQGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDE5IE1heSAyMDIyIDIxOjAx
OjEwICswMjAwOgoKPiBTb21lIGJhY2tncm91bmQgYWJvdXQgdGhpcy4KPiBPbiBvcmlnaW5hbCBx
c2RrIGlwcTgwNjQgYmFzZWQgZmlybXdhcmUgdGhlcmUgd2FzIGEgYmlnIHNlcGFyYXRpb24gZnJv
bQo+IGJvb3QgcGFydGl0aW9uIGFuZCB1c2VyIHBhcnRpdGlvbi4gV2l0aCBib290IHBhcnRpdGlv
biB3ZSByZWZlciB0bwo+IHBhcnRpdGlvbiB1c2VkIHRvIGluaXQgdGhlIHJvdXRlciAoYm9vdGxv
YWRlciwgc3BtIGZpcm13YXJlIGFuZCBvdGhlcgo+IGludGVybmFsIHN0dWZmKSBXaXRoIHVzZXIg
cGFydGl0aW9uIHdlIHJlZmVyIHRvIGxpbnV4IHBhcnRpdGlvbiBhbmQgZGF0YQo+IHBhcnRpdGlv
biBub3QgdXNlZCB0byBpbml0IHRoZSByb3V0ZXIuCj4gV2hlbiBzb21lb25lIGhhZCB0byB3cml0
ZSB0byB0aGVzZSBib290IHBhcnRpdGlvbiBhIHNwZWNpYWwgbW9kZSB3YXMKPiBuZWVkZWQsIHRv
IHN3aXRjaCB0aGUgbmFuZCBkcml2ZXIgdG8gdGhpcyBzcGVjaWFsIGNvbmZpZ3VyYXRpb24uCj4g
Cj4gVXBzdHJlYW0gdmVyc2lvbiBvZiB0aGUgbmFuZGMgZHJpdmVyIHRvdGFsbHkgZHJvcHBlZCB0
aGlzIGFuZCB0aGUgcmVzdWx0Cj4gaXMgdGhhdCBpZiBzb21lb25lIHRyeSB0byByZWFkIGRhdGEg
ZnJvbSB0aGVzZSBwYXJ0aXRpb24gYSBDUkMgd2FybmluZwo+IGlzIHByaW50ZWQgYW5kIGlmIHNv
bWVvbmUgdHJ5IHRvIHdyaXRlIHRoYXQgKGlmIGZvciBleGFtcGxlIHNvbWVvbmUKPiB3YW50cyB0
byByZXBsYWNlIHRoZSBib290bG9hZGVyKSByZXN1bHQgaXMgYSBicm9rZW4gc3lzdGVtIGFzIHRo
ZSBkYXRhCj4gaXMgYmFkbHkgd3JpdHRlbi4KPiAKPiBUaGlzIHNlcmllcyBjb21lcyB0byBmaXgg
dGhpcy4KPiAKPiBBIHVzZXIgY2FuIGRlY2xhcmUgb2Zmc2V0IGFuZCBzaXplIG9mIHRoZXNlIHNw
ZWNpYWwgcGFydGl0aW9uIHVzaW5nIHRoZQo+IHFjb20sYm9vdC1wYWdlcyBiaW5kaW5nLgo+IAo+
IEFuIGluaXRpYWwgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBhc3N1bWVkIHRoYXQgdGhlIGJvb3Qt
cGFnZXMgc3RhcnRlZAo+IGZyb20gdGhlIHN0YXJ0IG9mIHRoZSBuYW5kIGJ1dCB3ZSBkaXNjb3Zl
ciB0aGF0IHNvbWUgZGV2aWNlIGhhdmUgYmFja3VwCj4gb2YgdGhlc2Ugc3BlY2lhbCBwYXJ0aXRp
b24gYW5kIHdlIGNhbiBoYXZlIHNpdHVhdGlvbiB3aGVyZSB3ZSBoYXZlIHRoaXMKPiBwYXJ0aXRp
b24gc2NoZW1lCj4gLSBBUFBTQkwgKHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+IC0gQVBQU0JMRU5W
IChkb2Vzbid0IHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+IC0gQVJUCj4gLSBBUFBTQkxCSyAoYmFj
ayBvZiBBUFBTQkwgcmVxdWlyZSBzcGVjaWFsIG1vZGUpCj4gLSBBUFBTQkxFTlZCSyAoYmFjayBv
ZiBBUFBTQkxFTlYgZG9lc24ndCByZXF1aXJlIHNwZWNpYWwgbW9kZSkKPiBXaXRoIHRoaXMgY29u
ZmlndXJhdGlvbiB3ZSBuZWVkIHRvIGRlY2xhcmUgc3BhcnNlIGJvb3QgcGFnZSBhbmQgd2UgY2Fu
J3QKPiBhc3N1bWUgYm9vdC1wYWdlcyBhbHdheXMgc3RhcnRzIGZyb20gdGhlIHN0YXJ0IG9mIHRo
ZSBuYW5kLgo+IAo+IEEgdXNlciBjYW4gdXNlIHRoaXMgZm9ybSB0byBkZWNsYXJlIHNwYXJzZSBi
b290IHBhZ2VzCj4gcWNvbSxib290LXBhZ2VzID0gPDB4MCAweDBjODAwMDAgMHgwYzgwMDAwIDB4
MDUwMDAwMD47Cj4gCj4gVGhlIGRyaXZlciBpbnRlcm5hbGx5IHdpbGwgcGFyc2UgdGhpcyBhcnJh
eSwgY29udmVydCBpdCB0byBuYW5kIHBhZ2VzCj4gYW5kIGNoZWNrIGludGVybmFsbHkgb24gZXZl
cnkgcmVhZC93cml0ZSBpZiB0aGlzIHNwZWNpYWwgY29uZmlndXJhdGlvbgo+IHNob3VsZCB1c2Vk
IGZvciB0aGF0IHBhZ2Ugb3IgdGhlIG5vcm1hbCBvbmUuCj4gCj4gVGhlIHJlYXNvbiBmb3IgYWxs
IG9mIHRoaXMgaXMgdGhhdCBxY29tIEZPUiBTT01FIFJFQVNPTiwgZGlzYWJsZSBFQ0MgZm9yCj4g
c3BhcmUgZGF0YSBvbmx5IGZvciB0aGVzZSBib290IHBhcnRpdGlvbiBhbmQgd2UgbmVlZCB0byBy
ZWZsZWN0IHRoaXMKPiBzcGVjaWFsIGNvbmZpZ3VyYXRpb24gdG8gbXV0ZSB0aGVzZSB3YXJuaW5n
IGFuZCB0byBwZXJtaXQgYWN0dWFsbHkKPiB3cml0aW5nIHRvIHRoZXNlIHBhZ2VzLgoKTWFuaXZh
bm5hbiwgYW55IGZlZWRiYWNrIG9uIHRoaXM/Cgo+IAo+IHY0Ogo+IC0gRml4IHdyb25nIGNvbXBh
dGlibGUgc2V0IGZvciBib290LXBhZ2VzIChpcHE4MDc0IGluc3RlYWQgb2YgaXBxODA2eCkKPiB2
MzoKPiAtIEZpeCB0eXBvIGluIERvY211bmV0YXRpb24gY29tbWl0IGRlc3JpcHRpb24KPiAtIEFk
ZCBpdGVtcyBkZXNjcmlwdGlvbiBmb3IgdWludDMyLW1hdHJpeAo+IHYyOgo+IC0gQWRkIGZpeGVz
IGZyb20gS3J6eXN6dG9mIGluIERvY3VtZW50YXRpb24KPiAKPiBBbnN1ZWwgU21pdGggKDIpOgo+
ICAgbXRkOiBuYW5kOiByYXc6IHFjb21fbmFuZGM6IGFkZCBzdXBwb3J0IGZvciB1bnByb3RlY3Rl
ZCBzcGFyZSBkYXRhCj4gICAgIHBhZ2VzCj4gICBkdC1iaW5kaW5nczogbXRkOiBxY29tX25hbmRj
OiBkb2N1bWVudCBxY29tLGJvb3QtcGFnZXMgYmluZGluZwo+IAo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sICAgfCAgMjYgKysrCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYyAgICAgICAgICAgICB8IDE0OCArKysrKysrKysrKysrKysrKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
