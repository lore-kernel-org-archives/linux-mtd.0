Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5228BCCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgSrZdPIjNSHXqUddfKK8dwy3gqQdgKQIcoQGpHK5Rs=; b=GKzZpxk3LUONi9
	UIkzqFqj+YAIci4yljm8wwOv+vjWxD84PJ07oXTJDxMXqardhyj653/xiodwK3TTYxHsK8gAvqQa8
	rdK/4lstiZLYVDarB/8PZtNgVTFbJy94Rwv1ryNju1zq3OS9FBngBWA/smrRTcEt3r3Qeo6rUzfqm
	cck4tWiw9+juBhbgLasnyYvECAmZzaxtQhGK69jjsHHoJcYb2VBf8jq3/qX9EtEE43IKMtbZuFpjr
	BfW92cTEj220GqzE8s9rgAFpKoJqUrPW5eCScx9ukanv4GSOgTzdk+/bgo0XCoaWOQG0C3X8I/xU6
	e1NFxz//gZfxizIQM8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUmS-00000002BgF-2ofR;
	Wed, 22 Oct 2025 09:05:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUmP-00000002Bex-14a1
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:05:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF30D1A15D0;
	Wed, 22 Oct 2025 09:05:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86033606DC;
	Wed, 22 Oct 2025 09:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D3DE102F2424;
	Wed, 22 Oct 2025 11:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761123910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6yeLxlHF1ExWB5DZwZRxEYNkaxzkbdpoSKjymzjUJmE=;
	b=n2Z4tkf6o5U9c0lipN+o3XifhRcaEsIcWUSNkB4T/+bkjiLI0YovdjgK0wcw/J7+w+RMbP
	XXXJAB5sk0AgXJ84LV6w1+bAF7TfewA7Ru9eQQUYtqRfc5Mz8hPSjomJ0vzJimC6f6WSwx
	/RxHncJUqmBumvBArZb2tIXudRxorWrI/LUSkof3LpNucgeWNsVEkRp5WEsVVZK+YJCiDt
	2WpyPYSkFUyw42NtZYWtYA8vW4rVY8qo9IfQUOl2gFlEZkXCUFjf+zwFrTIIUZqhmy41P1
	zPVa0GTV+6s2TmWVoPZN/nw4n5xoyv9dLP8khMJ85WIi/0FKybbmO1lGqDabAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/15] mtd: rawnand: sunxi: introduce ecc_mode_mask
 in sunxi_nfc_caps
In-Reply-To: <20251020101311.256819-8-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:03 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-8-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:05:02 +0200
Message-ID: <87jz0ntigx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_020513_461657_364E8130 
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

SGkgUmljaGFyZCwKCk9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MDMgKzAyLCBSaWNoYXJkIEdlbm91
ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgSDYvSDYxNiBFQ0Nf
TU9ERSBmaWVsZCBpcyBub3QgYXQgdGhlIHNhbWUgb2Zmc2V0LCBhbmQgaGFzIG5vdCB0aGUKPiBz
YW1lIHNpemUuCj4gU28gbW92ZSB0aGUgbWFzayBpbnRvIHN1bnhpX25mY19jYXBzLgo+Cj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmlj
aGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1
bnhpX25hbmQuYyB8IDEzICsrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBp
bmRleCA3MGM5NDA4NDBkZGEuLjQxMTgzMDdjYWMxNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54
aV9uYW5kLmMKPiBAQCAtMjksOCArMjksOSBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+ICAKPiAtLyogbm9uIGNvbXBpbGUtdGltZSBm
aWVsZCBnZXQgKi8KPiArLyogbm9uIGNvbXBpbGUtdGltZSBmaWVsZCBnZXQvcHJlcCAqLwo+ICAj
ZGVmaW5lIGZpZWxkX2dldChfbWFzaywgX3JlZykgKCgoX3JlZykgJiAoX21hc2spKSA+PiAoZmZz
KF9tYXNrKSAtIDEpKQo+ICsjZGVmaW5lIGZpZWxkX3ByZXAoX21hc2ssIF92YWwpICgoKF92YWwp
IDw8IChmZnMoX21hc2spIC0gMSkpICYKPiAoX21hc2spKQoKVGhpcyBjb3VsZCBwcm9iYWJseSBy
ZXF1aXJlIGEgbWVudGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIGFzIGZvciB0aGUKaW50cm9k
dWN0aW9uIG9mIHRoZSBmaWVsZF9nZXQoKSBoZWxwZXIuCgpObyBuZWVkIHRvIHJlc2VuZCBqdXN0
IGZvciB0aGlzIGVpdGhlci4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
