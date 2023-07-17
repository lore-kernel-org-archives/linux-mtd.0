Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E877EEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z3V48YvKCataN/GErriaTwQdcJKX/s7KHbVu91xEQdc=; b=4vwnMeNTythkkw
	RjlSVZCiwZdiX6oGc9VGtA244/tq3mV/z8C7AX0zlbNKR1YVsI4mMgrHlxFCACktMRw560V0Y7eJl
	cZcfxTKh3TUKKa4ntJx8O5ClJaPlEWRDEzfg7XMWzESAgfRvelg1CPw5LmCDKEruq3WVqu6UDvd0v
	Dk2dmaKNuhMwaIociIqoNPir6lDf5kaNfTJ1i0cg1eB4IT+GgqO8lzbSlngCc6coErnNNAXkfWfF9
	Ft9raKNGE6Gi5yY0nChSIiOFDWg7iOtbQC2kHhqjZrDLA418rjfKAs7Ar2US2MTSIAQ9XQEcL/MJY
	+vyYMmLe3jQt/Yr2mp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0D9-005UUP-01;
	Wed, 19 Jul 2023 05:58:55 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0D2-005UOy-2U
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RW03N0S/bEhxMDlvc7ZnHFSbKTSNbVdEvn4DEIHdDvw=; b=gwgZ2+RKk8pmh3+5yV73ipA4Vi
	qL7dbPwVMj3ijP/TzC2HZquyD3WdQU4jl6UjlG+IVhyJJkDQJ+ASD24ggtMJv/BlvUxDOBD9paveZ
	rxabMY42g+xYcGEDnujuOiDFpslO1QXn/87OxBidbn/S0ENWYzWi4kustjvragi1o7x66b9um+GdG
	rLaGlGrjGJJHtsXEp+Ub8MNf8oio+qCm9N4ndDR0xiASzn3m9L4kE2WkkjLnpRZu2qr2AaKR2xkOf
	E7zasyiaNz0BCzDKTi4TFm64480uJh9bMi1P8bGJB+sM7Wi1hjyFpG6AjyfHmwoBJR1j2RNuaNviw
	JK9bLXEw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU7i-009FWp-09
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 19:43:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE27E1BF204;
	Mon, 17 Jul 2023 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689622946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RW03N0S/bEhxMDlvc7ZnHFSbKTSNbVdEvn4DEIHdDvw=;
	b=S3cq2YVGjPjyLO/zN1cJlZ/PGK5hAMYIFnMJ1pD5D/T2hlneLXaOKNuMcrvbAh78yqYs5Y
	BNSL6M0l1tI5SMJ2x47bdO4igVcWXKwSBpX0mWBAyiUP7bp74JFn/8/ymfLzdCxQotxk5b
	Way8MBFUx7Z8hv5ekT2cGMpRDA+nMPgBvQvV7J/kVOKErlJOJY834hrNXFJJbq0Id+GYjF
	6OBFrKMQex+TrPF+drrhJ81hQ2nfNhFGSXZ1WcsZKKncr3/KGcDbhsN79oUudj/dDayntN
	FVfigHBnxSfDxF6JvA86GDLjcs8+nG7GJ1v5vRYp/E0JpWvpflTE4vJI8uME6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org,
	Aviram Dali <aviramd@marvell.com>
Subject: [PATCH 1/3] mtd: rawnand: marvell: Ensure program page operations are successful
Date: Mon, 17 Jul 2023 21:42:19 +0200
Message-Id: <20230717194221.229778-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_204310_572732_EBD19F91 
X-CRM114-Status: GOOD (  15.27  )
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

