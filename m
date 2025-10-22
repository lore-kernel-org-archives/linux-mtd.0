Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E35CCCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=louERCJCNBtkJRVBGJ0116318E+jjJSP98j8wz5nMbQ=; b=Vj3NJDa4KFwMZ/
	VrHoe3VlX+By6hHWtoqi5vQBEIQ8DRTjncKIaEdWaA8UA/ick3qb+KEUJs/+BccohkkSFD01Jq+p2
	9PbH3kxS2HGlSH0PfHTB2iYcpSeERuDuofUJnf/wKKe9hwPtdz/qqae6Bu5r8aOJpRSVBmtBXrzDq
	7qQOcUZepHQO+5igXBu2WdOGCKiVDbMxmOe6aWuSyVk/noyljEbH3FUzn8NTndFiHCUVFUIfWKdiX
	CmMo9YnzF0t14LbyxTo0qwxdWTDumkimM+7nWBZoC6N5HR2v7C2Z3ZNTj08rb7gnVOOFQZFTgn2nC
	yNQ0z7E7i1gGrh3VE3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUk3-00000002B2D-07MS;
	Wed, 22 Oct 2025 09:02:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUjz-00000002B0k-0shT
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:02:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 76B4E4E4126D;
	Wed, 22 Oct 2025 09:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36F36606DC;
	Wed, 22 Oct 2025 09:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00CFE102F2424;
	Wed, 22 Oct 2025 11:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761123760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oDRCUkMoCDby5S/aZrDjp1VXkak+fQdoG5RdkGXcB4Y=;
	b=N3c3SpV57p5/GKS5PSw7jmNA1udiZ4jXASbHWVwRfwDneehJCGrqoNujIJH7dGUKy0P8SW
	Gwrpaj8sBhW97sO2TJlj8vA7fDjThqucjwNAkTfRgMBJkr8p00UXfw91V42W6vvZ5JfYG7
	/JcxDVomjRkPhkCUi0EjhpriqPlXzOYXf7jxDf/1NgdjYTNRQTC49WHgvkdL2eG1X9H7uy
	AHbENFrT5qNHYN54ydrdcpWeFSohXnMloWLAIJPKC6d0LrS9ldokxcFZ5I5ZRpgMDEtssH
	8QdrA8u6UmMSsYRO7b6XVxk3mYwdc6y3gp651iSnUuhM67xdB46zehcfJ1INfw==
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
Subject: Re: [PATCH v3 05/15] mtd: rawnand: sunxi: rework pattern found
 registers
In-Reply-To: <20251020101311.256819-6-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:01 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-6-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:02:36 +0200
Message-ID: <87plaftikz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_020243_381111_D1C8714C 
X-CRM114-Status: GOOD (  12.89  )
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

SGkgUmljaGFyZCwKCk9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MDEgKzAyLCBSaWNoYXJkIEdlbm91
ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiBINi9INjE2LCB0aGUg
cmVnaXN0ZXIgRUNDX1BBVF9GT1VORCBpcyBhdCBpdHMgb3duIGFkZHJlc3MsIGFuZCBub3QKPiBw
YXJ0IG9mIEVDQyBzdGF0dXMgcmVnaXN0ZXIuCj4gU28sIGludHJvZHVjZSB0aGUgcGF0dGVybiBm
b3VuZCByZWdpc3RlciBvZmZzZXQgaW4gc3VueGlfbmZjX2NhcHMsIGFsb25nCj4gd2l0aCBpdHMg
bWFzay4KPgo+IEFsc28sIGludHJvZHVjZSBhIG5vbiBjb21waWxlLXRpbWUgZmllbGRfZ2V0KCkg
YmVjYXVzZSBGSUVMRF9HRVQoKSBhbmQKPiB1MzJfZ2V0X2JpdHMoKSBkb24ndCB3b3JrIHdpdGgg
bm9uIGNvbXBpbGUtdGltZSBjb25zdGFudC4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
L2NvdmVyLjE3Mzk1NDA2NzkuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlLwo+Cj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFy
ZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhp
X25hbmQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jCj4gaW5kZXggOGY1ZDhkZjE5ZTMzLi40Y2ZiNWQzZTljMDYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gQEAgLTI5LDYgKzI5LDkgQEAKPiAgI2luY2x1ZGUg
PGxpbnV4L2lvcG9sbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPiAgCj4gKy8qIG5v
biBjb21waWxlLXRpbWUgZmllbGQgZ2V0ICovCj4gKyNkZWZpbmUgZmllbGRfZ2V0KF9tYXNrLCBf
cmVnKSAoKChfcmVnKSAmIChfbWFzaykpID4+IChmZnMoX21hc2spIC0KPiAxKSkKCkkgc2VlIHRo
ZXJlIGFyZSBhbHJlYWR5IDI2IHVzZXJzIGZvciB0aGlzLCBsZXQncyBob3BlIGl0IGdldHMgbWVy
Z2VkCnNvb24gYW5kIHRoaXMgb25lIGRyb3BwZWQuCgpOb3QgYSBibG9ja2VyIGZvciBtZS4KCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
