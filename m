Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64035CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/0D/P0ZueeuLbzGD+h6n/Zl1Z61HGmN6qN6/lvEmZeg=; b=UnGEgOe0Tz+CvJ
	BHkLz7ZcY6/kL8hxZMdnUwC3oDpjvSjuwShVxGpSc2VTHM9OZHf+f6hQqke4c89nHbyrd4CR73CHw
	0UkLT74d5HLH1PNXZXN0fKBBtyJtNcjEjW27zYSePAfvcWe8aV+TgrQhbwXUFOZ1ahEVkmExPzFoZ
	U0L1Mkrralm4N1xE3m7KPQyd07wT0vFgMkLCfWxxxhW/HLsooCPXuOjCHQcnDCXnxDN4WOb6mYCv1
	gW4nDRKkem2NmXofaVYWlluZdEWwtwIsRhDNwSiXAPYJtzz8NBDf1d64KzJlmOgLEaioa/FIS7v0z
	HpUD/ljULdngTwe181YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvE-00000006U8y-1Meq;
	Fri, 31 Oct 2025 17:28:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsv8-00000006U3Y-0qNy
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E4F1F1A17C2;
	Fri, 31 Oct 2025 17:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF75660704;
	Fri, 31 Oct 2025 17:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39D5C11818007;
	Fri, 31 Oct 2025 18:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Fq+SD7dZXVNCzjRnu2v6o1CWVJn5BJ/WuAi9xUnaeHo=;
	b=OUydQVO8Cu07f+UP4SO047uIenuskYJFzXnEozwc4WSizjn254jbRDCjiA0n+CBQkAiuU7
	l3bhqYGvEARuqGTfgHwtlkmu0Zll4M+fAMEIFaY9vjnkSrgAr9vdE+JQ/LIDd0mcXCkcZ0
	O1h6Em1pdCHZW56wOKtvY6Ua9knPQS5bNz0iWb+Gp+CKKyDfBLRzwstlqvAZAdO+ABhW8P
	gauuyTchQm49P4yD+hBXGMhWMaG36ahLdbldvEUCwIQmQb39BlLZlrixN2jpasBxVO+gfj
	CkFibuXIIkpYFYTfoJGl2eri76ONht8Co6e7kTLtN6Jx7c1MNK+uG4KmWvu6jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/28] mtd: spinand: Octal DTR support
Date: Fri, 31 Oct 2025 18:26:44 +0100
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFTxBGkC/x3MOwqFQAxA0a1IagMT/7qVh4WaqGlmJAM+Qdy7g
 +Up7r0hiqlEGLIbTE6NGnwC5Rks++Q3QeVkKFxRkysJ/+rn4BnPBqlFWwgDs2HZ1aurmq6auIc
 UHyarXt/4Nz7PCxPSFORoAAAA
X-Change-ID: 20251031-winbond-v6-17-rc1-oddr-385f04684ad9
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102814_389946_572B565C 
X-CRM114-Status: GOOD (  10.52  )
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

