Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB69C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXdOY9Mk2ZM74hi5ZeGLWqbzbuJIQsfV0fDFub1yxUo=; b=4oXQvFzRSCB3do
	pWHN6VLiUmcF18SxDr4n/O0uBU+pdmXC/8IjJYJgU6Rns62/iTgG+EsyMqJ+hBJdL3MQP/xnzovaL
	gw4Yfhfzn8xhTXvFKJbn+nHxzMFv0/ipmuRDdV9Upd27bEm7QEkNB+3fotYDqW5vl1QX+BfV67D7u
	wmlyp6NcUgoy7mBIzAKxHM5EWG7zgr0mIXKn5TxseCZngePgDJNn91oqMQ1HTf7o+JwUoP17GhgD5
	4r9B4SPXBqMbv09pOqqSz6IPoariO1KGeed7X45vPhZogZ4H//ABH/o3tMpzE20XRdJP2jGQ1KtZp
	H5PGtJKxn8sCi5S+iSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVpf-000OPG-1M;
	Wed, 29 Mar 2023 13:27:19 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVpZ-000OID-31
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 13:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680096434;
  x=1711632434;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=UkIA7Mg0wkSS6SCzGoV03/Dn00Q/NHxhddn7Mq3em5s=;
  b=SPmjpdIswEH4oYT8EXO6bH/Q9PEIMeIP2NVfOYckjHRJz/HEFU/Kq7at
   etVYXnuMNYZTSEyVg7dO5JkFXl/AtrTgDKSwnbsOE5LrUhTwRpIr5Pmvh
   +ogtXorf3urvRbMOsWL7/EvFswZunJJuH/wzdjudKq57u+y72V7j5sUdd
   L/wIOUZ9PcmgJMzc0GpSyTkGz2u+1lsKWcZlI5T7Rsdf4LPEcjZ5N3HNy
   i2Q7cJEM5QbMhn0HbfgtH5FanMlWuC2Xuwuj9AXA7GMZdu9fDYv3RC38b
   t0oZ9KPdviMQeJ5vT83kWzhwOHMScMEd507WlmTduCrWGCDFPq2vcYfVi
   A==;
From: =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Date: Wed, 29 Mar 2023 15:26:53 +0200
Subject: [PATCH] ubifs: Free memory for tmpfile name
MIME-Version: 1.0
Message-ID: <20230329-memleak-fix-v1-1-7133da56ea8f@axis.com>
X-B4-Tracking: v=1; b=H4sIAJw8JGQC/x2N0QqCQBBFf0XmuYF1lcp+JXoY9ZpD7RYzEYH47
 649Hs493IUcpnC6VAsZvur6ygXqQ0XDLPkO1rEwxRCb0MSOE9IT8uBJf3w+SahHmdpjBypFLw7
 uTfIw700S/8B28TaU/f/melvXDQwLA4N2AAAA
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680096427; l=1436;
 i=marten.lindahl@axis.com; s=20230329; h=from:subject:message-id;
 bh=BQF80pngKmi7ePG4d1VaptHuj1kVld09nplcrbehaww=;
 b=Wvpk/gDC9fmrtxlT41NqXHys/iJAdKNjJrY/dL3U76qd1MDSOBEs23HKh7iROqCk4lHiEK6Yf
 OEfjY8L0EmPAhlI6/aIADRvPqm1Bky8DE/PD2Fb3td7QdZkuJ8mb3Tm
X-Developer-Key: i=marten.lindahl@axis.com; a=ed25519;
 pk=JfbjqFPJnIDIQOkJBeatC8+S3Ax3N0RIdmN+fL3wXgw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062714_434146_95513753 
X-CRM114-Status: UNSURE (   8.99  )
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

