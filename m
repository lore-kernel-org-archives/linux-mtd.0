Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8580FC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ibq2vlwHFr6jm6utqBF4ThWyRFQlCU//vJFDyL818ZI=; b=etEzNCWDglnQP+
	3g94IvvQheHnE6OFt8syUxz+4bL8lyZ1mluNnT2L3NNDIX0e+GFEX/3p/E24OWU1Q9r3TpsIbp6cK
	qEuEfP/LhaOdv15f3asJaX7ijcCeLrZtPwXNNDNO8vcI/VvUMHqan6Z9GnmdJVjrWPDFGJWvr9gll
	9ZybLwyb9iIrwUIr6AYZFtImx/2F+uSU/fivqsfwIL/q8SgVlocKLwTTYWdubETybbOB1Tqk/ON9u
	KSVrRA5sNj9kvcZeA6yUC4pqGC/XdI5/rOSRPTiWv4Z+etoFyaONyXFMjBtOGySeC5+EE3B2sstyC
	2ABVOcmPR1gp7TrPdTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskSd-00DTZ8-4N; Wed, 09 Nov 2022 12:45:43 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskSZ-00DTUD-OR
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 12:45:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 547C91BF207;
	Wed,  9 Nov 2022 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667997930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CP5HR4/fW62hCUEuUWY+rJW5C3z5hPsLxg/D74tYsWg=;
	b=IQaY+i8KKGP7I+eJmahCk+nqdTj3vEIF7eoLt1ZRFZKkeRIwcVnF3JnaYCeSduXrh/bn6K
	w4UJf6oLc0ToqR/TsdchrX3M87LJsUqeVpdoxX/b79NlYnEFeN6ylERltWBiWFq4sbUpak
	H8DsZA7e/bBadHXaNogTXrMlnkYbI8auXlcKSTclxaGcbzlpqA3kbgP1jk6OFS2sF/+Ruw
	RyGNOg3Xhy3LmartbIq7ojm3aDQo3BOkBLEqXSSASDpJRMM27TPM17VWxqDgSEr/5bJsXa
	qvpXB2QjMXjsCSARHkY6FP5r6BgvzSrjHtzsSefQRXiFwqY2zMeUNO6XAQCfSQ==
Date: Wed, 9 Nov 2022 13:45:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei
 <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
Message-ID: <20221109134526.158047e1@xps-13>
In-Reply-To: <Y2rgbfpYfpbLKHaf@makrotopia.org>
References: <Y2rgbfpYfpbLKHaf@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_044540_077663_9CFFC8FB 
X-CRM114-Status: GOOD (  23.12  )
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

