Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41573C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:23:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0328160EE9
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0328160EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OTt6qJfAtFSe2W78w+lFmrymd3G+sVl1RmU9RKw+4k=; b=vTLUkG35DcgCbL
	Ai8IMUh6AViBcMEkppYj0RvwCU4Khc2KQ7+2LlkOHduQuPQN0nXL8DwUusDleKBClGdiHScTJyzRw
	Z64lCTB+8GZ7j/0xRSlGe5jdkoBKP8b/NerpS6IXTn/ITxZ+mcep0h30uc84dl5kK0DECu+wXe356
	DuqdP8xEU1DX4wKFeYOzsUK0qe8EhikYL1SONpeL/sHgmu4bvsEORr/znMhUtvfHS52vAd1JNbQS3
	K8zj//hpLxRiV3wYp9XKQKull5OjAAimspFeYcpmtB0iMLMxZ2ytvG3qtAeSu+KKTQf4nYl+eQykZ
	JhUyE9x9HDUmOYvf+05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbGbg-005VXk-6A; Fri, 15 Oct 2021 06:22:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbGbd-005VWY-Oj
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 06:22:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 49C9020002;
 Fri, 15 Oct 2021 06:22:08 +0000 (UTC)
Date: Fri, 15 Oct 2021 08:22:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: core: protect access to mtd devices while in
 suspend
Message-ID: <20211015082206.244a2316@xps13>
In-Reply-To: <20211011160546.707b737b@collabora.com>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011160546.707b737b@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_232213_966686_E2885286 
X-CRM114-Status: GOOD (  26.37  )
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

