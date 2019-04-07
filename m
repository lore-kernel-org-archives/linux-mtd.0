Return-Path: <SRS0=KvES=SJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213E1C10F0E
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2019 19:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E406820896
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2019 19:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kS1NLL/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E406820896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Ggf2xPQpLjYDhPOosSWPh5Jaqu/24021Xh0Qcx//mg=; b=kS1NLL/KXjCfYE
	ytQ8WwlpVZpD6JIt0q5bVRs1W0JzuIreAB9CLb52a0s+ieI9QeVl1tMaHSNX16XSRuCGDM0uDrDxk
	QWMuXDGxxOTP3j0yKsPwVa3VvXlacqe9uvjHdtP7lr1m8EYaAXvLeZCP0yz7lFjQ5pqIcHNslMcqd
	kBnEzST56drYMq6XcTk/+v+Nzim/npkMUggP6+yJmOGCi22m3hu1MXGh0A6eTJXTuPLrtwlzLJq2H
	+8v0Ml/9lTUnS5g4kc/1VhntgNKmUroFAYvH1MzFwejxUI1QeQU3uWhzoflzQOlRDBZidP+kvdd/Y
	RO5AHLN0pA8fERr64NNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDDYc-0000dF-2M; Sun, 07 Apr 2019 19:34:22 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDDYY-0000cu-Fj
 for linux-mtd@lists.infradead.org; Sun, 07 Apr 2019 19:34:20 +0000
X-Originating-IP: 81.185.160.65
Received: from localhost.localdomain (65.160.185.81.rev.sfr.net
 [81.185.160.65]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C6C21FF803;
 Sun,  7 Apr 2019 19:34:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: marvell: Ensure the ND_RUN bit is reset
Date: Sun,  7 Apr 2019 21:34:01 +0200
Message-Id: <20190407193401.7983-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_123418_673471_132A0A54 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: stable@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2luY2UgdGhlIG1pZ3JhdGlvbiBvZiB0aGUgZHJpdmVyIHRvIHN0b3AgdXNpbmcgdGhlIGxlZ2Fj
eQotPnNlbGVjdF9jaGlwKCkgaG9vaywgdGhlcmUgaXMgbm90aGluZyBkZXNlbGVjdGluZyB0aGUg
dGFyZ2V0IGFueW1vcmUsCnRodXMgdGhlIHNlbGVjdGlvbiBpcyBub3QgZm9yY2VkIGF0IHRoZSBu
ZXh0IGFjY2Vzcy4gRW5zdXJlIHRoZSBORF9SVU4KYml0IGlzIGFsd2F5cyBpbiBhIGNsZWFuIHN0
YXRlLgoKQ2M6IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKRml4ZXM6IGIyNTI1MTQxNGY2ZTAwICgibXRkOiByYXduYW5kOiBtYXJ2ZWxs
OiBTdG9wIGltcGxlbWVudGluZyAtPnNlbGVjdF9jaGlwKCkiKQpTdWdnZXN0ZWQtYnk6IEJvcmlz
IEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQoKSGkgRGFuaWVs
LCBjb3VsZCB5b3UgcGxlYXNlIHRlc3QgdGhpcyB2ZXJzaW9uIG9mIHRoZSBmaXg/CgpUaGFua3Ms
Ck1pcXXDqGwKCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCAxMiArKysr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwppbmRleCBmMzhlNWMxYjg3ZTQuLmE3ZDdm
MTdkODY4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMK
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKQEAgLTcyMiwxMiArNzIy
LDYgQEAgc3RhdGljIHZvaWQgbWFydmVsbF9uZmNfc2VsZWN0X3RhcmdldChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLAogCXN0cnVjdCBtYXJ2ZWxsX25mYyAqbmZjID0gdG9fbWFydmVsbF9uZmMoY2hp
cC0+Y29udHJvbGxlcik7CiAJdTMyIG5kY3JfZ2VuZXJpYzsKIAotCWlmIChjaGlwID09IG5mYy0+
c2VsZWN0ZWRfY2hpcCAmJiBkaWVfbnIgPT0gbWFydmVsbF9uYW5kLT5zZWxlY3RlZF9kaWUpCi0J
CXJldHVybjsKLQotCXdyaXRlbF9yZWxheGVkKG1hcnZlbGxfbmFuZC0+bmR0cjAsIG5mYy0+cmVn
cyArIE5EVFIwKTsKLQl3cml0ZWxfcmVsYXhlZChtYXJ2ZWxsX25hbmQtPm5kdHIxLCBuZmMtPnJl
Z3MgKyBORFRSMSk7Ci0KIAkvKgogCSAqIFJlc2V0IHRoZSBORENSIHJlZ2lzdGVyIHRvIGEgY2xl
YW4gc3RhdGUgZm9yIHRoaXMgcGFydGljdWxhciBjaGlwLAogCSAqIGFsc28gY2xlYXIgTkRfUlVO
IGJpdC4KQEAgLTczNiw2ICs3MzAsMTIgQEAgc3RhdGljIHZvaWQgbWFydmVsbF9uZmNfc2VsZWN0
X3RhcmdldChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogCQkgICAgICAgTkRDUl9HRU5FUklDX0ZJ
RUxEU19NQVNLICYgfk5EQ1JfTkRfUlVOOwogCXdyaXRlbF9yZWxheGVkKG5kY3JfZ2VuZXJpYyB8
IG1hcnZlbGxfbmFuZC0+bmRjciwgbmZjLT5yZWdzICsgTkRDUik7CiAKKwlpZiAoY2hpcCA9PSBu
ZmMtPnNlbGVjdGVkX2NoaXAgJiYgZGllX25yID09IG1hcnZlbGxfbmFuZC0+c2VsZWN0ZWRfZGll
KQorCQlyZXR1cm47CisKKwl3cml0ZWxfcmVsYXhlZChtYXJ2ZWxsX25hbmQtPm5kdHIwLCBuZmMt
PnJlZ3MgKyBORFRSMCk7CisJd3JpdGVsX3JlbGF4ZWQobWFydmVsbF9uYW5kLT5uZHRyMSwgbmZj
LT5yZWdzICsgTkRUUjEpOworCiAJLyogQWxzbyByZXNldCB0aGUgaW50ZXJydXB0IHN0YXR1cyBy
ZWdpc3RlciAqLwogCW1hcnZlbGxfbmZjX2NsZWFyX2ludChuZmMsIE5EQ1JfQUxMX0lOVCk7CiAK
LS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
