Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE65E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAi1YeZmiDPETfcMrTAZaVglYA9/GaDAmfV01iQOUEU=; b=Sp6zcM8mbqf3KN
	RhbQUt3Z5nu9NMrM6rn3rKyjesfsE2Q7xQYTYYhoKoj5dHbyuHfdx8q332ug28F1ctE2SsnbIpD+I
	fX+oeMFYwIgthnmoqVjNzxEgtNAU5jdvA/RlvIXESj7oJLSD1iz0Zp7zC2xQp29A46Ct34NKJ18bz
	VrzagvpxeRMxKC7yAgNBgOGprmZGDHUo3YmG0YzhYLMLrZOzBp+7FYp1iwvqDNdmleQnK0xLC3BMX
	mMe7ma3zH1+aSwGar+DznJRp0gzPe2KKnRjOTiv0CNoO9x1CZAFrn2GpMyDiEuOkjv9nV1TRzaHT1
	rPx1JahMTR3ndNh/rbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGo9-0000000FsMH-2SLW;
	Fri, 10 Jan 2025 15:20:21 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGHU-0000000FgXX-2RCA
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jan 2025 14:46:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60ED21BF209;
	Fri, 10 Jan 2025 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lq1eamULlCmRyHyCPksQXtjcgP0Gfwj+Ra+BImrmBcA=;
	b=I36JP0l8C3qWbjoakKvRungkRnThzZAPs29qRxzq/O7yjjaX3N3osUbmGLZeExN1HOPfhX
	6OrDTrjVt85P4MX4Zia/kmkWVZis/3uZD7BmOV8YmO3E0bu6FJ4SmfSAwmv/Aex5jaWMBm
	Rr0aQcp7TTh+wlACobcihnSC0tbli0GvDPjNxEo/KAgDsfzc+pj9ZTL+85JV9btMcYc4a+
	K6eKqbyD0pgDvFdtWHXFmWviH8OomEFzU7xAqStVbfne/FvUOciWiN17b1Nt9AN+jPVQxN
	tdCayUa2dDGLMCaGe9uLnvs10XBgxg3EL92H58UuHlhgfrxc/BomwQyTSsOsyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
In-Reply-To: <956f0490-2e47-4655-ab10-a10ef790cfad@wanadoo.fr> (Christophe
	JAILLET's message of "Thu, 9 Jan 2025 21:23:13 +0100")
References: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
	<20250109-winbond-6-12-rc1-nor-volatile-bit-v2-2-e8cd0812fe4e@bootlin.com>
	<956f0490-2e47-4655-ab10-a10ef790cfad@wanadoo.fr>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 15:46:32 +0100
Message-ID: <87cyguafqv.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064636_763859_F0B197CA 
X-CRM114-Status: GOOD (  10.22  )
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

SGkgQ2hyaXN0b3BoZSwKCk9uIDA5LzAxLzIwMjUgYXQgMjE6MjM6MTMgKzAxLCBDaHJpc3RvcGhl
IEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKCj4gTGUgMDkv
MDEvMjAyNSDDoCAyMToxNywgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+PiBBZGQgc3VwcG9y
dCBmb3IgV2luYm9uZCB3MjVxMDJqdiBzcGktbm9yIGNoaXAgd2hpY2ggc2hhcmVzIG1vc3Qgb2YK
Pj4gdzI1cTAxanYncyBzcGVjaWZpY2l0aWVzIGFzLCB0aGlzIHRpbWUsIHRoZSBjaGlwIGlzIG1h
ZGUgb2YgNCBkaWZmZXJlbnQKPj4gZGllcy4KPj4gTGluazoKPj4gaHR0cHM6Ly93d3cud2luYm9u
ZC5jb20vcmVzb3VyY2UtZmlsZXMvVzI1UTAySlZfRFRSJTIwUmV2RCUyMDA3MDkyMDI0JTIwUGx1
cy5wZGYKPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KPj4gLS0tCj4KPiAuLi4KPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3Bp
LW5vci93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+PiBpbmRleCBh
NGMwZDk5ZGRlNGZjZDJiMTIzZWI3ZGVkNGY3ODIyMTEwYzZhNGFlLi5kODI5NjJlMGJmN2Q4ZTAw
YjMwNWZkODM4Mjc0YTU4YzM0ZGQ2YzRlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL3dpbmJvbmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+PiBA
QCAtMzA1LDYgKzMwNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gd2luYm9u
ZF9ub3JfcGFydHNbXSA9IHsKPj4gICAJfSwgewo+PiAgIAkJLmlkID0gU05PUl9JRCgweGVmLCAw
eDcwLCAweDE5KSwKPj4gICAJCS5uYW1lID0gIncyNXEyNTZqdm0iLAo+PiArCX0sIHsKPj4gKwkJ
LmlkID0gU05PUl9JRCgweGVmLCAweDcwLCAweDIyKSwKPj4gKwkJLyogVzI1UTAySlYgKi8KPgo+
IE5pdHBpY2s6IFRoZSBwbGFjZSBvZiB0aGUgY29tbWVudCBpcyBub3QgY29uc2lzdGVudCB3aXRo
IHBhdGNoIDEvMi4KClRoYXQncyByaWdodCwgSSdsbCBjb3JyZWN0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
