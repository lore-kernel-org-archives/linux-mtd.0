Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2B9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Message-ID:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhA7aSZeo7TwH0OTQ6SYrLU+pRkotDz5eamS/Axv4Cc=; b=jq/IBFeic+HMl/
	JaGxfIwwGU+IHnhLpe5TJuvk4PLAPo3FGW6aRU8XKK//zNfyWyyWjcH+p+/4sIJ+aYxmJg0ojYKr4
	clZe6wi++y5hJT1N/P0qmkjcENaG5NQRlSFjf2isZQL+LscDoGy2HzmlfAAmZ1B+HXldQnnqjC1xn
	Flu0j5F8LzP7nV3OqTWSra/7fIQMtWD4QqPGm7LwMBw+FWDFAsktEnqrUEorYsYEwn+gx2LrSvGBA
	kOKaHYidZPrSJ+7DbQjJ0GNftM+Gq5QrV2TJAv2Kn9jIa2kCwN68Wb+HeVfAvlfVx+xAUBa3cNjND
	x6D4aIERVnDnVZxU6DEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XGx-00C15T-D3; Wed, 29 Jun 2022 12:58:23 +0000
Received: from sender11-op-o11.zoho.eu ([31.186.226.225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XGb-00C0pA-4c
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 12:58:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1656507467; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=bPEkODpH1BrWoLzj49AsqL2wDhtErpYfYCEC3rk/571uPh9DsExjBAV1AJegaCEX7QFwx0l20Yx+jDDhsdFZpzzHNf6lm3vLghA8zmF9hbGqCBe/pgs0/GCjEV7588Cn3vr20lVy6F9zdl/IYfXFEYzXPV9cF8pYyCGqPR6L/Xk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1656507467; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dDOt+WPyVtaeSWilL0VTH0dNyV4Wzq9NV94huwKX8M4=; 
	b=duuSXOPTCtwfaDuXawVdRim6hRvNpAhu8caNpME3a14Xgl3crmcd4bVHJ4CgAsCh82nqV8oVio7rCH/EtMrNQnt5KKGRty8qO5GSU7NMmEOtmDOn60mHA+bYi5FpP6bc9m+06T7cajO4EYTAhmj8h7AoW9e96uwcmfhpXEaPG0U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=kempniu.pl;
	spf=pass  smtp.mailfrom=kernel@kempniu.pl;
	dmarc=pass header.from=<kernel@kempniu.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656507467;
	s=zmail; d=kempniu.pl; i=kernel@kempniu.pl;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dDOt+WPyVtaeSWilL0VTH0dNyV4Wzq9NV94huwKX8M4=;
	b=bqY3W2KZn3mLzgc5vPFx02+p91frXe4AxfU3RPvg5CsFacoKiwhv7J/zpdCW3DPo
	uv5w9O7UTIu6gkn6iHQdQr8B+HNQHZ1OJQ0QisWhIcef42Z7hf+0/wQw14UlklhvPqI
	cId4iVO5VqoKCwR7zt+vI6xmbLefvb3DJ4kzvUv4=
Received: from larwa.hq.kempniu.pl (212.180.138.61 [212.180.138.61]) by mx.zoho.eu
	with SMTPS id 1656507466084174.89340666810722; Wed, 29 Jun 2022 14:57:46 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID: <20220629125737.14418-2-kernel@kempniu.pl>
Subject: [PATCH v4 1/4] mtd: track maximum number of bitflips for each read request
Date: Wed, 29 Jun 2022 14:57:34 +0200
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629125737.14418-1-kernel@kempniu.pl>
References: <20220629125737.14418-1-kernel@kempniu.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055801_686317_2D880145 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

bXRkX3JlYWRfb29iKCkgY2FsbGVycyBhcmUgY3VycmVudGx5IG9ibGl2aW91cyB0byB0aGUgZGV0
YWlscyBvZiBFQ0MKZXJyb3JzIGRldGVjdGVkIGR1cmluZyB0aGUgcmVhZCBvcGVyYXRpb24gLSB0
aGV5IG9ubHkgbGVhcm4gKHRocm91Z2ggdGhlCnJldHVybiB2YWx1ZSkgd2hldGhlciBhbnkgY29y
cmVjdGVkIGJpdGZsaXBzIG9yIHVuY29ycmVjdGFibGUgZXJyb3JzCm9jY3VycmVkLiAgTW9yZSBk
ZXRhaWxlZCBFQ0MgaW5mb3JtYXRpb24gY2FuIGJlIHVzZWZ1bCB0byB1c2VyLXNwYWNlCmFwcGxp
Y2F0aW9ucyBmb3IgbWFraW5nIGJldHRlci1pbmZvcm1lZCBjaG9pY2VzIGFib3V0IG1vdmluZyBk
YXRhCmFyb3VuZC4KCkV4dGVuZCBzdHJ1Y3QgbXRkX29vYl9vcHMgd2l0aCBhIHBvaW50ZXIgdG8g
YSBuZXdseS1pbnRyb2R1Y2VkIHN0cnVjdAptdGRfcmVxX3N0YXRzIGFuZCBzZXQgaXRzICdtYXhf
Yml0ZmxpcHMnIGZpZWxkIHRvIHRoZSBtYXhpbXVtIG51bWJlciBvZgpiaXRmbGlwcyBmb3VuZCBp
biBhIHNpbmdsZSBFQ0Mgc3RlcCBkdXJpbmcgdGhlIHJlYWQgb3BlcmF0aW9uIHBlcmZvcm1lZApi
eSBtdGRfcmVhZF9vb2IoKS4gIFRoaXMgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIHVsdGltYXRlbHkg
cGFzc2luZyB0aGF0CnZhbHVlIGJhY2sgdG8gdXNlciBzcGFjZS4KClN1Z2dlc3RlZC1ieTogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1i
eTogTWljaGHFgiBLxJlwaWXFhCA8a2VybmVsQGtlbXBuaXUucGw+Ci0tLQogZHJpdmVycy9tdGQv
bXRkY29yZS5jICAgfCA1ICsrKysrCiBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCB8IDUgKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwppbmRleCA2ZmFmZWE4MGZkOTgu
LjgwYzk4ZTU0NmQ3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYwpAQCAtMTYyMiw2ICsxNjIyLDkgQEAgaW50IG10ZF9yZWFkX29v
YihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHN0cnVjdCBtdGRfb29iX29wcyAq
b3BzKQogCWlmICghbWFzdGVyLT5fcmVhZF9vb2IgJiYgKCFtYXN0ZXItPl9yZWFkIHx8IG9wcy0+
b29iYnVmKSkKIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCisJaWYgKG9wcy0+c3RhdHMpCisJCW1l
bXNldChvcHMtPnN0YXRzLCAwLCBzaXplb2YoKm9wcy0+c3RhdHMpKTsKKwogCWlmIChtdGQtPmZs
YWdzICYgTVREX1NMQ19PTl9NTENfRU1VTEFUSU9OKQogCQlyZXRfY29kZSA9IG10ZF9pb19lbXVs
YXRlZF9zbGMobXRkLCBmcm9tLCB0cnVlLCBvcHMpOwogCWVsc2UKQEAgLTE2MzksNiArMTY0Miw4
IEBAIGludCBtdGRfcmVhZF9vb2Ioc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBz
dHJ1Y3QgbXRkX29vYl9vcHMgKm9wcykKIAkJcmV0dXJuIHJldF9jb2RlOwogCWlmIChtdGQtPmVj
Y19zdHJlbmd0aCA9PSAwKQogCQlyZXR1cm4gMDsJLyogZGV2aWNlIGxhY2tzIGVjYyAqLworCWlm
IChvcHMtPnN0YXRzKQorCQlvcHMtPnN0YXRzLT5tYXhfYml0ZmxpcHMgPSByZXRfY29kZTsKIAly
ZXR1cm4gcmV0X2NvZGUgPj0gbXRkLT5iaXRmbGlwX3RocmVzaG9sZCA/IC1FVUNMRUFOIDogMDsK
IH0KIEVYUE9SVF9TWU1CT0xfR1BMKG10ZF9yZWFkX29vYik7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L210ZC9tdGQuaCBiL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCmluZGV4IDk1NWFlZTE0
YjBmNy4uZmNjYWQxNzY2NDU4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAor
KysgYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaApAQCAtNDAsNiArNDAsMTAgQEAgc3RydWN0IG10
ZF9lcmFzZV9yZWdpb25faW5mbyB7CiAJdW5zaWduZWQgbG9uZyAqbG9ja21hcDsJCS8qIElmIGtl
ZXBpbmcgYml0bWFwIG9mIGxvY2tzICovCiB9OwogCitzdHJ1Y3QgbXRkX3JlcV9zdGF0cyB7CisJ
dW5zaWduZWQgaW50IG1heF9iaXRmbGlwczsKK307CisKIC8qKgogICogc3RydWN0IG10ZF9vb2Jf
b3BzIC0gb29iIG9wZXJhdGlvbiBvcGVyYW5kcwogICogQG1vZGU6CW9wZXJhdGlvbiBtb2RlCkBA
IC03MCw2ICs3NCw3IEBAIHN0cnVjdCBtdGRfb29iX29wcyB7CiAJdWludDMyX3QJb29ib2ZmczsK
IAl1aW50OF90CQkqZGF0YnVmOwogCXVpbnQ4X3QJCSpvb2JidWY7CisJc3RydWN0IG10ZF9yZXFf
c3RhdHMgKnN0YXRzOwogfTsKIAogLyoqCi0tIAoyLjM3LjAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
