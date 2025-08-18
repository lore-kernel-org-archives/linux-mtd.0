Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FAECA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBJBYSeIeWai2+YGQLSR8KXjk88r2baTwgzESO/8jWY=; b=nTdmWuw3umwEP1
	rmUyCFFzHQ/bspTXWu92wFPMth9g9Uy34NRa7XR/5VatPuzZ+PmQZDmlz6UsD/DMiwapfFHyKuslS
	k5PyT7xxT5cvzoCcJiJxTYst2mwc7qy2GMpjxs9iZKZoFWtjlgo6Vg486EZec+J0tGEwv+7Mt7F6/
	7kvF1g4wCCmMhC4TquFABap1kSyZDJC+MiT1rCbY7JdDxlxF5YrlW2WCroru/L5IEHzpIlEEw+t34
	OzQDK2z1eK5Ic9hUVuAtzQYuZMcNCOwjX8rJWoHYPpIQn3UD9E+8dtMxnf3WFUiqgBorabXWFTOwM
	2ejaoRzNkFcgof9RDk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo037-00000007Too-1Mnm;
	Mon, 18 Aug 2025 13:37:21 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unujN-00000006sl2-3raZ
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 07:56:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A291442BD;
	Mon, 18 Aug 2025 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755503793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8khIDpH1Nt7zKlmk4cr4Z3Op6CRLiDktdWqZ7Mqbrds=;
	b=CGa9KvUnlFCfSg/OVbt+sFgZtSbLZEm7p+2jqHNdZ8NV8qbY9WxRKSbNWqGaVW9yVJr76y
	yVbxYofro9aMw97I+udZuA+hLWyb+z7Tommxq6IM52uE+XeyPsbdqw0Im/vlQ0qogadQeo
	z1VwE+K3pjltdahVC8mgW3yJgEgyZQvHyFQJzuw+LJZ3T/q1jSq9dVsh+T720zHw4Nq27a
	OyxqMySGj4dHGPhUO2bd7ZdrxQP6BaSfETVj+vhKTzCZFlmrsI2c7uny4y+WjK6HAJKJ0Y
	w+y1FGQSMrmjoh2rRLZj2Miu6jZar3vEqw602cG1jqPkJRrsR/6NxjFQrN0uYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <markus.stockhausen@gmx.de>
Cc: <vigneshr@ti.com>,  <richard@nod.at>,  <tudor.ambarus@linaro.org>,
  <linux-mtd@lists.infradead.org>,  "'Chris Packham'"
 <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: Realtek ECC engine (was NAND errors)
In-Reply-To: <667201dc0ac8$153da250$3fb8e6f0$@gmx.de> (markus stockhausen's
	message of "Mon, 11 Aug 2025 15:58:56 +0200")
References: <667201dc0ac8$153da250$3fb8e6f0$@gmx.de>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 18 Aug 2025 09:56:31 +0200
Message-ID: <878qjh2hcg.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelveetiedufedugfejveehvefgvefgvdehleefkedutedtffevhfegjeeggfekkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehmrghrkhhushdrshhtohgtkhhhrghushgvnhesghhmgidruggvpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhst
 hhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepvehhrhhishdrrfgrtghkhhgrmhesrghllhhivgguthgvlhgvshhishdrtghordhnii
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_005638_578962_DF7A30AA 
X-CRM114-Status: GOOD (  15.20  )
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