VGhlIE5BTkQgY29yZSBjb21wbGllcyB3aXRoIHRoZSBPTkZJIHNwZWNpZmljYXRpb24sIHdoaWNo
IGl0c2VsZgptZW50aW9ucyB0aGF0IGFmdGVyIGFueSBwcm9ncmFtIG9yIGVyYXNlIG9wZXJhdGlv
biwgYSBzdGF0dXMgY2hlY2sKc2hvdWxkIGJlIHBlcmZvcm1lZCB0byBzZWUgd2hldGhlciB0aGUg
b3BlcmF0aW9uIHdhcyBmaW5pc2hlZCAqYW5kKgpzdWNjZXNzZnVsLgoKVGhlIE5BTkQgY29yZSBv
ZmZlcnMgaGVscGVycyB0byBmaW5pc2ggYSBwYWdlIHdyaXRlIChzZW5kaW5nIHRoZQoiUEFHRSBQ
Uk9HIiBjb21tYW5kLCB3YWl0aW5nIGZvciB0aGUgTkFORCBjaGlwIHRvIGJlIHJlYWR5IGFnYWlu
LCBhbmQKY2hlY2tpbmcgdGhlIG9wZXJhdGlvbiBzdGF0dXMpLiBCdXQgaW4gc29tZSBjYXNlcywg
YWR2YW5jZWQgY29udHJvbGxlcgpkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gb3B0aW1pemUgdGhpcyBh
bmQgY3JhZnQgdGhlaXIgb3duIHBhZ2Ugd3JpdGUKaGVscGVyIHRvIGxldmVyYWdlIGFkZGl0aW9u
YWwgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLCB0aHVzIG5vdCBhbHdheXMKdXNpbmcgdGhlIGNvcmUg
ZmFjaWxpdGllcy4KClNvbWUgZHJpdmVycywgbGlrZSB0aGlzIG9uZSwgZG8gbm90IHVzZSB0aGUg
Y29yZSBoZWxwZXIgdG8gZmluaXNoIGEgcGFnZQp3cml0ZSBiZWNhdXNlIHRoZSBmaW5hbCBjeWNs
ZXMgYXJlIGF1dG9tYXRpY2FsbHkgbWFuYWdlZCBieSB0aGUKaGFyZHdhcmUuIEluIHRoaXMgY2Fz
ZSwgdGhlIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlIHRha2VuIHRvIG1hbnVhbGx5CnBlcmZvcm0g
dGhlIGZpbmFsIHN0YXR1cyBjaGVjay4KCkxldCdzIHJlYWQgdGhlIE5BTkQgY2hpcCBzdGF0dXMg
YXQgdGhlIGVuZCBvZiB0aGUgcGFnZSB3cml0ZSBoZWxwZXIgYW5kCnJldHVybiAtRUlPIHVwb24g
ZXJyb3IuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogMDJmMjZlY2Y4Yzc3ICgi
bXRkOiBuYW5kOiBhZGQgcmV3b3JrZWQgTWFydmVsbCBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIikK
UmVwb3J0ZWQtYnk6IEF2aXJhbSBEYWxpIDxhdmlyYW1kQG1hcnZlbGwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKLS0tCgpIZWxs
byBBdmlyYW0sCgpJIGhhdmUgbm90IHRlc3RlZCB0aGlzLCBidXQgYmFzZWQgb24geW91ciByZXBv
cnQgSSBiZWxpZXZlIHRoZSBzdGF0dXMKY2hlY2sgaXMgaW5kZWVkIG1pc3NpbmcgaGVyZSBhbmQg
Y291bGQgc29tZXRpbWVzIGxlYWQgdG8gdW5ub3RpY2VkCnBhcnRpYWwgd3JpdGVzLgoKUGxlYXNl
IHRlc3Qgb24geW91ciBzaWRlIGFuZCByZXBseSB3aXRoIHlvdXIgVGVzdGVkLWJ5IGlmIHlvdSB2
YWxpZGF0ZQp0aGUgY2hhbmdlLgoKQW55IGJhY2twb3J0IG9uIGtlcm5lbHMgcHJlZGF0aW5nIHY0
LjE3IHdpbGwgbGlrZWx5IGZhaWwgYmVjYXVzZSBvZiBhCmZvbGRlciByZW5hbWUsIHNvIHlvdSB3
aWxsIGhhdmUgdG8gZG8gdGhlIGJhY2twb3J0IG1hbnVhbGx5IGlmIG5lZWRlZC4KClRoYW5rcywK
TWlxdcOobAotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9u
YW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwppbmRleCAzMGMxNWU0
ZTFjYzAuLjU3NjQ0MTA5NTAxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFy
dmVsbF9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKQEAg
LTExNjIsNiArMTE2Miw3IEBAIHN0YXRpYyBpbnQgbWFydmVsbF9uZmNfaHdfZWNjX2htZ19kb193
cml0ZV9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAJCS5uZGNiWzJdID0gTkRDQjJfQURE
UjVfUEFHRShwYWdlKSwKIAl9OwogCXVuc2lnbmVkIGludCBvb2JfYnl0ZXMgPSBsdC0+c3BhcmVf
Ynl0ZXMgKyAocmF3ID8gbHQtPmVjY19ieXRlcyA6IDApOworCXU4IHN0YXR1czsKIAlpbnQgcmV0
OwogCiAJLyogTkZDdjIgbmVlZHMgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgb3BlcmF0aW9u
IGJlaW5nIGV4ZWN1dGVkICovCkBAIC0xMTk1LDcgKzExOTYsMTggQEAgc3RhdGljIGludCBtYXJ2
ZWxsX25mY19od19lY2NfaG1nX2RvX3dyaXRlX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
IAogCXJldCA9IG1hcnZlbGxfbmZjX3dhaXRfb3AoY2hpcCwKIAkJCQkgIFBTRUNfVE9fTVNFQyhz
ZHItPnRQUk9HX21heCkpOwotCXJldHVybiByZXQ7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsK
KworCS8qIENoZWNrIHdyaXRlIHN0YXR1cyBvbiB0aGUgY2hpcCBzaWRlICovCisJcmV0ID0gbmFu
ZF9zdGF0dXNfb3AoY2hpcCwgJnN0YXR1cyk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwor
CWlmIChzdGF0dXMgJiBOQU5EX1NUQVRVU19GQUlMKQorCQlyZXR1cm4gLUVJTzsKKworCXJldHVy
biAwOwogfQogCiBzdGF0aWMgaW50IG1hcnZlbGxfbmZjX2h3X2VjY19obWdfd3JpdGVfcGFnZV9y
YXcoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKQEAgLTE2MjQsNiArMTYzNiw3IEBAIHN0YXRpYyBp
bnQgbWFydmVsbF9uZmNfaHdfZWNjX2JjaF93cml0ZV9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsCiAJaW50IGRhdGFfbGVuID0gbHQtPmRhdGFfYnl0ZXM7CiAJaW50IHNwYXJlX2xlbiA9IGx0
LT5zcGFyZV9ieXRlczsKIAlpbnQgY2h1bmssIHJldDsKKwl1OCBzdGF0dXM7CiAKIAltYXJ2ZWxs
X25mY19zZWxlY3RfdGFyZ2V0KGNoaXAsIGNoaXAtPmN1cl9jcyk7CiAKQEAgLTE2NjAsNiArMTY3
MywxNCBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmZjX2h3X2VjY19iY2hfd3JpdGVfcGFnZShzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwkvKiBDaGVj
ayB3cml0ZSBzdGF0dXMgb24gdGhlIGNoaXAgc2lkZSAqLworCXJldCA9IG5hbmRfc3RhdHVzX29w
KGNoaXAsICZzdGF0dXMpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlpZiAoc3RhdHVz
ICYgTkFORF9TVEFUVVNfRkFJTCkKKwkJcmV0dXJuIC1FSU87CisKIAlyZXR1cm4gMDsKIH0KIAot
LSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
