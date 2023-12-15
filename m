Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C13C41535
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3q+X0bGml2wTWgovXY/H3U1jkVg7CjKBbWLkh6pJuhc=; b=VSH330yIECmf6L
	+hlvpA3FVFX3EChLJUICxXkcr0mxa5oUJVO09miRdbYO7x6EjAGM9KPs/63kx250XIxqb0lFxjQxz
	gNDCvzxdpKfCKnNEUgBvBAVSVU6D9fWTmf75zik9RDyvi2GBZIembFZWuWBndAqiTBfWnd/79HIVc
	PBOWbY9x//Dzt0NFXv3JNHzG4Z8zejhQvuXh1E5jkBspEblcrn+TxSGV2NouaIkaquDBpVy625NgG
	wMVflpDbcs+Zf3L8/BnHej0hMdYDFTY7FQ/i9T68WVBJuOlS4I7pKzeQdmH50X6lp7igO6njOj7/O
	Z2xKF7fN7jPD8gi8hUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Mb-003Eop-2h;
	Fri, 15 Dec 2023 12:32:21 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7MY-003EmL-38
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:32:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2544F1BF20C;
	Fri, 15 Dec 2023 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702643536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4wAJjOtMwRJpleuVu6zvruceyKn7/iAuSicntgwqL4=;
	b=SozWTb0zPOyITokCNrYUhEqkuAOWhyRd8yoa9k+bdyShhtziyY6q3Y++LT6RJazuDtc4SW
	/1unSj7r6mTQl1qxq/EApqiRS9r/WqCy2DpWmUWXOlZxXuigwIK0NjaiuI1SOAiGGCpw+I
	dQP2Zfn59eTs8JLb99GV1s+6lw+9/DUPiGVlpJkA2JnIGDslkV1kCIgtk+RGC2ZTJ+JnXW
	Wkgugdd+ZNhgp6tDdBnc/5qgi05S095bP1WjMAT/wvPck8XwkWbzZJbTKgA1vOhM6jwnqX
	O4CQTkAlqXPJAZtnRKnaLC6OjvoCLT9qtoAs5zQjpmiIBChDSfTMBsxqpMaFUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] mtd: rawnand: Fix core interference with sequential reads
Date: Fri, 15 Dec 2023 13:32:06 +0100
Message-Id: <20231215123208.516590-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-1-miquel.raynal@bootlin.com>
References: <20231215123208.516590-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_043219_305308_E691FBD9 
X-CRM114-Status: GOOD (  14.84  )
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

