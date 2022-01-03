Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B59C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jj3Xu+DA4FcG7GGTt1gS7KKQ1E3TyRoPkySejB34tc=; b=F087R/ZPs0bAkn
	9fWZVYfbZ8TWH1MU2HDd2rsuSeiU8OiClHCj+PCV0Er3CBDg9U24C1PVFBwyXVqzM4smT08Os1zOq
	F4AxxZILjJ0PJVi4xskWO1T1L6JG2Pc7lw16FB2Y3T7Bi9LE8bjZrtZR4j2s5wy2icTGO2n5IsAKm
	b6HZ0K69NQ99hEgs0K7v+i51jI+z44Nb3KV9Zlf74RhkAyFQFaVo0zOozDCyetHhPSrBiMTV6Zf2y
	zXI5w91XmO0KUVlq66Lh3COXnZgHMgf8iIt0gk4tqBxa5wZgRSCO+Tru3bpP/aMSHN4NZ7B0HViPw
	tjGe5IVO8pYsA1/es2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PhJ-009Q0e-6i; Mon, 03 Jan 2022 15:56:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PhD-009Pzl-LI
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 15:56:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B4AF9240004;
 Mon,  3 Jan 2022 15:56:21 +0000 (UTC)
Date: Mon, 3 Jan 2022 16:56:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: kyungmin.park@samsung.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: onenand: Check for error irq
Message-ID: <20220103165620.2eadfc4c@xps13>
In-Reply-To: <20211224022321.1470969-1-jiasheng@iscas.ac.cn>
References: <20211224022321.1470969-1-jiasheng@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_075627_854032_E6D5AFDC 
X-CRM114-Status: GOOD (  17.38  )
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

SGkgSmlhc2hlbmcsCgpqaWFzaGVuZ0Bpc2Nhcy5hYy5jbiB3cm90ZSBvbiBGcmksIDI0IERlYyAy
MDIxIDEwOjIzOjIxICswODAwOgoKPiBGb3IgdGhlIHBvc3NpYmxlIGZhaWx1cmUgb2YgdGhlIHBs
YXRmb3JtX2dldF9pcnEoKSwgdGhlIHJldHVybmVkIGlycQo+IGNvdWxkIGJlIGVycm9yIG51bWJl
ciBhbmQgd2lsbCBmaW5hbGx5IGNhdXNlIHRoZSBmYWlsdXJlIG9mIHRoZQo+IHJlcXVlc3RfaXJx
KCkuCj4gQ29uc2lkZXIgdGhhdCBwbGF0Zm9ybV9nZXRfaXJxKCkgY2FuIG5vdyBpbiBjZXJ0YWlu
IGNhc2VzIHJldHVybgo+IC1FUFJPQkVfREVGRVIsIGFuZCB0aGUgY29uc2VxdWVuY2VzIG9mIGxl
dHRpbmcgcmVxdWVzdF9pcnEoKSBlZmZlY3RpdmVseQo+IGNvbnZlcnQgdGhhdCBpbnRvIC1FSU5W
QUwsIGV2ZW4gYXQgcHJvYmUgdGltZSByYXRoZXIgdGhhbiBsYXRlciBvbi4KPiBTbyBpdCBtaWdo
dCBiZSBiZXR0ZXIgdG8gY2hlY2sganVzdCBub3cuCj4gCj4gRml4ZXM6IDI2Nzc3ZDM3MjE2YyAo
Im10ZDogTW92ZSBvbmVuYW5kIGNvZGUgYmFzZSB0byBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQi
KQoKVGhpcyBpcyBub3QgdGhlIHJvb3QgY2F1c2UuCgo+IFNpZ25lZC1vZmYtYnk6IEppYXNoZW5n
IEppYW5nIDxqaWFzaGVuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9v
bmVuYW5kL2dlbmVyaWMuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
b25lbmFuZC9nZW5lcmljLmMgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvZ2VuZXJpYy5jCj4g
aW5kZXggOGI2ZjRkYTVkNzIwLi5hNGI4YjY1ZmUxNWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9vbmVuYW5kL2dlbmVyaWMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFu
ZC9nZW5lcmljLmMKPiBAQCAtNTMsNyArNTMsMTIgQEAgc3RhdGljIGludCBnZW5lcmljX29uZW5h
bmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCX0KPiAgCj4gIAlpbmZv
LT5vbmVuYW5kLm1tY29udHJvbCA9IHBkYXRhID8gcGRhdGEtPm1tY29udHJvbCA6IE5VTEw7Cj4g
LQlpbmZvLT5vbmVuYW5kLmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gKwo+ICsJ
ZXJyID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiArCWlmIChlcnIgPCAwKQo+ICsJCWdv
dG8gb3V0X2lvdW5tYXA7Cj4gKwo+ICsJaW5mby0+b25lbmFuZC5pcnEgPSBlcnI7Cj4gIAo+ICAJ
aW5mby0+bXRkLmRldi5wYXJlbnQgPSAmcGRldi0+ZGV2Owo+ICAJaW5mby0+bXRkLnByaXYgPSAm
aW5mby0+b25lbmFuZDsKCk90aGVyd2lzZSBsb29rcyBmaW5lLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