SGVsbG8sCgpUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIDhELThELThEIGluIFNQSSBOQU5E
LCB3aGljaCBjYW4gYWxyZWFkeSBiZQpsZXZlcmFnZWQgd2l0aG91dCBhbnkgU1BJIGNoYW5nZXMg
YXMgY29udHJvbGxlcnMgYWxyZWFkeSBoYXZlIHRoaXMKc3VwcG9ydCBmb3Igc29tZSBTUEkgTk9S
IGRldmljZXMuCgpUaGUgc2VyaWVzIGlzIGEgYml0IGxvbmcgYmVjYXVzZSBtYW55IHByZXBhcmF0
aW9uIHBhdGNoZXMgd2VyZSBuZWVkZWQKaW4gb3JkZXIgdG8gaGF2ZSBhIGNsZWFuIDhELThELThE
IGludHJvZHVjdGlvbiAob25lIG9mIHRoZSBsYXN0CnBhdGNoZXMpLCBidXQgSSBiZWxpZXZlIHRo
ZSBzcGxpdCBpcyB3b3J0aCBpdC4KCkFtb25nIHRoZSBmZXcgc3BpLW1lbSBwYXRjaGVzLCB0aGV5
IGFyZSBuZWVkZWQgZm9yIGJ1aWxkaW5nIHRoZSBTUEkgTkFORApjaGFuZ2VzIChlc3BlY2lhbGx5
IHRoZSBPRFRSIGludHJvZHVjdGlvbiBhdCB0aGUgZW5kKSBhbmQgdGhlcmVmb3JlIGFuCmltbXV0
YWJsZSB0YWcgd2lsbCBiZSBuZWVkZWQgZm9yIG1lcmdpbmcgaW4gdGhlIE1URCB0cmVlICh1bmxl
c3MgYWxsIHRoZQpzZXJpZXMgZ29lcyB0aHJvdWdoIE1URCBkaXJlY3RseSBvZmMpLgoKVGhlcmUg
aXMgYSBiZW5jaG1hcmsgaW4gdGhlIGxhc3QgV2luYm9uZCBwYXRjaCwgd2UgZ2V0ICs1NSUgcmVh
ZCBzcGVlZAphbmQgKzI2JSB3cml0ZSBzcGVlZCB3aXRoIHRoaXMgc2VyaWVzLCBhdCAyNU1IeiEK
CiAgICAxUy04Uy04UzoKICAgIAogICAgICAgIyBmbGFzaF9zcGVlZCAvZGV2L210ZDAgLWMxIC1k
CiAgICAgICBlcmFzZWJsb2NrIHdyaXRlIHNwZWVkIGlzIDc1MjkgS2lCL3MKICAgICAgIGVyYXNl
YmxvY2sgcmVhZCBzcGVlZCBpcyAxNTA1OCBLaUIvcwogICAgCiAgICA4RC04RC04RDoKICAgIAog
ICAgICAgIyBmbGFzaF9zcGVlZCAvZGV2L210ZDAgLWMxIC1kCiAgICAgICBlcmFzZWJsb2NrIHdy
aXRlIHNwZWVkIGlzIDk0ODEgS2lCL3MKICAgICAgIGVyYXNlYmxvY2sgcmVhZCBzcGVlZCBpcyAy
MzI3MiBLaUIvcwoKSSBhbSBleGNpdGVkIHRvIHNlZSB0aGlzIGZpbmFsbHkgdXBzdHJlYW0hIE5l
eHQgc3RlcCB3aWxsIGJlIHRvIHNlZSBUSSdzClBIWSB0dW5pbmcgc2VyaWVzIGZyb20gU2FudGhv
c2ggaW4gY29uanVuY3Rpb24gd2l0aCB0aGlzIG9uZSB0byBvcGVyYXRlIGF0Cm1heGltdW0gc3Bl
ZWQuCgpUaGFua3MhCk1pcXXDqGwKClNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQpNaXF1ZWwgUmF5bmFsICgyOCk6CiAgICAgIHNwaTog
c3BpLW1lbTogTWFrZSB0aGUgRFRSIGNvbW1hbmQgb3BlcmF0aW9uIG1hY3JvIG1vcmUgc3VpdGFi
bGUKICAgICAgc3BpOiBzcGktbWVtOiBDcmVhdGUgYSByZXBlYXRlZCBhZGRyZXNzIG9wZXJhdGlv
bgogICAgICBzcGk6IHNwaS1tZW06IExpbWl0IG9jdGFsIERUUiBjb25zdHJhaW50cyB0byBvY3Rh
bCBEVFIgc2l0dWF0aW9ucwogICAgICBtdGQ6IHNwaW5hbmQ6IEZpeCBrZXJuZWwgZG9jCiAgICAg
IG10ZDogc3BpbmFuZDogQWRkIG1pc3NpbmcgY2hlY2sKICAgICAgbXRkOiBzcGluYW5kOiBSZW1v
dmUgc3RhbGUgZGVmaW5pdGlvbnMKICAgICAgbXRkOiBzcGluYW5kOiBVc2Ugc3RhbmRhcmQgcmV0
dXJuIHZhbHVlcwogICAgICBtdGQ6IHNwaW5hbmQ6IERlY291cGxlIHdyaXRlIGVuYWJsZSBhbmQg
d3JpdGUgZGlzYWJsZSBvcGVyYXRpb25zCiAgICAgIG10ZDogc3BpbmFuZDogQ3JlYXRlIGFuIGFy
cmF5IG9mIG9wZXJhdGlvbiB0ZW1wbGF0ZXMKICAgICAgbXRkOiBzcGluYW5kOiBNYWtlIHVzZSBv
ZiB0aGUgb3BlcmF0aW9uIHRlbXBsYXRlcyB0aHJvdWdoIFNQSU5BTkRfT1AoKQogICAgICBtdGQ6
IHNwaW5hbmQ6IENvbnZlcnQgdmVuZG9yIGRyaXZlcnMgdG8gU1BJTkFORF9PUCgpCiAgICAgIG10
ZDogc3BpbmFuZDogbWFjcm9uaXg6IENvbnZlcnQgdmVuZG9yIHNwZWNpZmljIG9wZXJhdGlvbiB0
byBTUElOQU5EX09QKCkKICAgICAgbXRkOiBzcGluYW5kOiB3aW5ib25kOiBDb252ZXJ0IFcyNU4g
c3BlY2lmaWMgb3BlcmF0aW9uIHRvIFNQSU5BTkRfT1AoKQogICAgICBtdGQ6IHNwaW5hbmQ6IHdp
bmJvbmQ6IENvbnZlcnQgVzM1TiBzcGVjaWZpYyBvcGVyYXRpb24gdG8gU1BJTkFORF9PUCgpCiAg
ICAgIG10ZDogc3BpbmFuZDogTGlzdCB2ZW5kb3Igc3BlY2lmaWMgb3BlcmF0aW9ucyBhbmQgbWFr
ZSBzdXJlIHRoZXkgYXJlIHN1cHBvcnRlZAogICAgICBtdGQ6IHNwaW5hbmQ6IG1hY3Jvbml4OiBS
ZWdpc3RlciB2ZW5kb3Igc3BlY2lmaWMgb3BlcmF0aW9uCiAgICAgIG10ZDogc3BpbmFuZDogd2lu
Ym9uZDogUmVnaXN0ZXIgVzI1TiB2ZW5kb3Igc3BlY2lmaWMgb3BlcmF0aW9uCiAgICAgIG10ZDog
c3BpbmFuZDogd2luYm9uZDogUmVnaXN0ZXIgVzM1TiB2ZW5kb3Igc3BlY2lmaWMgb3BlcmF0aW9u
CiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDogRml4IHN0eWxlCiAgICAgIG10ZDogc3BpbmFu
ZDogd2luYm9uZDogUmVuYW1lIElPX01PREUgcmVnaXN0ZXIgbWFjcm8KICAgICAgbXRkOiBzcGlu
YW5kOiB3aW5ib25kOiBDb25maWd1cmUgdGhlIElPIG1vZGUgYWZ0ZXIgdGhlIGR1bW15IGN5Y2xl
cwogICAgICBtdGQ6IHNwaW5hbmQ6IEdhdGhlciBhbGwgdGhlIGJ1cyBpbnRlcmZhY2Ugc3RlcHMg
aW4gb25lIHNpbmdsZSBmdW5jdGlvbgogICAgICBtdGQ6IHNwaW5hbmQ6IEFkZCBzdXBwb3J0IGZv
ciBzZXR0aW5nIGEgYnVzIGludGVyZmFjZQogICAgICBtdGQ6IHNwaW5hbmQ6IFByb3BhZ2F0ZSB0
aGUgYnVzIGludGVyZmFjZSBhY3Jvc3MgY29yZSBoZWxwZXJzCiAgICAgIG10ZDogc3BpbmFuZDog
R2l2ZSB0aGUgYnVzIGludGVyZmFjZSB0byB0aGUgY29uZmlndXJhdGlvbiBoZWxwZXIKICAgICAg
bXRkOiBzcGluYW5kOiBXYXJuIGlmIHVzaW5nIFNTRFItb25seSB2ZW5kb3IgY29tbWFuZHMgaW4g
YSBub24gU1NEUiBtb2RlCiAgICAgIG10ZDogc3BpbmFuZDogQWRkIG9jdGFsIERUUiBzdXBwb3J0
CiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDogVzM1TiBvY3RhbCBEVFIgc3VwcG9ydAoKIGRy
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgICAgICB8IDI5NyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvZXNtdC5jICAgICAgIHwg
ICA0ICstCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9naWdhZGV2aWNlLmMgfCAgIDggKy0KIGRyaXZl
cnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgICB8ICA0OSArKysrKystCiBkcml2ZXJzL210ZC9u
YW5kL3NwaS9taWNyb24uYyAgICAgfCAgIDggKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hp
YmEuYyAgICB8ICAgMyArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jICAgIHwgMTI5
ICsrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgICAgICAgfCAg
MTUgKy0KIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgICAgICB8IDI0NiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tCiBpbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmggICAgICAg
fCAgMTQgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDY0NiBpbnNlcnRpb25zKCspLCAxMjcgZGVsZXRp
b25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNjA0YTA4NDFhMjZkZTE4ODI4MGI0N2ZiN2U3OGRjZGFh
OTY2YTA5ZQpjaGFuZ2UtaWQ6IDIwMjUxMDMxLXdpbmJvbmQtdjYtMTctcmMxLW9kZHItMzg1ZjA0
Njg0YWQ5CgpCZXN0IHJlZ2FyZHMsCi0tIApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
