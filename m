Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8729FF45A0B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hxC0xobmWo2jh5x0NRTy7bbwuK1jKA2haiH6TifrhB0=; b=lkAE7zDTjrG++s
	aH6Xc409Sm9XfFX5svkvUyP+nojxDq0k1fp9L1SYonDiJj03ZmmmiGL0MoRa1I2FoG2cQYa5xsoF0
	XltsEV6/wI8tVlOFcbrYZK39xlFVkDiVEITw82KkocMQu5B5y/xMrK/BHKjHjBQ71YqybQpao18sN
	aF1pZMQI++8Gg0ohhSrdGsCvgPceH+i8UuyywrBH56/OiG2iyRQWEk51GENdUbEHXYEsLg6xm3VK+
	rzPEf+T0cl8Ssd50AmBrwAEvXKoenvCgdgxCutgClHICNQk2dEg6RwUGxDltMm+h8rMT3zW68MMiY
	DwZSUBuTEuKcB4NtyvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr9-0000000CdRn-16W8;
	Fri, 10 Apr 2026 17:41:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr5-0000000CdPc-0XJ8
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:41:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04D5E4E429B2;
	Fri, 10 Apr 2026 17:41:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB56C603F0;
	Fri, 10 Apr 2026 17:41:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD7E410450081;
	Fri, 10 Apr 2026 19:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775842874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Qa3dANP/wUXrWJWcHM3dhr+Gc2Tpco6bvezFZtBbQdE=;
	b=vT69zDeAndg5h0raB0P5pQzNrt6L8GftILEkWWHwb0H0lFBAAlBPYxRjgbavg9DxplhyPq
	4cZm2hsApHPgcSW9CHNBXPe+gGaTLqWOKM+fKY2iXd4puHOmrb/DkK6ydHXYMy+/zMlkyZ
	TqXrmSnexaI+SrzDWXJo9/P/71bb3g3xq3wsR8ifvFnzxEtLwUpu6X7mQXcRwKcgWDF8yG
	BaUxAWC3d/hDISCtQ1ZrvGaKvAGEl0M2Ui2mDZkZf+S5tORyHtFQ2PQ3ytPkdHKLGhBQH0
	rQFLlHeQ1QZh5P33xV9uBiG2SpgkN5VjQ8ZUQgHaUaq30SQy5GW4P2KznryiOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] mtd/spi: Fix Winbond W35N02JW / W35N04JW support
Date: Fri, 10 Apr 2026 19:41:00 +0200
Message-Id: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQqayuEi1Kp5qNxggVSHdPW
 r7F/xkSCVOCscogdHHiGAp0XYE7lrATsi8Go0ynGq3w5rDG4LFDPaA4jdF7Qbv0dh1617TGQWl
 PoY2f/zvN7/sBJVEAqWcAAAA=
X-Change-ID: 20260410-winbond-6-19-rc1-oddr-7a87b98c452c
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_104119_302365_AB158ECF 
X-CRM114-Status: GOOD (  10.61  )
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

V2luYm9uZCBjaGlwcyBXMzVOMDJKVyBhbmQgVzM1TjA0SlcgZGlmZmVyIHNsaWdodGx5IGZyb20g
VzM1TjAxSlcuIEFzCnRoZXkgaGF2ZSBtb3JlIGJsb2NrcywgdGhleSByZXF1aXJlIGEgY291cGxl
IG1vcmUgYml0cyB0byBmdWxseSBhZGRyZXNzCnRoZSB3aG9sZSBkZXZpY2UuIFRoZXNlIGFkZHJl
c3MgYml0cyBoYXZlIGJlZW4gc3R1ZmZlZCBhdCB0aGUgZW5kIG9mIHRoZQpjb21tYW5kIGN5Y2xl
cywgd2hpY2ggaXMgbm9uIHN0YW5kYXJkLCBhbmQgdGhpcyBpcyBzb21ldGhpbmcgSSBkaWRuJ3QK
Y2F0Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLgoKU3R1ZmZpbmcgdGhlc2UgYWRkcmVzcyBiaXRzIHRo
ZXJlIGltcGxpZXMgdGhlIGNyZWF0aW9uIG9mIGEgbmV3IHNwaS1tZW0KY29tbWFuZCB0ZW1wbGF0
ZS4KCldoaWxlIHRlc3RpbmcsIEkgcmVhbGl6ZWQgb25lIG9mIG15IGZvcm1lciBwYXRjaGVzIGlu
IHRoZSBDYWRlbmNlCmNvbnRyb2xsZXIgd2FzIHRvdGFsbHkgd3JvbmcsIHNvIGl0IG5lZWRzIHRv
IGJlIHJldmVydGVkLgoKTWFyaywgaWYgaXQgaXMgbm90IHRvbyBsYXRlLCB5b3UgbWF5IHdhbnQg
dG8gcHVsbCBpbiB0aGUgZmlyc3QgMgpwYXRjaGVzLCBhbmQgSSB3aWxsIGFwcGx5IHRoZSBTUEkg
TkFORCBwYXRjaGVzIGluIGEgZml4ZXMgUFIgYWZ0ZXIgLXJjMQppcyBvdXQuCgpTb3JyeSBmb3Ig
dGhlIG1lc3MgOi0pCgpUaGFua3MsCk1pcXXDqGwKClNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQpNaXF1ZWwgUmF5bmFsICg1KToKICAg
ICAgc3BpOiBjYWRlbmNlLXFzcGk6IFJldmVydCB0aGUgZmlsdGVyaW5nIG9mIGNlcnRhaW4gb3Bj
b2RlcyBpbiBPRFRSCiAgICAgIHNwaTogc3BpLW1lbTogQWRkIGEgcGFja2VkIGNvbW1hbmQgb3Bl
cmF0aW9uCiAgICAgIG10ZDogc3BpbmFuZDogQWRkIHN1cHBvcnQgZm9yIHBhY2tlZCByZWFkIGRh
dGEgT0RUUiBjb21tYW5kcwogICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IFNldCB0aGUgcGFj
a2VkIHBhZ2UgcmVhZCBmbGFnIHRvIFczNU4wMi8wNEpXCiAgICAgIG10ZDogc3BpbmFuZDogd2lu
Ym9uZDogRml4IE9EVFIgd3JpdGUgVkNSIG9uIFczNU54eEpXCgogZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL210
ZC9uYW5kL3NwaS93aW5ib25kLmMgICAgfCAgNiArKystLS0KIGRyaXZlcnMvc3BpL3NwaS1jYWRl
bmNlLXF1YWRzcGkuYyB8ICA0IC0tLS0KIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgICAg
ICB8ICA3ICsrKysrKysKIGluY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaCAgICAgICB8ICA4ICsr
KysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQotLS0KYmFzZS1jb21taXQ6IGEyZTc4NmNiNzExZjg4NTA5YzM5YjgyZDhlNWE3ZTUyYjE2OWIx
YTYKY2hhbmdlLWlkOiAyMDI2MDQxMC13aW5ib25kLTYtMTktcmMxLW9kZHItN2E4N2I5OGM0NTJj
CgpCZXN0IHJlZ2FyZHMsCi0tIApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
