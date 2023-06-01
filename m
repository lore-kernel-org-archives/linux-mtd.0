Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBFEC77B7A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dXfr4E1iCrlKIFMq0ekf84YEbVF6D6rdssBKSFrFFhc=; b=A6JgVsc6W3ldmR
	1U14C5+vA8rgRgMNubQoVW5YmI4dwHdp/PHH00uWbfieJ8MlQeUhUxaRtu0Zs+HZi5r/LURpZZ8Lf
	9dEp1sBDUiC+aFUcLH5UIJolw8tarDv6LebZQOJDoaLSrR98fGdFIMTJz/q7dvGWDo7N1irLDOBm4
	+g6QWreFppqucgeDJw0JvDR5J4LfDOskH4xRwHCnoJigjCFg+qu/eWUCJ205kMnv6OwAMBheH6yYK
	GJ88pCiPLb9UXIFNh2p4wFrs/EaeWM4xEyZII1/AvkMuFWmViL2fW58fs2snYwd1zCP/kFRErovKM
	ZaIjfnE5T0DGKEQjYRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4l1T-004CuI-0D;
	Thu, 01 Jun 2023 16:19:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4l1P-004Crv-0D
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 16:19:33 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685636365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=puKACfukReNN906YExsD3DbozgKlspwvf9R76iyybnU=;
	b=WtE0+wAjkkfGsv3GA0REmXerM72iY1+MyQssiLP0cy3foyuPkaETO4J0bWnwqw6HQn3Xv0
	sEhPAyXJNfwwWMZsJSXVKxJ8pgUFH28lltCwLObsNZ+WQT6CvWbwD8OyyOr2G/Fzv3wuJz
	A91cY5UMlzQ9sqQ29xeBZiPEih7cIuDeR1CT9fUYIOmHvQ3G+BC+Kcd4lM6UcSO/gjYOTe
	6ESU3q/ZngPbVLT4yhoawoN+HR8v/QvqUuOwt4ySBrbXr/BtLbzj4uzwKdPJ04jK9xsho5
	n3CHdhk/kj7DP8BJfyy4xgosKWAK+K02BAl58aDV2FG/c6aWcYffSGr8Lmb+CA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7740FF808;
	Thu,  1 Jun 2023 16:19:21 +0000 (UTC)
Date: Thu, 1 Jun 2023 18:19:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 6.4-rc5
Message-ID: <20230601181916.515b516a@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_091931_706582_3EEE2221 
X-CRM114-Status: GOOD (  11.63  )
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

