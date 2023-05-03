Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F8FC77B75
	for <linux-mtd@archiver.kernel.org>; Wed,  3 May 2023 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXom21IeLfm4MNX8d8Y/IIyZKjqudNFWXGgciYuoIVw=; b=sk/Z9jhPIjaT2N
	r2dk2As7Xal1gicpstsKlUTnVYLxqyITQV4JPC7Mj2sJ2nZVg3qr2uKnCKoBr6M5UOjQqo2Ni0sme
	TzXBY4sJuWe4Xly34QzlQQeu/VaOQ7Su5V6cUnyoEOhP7+qaEwyi4IuYBJR0XKdDEwtb0h8aMJnyb
	pdkxc6qNFE8MwExS8t8pdbZLf+HIi2Ssqkw82/W0J96en5NsEa4bFgj2RTGCwNQc2xrpEwaJr5Zo5
	l250dJvZr+UtdiJvQFmJZmRYmm8jvQmFd29k+pLozyDVyEA4dHOwVHxeztR0wdovuc9XDziVRsiMM
	HwdJnWi2BuTK4M9imPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puI73-005aSo-1H;
	Wed, 03 May 2023 19:26:05 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puI6z-005aOZ-2z
	for linux-mtd@lists.infradead.org;
	Wed, 03 May 2023 19:26:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C817D62E1A81;
	Wed,  3 May 2023 21:25:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ncu617pyWvvk; Wed,  3 May 2023 21:25:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 47FD062E1A88;
	Wed,  3 May 2023 21:25:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gScMev-CUfm9; Wed,  3 May 2023 21:25:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 27A7A62E1A81;
	Wed,  3 May 2023 21:25:45 +0200 (CEST)
Date: Wed, 3 May 2023 21:25:45 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1235201236.2692346.1683141945109.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS changes for v6.4
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: o2rRX15G+ItHzV6XoUeNlh7n8Se5Dg==
Thread-Topic: UBI and UBIFS changes for v6.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_122602_139887_7A1FC178 
X-CRM114-Status: UNSURE (   5.52  )
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

TGludXMsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDZhOGY1N2FlMmViMDdh
YjM5YTZmMGNjYWQ2MGM3NjA3NDMwNTEwMjY6CgogIExpbnV4IDYuMy1yYzcgKDIwMjMtMDQtMTYg
MTU6MjM6NTMgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3J3L3ViaWZz
LmdpdCB0YWdzL3ViaWZzLWZvci1saW51cy02LjQtcmMxCgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gYjVmZGEwOGVmMjEzMzUyYWMyZGY3NDQ3NjExZWI0ZDM4M2NjZTkyOToKCiAgdWJp
ZnM6IEZpeCBtZW1sZWFrIHdoZW4gaW5zZXJ0X29sZF9pZHgoKSBmYWlsZWQgKDIwMjMtMDQtMjMg
MjM6MzY6MzggKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRoaXMgcHVsbCByZXF1ZXN0IGNvbnRhaW5zIHVwZGF0
ZXMgZm9yIFVCSSBhbmQgVUJJRlMKClVCSToKCS0gRml4IGVycm9yIHZhbHVlIGZvciB0cnlfd3Jp
dGVfdmlkX2FuZF9kYXRhKCkKCS0gTWlub3IgY2xlYW51cHMKClVCSUZTOgoJLSBGaXhlcyBmb3Ig
dmFyaW91cyBtZW1vcnkgbGVha3MKCS0gTWlub3IgY2xlYW51cHMKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTcOlcnRlbiBM
aW5kYWhsICgyKToKICAgICAgdWJpZnM6IEZyZWUgbWVtb3J5IGZvciB0bXBmaWxlIG5hbWUKICAg
ICAgdWJpZnM6IEZpeCBtZW1vcnkgbGVhayBpbiBkb19yZW5hbWUKCldhbmcgWWFuUWluZyAoMSk6
CiAgICAgIHViaTogRml4IHJldHVybiB2YWx1ZSBvdmVyd3JpdGUgaXNzdWUgaW4gdHJ5X3dyaXRl
X3ZpZF9hbmRfZGF0YSgpCgpZYW5nIExpICgxKToKICAgICAgdWJpOiBTaW1wbGlmeSBib29sIGNv
bnZlcnNpb24KCllhbmd0YW8gTGkgKDEpOgogICAgICB1YmlmczogUmVtb3ZlIHJldHVybiBpbiBj
b21wcl9leGl0KCkKClpoaWhhbyBDaGVuZyAoMik6CiAgICAgIFJldmVydCAidWJpZnM6IGRpcnR5
X2Nvd196bm9kZTogRml4IG1lbWxlYWsgaW4gZXJyb3IgaGFuZGxpbmcgcGF0aCIKICAgICAgdWJp
ZnM6IEZpeCBtZW1sZWFrIHdoZW4gaW5zZXJ0X29sZF9pZHgoKSBmYWlsZWQKCiBkcml2ZXJzL210
ZC91YmkvYnVpbGQuYyB8ICAgMiArLQogZHJpdmVycy9tdGQvdWJpL2ViYS5jICAgfCAgMTkgKysr
KystLQogZnMvdWJpZnMvY29tcHJlc3MuYyAgICAgfCAgIDEgLQogZnMvdWJpZnMvZGlyLmMgICAg
ICAgICAgfCAgIDcgKy0tCiBmcy91Ymlmcy90bmMuYyAgICAgICAgICB8IDE0MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwg
MTAyIGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
