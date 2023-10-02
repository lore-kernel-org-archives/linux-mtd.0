Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B478E784AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbg1Oi/w1RcwWYg3vD/ncshvZX2XB84/xhLev2wf2hY=; b=mUS4YE86cMrASh
	CCGgYKFgcnfm+haj/Ev7Vy1L/0fxSfpmIAHH8OXXnzjhzdCkiA17UXnDonPtG0WCNft18/eNGLFR/
	V2PbpKOCL/CetoqLQNGv0aQ0+4d67rObKnlGYJvss5BaoI4xu8h8kI9nNUye3VH7CkrQbN2XRzmNI
	eTuu410expIAk9Ra0SDTlBFluwTH6RcGsJj7A+DJR4T059HpfyZeiR9nZzU7a1ZK0t7UaK0nFxehr
	Ao32jgkbAcFT9VVXdpWvvPGXGg/DMSogGtN2U6bJEa6hLVRRBrK5tDm7Te0SVG7m1l59wWrwobiRa
	vU2kKi9iAgCJtYw/4XtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnI9B-00Ciuf-01;
	Mon, 02 Oct 2023 12:35:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnI98-00CiuI-0A
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 12:35:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 023FAC000C;
	Mon,  2 Oct 2023 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696250131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nNMuGJL44gj1ZB3e/uIcPx32jrKTbp3WUjy5cGFxIrI=;
	b=UaYnoZbI9nCRnp+/H4oltdkSs70wxX+I01PxntZGZZYeYIJCrGKSNK5eg7y892Qh6Eolct
	30aCRk5yz1i4cV5BBApon3dVHnya7+DDwsjYzfDsxW5UGL0Y38C3656zFcjExO3zNvfsKx
	XzBkxnFwIGfE3b8uN4lCuP0/OCwHinymBiscuCF3/vXjTyhyV+uWtatIj1ZJP/Zwx36rhD
	ONhPESCrNSzZruBIJtCyK73GNT1cY9eQmyP89tNSMqjw9DOx2cS3sclxSqwDmH9735hEsd
	oTriY9YKyORJbbr24sw1CqZEczeb6FagqrBM8fcpCtTsKynVd3umVkFdRi5PAw==
Date: Mon, 2 Oct 2023 14:35:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: Initial exec_op
 implementation
Message-ID: <20231002143527.4ccf254a@xps-13>
In-Reply-To: <trinity-06dd34f4-ab26-4c60-bcf8-f986f1d08058-1696039055941@3c-app-mailcom-lxa04>
References: <trinity-bb7db9f1-d34d-4fe2-bed3-814d3a63476a-1694571881792@3c-app-mailcom-lxa03>
 <20230922162424.4a7b27ec@xps-13>
 <trinity-06dd34f4-ab26-4c60-bcf8-f986f1d08058-1696039055941@3c-app-mailcom-lxa04>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_053534_361357_A6175F26 
X-CRM114-Status: GOOD (  23.95  )
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

