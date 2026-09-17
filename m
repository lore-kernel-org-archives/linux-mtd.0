Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68664C88E72
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNegEfF4KeykBSraddc8H6cVWUt36OP04XZCUOBQpwA=; b=fHe8cWe4YtesoN
	h8vQAWd9KojQsLdAZZbvlW55uVLThhXX+StQOcehp/uaUGRN+qaPoYRZdl51NG2kcDf41d1ixbqkf
	wn+KjPMA4Ud5fFj3JL5pOHuIbXmCMKIMVYkhZzYcKKJZ39Yj8mq7aaKaVmmtw7EIGIZBitCIkTHwb
	Xh/DB5mNuyzbrL1yfqnrvhWFCf8kf5tkIA67eOJTB335TcuhesR/a4QdBFphfoIck2ac+we/MVswX
	O485x5g4hWLExowEVw+eVJsHewst3C5IF5skr0ldCHl75Ou7Rr5ZYxtsObShUHKvs7e8l+sUvQA6X
	nlNDbu6rLed1xJUlZJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Xc-0000000B7WB-3b4D;
	Thu, 17 Sep 2026 10:40:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Xb-0000000B7Vz-2cfR
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 10:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0875600D4;
	Thu, 17 Sep 2026 10:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223651F00893;
	Thu, 17 Sep 2026 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641630;
	bh=B1y9pUsKx0AJ915GGc6qcee+i+Ha2X0DlbvDWbjL+wo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D0NdSTwTaGbDb/J8htFLNu6DxeWRMmZ1UFTfXLLMyvpKNpZXb3zPeTEy3FfMoMqb4
	 Z8rqvOZ6MtcIsnEDh+p38EfX5VCVljC96Bz9K6R/GIfGKdDI26GeUr3gWcKEDO4DaA
	 nCEhcz6LpHKV9Ay2yFlG2TbVbunzHXgdRFD0R9Dx/CdZR61ctR1BBvkpKfqH7G6K4A
	 IYtsduH7bDAhmKblOz+/uPnDKUCs4tET13Bpw+CjVKjbsu/g81qvdsSVp6XLhgMSch
	 MZmBe5UpXRyJOGhyz+OwBkJT05wU7FnC8wfX6i++3v7RxGGSULbaJG8XsdrEp8LG+4
	 rDVViGSvnEIdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: ubi: Fix UBI device reference leak in
 ubi_detach_mtd_dev()
