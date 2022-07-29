Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F94C00144
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPbXXIPdgRdUEdw5BQ8dWYPZeoAkRX3lJ95OrMdFPh0=; b=MJnUBOihPoxGyd
	JalttpsyEDReUWHgc97kGOb14j0e3cT7XbCiykzhpJEKDNnKyHmx6rBD3og575Iu+X4GRPTalmkjc
	lU/cOBk/JHJudozbNpc/qyW86/CjkQWobudNjgF9w5Ph8PIbS6rbaOtDp0UQclkLYureZz8UVzHGB
	GENmsoNlZCNw76Hv3yIlmUPnEBLAutwiFndIbiZ5S7vLhpWblAuk9ElTxC+BKxESsMdN4/qd8tFvb
	ePTtP69y2Q+AaIfv8Ll/Rl/zpTG7UIo6cVCCivs3W8xU7rTcqcFuGXdZp5Vyt8+sskPoquxkWwRwZ
	RuXoLcq121sZXoQ8aPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM90-003jar-Eh; Fri, 29 Jul 2022 09:18:54 +0000
Received: from vps.slashdirt.org ([144.91.108.218])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM7y-003ixi-9U
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 09:17:51 +0000
Received: from supercopter.milliways.lan (unknown [IPv6:2a01:e0a:4ca:1080:42a8:f0ff:fe28:2844])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vps.slashdirt.org (Postfix) with ESMTPSA id 2F8D160463;
	Fri, 29 Jul 2022 11:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 vps.slashdirt.org 2F8D160463
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=slashdirt.org; s=mail;
	t=1659086259; bh=qeA1JbSLyN+uuH/86TfIzQPn1whVMrCTt24XM4GDnw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oxu0bLyB33fzu15H2OX7cXHl59iWZRo6XE3gNE6PqLVz8JXhwXm8oh6PpftJdR2Bz
	 iGx/G/4eoVeaoO4ybGsQZLh3WTHcaYbuqYnESU6rtxW0E7QP/LKpcRk1zehBR1rR1l
	 PaZHUX558fOELJ9iAH+5aSeCcLYIZwURygIt6GOE=
