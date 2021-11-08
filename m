Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88370C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408416120D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 408416120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mk7L5UZbD64LF5zUstxmcXbDy6Ke6T+yclOUf0sjvmA=; b=Da1t3UwRm5sJV7
	aBuxaT7q8PjS2y356rwwpYqdIWY3w9kFeF2KhTis6zh/dkTsKMdJR+Mohrs85B7kZcQlPcf2n3/sm
	+uK8L7dzuvaiyqDbqqIfjlEbYO4mZQ117ogtIExBwC86+g64xFv7VnOaGwHoAERwywkWaNSZb/ajJ
	WK+bTfivj4dnxp7DYFknliDDylgNVORitKgNeQL+KTVRJ+DbB08HJjCOIBv8ukO2PRrWLbsYC5P9J
	lQj2X+6HT66jXYfUvF2ec5clvn4XnvmfZAqvAVDbiH7UhMcd8M56Voww/oj07vcLVXVxlrftzuFOF
	c5rtJSrNmfbO6Zg/5e5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk10e-00FsXb-Pc; Mon, 08 Nov 2021 09:32:12 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk10b-00FsTz-HC
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 09:32:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10S-0007gN-Q1; Mon, 08 Nov 2021 10:32:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10Q-0005Zb-Mi; Mon, 08 Nov 2021 10:31:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10Q-0001ED-Lj; Mon, 08 Nov 2021 10:31:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-spi@vger.kernel.org
Subject: [PATCH 2/4] mtd: mchp23k256: Warn about failure to unregister mtd
 device
Date: Mon,  8 Nov 2021 10:31:50 +0100
Message-Id: <20211108093153.63792-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108093153.63792-1-u.kleine-koenig@pengutronix.de>
References: <20211108093153.63792-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=oQ0rhox5HEbwbc0e75w1kKEc23U+uF8p5JmZ7F33OK0=;
 m=7KSLr5cayipWkedCHz7+d6af4pRbjwTwvLxY0jhuRso=;
 p=y8uE+X4rF0xYUl8SQTQfji1PmQ09gP0zkTFXjoDC/CM=;
 g=8e6ec6dbe993af74eb7f5b477a7f711258598579
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGI7n0ACgkQwfwUeK3K7Ak9SAgAgpG
 d0Z9DCFHMMHT8pXrABqPM4T/lG3bVlVpraazo4YIrIXyfj3Ycszn39lY7EotBwqVlxASMBWlDBaGb
 CT5kDKkezRFABKpE47ZjEQwEAFdQmZjA/hxdG11NuTSmHzVvQF2Q0Y32hY/+fbZubh0O+teiFvF6Y
 p88kogxiHYffoqqxjochbeNQCfsljjdpB/fiyCgLo/z96eq8IWSOQF+CbRgEzSTY3nBX3BePuCOP4
 PZyxq4mUjKkhemU1GMs8/0GIzk0I0jfFiXlAVjw955iswQtWIxKA6MhCJ13V5efFOQ8/FXUxdJ7c0
 Ci9yvdpEkObkrU+5+nyyJFmTHBoglRw==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_013209_618407_D0E45B87 
X-CRM114-Status: GOOD (  14.14  )
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

bXRkX2RldmljZV91bnJlZ2lzdGVyKCkgc2hvdWxkbid0IGZhaWwuIFdhaWwgbG91ZGx5IGlmIGl0
IGRvZXMgYW55aG93LgoKVGhpcyBtYXRjaGVzIGhvdyBvdGhlciBkcml2ZXJzIChlLmcuIG5hbmQv
cmF3L25hbmRzaW0uYykgdXNlCm10ZF9kZXZpY2VfdW5yZWdpc3RlcigpLgoKQnkgcmV0dXJuaW5n
IDAgaW4gdGhlIHNwaSByZW1vdmUgY2FsbGJhY2sgYSBnZW5lcmljIGVycm9yIG1lc3NhZ2UgYnkg
dGhlCnNwaSBmcmFtZXdvcmsgKGFuZCBub3RoaW5nIGVsc2UpIGlzIHN1cHByZXNzZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgotLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvbWNocDIzazI1Ni5jIHwgNCArKystCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwMjNrMjU2LmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL21j
aHAyM2syNTYuYwppbmRleCA3N2M4NzJmZDNkODMuLmE4YjMxYmRkZjE0YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwMjNrMjU2LmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNl
cy9tY2hwMjNrMjU2LmMKQEAgLTIxMyw3ICsyMTMsOSBAQCBzdGF0aWMgaW50IG1jaHAyM2syNTZf
cmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiB7CiAJc3RydWN0IG1jaHAyM2syNTZfZmxh
c2ggKmZsYXNoID0gc3BpX2dldF9kcnZkYXRhKHNwaSk7CiAKLQlyZXR1cm4gbXRkX2RldmljZV91
bnJlZ2lzdGVyKCZmbGFzaC0+bXRkKTsKKwlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdpc3Rlcigm
Zmxhc2gtPm10ZCkpOworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG1jaHAyM2syNTZfb2ZfdGFibGVbXSA9IHsKLS0gCjIuMzAuMgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