SGkgRGF2aWQsCgpkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gU2F0LCAzMCBTZXAgMjAyMyAwMzo1
NzozNSArMDIwMDoKCj4gSW5pdGlhbCBleGVjX29wIGltcGxlbWVudGF0aW9uIGZvciBCcm9hZGNv
bSBTVEIsIEJyb2FkYmFuZCBhbmQgaVByb2MgU29DCj4gVGhpcyBhZGRzIGV4ZWNfb3AgYW5kIHJl
bW92ZXMgdGhlIGxlZ2FjeSBpbnRlcmZhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVn
YW4gPGRyZWdhbkBtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlh
bS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gCj4gLS0tCj4gCgouLi4KCj4gK3N0YXRpYyBpbnQgYnJj
bW5hbmRfcGFyc2VyX2V4ZWNfbWF0Y2hlZF9vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICsJ
CQkJCSBjb25zdCBzdHJ1Y3QgbmFuZF9zdWJvcCAqc3Vib3ApCj4gK3sKPiArCXN0cnVjdCBicmNt
bmFuZF9ob3N0ICpob3N0ID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwo+ICsJc3Ry
dWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwgPSBob3N0LT5jdHJsOwo+ICsJc3RydWN0IG10
ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiArCWNvbnN0IHN0cnVjdCBuYW5kX29w
X2luc3RyICppbnN0ciA9ICZzdWJvcC0+aW5zdHJzWzBdOwo+ICsJdW5zaWduZWQgaW50IGk7Cj4g
KwlpbnQgcmV0ID0gMDsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgc3Vib3AtPm5pbnN0cnM7IGkr
Kykgewo+ICsJCWluc3RyID0gJnN1Ym9wLT5pbnN0cnNbaV07Cj4gKwo+ICsJCWlmICgoaW5zdHIt
PnR5cGUgPT0gTkFORF9PUF9DTURfSU5TVFIpICYmCj4gKwkJCShpbnN0ci0+Y3R4LmNtZC5vcGNv
ZGUgPT0gTkFORF9DTURfU1RBVFVTKSkKPiArCQkJY3RybC0+c3RhdHVzX2NtZCA9IDE7Cj4gKwkJ
ZWxzZSBpZiAoY3RybC0+c3RhdHVzX2NtZCAmJiAoaW5zdHItPnR5cGUgPT0gTkFORF9PUF9EQVRB
X0lOX0lOU1RSKSkgewo+ICsJCQkvKgo+ICsJCQkgKiBuZWVkIHRvIGZha2UgdGhlIG5hbmQgZGV2
aWNlIHdyaXRlIHByb3RlY3QgYmVjYXVzZSBuYW5kX2Jhc2UgZG9lcyBhCj4gKwkJCSAqIG5hbmRf
Y2hlY2tfd3Agd2hpY2ggY2FsbHMgbmFuZF9zdGF0dXNfb3AgTkFORF9DTURfU1RBVFVTIHdoaWNo
IGNoZWNrcwo+ICsJCQkgKiB0aGF0IHRoZSBuYW5kIGlzIG5vdCB3cml0ZSBwcm90ZWN0ZWQgYmVm
b3JlIGFuIG9wZXJhdGlvbiBzdGFydHMuCj4gKwkJCSAqIFRoZSBwcm9ibGVtIHdpdGggdGhpcyBp
cyBpdCdzIGRvbmUgb3V0c2lkZSBleGVjX29wIHNvIHRoZSBuYW5kIGlzCj4gKwkJCSAqIHdyaXRl
IHByb3RlY3RlZCBhbmQgdGhpcyBjaGVjayB3aWxsIGZhaWwgdW50aWwgdGhlIHdyaXRlIG9yIGVy
YXNlCj4gKwkJCSAqIG9yIHdyaXRlIGJhY2sgb3BlcmF0aW9uIGFjdHVhbGx5IGhhcHBlbnMgd2hl
cmUgd2UgdHVybiBvZmYgd3AuCj4gKwkJCSAqLwo+ICsJCQl1OCAqaW47Cj4gKwo+ICsJCQljdHJs
LT5zdGF0dXNfY21kID0gMDsKPiArCj4gKwkJCWluc3RyID0gJnN1Ym9wLT5pbnN0cnNbaV07Cj4g
KwkJCWluID0gaW5zdHItPmN0eC5kYXRhLmJ1Zi5pbjsKPiArCQkJaW5bMF0gPSBicmNtbmFuZF9z
dGF0dXMoaG9zdCkgfCBOQU5EX1NUQVRVU19XUDsgLyogaGlkZSBXUCBzdGF0dXMgKi8KCkkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgeW91IGFyZSBmYWtpbmcgdGhlIFdQIGJpdC4gSWYgaXQncyBzZXQs
CmJyY21uYW5kX3N0YXR1cygpIHNob3VsZCByZXR1cm4gaXQgYW5kIHlvdSBzaG91bGQgbm90IGNh
cmUgYWJvdXQgaXQuIElmCml0J3Mgbm90IGhvd2V2ZXIsIGNhbiB5b3UgcGxlYXNlIGdpdmUgbWUg
dGhlIHBhdGggdXNlZCB3aGVuIHdlIGhhdmUKdGhpcyBpc3N1ZT8gRWl0aGVyIHdlIG5lZWQgdG8g
bW9kaWZ5IHRoZSBjb3JlIG9yIHdlIG5lZWQgdG8gcHJvdmlkZQphZGRpdGlvbmFsIGhlbHBlcnMg
aW4gdGhpcyBkcml2ZXIgdG8gY2lyY3VtdmVudCB0aGUgZmF1bHR5IHBhdGguCgo+ICsJCX0gZWxz
ZSBpZiAoaW5zdHItPnR5cGUgPT0gTkFORF9PUF9XQUlUUkRZX0lOU1RSKSB7Cj4gKwkJCXJldCA9
IGJjbW5hbmRfY3RybF9wb2xsX3N0YXR1cyhob3N0LCBOQU5EX0NUUkxfUkRZLCBOQU5EX0NUUkxf
UkRZLCAwKTsKPiArCQkJaWYgKGN0cmwtPndwX2NtZCkgewo+ICsJCQkJY3RybC0+d3BfY21kID0g
MDsKPiArCQkJCWJyY21uYW5kX3dwKG10ZCwgMSk7CgpUaGlzIGlkZWFsbHkgc2hvdWxkIGRpc2Fw
cGVhci4KCj4gKwkJCX0KPiArCQl9IGVsc2UgeyAvKiBvdGhlcndpc2UgcGFzcyB0byBsb3cgbGV2
ZWwgaW1wbGVtZW50YXRpb24gKi8KPiArCQkJaWYgKChpbnN0ci0+dHlwZSA9PSBOQU5EX09QX0NN
RF9JTlNUUikgJiYKPiArCQkJCShpbnN0ci0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUkVT
RVQpKSB7Cj4gKwkJCQlicmNtbmFuZF9zdGF0dXMoaG9zdCk7Cj4gKwkJCQljdHJsLT5zdGF0dXNf
Y21kID0gMDsKPiArCQkJCWN0cmwtPndwX2NtZCA9IDA7Cj4gKwkJCQlicmNtbmFuZF93cChtdGQs
IDEpOwoKU2FtZQoKPiArCQkJfQo+ICsKPiArCQkJaWYgKChpbnN0ci0+dHlwZSA9PSBOQU5EX09Q
X0NNRF9JTlNUUikgJiYKPiArCQkJCSgoaW5zdHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01E
X0VSQVNFMSkgfHwKPiArCQkJCShpbnN0ci0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfU0VR
SU4pKSkgewo+ICsJCQkJYnJjbW5hbmRfd3AobXRkLCAwKTsKPiArCQkJCWN0cmwtPndwX2NtZCA9
IDE7CgpTYW1lCgo+ICsJCQl9Cj4gKwo+ICsJCQlyZXQgPSBicmNtbmFuZF9leGVjX2luc3RyKGhv
c3QsIGluc3RyLCBpID09IChzdWJvcC0+bmluc3RycyAtIDEpKTsKPiArCQl9Cj4gKwl9Cj4gKwo+
ICsJcmV0dXJuIHJldDsKPiArfQoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
