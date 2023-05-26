Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F103CC7EE23
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoEa1GB9T/JXlT4x9psk4LB95D9JxkmQPQVF6eXIlsI=; b=BABzOmWwh6SXjj
	FFmoKK3i02DR8xc6JSyTJhJZXAOAlphpj58kIKOJyI9lB68Wkc9JbcCE1bcByue2Yk/EkIGuCIxo/
	HmF2OFnQ1+S1eQiYf83OhtU2qh7Lbvm0m7ljWkDaT/idFQS7Wnf2eFQsP9jTXdyW3+DZAGPndH086
	0M6eYJr0IyLmGXnmYNK9q2PF+tZDSVn7Y5VlSjRvVvOfGuvoIXe+D/a38TgNfrCv3eWMSiHbl0/8Q
	wns1MCBmoLQ0u/a/oqxJCHhrSNLHU0Csgas8A7x7e7JCK2KUZ7ZTb0o8KE9g3ZkzMoHU70pjJ4iLW
	Kx/12fYbkt6BKcaorUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2b8p-003Hjv-2i;
	Fri, 26 May 2023 17:22:15 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2b8l-003Hih-18;
	Fri, 26 May 2023 17:22:12 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685121728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efZQFkhGxaWLVGqIF4cJhlsyJFIZEiGG0itIcLrxbrs=;
	b=PJzMm7FXKrNPBHGJnVX++8nGvS8t+2WQfb77helAAMq2fmDv9SdfYwz7+zT+D/WGsY9G5q
	TspfzH0SJEnPDHP8fkuyDVJnI7oG1jODJC64APzh9cJmSXGHyZ1Io8YI6732cmDqrHBaS2
	pEL6W3jO07t789mvl1WYdpjQb6t10HMEM5eYn6+RyzPspJO0BNR1RzUBCv3txSd0aluBq0
	1JEZMuK9nBSOYsRZhDWILpLMHRlfE4yxc1Fpbwtl9zF3E00Yb+CWVZHKMyGVfa+n/7Arhx
	eknMcg1P2OjyBazGT18mJ5qDosUEQi5dtinazPMXMNrVhRu6Qfv+YvXJ7wAeqQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C167AC0003;
	Fri, 26 May 2023 17:22:06 +0000 (UTC)
Date: Fri, 26 May 2023 19:22:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for
 read/write
Message-ID: <20230526192205.4a69ca79@xps-13>
In-Reply-To: <abeadc03-a69c-be1c-3c6a-6ce492a5e4f6@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-2-AVKrasnov@sberdevices.ru>
	<20230522170526.6486755a@xps-13>
	<9013b0e2-c923-43f8-0bd6-979bf0c23ebc@sberdevices.ru>
	<abeadc03-a69c-be1c-3c6a-6ce492a5e4f6@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_102211_651474_3AE9B3A8 
