Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DEAC05027
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Feb 2023 02:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F66wYuF7l+xFWCd2/fUBrJYCAWB1q56cxrVZJCtJtk4=; b=MafoUsoe5Mw02B
	NmeNLSd1oOjM5kCQRtmqbYohUV7SK3HYVWaL1/Qpj4/6fHZgF7ZqqtxwZjLcwpSN+xG54BZDc3fm3
	wQ5nKM0pnL/8tL7w/OBSt111cWGfF1UT61eD+j39fwmwqib4pgWfOjECTdwUaIUwuE2XvqZ72UQ8V
	fjWVj/a5cnyiK/BhrTkdk1qT7i0ewg7JPrxFvZJRgTtmJncfCbaCqXNf+GiKVAyK1d1lQBsYOtkZq
	4pVFQhy9yv48JdHkflpxgEJxf5jNQXg77P8AenyFJulGgUyBjmu4PL4hoLR71CYmwEOGhd3cjiSPP
	834yVzTf5qtbqeGacxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQIxa-003v2q-PU; Fri, 10 Feb 2023 02:16:22 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQIxX-003v22-Hd
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2023 02:16:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675995376;
	bh=IcKXUOph5Uq/d7rKrb0onbZjg5XcHRfrd3jO9HnwOtc=;
	h=From:Date:Subject:To:Cc:From;
	b=C1Zl+D0kHHP6WRG/IcJ9m+o7ZDWLuR52OXL9kQ0PXvscuX9Gqhw45LIPxRb4aQyWm
	 pofvytHVdbTTdwl4rO/xHeZIJk30zckiwUV0lWrj1WHmK/lU6jl1tAzeQ65GsF8mei
	 pEIYkjjMG4jJWWc5lIpXhiPISPA2eGHeVR4+2pJI=
Date: Fri, 10 Feb 2023 02:16:13 +0000
Subject: [PATCH] ubifs: make kobj_type structures constant
MIME-Version: 1.0
Message-Id: <20230210-kobj_type-ubifs-v1-1-052419f90fae@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOyo5WMC/x2N0QqDMAwAf0XyvECtm6K/MkRajRqVKo2ODfHfF
 3y8g+NOEIpMAlVyQqQPC69BIX0k0I4uDITcKYM1NjM2NTivfmr230Z4eO4FX0VpXNY9cyoL0Mo
 7IfTRhXbULhzLonKL1PP33rzr6/oDPO1kK3YAAAA=
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675995374; l=1131;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IcKXUOph5Uq/d7rKrb0onbZjg5XcHRfrd3jO9HnwOtc=;
 b=h0oBl2kNVAVRAwQ2FkTKyDUx9MVHRilJY04iy94HQb8x1TyJyARqGBUi9S71Y+mutyUYJTxf/
 i01Zdk1h9O4CnFX8UnzZijYlgogTGypPDMf+V2UrLIEFFhYGzHc5aH3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_181619_764145_EAD161A1 
X-CRM114-Status: UNSURE (   8.75  )
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

U2luY2UgY29tbWl0IGVlNmQzZGQ0ZWQ0OCAoImRyaXZlciBjb3JlOiBtYWtlIGtvYmpfdHlwZSBj
b25zdGFudC4iKQp0aGUgZHJpdmVyIGNvcmUgYWxsb3dzIHRoZSB1c2FnZSBvZiBjb25zdCBzdHJ1
Y3Qga29ial90eXBlLgoKVGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcyB0byBjb25zdGlmeSB0aGUgc3Ry
dWN0dXJlIGRlZmluaXRpb25zIHRvIHByZXZlbnQKbW9kaWZpY2F0aW9uIGF0IHJ1bnRpbWUuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0t
LQogZnMvdWJpZnMvc3lzZnMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9zeXNmcy5jIGIvZnMv
dWJpZnMvc3lzZnMuYwppbmRleCAwNmFkOGZhMWZjZmIuLjQ0MDRjYTRmMmNlOSAxMDA2NDQKLS0t
IGEvZnMvdWJpZnMvc3lzZnMuYworKysgYi9mcy91Ymlmcy9zeXNmcy5jCkBAIC03NCwxMyArNzQs
MTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzeXNmc19vcHMgdWJpZnNfYXR0cl9vcHMgPSB7CiAJ
LnNob3cJPSB1Ymlmc19hdHRyX3Nob3csCiB9OwogCi1zdGF0aWMgc3RydWN0IGtvYmpfdHlwZSB1
Ymlmc19zYl9rdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga29ial90eXBlIHViaWZzX3Ni
X2t0eXBlID0gewogCS5kZWZhdWx0X2dyb3Vwcwk9IHViaWZzX2dyb3VwcywKIAkuc3lzZnNfb3Bz
CT0gJnViaWZzX2F0dHJfb3BzLAogCS5yZWxlYXNlCT0gdWJpZnNfc2JfcmVsZWFzZSwKIH07CiAK
LXN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHViaWZzX2t0eXBlID0geworc3RhdGljIGNvbnN0IHN0
cnVjdCBrb2JqX3R5cGUgdWJpZnNfa3R5cGUgPSB7CiAJLnN5c2ZzX29wcwk9ICZ1Ymlmc19hdHRy
X29wcywKIH07CiAKCi0tLQpiYXNlLWNvbW1pdDogZTU0NGEwNzQzODUyMmFiMzY4ODQxNmU2ZTJl
MzRiZjBlZTZkODc1NQpjaGFuZ2UtaWQ6IDIwMjMwMjEwLWtvYmpfdHlwZS11Ymlmcy01NzkwYTNk
NDZlOTcKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3Nj
aHVoLm5ldD4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