V2hlbiBvcGVuaW5nIGEgdWJpZnMgdG1wZmlsZSBvbiBhbiBlbmNyeXB0ZWQgZGlyZWN0b3J5LCBm
dW5jdGlvbgpmc2NyeXB0X3NldHVwX2ZpbGVuYW1lIGFsbG9jYXRlcyBtZW1vcnkgZm9yIHRoZSBu
YW1lIHRoYXQgaXMgdG8gYmUKc3RvcmVkIGluIHRoZSBkaXJlY3RvcnkgZW50cnksIGJ1dCBhZnRl
ciB0aGUgbmFtZSBoYXMgYmVlbiBjb3BpZWQgdG8gdGhlCmRpcmVjdG9yeSBlbnRyeSBpbm9kZSwg
dGhlIG1lbW9yeSBpcyBub3QgZnJlZWQuCgpXaGVuIHJ1bm5pbmcga21lbWxlYWsgb24gaXQgd2Ug
c2VlIHRoYXQgaXQgaXMgcmVnaXN0ZXJlZCBhcyBhIGxlYWsuIFRoZQpyZXBvcnQgYmVsb3cgaXMg
dHJpZ2dlcmVkIGJ5IGEgc2ltcGxlIHByb2dyYW0gJ3RtcGZpbGUnIGp1c3Qgb3BlbmluZyBhCnRt
cGZpbGU6CgogIHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTAxNzhmMzgwIChzaXplIDMy
KToKICAgIGNvbW0gInRtcGZpbGUiLCBwaWQgNTA5LCBqaWZmaWVzIDQyOTQ5MzQ3NDQgKGFnZSAx
NTI0Ljc0MnMpCiAgICBiYWNrdHJhY2U6CiAgICAgIF9fa21lbV9jYWNoZV9hbGxvY19ub2RlCiAg
ICAgIF9fa21hbGxvYwogICAgICBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lCiAgICAgIHViaWZzX3Rt
cGZpbGUKICAgICAgdmZzX3RtcGZpbGUKICAgICAgcGF0aF9vcGVuYXQKCkZyZWUgdGhpcyBtZW1v
cnkgYWZ0ZXIgaXQgaGFzIGJlZW4gY29waWVkIHRvIHRoZSBpbm9kZS4KClNpZ25lZC1vZmYtYnk6
IE3DpXJ0ZW4gTGluZGFobCA8bWFydGVuLmxpbmRhaGxAYXhpcy5jb20+Ci0tLQogZnMvdWJpZnMv
ZGlyLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2Rpci5jIGIvZnMvdWJpZnMvZGlyLmMKaW5kZXggMGYyOWNmMjAxMTM2Li4wODlj
YTY5MTAxMjQgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2Rpci5jCisrKyBiL2ZzL3ViaWZzL2Rpci5j
CkBAIC00OTEsNiArNDkxLDcgQEAgc3RhdGljIGludCB1Ymlmc190bXBmaWxlKHN0cnVjdCB1c2Vy
X25hbWVzcGFjZSAqbW50X3VzZXJucywgc3RydWN0IGlub2RlICpkaXIsCiAJCWdvdG8gb3V0X2Nh
bmNlbDsKIAl1bmxvY2tfMl9pbm9kZXMoZGlyLCBpbm9kZSk7CiAKKwlmc2NyeXB0X2ZyZWVfZmls
ZW5hbWUoJm5tKTsKIAl1Ymlmc19yZWxlYXNlX2J1ZGdldChjLCAmcmVxKTsKIAogCXJldHVybiBm
aW5pc2hfb3Blbl9zaW1wbGUoZmlsZSwgMCk7CgotLS0KYmFzZS1jb21taXQ6IGM5YzMzOTVkNWUz
ZGNjNmRhZWU2NmM2OTA4MzU0ZDQ3YmY5OGNiMGMKY2hhbmdlLWlkOiAyMDIzMDMyOS1tZW1sZWFr
LWZpeC04N2EwMWRhZjQ2OWUKCkJlc3QgcmVnYXJkcywKLS0gCk3DpXJ0ZW4gTGluZGFobCA8bWFy
dGVuLmxpbmRhaGxAYXhpcy5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