QSBjb3VwbGUgb2YgcmVwb3J0cyBwb2ludGVkIGF0IHNvbWUgc3RyYW5nZSBmYWlsdXJlcyBoYXBw
ZW5pbmcgYSBiaXQKcmFuZG9tbHkgc2luY2UgdGhlIGludHJvZHVjdGlvbiBvZiBzZXF1ZW50aWFs
IHBhZ2UgcmVhZHMgc3VwcG9ydC4gQWZ0ZXIKaW52ZXN0aWdhdGlvbiBpdCB0dXJuZWQgb3V0IHRo
ZSBtb3N0IGxpa2VseSByZWFzb24gZm9yIHRoZXNlIGlzc3VlcyB3YXMKdGhlIGZhY3QgdGhhdCBz
b21ldGltZXMgYSAobG9uZ2VyKSByZWFkIG1pZ2h0IGhhcHBlbiwgc3RhcnRpbmcgYXQgdGhlCnNh
bWUgcGFnZSB0aGF0IHdhcyByZWFkIHByZXZpb3VzbHkuIFRoaXMgaXMgb3B0aW1pemVkIGJ5IHRo
ZSByYXcgTkFORApjb3JlLCBieSBub3Qgc2VuZGluZyB0aGUgUkVBRF9QQUdFIGNvbW1hbmQgdG8g
dGhlIE5BTkQgZGV2aWNlIGFuZCBqdXN0CnJlYWRpbmcgb3V0IHRoZSBkYXRhIGluIGEgbG9jYWwg
Y2FjaGUuIFdoZW4gdGhpcyBwYWdlIGlzIGFsc28gZmxhZ2dlZCBhcwpiZWluZyB0aGUgc3RhcnRp
bmcgcG9pbnQgZm9yIGEgc2VxdWVudGlhbCByZWFkLCBpdCBtZWFucyB0aGUgcGFnZSByaWdodApu
ZXh0IHdpbGwgYmUgYWNjZXNzZWQgd2l0aG91dCB0aGUgcmlnaHQgaW5zdHJ1Y3Rpb25zLiBUaGUg
TkFORCBjaGlwIHdpbGwKYmUgY29uZnVzZWQgYW5kIHdpbGwgbm90IG91dHB1dCBjb3JyZWN0IGRh
dGEuIEluIG9yZGVyIHRvIGF2b2lkIHN1Y2gKc2l0dWF0aW9uIGZyb20gaGFwcGVuaW5nIGFueW1v
cmUsIHdlIGNhbiBob3dldmVyIGhhbmRsZSB0aGlzIGNhc2Ugd2l0aCBhCmJpdCBvZiBhZGRpdGlv
bmFsIGxvZ2ljLCB0byBwb3N0cG9uZSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHJlYWQKc2Vx
dWVuY2UgYnkgb25lIHBhZ2UuCgpSZXBvcnRlZC1ieTogQWxleGFuZGVyIFNoaXlhbiA8ZWFnbGUu
YWxleGFuZGVyOTIzQGdtYWlsLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1tdGQvQ0FQMXROdlM9TlZBbS12ZnZZV2JjM2s5Q3g5WXhNYzJ1WlprbVhrOGgxTmhHWDg3
N1pnQG1haWwuZ21haWwuY29tLwpSZXBvcnRlZC1ieTogTcOlbnMgUnVsbGfDpXJkIDxtYW5zQG1h
bnNyLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQveXcxeGZz
Nmo0azZxLmZzZkBtYW5zci5jb20vClJlcG9ydGVkLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRk
LzlkMGM0MmZjZGU3OWJmZWRmZTViMDVkNmE0ZTlmZGVmNzFkM2RkNTIuY2FtZWxAZ2Vhbml4LmNv
bS8KRml4ZXM6IDAwM2ZlNGI5NTQ1YiAoIm10ZDogcmF3bmFuZDogU3VwcG9ydCBmb3Igc2VxdWVu
dGlhbCBjYWNoZSByZWFkcyIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCmluZGV4IDA0
ZTgwYWNlNDE4Mi4uMWIwYTk4NGQxODFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwpAQCAt
MzQ3OCw2ICszNDc4LDE4IEBAIHN0YXRpYyB2b2lkIHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHMo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IHBhZ2UsCiAJcmF3bmFuZF9jYXBf
Y29udF9yZWFkcyhjaGlwKTsKIH0KIAorc3RhdGljIHZvaWQgcmF3bmFuZF9jb250X3JlYWRfc2tp
cF9maXJzdF9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBwYWdlKQor
eworCWlmICghY2hpcC0+Y29udF9yZWFkLm9uZ29pbmcgfHwgcGFnZSAhPSBjaGlwLT5jb250X3Jl
YWQuZmlyc3RfcGFnZSkKKwkJcmV0dXJuOworCisJY2hpcC0+Y29udF9yZWFkLmZpcnN0X3BhZ2Ur
KzsKKwlpZiAoY2hpcC0+Y29udF9yZWFkLmZpcnN0X3BhZ2UgPT0gY2hpcC0+Y29udF9yZWFkLnBh
dXNlX3BhZ2UpCisJCWNoaXAtPmNvbnRfcmVhZC5maXJzdF9wYWdlKys7CisJaWYgKGNoaXAtPmNv
bnRfcmVhZC5maXJzdF9wYWdlID49IGNoaXAtPmNvbnRfcmVhZC5sYXN0X3BhZ2UpCisJCWNoaXAt
PmNvbnRfcmVhZC5vbmdvaW5nID0gZmFsc2U7Cit9CisKIC8qKgogICogbmFuZF9zZXR1cF9yZWFk
X3JldHJ5IC0gW0lOVEVSTl0gU2V0IHRoZSBSRUFEIFJFVFJZIG1vZGUKICAqIEBjaGlwOiBOQU5E
IGNoaXAgb2JqZWN0CkBAIC0zNjUyLDYgKzM2NjQsOCBAQCBzdGF0aWMgaW50IG5hbmRfZG9fcmVh
ZF9vcHMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IGZyb20sCiAJCQlidWYgKz0gYnl0
ZXM7CiAJCQltYXhfYml0ZmxpcHMgPSBtYXhfdCh1bnNpZ25lZCBpbnQsIG1heF9iaXRmbGlwcywK
IAkJCQkJICAgICBjaGlwLT5wYWdlY2FjaGUuYml0ZmxpcHMpOworCisJCQlyYXduYW5kX2NvbnRf
cmVhZF9za2lwX2ZpcnN0X3BhZ2UoY2hpcCwgcGFnZSk7CiAJCX0KIAogCQlyZWFkbGVuIC09IGJ5
dGVzOwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