SGVsbG8gTGludXMsCgpIZXJlIGFyZSBhIGNvdXBsZSBvZiBtdGQgZml4ZXMgd2Ugd291bGQgbGlr
ZSB0byBnZXQgaW50byA2LjQuIEFsbCB0aGUKZml4ZXMgaGF2ZSBiZWVuIGluIC1uZXh0IGZvciBh
IHdlZWsgYnV0IEkgbWVzc2VkIHRoZSBhdXRob3JzaGlwIG9mIHRoZQpNQUlOVEFJTkVSUyBwYXRj
aCB3aGVuIEkgbWFudWFsbHkgYXBwbGllZCBpdCBkdWUgdG8gdGhlIHJlb3JkZXJpbmcKb2YgdGhl
IGZpbGUgd2hpY2ggc2xpcHBlZCBpbiwgc28gSSBlZGl0ZWQgdGhlIGNvbW1pdCBhbmQgcHVzaGVk
IC1mCnJpZ2h0IGJlZm9yZSB0YWdnaW5nLgoKVGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDQ0YzAyNmE3M2JlODAzOGYwM2RiZGVlZjAyOGI2NDI4ODBj
ZjE1MTE6CgogIExpbnV4IDYuNC1yYzMgKDIwMjMtMDUtMjEgMTQ6MDU6NDggLTA3MDApCgphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMt
Zm9yLTYuNC1yYzUKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjNGQyOGUzMGE4ZDBi
OTc5ZTQwMjk0NjVhYjhmMzEyYWI2Y2UyNjQ0OgoKICBtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IGRv
bid0IHNldCB0aGUgTkFORCBmcmVxdWVuY3kgc2VsZWN0ICgyMDIzLTA2LTAxIDE4OjEyOjMzICsw
MjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpNVEQgY29yZToKKiBNQUlOVEFJTkVSUzogQWRkIE1pY2hhbCBhcyByZXZp
ZXdlciBpbnN0ZWFkIG9mIE5hZ2EKKiBtdGRjaGFyOiBNYXJrIGJpdHMgb2YgaW9jdGwgaGFuZGxl
ciBub2lubGluZQoKTkFORCBjb250cm9sbGVyIGRyaXZlcnM6CiogbWFydmVsbDoKICAtIERvbid0
IHNldCB0aGUgTkFORCBmcmVxdWVuY3kgc2VsZWN0CiAgLSBFbnN1cmUgdGltaW5nIHZhbHVlcyBh
cmUgd3JpdHRlbgoqIGluZ2VuaWM6IEZpeCBlbXB0eSBzdHViIGhlbHBlciBkZWZpbml0aW9ucwoK
U1BJLU5PUiBjb3JlOgoqIEZpeCBkaXZpZGUgYnkgemVybyBmb3Igc3BpLW5vci1nZW5lcmljIGZs
YXNoZXMKClNQSS1OT1IgbWFudWZhY3R1cmVyIGRyaXZlcjoKKiBzcGFuc2lvbjogbWFrZSBzdXJl
IGxvY2FsIHN0cnVjdCBkb2VzIG5vdCBjb250YWluIGdhcmJhZ2UKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQXJuZCBCZXJn
bWFubiAoMik6CiAgICAgIG10ZDogcmF3bmFuZDogaW5nZW5pYzogZml4IGVtcHR5IHN0dWIgaGVs
cGVyIGRlZmluaXRpb25zCiAgICAgIG10ZGNoYXI6IG1hcmsgYml0cyBvZiBpb2N0bCBoYW5kbGVy
IG5vaW5saW5lCgpDaHJpcyBQYWNraGFtICgyKToKICAgICAgbXRkOiByYXduYW5kOiBtYXJ2ZWxs
OiBlbnN1cmUgdGltaW5nIHZhbHVlcyBhcmUgd3JpdHRlbgogICAgICBtdGQ6IHJhd25hbmQ6IG1h
cnZlbGw6IGRvbid0IHNldCB0aGUgTkFORCBmcmVxdWVuY3kgc2VsZWN0CgpNaWNoYWwgU2ltZWsg
KDEpOgogICAgICBNQUlOVEFJTkVSUzogQWRkIG15c2VsZiBhcyByZXZpZXdlciBpbnN0ZWFkIG9m
IE5hZ2EKClR1ZG9yIEFtYmFydXMgKDIpOgogICAgICBtdGQ6IHNwaS1ub3I6IHNwYW5zaW9uOiBt
YWtlIHN1cmUgbG9jYWwgc3RydWN0IGRvZXMgbm90IGNvbnRhaW4gZ2FyYmFnZQogICAgICBtdGQ6
IHNwaS1ub3I6IEZpeCBkaXZpZGUgYnkgemVybyBmb3Igc3BpLW5vci1nZW5lcmljIGZsYXNoZXMK
CiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0K
IGRyaXZlcnMvbXRkL210ZGNoYXIuYyAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKystLS0t
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmggfCAgOCArKysrLS0t
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgICAgICAgIHwgMTAgKysrKysr
LS0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAgICAgICAgICAgICAgIHwgIDUgKysr
Ky0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYyAgICAgICAgICAgICB8ICA0ICsrLS0K
IDYgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCm1yYXlu
YWxAeHBzLTEzOiB+L2xpbnV4LW5hbmQgW210ZC9maXhlc10kIAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