X-CRM114-Status: GOOD (  27.18  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDI0IE1h
eSAyMDIzIDEyOjA1OjQ3ICswMzAwOgoKPiBPbiAyMy4wNS4yMDIzIDEyOjEyLCBBcnNlbml5IEty
YXNub3Ygd3JvdGU6Cj4gPiBIZWxsbyBNaXF1ZWwsIExpYW5nCj4gPiAKPiA+IE9uIDIyLjA1LjIw
MjMgMTg6MDUsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+PiBIaSBBcnNlbml5LAo+ID4+Cj4g
Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgMTUgTWF5IDIwMjMgMTI6
NDQ6MzUgKzAzMDA6Cj4gPj4gIAo+ID4+PiBUaGlzIGZpeGVzIHJlYWQvd3JpdGUgZnVuY3Rpb25h
bGl0eSBieToKPiA+Pj4gMSkgQ2hhbmdpbmcgTkZDX0NNRF9SQl9JTlQgYml0IHZhbHVlLiAgCj4g
Pj4KPiA+PiBJIGd1ZXNzIHRoaXMgaXMgYSBzZXBhcmF0ZSBmaXgKPiA+PiAgCj4gPiAKPiA+IE9r
LCBJJ2xsIG1vdmUgaXQgdG8gc2VwYXJhdGUgcGF0Y2gKPiA+ICAgCj4gPj4+IDIpIEFkZGluZyBl
eHRyYSBOQU5EX0NNRF9TVEFUVVMgY29tbWFuZCBvbiBlYWNoIHIvdyByZXF1ZXN0LiAgCj4gPj4K
PiA+PiBJcyB0aGlzIHJlYWxseSBuZWVkZWQ/IExvb2tzIGxpa2UgeW91J3JlIGRlbGF5aW5nIHRo
ZSBuZXh0IG9wIG9ubHkuIElzCj4gPj4gdXNpbmcgYSBkZWxheSBlbm91Z2g/IElmIHllcywgdGhl
biBpdCdzIHByb2JhYmx5IHRoZSB3cm9uZyBhcHByb2FjaC4gIAo+IAo+IEhpIE1pcXVlbCwgc21h
bGwgdXBkYXRlLCBJIGZvdW5kIHNvbWUgZGV0YWlscyBmcm9tIEBMaWFuZydzIG1lc3NhZ2UgaW4g
djEgdGFsa3MgZnJvbSB0aGUgbGFzdCBtb250aDoKPiAKPiAqCj4gQWZ0ZXIgc2VuZGluZyBOQU5E
X0NNRF9SRUFEMCwgYWRkcmVzcywgTkFORF9DTURfUkVBRFNUQVJUIGFuZCByZWFkIHN0YXR1cyhO
QU5EX0NNRF9TVEFUVVMgPSAweDcwKSBjb21tYW5kcywgaXQgc2hvdWxkIHNlbmQKPiBOQU5EX0NN
RF9SRUFEMCBjb21tYW5kIGZvciBleGl0aW5nIHRoZSByZWFkIHN0YXR1cyBtb2RlIGZyb20gdGhl
IGRhdGFzaGVldCBmcm9tIE5BTkQgZGV2aWNlLgoKVGhhdCBpcyB0cnVlLgoKPiBidXQgcHJldmlv
dXMgbWVzb25fbmZjX3F1ZXVlX3JiKCkKPiBvbmx5IGNoZWNrcyB0aGUgUmVhZHkvQnVzeSBwaW4g
YW5kIGl0IGRvZXNuJ3Qgc2VuZCByZWFkIHN0YXR1cyhOQU5EX0NNRF9TVEFUVVMgPSAweDcwKSBj
b21tYW5kLgo+IGkgdGhpbmsgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIFJlYWR5
L0J1c3kgcGluKHBsZWFzZSBjaGVjayB0aGUgaGFyZHdhcmUgd2hldGhlciB0aGlzCj4gUmVhZHkv
QnVzeSBwaW4gaXMgY29ubmVjdGVkIHdpdGggU09DKSBvciB0aGUgc291cmNlIGNvZGUuIGkgaGF2
ZSB0aGUgYm9hcmQgd2l0aG91dCBSZWFkeS9CdXN5IHBpbiBhbmQgcHJlZmVyIHRvIHVzZSB0aGUK
PiBuZmMgY29tbWFuZCBjYWxsZWQgUkJfSU82LiBpdCBzZW5kcyBOQU5EX0NNRF9TVEFUVVMgY29t
bWFuZCBhbmQgY2hlY2tzIGJpdDYgb2YgdGhlIHN0YXR1cyByZWdpc3RlciBvZiBOQU5EIGRldmlj
ZSBmcm9tIHRoZQo+IGRhdGEgYnVzIGFuZCBnZW5lcmF0ZSBJUlEgaWYgcmVhZHkuCj4gKgo+IAo+
IEkgZ3Vlc3MsIHRoYXQgc2VxdWVuY2Ugb2YgY29tbWFuZHMgZnJvbSB0aGlzIHBhdGNoIGlzIGRl
c2NyaWJlZCBpbiBkYXRhc2hlZXQgKHVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIGl0IGFuZCBy
ZWxpZWQgb24gdGhlIG9sZCBkcml2ZXIpLgo+IFllc3RlcmRheSBJIHRyaWVkIHRvIHJlbW92ZSBz
ZW5kaW5nIG9mIE5BTkRfQ01EX1NUQVRVUyBmcm9tIHRoaXMgcGF0Y2gsIGJ1dCBpdCBicm9rZSBj
dXJyZW50IGRyaXZlciAtIGkgaGFkIEVDQyBlcnJvcnMsIHNvIGl0IGxvb2tzIGxpa2UKPiAic2hv
dCBpbiB0aGUgZGFyayIgc2l0dWF0aW9uLCB0byB1bmRlcnN0YW5kIHRoaXMgbG9naWMuCgpXaGVu
IGFuIG9wZXJhdGlvbiBvbiB0aGUgTkFORCBhcnJheSBoYXBwZW5zIChlZy4gcmVhZCwgcHJvZywg
ZXJhc2UpLAp5b3UgbmVlZCB0byB3YWl0ICJzb21lIHRpbWUiIGJlZm9yZSBhY2Nlc3NpbmcgdGhl
IGludGVybmFsIHNyYW0gb3IgZXZlbgp0aGUgY2hpcCB3aGljaCBpcyAiYnVzeSIgdW50aWwgaXQg
Z2V0cyAicmVhZHkiIGFnYWluLiBZb3UgY2FuIHByb2JlIHRoZQpyZWFkeS9idXN5IHBpbiAodGhh
dCdzIHRoZSBoYXJkd2FyZSB3YXksIGZhc3QgYW5kIHJlbGlhYmxlKSBvciB5b3UgY2FuCnBvbGwg
YSBzdGF0dXMgd2l0aCBOQU5EX0NNRF9TVEFUVVMuIFRoZSBjaGlwcyBhcmUgZGVzaWduZWQgc28g
dGhleSBjYW4KYWN0dWFsbHkgcHJvY2VzcyB0aGF0IGNvbW1hbmQgd2hpbGUgdGhleSBhcmUgZG9p
bmcgdGltZSBjb25zdW1pbmcgdGFza3MKdG8gdXBkYXRlIHRoZSBob3N0LiBCdXQgSUlSQyBldmVy
eSBieXRlIHJlYWQgd2lsbCByZXR1cm4gdGhlIHN0YXR1cwp1bnRpbCB5b3Ugc2VuZCBSRUFEMCBh
Z2Fpbiwgd2hpY2ggbWVhbnMgIkknbSBkb25lIHdpdGggdGhlIHN0YXR1cwpyZWFkIiBzb21laG93
LgoKUGxlYXNlIHNlZSBuYW5kX3NvZnRfd2FpdHJkeSgpIGluIG9yZGVyIHRvIHVuZGVyc3RhbmQg
aG93IHRoaXMgaXMKc3VwcG9zZWQgdG8gd29yay4gWW91IGNhbiBldmVuIHVzZSB0aGF0IGhlbHBl
ciAod2hpY2ggaXMgZXhwb3J0ZWQpCmluc3RlYWQgb2Ygb3Blbi1jb2RpbmcgaXQgaW4geW91ciBk
cml2ZXIuIFNlZSBhdG1lbCBvciBzdW54aQppbXBsZW1lbnRhdGlvbnMgZm9yIGluc3RhbmNlLgoK
QXMgdXNpbmcgdGhlIG5hdGl2ZSBSQiBwaW4gaXMgYmV0dGVyLCB5b3Ugd291bGQgbmVlZCB0byBp
ZGVudGlmeQp3aGV0aGVyIHlvdSBoYXZlIG9uZSBvciBub3QgYXQgcHJvYmUgdGltZSBhbmQgdGhl
biBlaXRoZXIgcG9sbCB0aGUKcmVsZXZhbnQgYml0IG9mIHlvdXIgY29udHJvbGxlciBpZiB0aGVy
ZSBpcyBvbmUsIG9yIGZhbGxiYWNrIHRvIHRoZQpzb2Z0IHJlYWQgKHdoaWNoIHNob3VsZCBmYWxs
YmFjayBvbiBleGVjX29wIGluIHRoZSBlbmQpLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