From: =?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	git@johnthomson.fastmail.com.au,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
Subject: [PATCH v3 3/3] mtd: spi-nor: allow overriding uniform erase
Date: Fri, 29 Jul 2022 11:16:36 +0200
Message-Id: <20220729091636.59287-4-hacks+kernel@slashdirt.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
References: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_021750_606256_38B0C575 
X-CRM114-Status: GOOD (  13.25  )
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

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IENPTkZJR19NVERfU1BJX05PUl9VU0VfVkFSSUFC
TEVfRVJBU0Ugb3B0aW9uCndoaWNoIGZvcmNlcyBhbiBTUEkgTk9SIG10ZCBkZXZpY2UgdG8gdXNl
IG5vbi11bmlmb3JtIGVyYXNlLCBlbmFibGluZwoob24gc3VwcG9ydGluZyBoYXJkd2FyZSkgdG8g
Y29tcGxldGUgZXJhc2Ugb3BlcmF0aW9ucyB1c2luZyBhbGwKYXZhaWxhYmxlIGVyYXNlc2l6ZXMg
dGhyb3VnaCBzcGlfbm9yX2VyYXNlX211bHRpX3NlY3RvcnMoKS4KClRoZSBtYWpvcml0eSBvZiBj
dXJyZW50IFNQScKgTk9SIGRldmljZXMgc3VwcG9ydCBtdWx0aXBsZSBlcmFzZXNpemVzOgppbnN0
ZWFkIG9mIGZvcmNpbmcgYWxsIG9wZXJhdGlvbnMgdG8gdXNlIDRLIGVyYXNlIHNpemUgZm9yIGV2
ZXJ5dGhpbmcKKHVzaW5nIENPTkZJR19NVERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUykgd2hlbiB3
cml0ZSBhY2Nlc3MgdG8gYQptaW5vci1hbGlnbmVkIHBhcnRpdGlvbiBpcyBuZWVkZWQsIHRoaXMg
cGF0Y2ggYWxsb3dzIHRoZSBrZXJuZWwgdG8gdXNlCnRoZSBsYXJnZXN0IHN1aXRhYmxlIGVyYXNl
IHNpemUgZm9yIGEgZ2l2ZW4gb3BlcmF0aW9uLCB0aHVzIGltcHJvdmluZwpwZXJmb3JtYW5jZS4K
ClNpZ25lZC1vZmYtYnk6IEpvaG4gVGhvbXNvbiA8Z2l0QGpvaG50aG9tc29uLmZhc3RtYWlsLmNv
bS5hdT4KU2lnbmVkLW9mZi1ieTogVGhpYmF1dCBWQVLDiE5FIDxoYWNrcytrZXJuZWxAc2xhc2hk
aXJ0Lm9yZz4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcgfCAxMCArKysrKysrKysr
CiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmln
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnCmluZGV4IDI0Y2QyNWRlMi4uMDlkZjlmMWE4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcKKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9LY29uZmlnCkBAIC0xMCw2ICsxMCwxNiBAQCBtZW51Y29uZmlnIE1URF9TUElf
Tk9SCiAKIGlmIE1URF9TUElfTk9SCiAKK2NvbmZpZyBNVERfU1BJX05PUl9VU0VfVkFSSUFCTEVf
RVJBU0UKKwlib29sICJEaXNhYmxlIHVuaWZvcm1fZXJhc2UgdG8gYWxsb3cgdXNlIG9mIGFsbCBo
YXJkd2FyZSBzdXBwb3J0ZWQgZXJhc2VzaXplcyIKKwlkZXBlbmRzIG9uICFNVERfU1BJX05PUl9V
U0VfNEtfU0VDVE9SUworCWRlZmF1bHQgbgorCWhlbHAKKwkgIEFsbG93IG1peGVkIHVzZSBvZiBh
bGwgaGFyZHdhcmUgc3VwcG9ydGVkIGVyYXNlc2l6ZXMsCisJICBieSBmb3JjaW5nIHNwaV9ub3Ig
dG8gdXNlIHRoZSBtdWx0aXBsZSBlcmFzZXJlZ2lvbnMgY29kZSBwYXRoLgorCSAgRm9yIGV4YW1w
bGU6IEEgNjhLIGVyYXNlIHdpbGwgdXNlIG9uZSA2NEsgZXJhc2UsIGFuZCBvbmUgNEsgZXJhc2UK
KwkgIG9uIHN1cHBvcnRpbmcgaGFyZHdhcmUuCisKIGNvbmZpZyBNVERfU1BJX05PUl9VU0VfNEtf
U0VDVE9SUwogCWJvb2wgIlVzZSBzbWFsbCA0MDk2IEIgZXJhc2Ugc2VjdG9ycyIKIAlkZWZhdWx0
IHkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMKaW5kZXggYmFmZDMzOTZlLi5iNGI1MzlhOWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
CkBAIC0xMDQ4LDYgKzEwNDgsOCBAQCBzdGF0aWMgdTggc3BpX25vcl9jb252ZXJ0XzN0bzRfZXJh
c2UodTggb3Bjb2RlKQogCiBzdGF0aWMgYm9vbCBzcGlfbm9yX2hhc191bmlmb3JtX2VyYXNlKGNv
bnN0IHN0cnVjdCBzcGlfbm9yICpub3IpCiB7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9T
UElfTk9SX1VTRV9WQVJJQUJMRV9FUkFTRSkpCisJCXJldHVybiBmYWxzZTsKIAlyZXR1cm4gISFu
b3ItPnBhcmFtcy0+ZXJhc2VfbWFwLnVuaWZvcm1fZXJhc2VfdHlwZTsKIH0KIAotLSAKMi4zMC4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
