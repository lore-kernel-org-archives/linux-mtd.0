Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6853C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:32:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 841E161215
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 841E161215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvzp45/mjGNeDKmt7zw5J4xipcL+MXnGw01HH7lJqGk=; b=X9lhoW0z6DHbFr
	F9rKd/asL9YB7QW0jrQTtqEECmiDRlZVDcJf8v5fhDNqvOA82pmVT13tLyzFRQ4EkGtrIeTSAF3N9
	f7VCGPVNWi8QbrDd+1j08ZLexwtqkdpA9yQ8KX/tSjHqfGkhNwS+wFVSrSyHN7y//enlXKzYZOPsG
	HTcKZFVf7O4U7yqUwrxc8tP3rH64kluWRExQVLAE3Dw2eASvRmeCxSXRG8EfRPvljh6Zk3VlzrwjS
	837BPnYVpySYIBO8X8qvDUz9/JhQ0jBBGDHzAJE+MqLccWRHGE3sdSAUqRzOFSBnDqDM2lTbrrHSa
	00pr3wzSszlQW+3wxb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk10r-00FsZk-Ny; Mon, 08 Nov 2021 09:32:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk10b-00FsU0-IN
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 09:32:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10S-0007gM-Q1; Mon, 08 Nov 2021 10:32:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10Q-0005ZY-IF; Mon, 08 Nov 2021 10:31:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10Q-0001E2-HC; Mon, 08 Nov 2021 10:31:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-spi@vger.kernel.org
Subject: [PATCH 1/4] mtd: dataflash: Warn about failure to unregister mtd
 device
Date: Mon,  8 Nov 2021 10:31:49 +0100
Message-Id: <20211108093153.63792-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=2VqFZIno/yGWsKtWn0NIvGoO0BsdZpAyUJM3JsTcgVQ=;
 m=7KSLr5cayipWkedCHz7+d6af4pRbjwTwvLxY0jhuRso=;
 p=dp+d9QTfUVIlCaBs3wY1yKyRjs7CL31c/ZsgBiAwaOo=;
 g=e364a11306a2fa96d20bff34d5a4eb2b8e9f1f6d
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGI7ncACgkQwfwUeK3K7AmbDQf/ZUY
 7/ChKRQDpyu4txJFq3DpQaEpdIKV1t/C8DVyqVOXaHcVWBRNkuHLxwJKKqBYfp/fMRQANwLyaCAcf
 qUgCnxzuvqHFrj4d4NSYtJGl/6UAMRmaRvaRtfNsaqiU3E0J6lf4DNKR5g9/0oCSSKQij/FWmYtAn
 z4J3u2AZ46TtqrI/ORKTz0gCX+KG/rl+IA3FpHJxECBvRvQwF7vqDJNscgFgTzGK0tljgsZgA0of6
 fd1jrJnnudtJyyVA1kTZHpR1qC3VlfU859ng6hMfl3Sa7mu1pPPXTn3lAUcfReRkGPD9SzSBnBzaK
 ijplz+6fNtXdNsBc/wRsYdKHosWy74A==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_013209_657947_07A59BCE 
X-CRM114-Status: GOOD (  14.55  )
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
LmRlPgotLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9kYXRhZmxhc2guYyBiL2RyaXZlcnMv
bXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jCmluZGV4IDk4MDJlMjY1ZmNhOC4uMjkzY2FiNzU4
Mjk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9kYXRhZmxhc2guYworKysg
Yi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9kYXRhZmxhc2guYwpAQCAtOTEyLDE0ICs5MTIsMTQg
QEAgc3RhdGljIGludCBkYXRhZmxhc2hfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIHN0
YXRpYyBpbnQgZGF0YWZsYXNoX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogewogCXN0
cnVjdCBkYXRhZmxhc2gJKmZsYXNoID0gc3BpX2dldF9kcnZkYXRhKHNwaSk7Ci0JaW50CQkJc3Rh
dHVzOwogCiAJZGV2X2RiZygmc3BpLT5kZXYsICJyZW1vdmVcbiIpOwogCi0Jc3RhdHVzID0gbXRk
X2RldmljZV91bnJlZ2lzdGVyKCZmbGFzaC0+bXRkKTsKLQlpZiAoc3RhdHVzID09IDApCi0JCWtm
cmVlKGZsYXNoKTsKLQlyZXR1cm4gc3RhdHVzOworCVdBUk5fT04obXRkX2RldmljZV91bnJlZ2lz
dGVyKCZmbGFzaC0+bXRkKSk7CisKKwlrZnJlZShmbGFzaCk7CisKKwlyZXR1cm4gMDsKIH0KIAog
c3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIGRhdGFmbGFzaF9kcml2ZXIgPSB7CgpiYXNlLWNvbW1p
dDogNmI3NWQ4OGZhODFiMTIyY2NlMzdlYmYxNzQyOGE4NDljY2QzZDBmMQotLSAKMi4zMC4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
