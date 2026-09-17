Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172BAC88E72
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeQrLI6UMTMsMcXndYFzI4MK4IPLNFeArxPzXr7S2Os=; b=ppF2c5anE77mx+
	0VexeLP0lnZrKxVUi54famh2lFm0dIwV59nLDEYSyUZ4GspTbiAfD03+Qd+dd2PFt13SH8ydDlHyg
	LtAk/JmgJov1LV418F7/mvWCtbjGbqenAIOOzMvSZqjdRDWKQ6fOxzJHI6ZihT/Gm5GbQnmzt0J8j
	n7aOQOc570oVvAcLEomyQyLuTxobiPzs8/pCs9/imUPot5GP8otpok/yhDFk0vztIY19G8waeLgxW
	QRqUQ86/iM6Yt83SCVDEm5SgM0VXetOO8JxdgLNNRCy+xhmFPkENIWcXr6TGUnUiYxznU7a2eq0sN
	9Rb9xAIrNqIXOgf4Kjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BVz-0000000BKJQ-1q99;
	Thu, 17 Sep 2026 12:46:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BVw-0000000BKIu-3trp
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 12:46:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 444AE4E40796;
	Thu, 17 Sep 2026 12:46:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 120E55FAA3;
	Thu, 17 Sep 2026 12:46:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CAF611C7A082;
	Thu, 17 Sep 2026 14:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789649213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gILUbaoT7fKQcvTHAlwvSON/RkpV2LxEuI0qJh2Jgms=;
	b=x0CBO3Tksv36MnOcMm74cMyyRxyUhrNIirc1jJrZ2eU9h6YvfZOhrEsadWTw650LzfXJy/
	OtcX5NRbEq5BHePRfhR9GVgmd3lgif0ROF56YDsTBpCsJ0/Z5DyS6MtLzi5Dvfjg3ctObc
	RVBW8NkY2P+K4HyLrqhJcwAsHbJOHzs0QaSdSoCGynuswRw3ZrAFoyqBl3FsTUHwk51Sr9
	3N4EATdeVmBY/Sj/9QivMNySqRykWsWejGnaIHpkb9CysakKayQqGMjMPQLi7P5tl7j1Kl
	5jawGJ1Vzc3qV4Ic4nhgSniJPskklka3eDfr14zu9xh6r3s8g/k+Ru3pMXb9Fg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  richard@nod.at,  vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at
 256 bytes on an x8 device
In-Reply-To: <20260916162746.308008-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Wed, 16 Sep 2026 16:27:45 +0000")
References: <8733v9mdro.fsf@bootlin.com>
	<20260916162746.308008-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 14:46:52 +0200
Message-ID: <87ecesjb9f.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_054657_111484_1D347998 
X-CRM114-Status: GOOD (  13.47  )
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

T24gMTYvMDkvMjAyNiBhdCAxNjoyNzo0NSBHTVQsIE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEhpIE1pcXVlbCwKPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4gdjMg
c2VudCBhcyBhIHJlcGx5IHRvIHYyLgo+Cj4+IFRoaXMgc2VudGVuY2UgZG9lcyBub3QgbWVhbiBh
bnl0aGluZywgSSdtIHNvcnJ5Lgo+Cj4gUmV3cml0dGVuOiB0aGUgY291bnQgZ29lcyBvdXQgYXMg
YSBzaW5nbGUgYnVzIHdvcmQsIENNRCgpIHJlcGxpY2F0ZXMgaXQKPiBpbnRvIGV2ZXJ5IGRldmlj
ZSBsYW5lLCBhbmQgYW4geDggcGFydCByZWFkcyBpdCBvZmYgZWlnaHQgZGF0YSBsaW5lcywgc28K
PiBhbnl0aGluZyBhYm92ZSAyNTUgaXMgdHJ1bmNhdGVkIHRoZXJlLgo+Cj4+IGZhaWxlZD8gZG8g
eW91IGhhdmUgaGFyZHdhcmUgdGhhdCBhY3R1YWxseSB0cmlnZ2VyZWQgdGhhdCBpc3N1ZT8KPgo+
IFllcyAtIGEgQ2F2aXVtIE9jdGVvbiBDTjYzMzUgYm9hcmQgd2hvc2UgTk9SIGlzIGFuIE0yOUVX
IHN0cmFwcGVkIHRvIHg4Lgo+IFRoZSBsb2cgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlzIGZyb20g
aXQsIGFuZCB0aGUgY2xhbXAgZml4ZXMgaXQuIHYzCj4gbmFtZXMgdGhlIGJvYXJkLgoKT2ssIHRo
aXMgbWF0dGVycyBhIGxvdCB0byBtZSB0b2RheSwgYmVjYXVzZSB3ZSBnZXQgZG96ZW5zIGFuZCBk
b3plbnMgb2YKaGFyZGVuaW5nIGNoYW5nZXMgd2hpY2ggZG8gbm90IGFsd2F5cyBoYXZlIGFuIGFj
dHVhbCByZWFsaXR5LiBJZiB5b3UgZml4CmEgcmVhbCBwcm9ibGVtIHlvdSBlbmNvdW50ZXJlZCwg
dGhhdCdzIHJlbGV2YW50LgoKPgo+PiBUaGF0J3MgaW5jb3JyZWN0LiBJdCBpbmRpY2F0ZXMgdW50
aWwgd2hlbiB3ZSBuZWVkIHRvIGJhY2twb3J0IGl0Lgo+Cj4gQWRkZWQuIEkgY2hlY2tlZCB0aGUg
Y29kZSBpcyByZWFsbHkgdGhlcmU6IDFkYTE3N2U0YzNmNCBhbHJlYWR5IHNlbmRzCj4gQ01EKHdv
cmRzIC0gMSkgYW5kIGFscmVhZHkgdGFrZXMgdGhlIGNodW5rIHNpemUgZnJvbSBNYXhCdWZXcml0
ZVNpemUuCj4KPiBWaWduZXNoIGlzIG9uIFRvOiBmb3IgdjMuCgpZb3Ugc2hvdWxkIHVzZSBjaGVj
a3BhdGNoLnBsIG9yIGI0J3Mgb3B0aW9uIC0tYXV0by10by1jYyB0byBjcmVhdGUgdGhlIENjCmxp
c3QuCgpUaGFua3MgZm9yIHRoZSB2My4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