SGkgTWFya3VzLAoKT24gMTEvMDgvMjAyNSBhdCAxNTo1ODo1NiArMDIsIDxtYXJrdXMuc3RvY2to
YXVzZW5AZ214LmRlPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4gb24gdGhlIHdlZWtlbmQgSSB3
YXMgYWJsZSB0byBoYWNrIHRvZ2V0aGVyIGEgdmVyeSBiYXNpYyB3b3JraW5nIHZlcnNpb24gb2Yg
Cj4gdGhlIFJlYWx0ZWsgRUNDIGVuZ2luZS4gU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0
L29wZW53cnQvcHVsbC8xOTc0Ngo+IFVudGlsIG5vdyBJIHdhcyBvbmx5IGZvY3VzZWQgb24gdGhl
IGRldmljZXMgdGhhdCBhcmUgYXZhaWxhYmxlIGZvciB0ZXN0aW5nIAo+IChMaW5rc3lzIExHUzMy
OEMgJiBMR1MzNTJDKS4gRHJpdmVyIGNhbiBub3cgaGFuZGxlIGV4YWN0bHkgdGhlIGlkZW50aWZp
ZWQgCj4gZGF0YSBsYXlvdXQ6Cj4KPiAtIDIwNDggYnl0ZXMgZGF0YSAoNCo1MTIgYnl0ZXMpCj4g
LSA2NCBieXRlcyBPT0IgY29uc2lzdGluZyBvZgo+ICAgLSA0KjYgYnl0ZXMgdGFnCj4gICAtIDQq
MTAgYnl0ZXMgRUNDCgpXZWxsIGRvbmUhCgo+Cj4gVGhlcmUgYXJlIHR3byB0aGluZ3MgSSBkbyBu
b3QgeWV0IHVuZGVyc3RhbmQ6Cj4KPiAxLiBJbnRlcmFjdGlvbiBiZXR3ZWVuIHJlcXVlc3QgaGFu
ZGxpbmcgYW5kIG10ZF9vb2JsYXlvdXRfb3BzLiBGb3Igbm93IEkgCj4gc2ltcGx5IHRha2UgdGhl
IHJlcXVlc3QgZGF0YSAmIG9vYiBidWZmZXJzIGFuZCBwdXQgZGF0YSB3aGVyZSBpdCAic2VlbXMi
Cj4gcmlnaHQuCgptdGRfb29ibGF5b3V0X29wcyBhcmUganVzdCBvcGVyYXRpb25zIHRoZSBjb3Jl
IHdpbGwgY2FsbCB0byBnZXQgdGhlCmxvY2F0aW9uIG9mIHRoZSBFQ0MgYnl0ZXMgYW5kIHRoZSBs
b2NhdGlvbiBvZiB0aGUgZnJlZSBieXRlcyAoYXZhaWxhYmxlCmZvciB1c2VycywgYnV0IG9ubHkg
amZmczIgd291bGQgdXNlIHRoYXQgbm93YWRheXMgSSBndWVzcykuIFlvdSBzaG91bGQKZ2l2ZSB0
aGUgInBoeXNpY2FsIiBsYXlvdXQsIGllLiB3aGVyZSB0aGUgaGFyZHdhcmUgZW5naW5lIHB1dHMg
aXRzIG93bgpkYXRhLCBhbmQgd2hlcmUgaXQgZG9lcyBub3QuCgo+IDIuIFRoZSBoYXJkd2FyZSBk
b2VzIGEgbG90IG9mIGdvb2QgdGhpbmdzLiBJdCByZXR1cm5zIG9rL2Vycm9ycy9iaXRmbGlwcwo+
IGFuZCBJIGNhbiBzaW1wbHkgcGFzcyB0aGVtIGJhY2suIEJ1dCBob3cgZG8gSSB0ZWxsIHRoZSB1
cHBlciBsYXllcnMgdGhhdAo+IDQgYml0ZmxpcHMgYXJlIGdldHRpbmcgY2xvc2UgdG8gdGhlIDYg
Yml0cyB0aGUgZW5naW5lIGNhbiBoYW5kbGUuIElzIGl0Cj4gaW4gdGhlIGRyaXZlciBvciBEVFM/
IFRoYXQgY3VycmVudGx5IHJlYWRzLgoKSW4gdGhlIC0+aW5pdF9jdHgoKSwgZmlsbCB0aGUgbmFu
ZC0+ZWNjLmN0eC5jb25mLnN0cmVuZ3RoIGZpZWxkIHdpdGggdGhlCmVuZ2luZSBjYXBhYmlsaXR5
LiBUaGVuLCBpbiB0aGUgLT5maW5pc2hfaW9fcmVxKCkgaG9vaywgdXBkYXRlCm10ZC0+ZWNjX3N0
YXRzLmZhaWxlZC9jb3JyZWN0ZWQgYW5kIHJldHVybiB0aGUgbWF4aW11bSBudW1iZXIgb2YKYml0
bGZpcHMgb2JzZXJ2ZWQgaW4gdGhlIGN1cnJlbnQgc3RlcC4gVGhlIFNQSSBOQU5EIGxheWVyIHdp
bGwgZm9yd2FyZAp0aGUgbWF4X2JpdGZsaXAgdmFsdWUgb3IgLUVCQURNU0cgaW4gY2FzZSBvZiBl
cnJvciwgd2hpY2ggd2lsbCB0aGVuIGJlCnRyYW5zZm9ybWVkIGJ5IG10ZGNvcmUuYzoxNzQ0IGlu
dG8gYW4gLUVVQ0xFQU4gZm9yIFVCSSB0byBhY3QgdXBvbiBpbgpjYXNlIHRoZSBiaXRmbGlwIHRo
cmVzaG9sZCB3YXMgcmVhY2hlZC4KCj4KPiBzb2M6IHNvYyB7Cj4gCWNvbXBhdGlibGUgPSAic2lt
cGxlLWJ1cyI7Cj4gCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+IAkjc2l6ZS1jZWxscyA9IDwxPjsK
PiAJcmFuZ2VzID0gPDB4MCAweDE4MDAwMDAwIDB4MjAwMDA+Owo+Cj4gCWVjYzA6IGVjY0AxYTYw
MCB7Cj4gCQlzdGF0dXMgPSAib2theSI7Cj4gCQljb21wYXRpYmxlID0gInJlYWx0ZWssbmFuZC1l
Y2MtZW5naW5lIjsKPiAJCXJlZyA9IDwweDFhNjAwIDB4NTQ+Owo+IAl9OwkKPgo+IAlzbmFuZDog
c3BpQDFhNDAwIHsKPiAJCWNvbXBhdGlibGUgPSAicmVhbHRlayxydGw5MzAxLXNuYW5kIjsKPiAJ
CXJlZyA9IDwweDFhNDAwIDB4NDQ+Owo+IAkJaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47Cj4g
CQlpbnRlcnJ1cHRzID0gPDE5IDI+Owo+IAkJY2xvY2tzID0gPCZseF9jbGs+Owo+IAkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4gCQkjc2l6ZS1jZWxscyA9IDwwPjsJCj4gCQlzdGF0dXMgPSAib2th
eSI7Cj4KPiAJCWZsYXNoQDAgewo+IAkJCWNvbXBhdGlibGUgPSAic3BpLW5hbmQiOwo+IAkJCXJl
ZyA9IDwwPjsKPiAJCQluYW5kLWVjYy1lbmdpbmUgPSA8JmVjYzA+Owo+IAkJCXBhcnRpdGlvbnMg
ewo+IAkJCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwoKTG9va3MgcmVhbGx5IG5p
Y2UhCgpMb29raW5nIGZvcndhcmQgZm9yIHRoaXMgY2hhbmdlIHVwc3RyZWFtLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