SGkgRGFuaWVsLAoKZGFuaWVsQG1ha3JvdG9waWEub3JnIHdyb3RlIG9uIFR1ZSwgOCBOb3YgMjAy
MiAyMzowNDoxMyArMDAwMDoKCj4gQWRkIEtjb25maWcgYm9vbGVhbiBDT05GSUdfTVREX0JMT0NL
X1BBUlRJVElPTlMgYW5kIGVuYWJsZSBibG9jawo+IHBhcnRpdGlvbiBwYXJzZXJzIG9uIG5vbi1O
QU5EIG10ZGJsb2NrIGRldmljZXMgaW4gY2FzZSBpdCBpcyBzZWxlY3RlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBY2tlZC1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9tdGQvS2NvbmZpZyAgICAgICB8IDExICsrKysrKysrKysrCj4gIGRyaXZlcnMvbXRkL210ZF9i
bGtkZXZzLmMgfCAgNCArKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9LY29uZmlnIGIvZHJp
dmVycy9tdGQvS2NvbmZpZwo+IGluZGV4IDc5NmEyZWNjYmVmMC4uMTI4NzRkZWMxNTY5IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL0tjb25maWcKPiArKysgYi9kcml2ZXJzL210ZC9LY29uZmln
Cj4gQEAgLTY5LDYgKzY5LDE3IEBAIGNvbmZpZyBNVERfQkxPQ0tfUk8KPiAgCSAgWW91IGRvIG5v
dCBuZWVkIHRoaXMgb3B0aW9uIGZvciB1c2Ugd2l0aCB0aGUgRGlza09uQ2hpcCBkZXZpY2VzLiBG
b3IKPiAgCSAgdGhvc2UsIGVuYWJsZSBORlRMIHN1cHBvcnQgKENPTkZJR19ORlRMKSBpbnN0ZWFk
Lgo+ICAKPiArY29uZmlnIE1URF9CTE9DS19QQVJUSVRJT05TCj4gKwlib29sICJTY2FuIGZvciBw
YXJ0aXRpb25zIG9uIE1URCBibG9jayBkZXZpY2VzIgo+ICsJZGVwZW5kcyBvbiBNVERfQkxPQ0sg
fHwgTVREX0JMT0NLX1JPCj4gKwlkZWZhdWx0IHkgaWYgRklUX1BBUlRJVElPTgo+ICsJaGVscAo+
ICsJICBTY2FuIE1URCBibG9jayBkZXZpY2VzIGZvciBwYXJ0aXRpb25zIChpZS4gTUJSLCBHUFQs
IHVJbWFnZS5GSVQsIC4uLikuCj4gKwkgIChOQU5EIGRldmljZXMgYXJlIG9taXR0ZWQsIHViaWJs
b2NrIHNob3VsZCBiZSB1c2VkIGluc3RlYWQgd2hlbikKPiArCj4gKwkgIFVubGVzcyB5b3VyIE1U
RCBwYXJ0aXRpb25zIGNvbnRhaW4gc3ViLXBhcnRpdGlvbnMgbWFwcGVkIHVzaW5nIGEKPiArCSAg
cGFydGl0aW9uIHRhYmxlLCBzYXkgbm8uCgpBY3R1YWxseSBJIGtub3cgSSd2ZSBhY2tlZCB0aGlz
IHBhdGNoIGluIHRoZSBwYXN0IGJ1dCBJIGFtIG5vdwp3b25kZXJpbmcgYWdhaW4gaWYgdGhpcyBp
cyB0aGUgcmlnaHQgd2F5IHNvIEkgd291bGQgbGlrZSB0byBkaXNjdXNzCnRoaXMgYWdhaW4uIEkg
ZG9uJ3QgZmVlbCBtYWtpbmcgcGFydGl0aW9ucyBvbiB0b3Agb2YgYmxrIGRldmljZXMgbGlrZQp0
aGF0IGlzIHRoZSByaWdodCBzb2x1dGlvbi4gV2h5IG5vdCB1c2luZyB0aGUgYWR2YW5jZWQgcGFy
dGl0aW9uCnBhcnNlcnMgdGhhdCB3ZSBub3cgaGF2ZSBpbiBNVEQgdG8gY3JlYXRlIHRoZXNlIHN1
YnBhcnRpdGlvbnMgYW5kIHRoZW4KaGF2ZSBibG9ja3MgZW11bGF0ZWQgb24gdG9wIG9mIHRoZW0/
Cgo+ICsKPiAgY29tbWVudCAiTm90ZSB0aGF0IGluIHNvbWUgY2FzZXMgVUJJIGJsb2NrIGlzIHBy
ZWZlcnJlZC4gU2VlIE1URF9VQklfQkxPQ0suIgo+ICAJZGVwZW5kcyBvbiBNVERfQkxPQ0sgfHwg
TVREX0JMT0NLX1JPCj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5j
IGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IGluZGV4IDYwYjIyMjc5OTg3MS4uZTZmMmUw
ODg4MjQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiArKysgYi9k
cml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4gQEAgLTM1OSw3ICszNTksOSBAQCBpbnQgYWRkX210
ZF9ibGt0cmFuc19kZXYoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKm5ldykKPiAgCX0gZWxzZSB7
Cj4gIAkJc25wcmludGYoZ2QtPmRpc2tfbmFtZSwgc2l6ZW9mKGdkLT5kaXNrX25hbWUpLAo+ICAJ
CQkgIiVzJWQiLCB0ci0+bmFtZSwgbmV3LT5kZXZudW0pOwo+IC0JCWdkLT5mbGFncyB8PSBHRU5I
RF9GTF9OT19QQVJUOwo+ICsKPiArCQlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX01URF9CTE9DS19Q
QVJUSVRJT05TKSB8fCBtdGRfdHlwZV9pc19uYW5kKG5ldy0+bXRkKSkKPiArCQkJZ2QtPmZsYWdz
IHw9IEdFTkhEX0ZMX05PX1BBUlQ7Cj4gIAl9Cj4gIAo+ICAJc2V0X2NhcGFjaXR5KGdkLCAoKHU2
NCluZXctPnNpemUgKiB0ci0+Ymxrc2l6ZSkgPj4gOSk7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
