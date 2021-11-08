Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70664C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F6FB61215
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 09:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F6FB61215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVh7XzgwESzrLeGWBH3fyx2uuUOJRzSwcNcncsUqA68=; b=oefdLf9/R2AJRn
	IviHCOduunyIjF61L7LvDK2aEwRhBZanvRzCttI/LNnIIyio/4+y9kCM/fWIjFZf/DG4iOOtXof5L
	0KKneKejJ3wxZGUBekBHudZsDt2pJTITieJ6hPscLLUj0ElVQOUzqOygiO4wOQpLEoYkwJu2dWgiy
	kpF+Ilt8voA8mX61T9iA055AwlmgdxZ2V9AOC3ObfM54zdnyPTjCbzTHc4KeiQLTMhcDmVh6qZU8f
	3VUIYi23axmrkxXRqji6teRtJHPuasQO/YFHN7hDH77CTFGxMWix/P0q4FUGQhJwQaJVBS3rvrpHB
	mJqO30k2g+V7ewrzqr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk11T-00FskZ-9W; Mon, 08 Nov 2021 09:33:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk10b-00FsUi-Ty
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 09:32:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10S-0007gP-Q1; Mon, 08 Nov 2021 10:32:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10R-0005Zh-0a; Mon, 08 Nov 2021 10:31:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mk10Q-0001EZ-Vh; Mon, 08 Nov 2021 10:31:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-spi@vger.kernel.org
Subject: [PATCH 4/4] mtd: sst25l: Warn about failure to unregister mtd device
Date: Mon,  8 Nov 2021 10:31:52 +0100
Message-Id: <20211108093153.63792-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108093153.63792-1-u.kleine-koenig@pengutronix.de>
References: <20211108093153.63792-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=chTrsNwtyvGFDidu8JfqkR8D1NeBCtiv8G0Xdn/Msdg=;
 m=7KSLr5cayipWkedCHz7+d6af4pRbjwTwvLxY0jhuRso=;
 p=GyFyjTLYPEwkTCbq/a6e00IrkhK4nCV0ABnVgGp+m+w=;
 g=6b042ce343cc284fe221ab7a9db5771a78afa793
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGI7oUACgkQwfwUeK3K7AlbVAf+JKt
 +Jh1O3wHjvHkmmzbNPD9RLyL8VD2Uw0RBt7eWa80liNL4AYJP8MxcmZ7GmECL0UGgDKh/1aEOKvhj
 ywLbU0w6kaploF2/XU4WuYQUqWjRfm0cnihU6+dNz5x8zTbj18/YVwjOSb92eutPYg3SbgjlSdeqt
 qbf8XN6vitfl2utFti32McIfA4bRwZkGu2tzbVeF2ZJ5iz5cednguwT0O2MHBn4e1H2rhWJ2QfCno
 DcCffcYS2f6M2o+rVoLHcpxiMYw/eLTuprG9JFIP1oLEg+GaPoy7lUaSFPlnKLDaXK12JGkGXyHwd
 HzV6nXRbijB639b4mLtWy0/pR2Nl37Q==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_013210_014011_2E13BBE6 
X-CRM114-Status: GOOD (  14.15  )
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
LmRlPgotLS0KIGRyaXZlcnMvbXRkL2RldmljZXMvc3N0MjVsLmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9kZXZpY2VzL3NzdDI1bC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zc3QyNWwuYwpp
bmRleCBiODFjM2YwYjg1ZjkuLjdmMTI0YzFiZmE0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
ZGV2aWNlcy9zc3QyNWwuYworKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3NzdDI1bC5jCkBAIC00
MDIsNyArNDAyLDkgQEAgc3RhdGljIGludCBzc3QyNWxfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNl
ICpzcGkpCiB7CiAJc3RydWN0IHNzdDI1bF9mbGFzaCAqZmxhc2ggPSBzcGlfZ2V0X2RydmRhdGEo
c3BpKTsKIAotCXJldHVybiBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoJmZsYXNoLT5tdGQpOworCVdB
Uk5fT04obXRkX2RldmljZV91bnJlZ2lzdGVyKCZmbGFzaC0+bXRkKSk7CisKKwlyZXR1cm4gMDsK
IH0KIAogc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIHNzdDI1bF9kcml2ZXIgPSB7Ci0tIAoyLjMw
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