To: "Wentao Liang" <vulab@iscas.ac.cn>, chengzhihao1@huawei.com
Cc: richard@nod.at, daniel@makrotopia.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com, miquel.raynal@bootlin.com, stable@vger.kernel.org
In-Reply-To: <20260917103102.2147038-1-vulab@iscas.ac.cn>
References: <20260917103102.2147038-1-vulab@iscas.ac.cn>
Date: Thu, 17 Sep 2026 10:40:29 +0000
Message-Id: <20260917104030.223651F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogdWJpOiBkb3Vi
bGUgcHV0IG9mIHViaV9kZXZpY2UgaW4gdWJpX2RldGFjaF9tdGRfZGV2KCkKLS0KCmNvbW1pdCBk
YzFlMTU2MGM2YTkyZTIxN2RjMzgyN2ViMTNhNmM0MWFjYWRjYWZiCkF1dGhvcjogV2VudGFvIExp
YW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KCm10ZDogdWJpOiBGaXggVUJJIGRldmljZSByZWZlcmVu
Y2UgbGVhayBpbiB1YmlfZGV0YWNoX210ZF9kZXYoKQoKdWJpX2RldGFjaF9tdGRfZGV2KCkgdGFr
ZXMgYSByZWZlcmVuY2Ugb24gdGhlIFVCSSBkZXZpY2Ugd2l0aCB1YmlfZ2V0X2RldmljZSgpCmFu
ZCBhdHRlbXB0cyB0byBkcm9wIGl0LiBUaGlzIHBhdGNoIGFpbXMgdG8gZml4IGEgcmVmZXJlbmNl
IGxlYWsgd2hlbiByZXR1cm5pbmcKLUVCVVNZLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
dWJpL2J1aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IGE5MDFmOGVkZmE0
MWQuLjg2NjYzOGMwMDY0OTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMK
PiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBAIC0xMDczLDYgKzEwNzMsNyBAQCBp
bnQgdWJpX2RldGFjaF9tdGRfZGV2KGludCB1YmlfbnVtLCBpbnQgYW55d2F5KQo+ICAJaWYgKHVi
aS0+cmVmX2NvdW50KSB7Cj4gIAkJaWYgKCFhbnl3YXkpIHsKPiAgCQkJc3Bpbl91bmxvY2soJnVi
aV9kZXZpY2VzX2xvY2spOwo+ICsJCQlwdXRfZGV2aWNlKCZ1YmktPmRldik7CgpbU2V2ZXJpdHk6
IEhpZ2hdCkRvZXMgdGhpcyBjb2RlIGRvdWJsZS1wdXQgdGhlIHViaV9kZXZpY2Ugb24gdGhlIGVy
cm9yIHBhdGg/CgpMb29raW5nIGF0IHViaV9kZXRhY2hfbXRkX2RldigpIGluIGRyaXZlcnMvbXRk
L3ViaS9idWlsZC5jLCBwdXRfZGV2aWNlKCkgaXMKYWxyZWFkeSBjYWxsZWQgcmlnaHQgYmVmb3Jl
IHRoZSByZWZfY291bnQgY2hlY2s6CgoJc3Bpbl9sb2NrKCZ1YmlfZGV2aWNlc19sb2NrKTsKCXB1
dF9kZXZpY2UoJnViaS0+ZGV2KTsKCXViaS0+cmVmX2NvdW50IC09IDE7CglpZiAodWJpLT5yZWZf
Y291bnQpIHsKCQlpZiAoIWFueXdheSkgewoJCQlzcGluX3VubG9jaygmdWJpX2RldmljZXNfbG9j
ayk7CgpBZGRpbmcgYW5vdGhlciBwdXRfZGV2aWNlKCZ1YmktPmRldikgaGVyZSBkcm9wcyBhIGtv
YmplY3QgcmVmZXJlbmNlIHRoYXQgdGhlCmZ1bmN0aW9uIGRvZXMgbm90IG93biwgbGVhZGluZyB0
byBwcmVtYXR1cmUgZnJlZWluZyBvZiBzdHJ1Y3QgdWJpX2RldmljZSBtZW1vcnkKdmlhIGRldl9y
ZWxlYXNlIHdoaWxlIGl0IGlzIHN0aWxsIGluIHVzZSBieSBvdGhlciBrZXJuZWwgY29tcG9uZW50
cy4KCklmIGEgdXNlciB3aXRoIENBUF9TWVNfUkVTT1VSQ0UgY2FsbHMgdGhlIFVCSV9JT0NERVQg
aW9jdGwgb24gdGhlIFVCSSBjb250cm9sCmRldmljZSB3aGlsZSB0aGUgdGFyZ2V0IFVCSSBkZXZp
Y2UgaXMgaW4gdXNlLCB1YmktPnJlZl9jb3VudCBpcyA+IDAsIGxlYWRpbmcKdWJpX2RldGFjaF9t
dGRfZGV2KCkgdG8gcmV0dXJuIC1FQlVTWSBhbmQgZXhlY3V0ZSB0aGlzIHBhdGguCgpUaGlzIGFw
cGVhcnMgdG8gYmUgYSBmbGF3ZWQgYmFja3BvcnQgaW50ZW5kZWQgZm9yIGEgbmV3ZXIga2VybmVs
IHRyZWUgd2hlcmUKcHV0X2RldmljZSgpIHdhcyBhY3R1YWxseSBtaXNzaW5nIGZyb20gdGhpcyBi
bG9jayAoZHVlIHRvIGNvbW1pdCA3ZTg0Yzk2MWIyZWIpLgpJbiB0aGlzIGJhc2VsaW5lLCB0aGUg
cmVmZXJlbmNlIGlzIGFscmVhZHkgY29ycmVjdGx5IGRyb3BwZWQgYmVmb3JlIHRoZSAtRUJVU1kK
Y2hlY2suCgo+ICAJCQlyZXR1cm4gLUVCVVNZOwo+ICAJCX0KPiAgCQkvKiBUaGlzIG1heSBvbmx5
IGhhcHBlbiBpZiB0aGVyZSBpcyBhIGJ1ZyAqLwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNzEwMzEwMi4yMTQ3MDM4LTEtdnVs
YWJAaXNjYXMuYWMuY24/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
