Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2791CAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ch/L4GjV3n4cPsbKBoUMO4L9BNzevKKj+JL+wSIILcQ=; b=d6Auh2NXYsvlit
	aeDhBwEAoknfZs8P37rd0If6DL9fJm+a1P1k40VjEgv9OxdzT+0NR+nljeTlM//hl7RyqDzuha9aM
	mWMDT987jnwkKx0ekQV7LiGg5C0D2XWsYE3bTDsj/Iefq84xRSPtcTVqKzcILm4BA8GTEZYW87uH7
	zKDe7uI/UJ7EbUWHOZ89w+WD37UdJFAVWvF3QfMzHsTM8sBztOvJhVfUClVx7V/93an4AUMSo1FZT
	QmAeZFeGp5IQIrY6hVM028FCw6CfPYV0P+ZpF/XD0cOqeg7lcbyBpYcJBcR54ZJp0ITe7ZPtd6oVu
	WocpGzg9PyeGggjjJ4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjW5-00000003z3V-077f;
	Thu, 11 Sep 2025 15:47:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjW2-00000003z2N-2Nqp
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 15:47:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80D4EC6B3AB;
	Thu, 11 Sep 2025 15:46:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3786460638;
	Thu, 11 Sep 2025 15:47:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEB3C102F2A48;
	Thu, 11 Sep 2025 17:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757605634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tyK6sya1MCooidPg/687N77t/qJSNi3aG8tPDW0+KmY=;
	b=ZvjIjY70oWpz6wc/g/lsF6FuCoqxU2jPAIdxXNFVGXXIWK22YhRAioKZqGNLUwbQy0T7Ml
	xtTrJ891rQ8iBze1NzqIzPycRNG4GvuwNY7bTWTI680aJQCmlHqMjygoIXB1sTwEdx/yZt
	UNG+NZ4JiYM18TTYY1XRQFYhWXcra8d10eGQXDKyI3HlDJttH1tsZwHQU/x3m8CIGyWiBE
	Yly1SMn1X9X4Tt9KmfdiLwELCMEB1qcQV84A8encZFrT+m7ckorTT8Yv9x7h9B+Evyyhht
	Bl9YgZrRPgywhMRzWhWNH8aaywVHVTfybSA5hZKu28wyBQloEitdFUkWauopoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.17-rc6
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 17:46:51 +0200
Message-ID: <87ms71800k.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_084718_822127_6DB41A04 
X-CRM114-Status: UNSURE (   6.14  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciB0aGUgbmV4dCAtcmMgY3ljbGUuCgpU
aGFua3MsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOGY1YWUz
MGQ2OWQ3NTQzZWVlMGQ3MDA4M2RhZjRkZThmZTE1ZDU4NToKCiAgTGludXggNi4xNy1yYzEgKDIw
MjUtMDgtMTAgMTk6NDE6MTYgKzAzMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTYuMTctcmM2Cgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gNDU1MGQzM2UxODExMmExMWE3NDA0MjRjNGVlYzA2M2NkNThlOTE4
YzoKCiAgbXRkOiBzcGluYW5kOiB3aW5ib25kOiBGaXggb29iX2xheW91dCBmb3IgVzI1TjAxSlcg
KDIwMjUtMDktMDUgMTc6MDM6NDQgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNQSSBOQU5EIGZpeDoKCi0gV3Jv
bmcgT09CIGxheW91dCBmb3IgV2luYm9uZCBXMjVOMDFKVyBTUEkgTkFORCBkZXZpY2VzCgpSYXcg
TkFORCBmaXhlczoKLSBBdG1lbCByYXcgTkFORCBjb250cm9sbGVyIHRpbWluZ3MKLSBCdWZmZXIg
aGFuZGxpbmcgaW4gc3RtMzJfZm1jMiBkcml2ZXIKLSBFcnJvciBoYW5kbGluZyBpbiBOdXZvdG9u
J3MgZHJpdmVyCgpNVEQgZGV2aWNlcyBmaXhlczoKLSBXcm9uZyBkZXBlbmRzLW9uIGRlcGVuZGVu
Y2llcyBvbiB0aGUgSW50ZWwgRFJNIGRyaXZlcgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbGV4YW5kZXIgU3ZlcmRsaW4g
KDEpOgogICAgICBtdGQ6IG5hbmQ6IHJhdzogYXRtZWw6IFJlc3BlY3QgdEFSLCB0Q0xSIGluIHJl
YWQgc2V0dXAgdGltaW5nCgpDaHJpc3RvcGhlIEpBSUxMRVQgKDEpOgogICAgICBtdGQ6IHJhd25h
bmQ6IG51dm90b246IEZpeCBhbiBlcnJvciBoYW5kbGluZyBwYXRoIGluIG1hMzVfbmFuZF9jaGlw
c19pbml0KCkKCkNocmlzdG9waGUgS2VyZWxsbyAoMik6CiAgICAgIG10ZDogcmF3bmFuZDogc3Rt
MzJfZm1jMjogYXZvaWQgb3ZlcmxhcHBpbmcgbWFwcGluZ3Mgb24gRUNDIGJ1ZmZlcgogICAgICBt
dGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGZpeCBFQ0Mgb3ZlcndyaXRlCgpHZWVydCBVeXR0ZXJo
b2V2ZW4gKDEpOgogICAgICBtdGQ6IE1URF9JTlRFTF9ERyBzaG91bGQgZGVwZW5kIG9uIERSTV9J
OTE1IG9yIERSTV9YRQoKU2FudGhvc2ggS3VtYXIgSyAoMSk6CiAgICAgIG10ZDogc3BpbmFuZDog
d2luYm9uZDogRml4IG9vYl9sYXlvdXQgZm9yIFcyNU4wMUpXCgogZHJpdmVycy9tdGQvZGV2aWNl
cy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgICAgICAgfCAxNiArKysrKystLQogLi4uL210
ZC9uYW5kL3Jhdy9udXZvdG9uLW1hMzVkMS1uYW5kLWNvbnRyb2xsZXIuYyAgfCAgNCArLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgICAgICAgICAgICAgfCA0NiArKysr
KysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgICAgICAg
ICAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKystCiA1IGZpbGVzIGNoYW5nZWQsIDc3
IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
