Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC0C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EVq3tZGF2K6V9HbeRibVdL1UxH17irM3G9CJl+XiKDc=; b=fTtnKueeTmCacz
	yNw1XzYwj8vTdWG/f5Z0eTubvAQOoUPcha2P/rBpFYb28dVDjmYF66/0csD0KNJTdlFXIebc+HClE
	reUGkujJKVuGzDBgqgJjDqrgMBHKXBFma8bgCsFmWG8Ltl8zGqmynDWjquVPWFIIoBVIJJmQTgDFj
	+ZPTv2CXoajaLcaTkGKjBn/BfvnjaM3h82lXSnHZvnYqNljXKKgbCn4/m0dPl3B+/eZP3G88do3QP
	aXbbWmY5+fcVpQoCTdQ47na7zSJne1UOaPWsSE1m3mM0SPQOyrJytKke90MmZHgTqojn7mJDrLluF
	MEX7d6Q/rQn9lBHlkYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYtO-00000000ICA-0uL4;
	Mon, 26 Feb 2024 11:11:30 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYtM-00000000IBL-0SiJ
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 11:11:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5806B240008;
	Mon, 26 Feb 2024 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708945885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zj+MygKb5ZUUUy0ooxu8lQ+0Uq7LCSNKhmYOAZa6N4o=;
	b=RAYgkdh2jRMqfDPoddRnnETB6wqNn8A9Gr7qYeshN/TM5cxEi+uL+2ZV7ktMsxAA0vYdVe
	Rk+fCyJewxbXJ2HQz3m/2q8zgoy8YRTzC5oPR6Mqtox6Sy/+s4TPs0mTCaLqk9WOfOD5ep
	EnzloJ5jZqMzEZ6+vPL43v0e/SkdIBZ3k+3vYUqV+NgV9t3EFI1fIF+UhqkKJ3GHnID4tQ
	eS286RGFp0/YJPhlCN/KYMKXaJ6T6lrzYbKgf6pm6StOn/FtU7KY/zyJCHK2pSSm6j7KuH
	ql+r4s5dAn+tdex0kyApdiHQDCaOINmAMQk75ChDQaTAJH3w6N/U4Kn5Dwuotg==
Date: Mon, 26 Feb 2024 12:11:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 6.8-rc7
Message-ID: <20240226121124.0cad7cdf@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_031128_315633_F97A5ACC 
X-CRM114-Status: GOOD (  10.03  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciB2Ni44LXJjNy4KClRoYW5r
cywKTWlxdcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2NjEzNDc2ZTIy
NWUwOTBjYzlhYWQ0OWJlN2ZhNTA0ZTI5MGRkMzNkOgoKICBMaW51eCA2LjgtcmMxICgyMDI0LTAx
LTIxIDE0OjExOjMyIC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQv
bGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci02LjgtcmM3Cgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gZTZhMzBkMGM0OGExZThhNjhmMWNjNDEzYmVlNjUzMDJhYjAzZGRmYjoKCiAg
bXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBmaXggbGF5b3V0cyAoMjAyNC0wMi0wNSAxNjoxNjoyNCAr
MDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KTWFueSBOQU5EIHBhZ2UgbGF5b3V0cyBoYXZlIGJlZW4gYWRkZWQgdG8g
dGhlIE1hcnZlbGwgTkFORCBjb250cm9sbGVyCmJ1dCBjb3VsZCBub3QgYmUgdXNlZCBpbiBwcmFj
dGljZSBzbyB0aGV5IGFyZSBiZWluZyByZW1vdmVkLgoKUmVnYXJkaW5nIHRoZSBTUEktTkFORCBh
cmVhLCBHaWdhZGV2aWNlIGNoaXBzIHdlcmUgbm90IHVzaW5nIHRoZSByaWdodApidWZmZXIgZm9y
IGFuIEVDQyBzdGF0dXMgY2hlY2sgb3BlcmF0aW9uLgoKQXNpZGUgZnJvbSB0aGVzZSBkcml2ZXIg
Zml4ZXMsIHRoZXJlIGlzIGFsc28gYSByZWZjb3VudCBmaXggaW4gdGhlIE1URApjb3JlIG5vZGVz
IHBhcnNpbmcgbG9naWMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkVsYWQgTmFjaG1hbiAoMSk6CiAgICAgIG10ZDogcmF3
bmFuZDogbWFydmVsbDogZml4IGxheW91dHMKCkhhbiBYdSAoMSk6CiAgICAgIG10ZDogc3BpbmFu
ZDogZ2lnYWRldmljZTogRml4IHRoZSBnZXQgZWNjIHN0YXR1cyBpc3N1ZQoKTWlxdWVsIFJheW5h
bCAoMSk6CiAgICAgIG10ZDogRml4IHBvc3NpYmxlIHJlZmNvdW50aW5nIGlzc3VlIHdoZW4gZ29p
bmcgdGhyb3VnaCBwYXJ0aXRpb24gbm9kZXMKCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAg
ICAgICAgICB8ICAxICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwgMTMg
KysrKystLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRldmljZS5jICAgfCAgNiAr
KysrLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