SGkgU2VhbiwKCmJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tIHdyb3RlIG9uIE1vbiwgMTEg
T2N0IDIwMjEgMTY6MDU6NDYgKzAyMDA6Cgo+IE9uIE1vbiwgMTEgT2N0IDIwMjEgMTM6NTI6NTAg
KzAyMDAKPiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+IHdyb3RlOgo+IAo+ID4gRm9s
bG93LXVwIG9uIGRpc2N1c3Npb24gaW4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMTAvNC80
MQo+ID4gCj4gPiBDaGFuZ2VzIHNpbmNlIGZyb20gcmZjIHYxL3YyOgo+ID4gIC0gYWRkZWQgYWNj
ZXNzIHByb3RlY3Rpb24gZm9yIGFsbCBkZXZpY2UgYWNjZXNzIGhvb2tzIGluIG10ZF9pbmZvLgo+
ID4gIC0gYWRkZWQgU3VnZ2VzdGVkLWJ5IHRvIFsxLzNdIHBhdGNoLgo+ID4gIC0gcmVtb3ZlZCBy
ZWZlcmVjZXMgdG8gY29tbWl0IGVmMzQ3YzBjZmQ2MSAoIm10ZDogcmF3bmFuZDogZ3BtaTogSW1w
bGVtZW50IGV4ZWNfb3AiKQo+ID4gICAgZnJvbSBjb21taXQgbXNnIGFzIGNvbW1pdCAwMTNlNjI5
MmFhZjUgKCJtdGQ6IHJhd25hbmQ6IFNpbXBsaWZ5IHRoZSBsb2NraW5nIikgaXMgCj4gPiAgICB0
byBiZSBibGFtZWQuCj4gPiAgLSB0ZXN0ZWQgb24gYSBrZXJuZWwgd2l0aCBMT0NLREVQIGVuYWJs
ZWQuCj4gPiAKPiA+IEBNaXF1ZWw6IEkgaGF2bid0IGNvdmVyZWQgZXZlcnkgaW9jdGwsIHRvIG1l
IGl0IGxvb2tzIGxpa2UgdGhleSBoYXZuJ3QKPiA+IGRpcmVjdCBkZXZpY2UgYWNjZXNzLgoKWWVz
IGluZGVlZCBpdCBsb29rcyBsaWtlIHRoZXkgcmUtdXNlIG1vc3Qgb2YgdGhlIG10ZGNvcmUuYyBm
dW5jdGlvbnMsCnNvIGl0IHNob3VsZCBiZSBmaW5lLgoKPiA+IE9uZSAoc21hbGwpIGlzc3VlIHN0
aWxsIHByZXNlbnQuIGdwbWlfbmFuZC5jIHVzZXMgdGhlIHJ3c2VtIGJlZm9yZSBpdCdzCj4gPiBp
bml0aWFsaXplZC4gU2VlbXMgY3VtYmVyc29tZSB0byBoYXZlIGV2ZXJ5IG10ZC9uYW5kIGRyaXZl
ciB0byBjYWxsCj4gPiBpbml0X3dhaXRxdWV1ZV9oZWFkKCkgYW5kIGluaXRfcndzZW0oKS4gQ291
bGQgd2Ugc29tZWhvdyBtb3ZlIHRoZSBjYWxsCj4gPiB0byBtdGRfc2V0X2Rldl9kZWZhdWx0cygp
IGJlZm9yZSBuYW5kX2NyZWF0ZV9iYnQoKT8gIAo+IAo+IEkgaGF2ZSBhIG5hc3R5IHRyaWNrIGZv
ciB0aGF0IG9uZSwgYnV0IEknbSBub3Qgc3VyZSBNaXF1ZWwgd2lsbCBsaWtlIGl0Cj4gKGFjdHVh
bGx5LCBJIGRvbid0IGxpa2UgaXQgZWl0aGVyLCBidXQgaXQncyBzbyBzaW1wbGUgY29tcGFyZWQg
dG8gdGhlCj4gb3RoZXIgb3B0aW9ucyB3ZSBoYXZlIHRoYXQgSSdtIHRlbXB0ZWQgdG8gZ28gZm9y
IHRoaXMgYXBwcm9hY2ggdW50aWwKPiBzb21lb25lIGhhcyB0aW1lIHRvIGludmVzdCBpbiBhIGNs
ZWFuZXIgc29sdXRpb24gOi0pKToKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4
IDNkNmM2ZTg4MDUyMC4uYTlhYzJkNTI4YTRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMKPiBAQCAtNjIyMiw4ICs2MjIyLDYgQEAgc3RhdGljIGludCBuYW5kX3NjYW5fdGFpbChzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAgICAgICAgbXRkLT5fc3luYyA9IG5hbmRfc3luYzsKPiAg
ICAgICAgIG10ZC0+X2xvY2sgPSBuYW5kX2xvY2s7Cj4gICAgICAgICBtdGQtPl91bmxvY2sgPSBu
YW5kX3VubG9jazsKPiAtICAgICAgIG10ZC0+X3N1c3BlbmQgPSBuYW5kX3N1c3BlbmQ7Cj4gLSAg
ICAgICBtdGQtPl9yZXN1bWUgPSBuYW5kX3Jlc3VtZTsKPiAgICAgICAgIG10ZC0+X3JlYm9vdCA9
IG5hbmRfc2h1dGRvd247Cj4gICAgICAgICBtdGQtPl9ibG9ja19pc3Jlc2VydmVkID0gbmFuZF9i
bG9ja19pc3Jlc2VydmVkOwo+ICAgICAgICAgbXRkLT5fYmxvY2tfaXNiYWQgPSBuYW5kX2Jsb2Nr
X2lzYmFkOwo+IEBAIC02MjY5LDYgKzYyNjcsMTMgQEAgc3RhdGljIGludCBuYW5kX3NjYW5fdGFp
bChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJfZnJlZV9zZWN1cmVfcmVnaW9uczsKPiAgCj4gKyAgICAgICAvKgo+ICsg
ICAgICAgICogUG9wdWxhdGUgdGhlIHN1c3BlbmQvcmVzdW1lIGhvb2tzIGFmdGVyIHRoZSBCQlQg
aGFzIGJlZW4gc2Nhbm5lZCB0bwo+ICsgICAgICAgICogYXZvaWQgdXNpbmcgdGhlIHN1c3BlbmQg
bG9jayBhbmQgcmVzdW1lIHdhaXRxdWV1ZSB3aGljaCBhcmUgb25seQo+ICsgICAgICAgICogaW5p
dGlhbGl6ZWQgd2hlbiBtdGRfZGV2aWNlX3JlZ2lzdGVyKCkgaXMgY2FsbGVkLgo+ICsgICAgICAg
ICovCj4gKyAgICAgICBtdGQtPl9zdXNwZW5kID0gbmFuZF9zdXNwZW5kOwo+ICsgICAgICAgbXRk
LT5fcmVzdW1lID0gbmFuZF9yZXN1bWU7Cj4gICAgICAgICByZXR1cm4gMDsKCkknbSBmaW5lIHdp
dGggdGhpcyBhcyBsb25nIGFzIGl0IGlzIGRvY3VtZW50ZWQgZm9yIG5vdy4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
