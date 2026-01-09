Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929BFD26D7D
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sp4E//th1+UGJY4MaqklufEy5ifbx8yCdv6TUetw9CE=; b=Tg/W4R99IcFYSI
	iNIMYvAlHqlpjSS0sCvx2gldSNC4ntqVQtezcGcd5NJm0mhOTfsFW95cz6Wga0sVJ4wmuooWFVTYO
	kfnspW0kb0sLlgq0yQeLPNcxiB2Orwyd6JnPc2e8ceZSuS6WL5MyfVl6jnoCHmDnmI8ytAQCClGP/
	9j0qqjM4rZuV2MRSj5vND3lWtF85phvTpOuDB3vyI7qCULr1u4XpueKfCZ0qcUYwVzOce3gqW+Wxy
	/jrxh8vYRvjfrAoBDAGIRRhQO4nCiyttVR5WH3V386YlUn913mZbaIT/1qLQJCtSzDD+baXIHNStD
	uNWWweyrs5E7bgkdyH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG81-00000002lod-43vc;
	Fri, 09 Jan 2026 17:18:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG7x-00000002llt-3Z0u
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC727C1F6E4;
	Fri,  9 Jan 2026 17:17:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4146606C6;
	Fri,  9 Jan 2026 17:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19591103C8956;
	Fri,  9 Jan 2026 18:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Nk6VYcCVM0dbZkuSsvXeXsco6Qkys/I/rgDW/FQldcQ=;
	b=pj3Dd7rPaTHREoqeQrezQtCbnfQ26+bke+WyrcVrSBwnSu5mVscaAIGOxW1meuTJ3+XQWH
	B/R4xhAZHC6ddKFKz2wADfx6TOW/SATVGpqze5o/U6l1OJRU0yB2Zxu9WuDd+o3W5fxo7a
	NxyDgHtYONLOmBh/LiumZ0pWeM6FmaiDSiZoIzjKcvWjEskf5pNXEEnBZbirb//MLRlncI
	cJrXKRZ58YmrpFxKZ+BlYEuPEw38444+1WSroyI9Dp3Oj+lFDRpskHe8B23ggjYu3yOll7
	oB5Nq+x6WVWSUkncXLy9Y/2nvJKlJ33plDv/gOtJzvKSeTERob5WDEJ//8ZO0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/27] mtd: spinand: Octal DTR support
Date: Fri, 09 Jan 2026 18:17:58 +0100
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0K6dkyn/IiuvIdhQekgk2iHtKRqC
 He3cgGX7yXf+1YVKTBFdSlWFShxZPEZzKFQw9T7OwG7zMpoU6MuEV7srXgHqQE8QRgQxLkAZVu
 PumraqndnlcdzoJHfe/jWZZ44LhI++0/Cn/2bTAgaLFXGkSnJjni1IsuD/XGQp+q2bfsCkfVAx
 r4AAAA=
X-Change-ID: 20251031-winbond-v6-17-rc1-oddr-385f04684ad9
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091822_168914_1E4EC2F8 
X-CRM114-Status: GOOD (  12.29  )
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
bC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIFJlYmFzZWQgb24gdjYu
MTktcmMxLgotIENvbGxlY3RlZCB0YWdzLgotIEZpeGVkIGNvbW1pdCBsb2dzIGFzIHJlcG9ydGVk
LgotIFJlbW92ZWQgaW5saW5lIGZ1bmN0aW9ucyBhbmQgdHVybmVkIHRoZW0gaW50byBwcm9wZXIg
ZnVuY3Rpb25zIGluIGEgQwogIGZpbGUgYXMgc3VnZ2VzdGVkIGJ5IFR1ZG9yLgotIFNxdWFzaGVk
IHBhdGNoZXMgMTAgYW5kIDExIGFzIHN1Z2dlc3RlZCBieSBUdWRvci4KLSBMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMDMxLXdpbmJvbmQtdjYtMTctcmMxLW9kZHIt
djEtMC1iZTQyZGUyM2ViZjFAYm9vdGxpbi5jb20KCi0tLQpNaXF1ZWwgUmF5bmFsICgyNyk6CiAg
ICAgIHNwaTogc3BpLW1lbTogTWFrZSB0aGUgRFRSIGNvbW1hbmQgb3BlcmF0aW9uIG1hY3JvIG1v
cmUgc3VpdGFibGUKICAgICAgc3BpOiBzcGktbWVtOiBDcmVhdGUgYSByZXBlYXRlZCBhZGRyZXNz
IG9wZXJhdGlvbgogICAgICBzcGk6IHNwaS1tZW06IExpbWl0IG9jdGFsIERUUiBjb25zdHJhaW50
cyB0byBvY3RhbCBEVFIgc2l0dWF0aW9ucwogICAgICBtdGQ6IHNwaW5hbmQ6IEZpeCBrZXJuZWwg
ZG9jCiAgICAgIG10ZDogc3BpbmFuZDogQWRkIG1pc3NpbmcgY2hlY2sKICAgICAgbXRkOiBzcGlu
YW5kOiBSZW1vdmUgc3RhbGUgZGVmaW5pdGlvbnMKICAgICAgbXRkOiBzcGluYW5kOiBVc2Ugc3Rh
bmRhcmQgcmV0dXJuIHZhbHVlcwogICAgICBtdGQ6IHNwaW5hbmQ6IERlY291cGxlIHdyaXRlIGVu
YWJsZSBhbmQgd3JpdGUgZGlzYWJsZSBvcGVyYXRpb25zCiAgICAgIG10ZDogc3BpbmFuZDogQ3Jl
YXRlIGFuIGFycmF5IG9mIG9wZXJhdGlvbiB0ZW1wbGF0ZXMKICAgICAgbXRkOiBzcGluYW5kOiBN
YWtlIHVzZSBvZiB0aGUgb3BlcmF0aW9uIHRlbXBsYXRlcyB0aHJvdWdoIFNQSU5BTkRfT1AoKQog
ICAgICBtdGQ6IHNwaW5hbmQ6IG1hY3Jvbml4OiBDb252ZXJ0IHZlbmRvciBzcGVjaWZpYyBvcGVy
YXRpb24gdG8gU1BJTkFORF9PUCgpCiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDogQ29udmVy
dCBXMjVOIHNwZWNpZmljIG9wZXJhdGlvbiB0byBTUElOQU5EX09QKCkKICAgICAgbXRkOiBzcGlu
YW5kOiB3aW5ib25kOiBDb252ZXJ0IFczNU4gc3BlY2lmaWMgb3BlcmF0aW9uIHRvIFNQSU5BTkRf
T1AoKQogICAgICBtdGQ6IHNwaW5hbmQ6IExpc3QgdmVuZG9yIHNwZWNpZmljIG9wZXJhdGlvbnMg
YW5kIG1ha2Ugc3VyZSB0aGV5IGFyZSBzdXBwb3J0ZWQKICAgICAgbXRkOiBzcGluYW5kOiBtYWNy
b25peDogUmVnaXN0ZXIgdmVuZG9yIHNwZWNpZmljIG9wZXJhdGlvbgogICAgICBtdGQ6IHNwaW5h
bmQ6IHdpbmJvbmQ6IFJlZ2lzdGVyIFcyNU4gdmVuZG9yIHNwZWNpZmljIG9wZXJhdGlvbgogICAg
ICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IFJlZ2lzdGVyIFczNU4gdmVuZG9yIHNwZWNpZmljIG9w
ZXJhdGlvbgogICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEZpeCBzdHlsZQogICAgICBtdGQ6
IHNwaW5hbmQ6IHdpbmJvbmQ6IFJlbmFtZSBJT19NT0RFIHJlZ2lzdGVyIG1hY3JvCiAgICAgIG10
ZDogc3BpbmFuZDogd2luYm9uZDogQ29uZmlndXJlIHRoZSBJTyBtb2RlIGFmdGVyIHRoZSBkdW1t
eSBjeWNsZXMKICAgICAgbXRkOiBzcGluYW5kOiBHYXRoZXIgYWxsIHRoZSBidXMgaW50ZXJmYWNl
IHN0ZXBzIGluIG9uZSBzaW5nbGUgZnVuY3Rpb24KICAgICAgbXRkOiBzcGluYW5kOiBBZGQgc3Vw
cG9ydCBmb3Igc2V0dGluZyBhIGJ1cyBpbnRlcmZhY2UKICAgICAgbXRkOiBzcGluYW5kOiBQcm9w
YWdhdGUgdGhlIGJ1cyBpbnRlcmZhY2UgYWNyb3NzIGNvcmUgaGVscGVycwogICAgICBtdGQ6IHNw
aW5hbmQ6IEdpdmUgdGhlIGJ1cyBpbnRlcmZhY2UgdG8gdGhlIGNvbmZpZ3VyYXRpb24gaGVscGVy
CiAgICAgIG10ZDogc3BpbmFuZDogV2FybiBpZiB1c2luZyBTU0RSLW9ubHkgdmVuZG9yIGNvbW1h
bmRzIGluIGEgbm9uIFNTRFIgbW9kZQogICAgICBtdGQ6IHNwaW5hbmQ6IEFkZCBvY3RhbCBEVFIg
c3VwcG9ydAogICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IFczNU4gb2N0YWwgRFRSIHN1cHBv
cnQKCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICAgICAgfCAzODcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL2VzbXQuYyAg
ICAgICB8ICAgNCArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRldmljZS5jIHwgICA4ICst
CiBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jICAgfCAgNDkgKysrKy0KIGRyaXZlcnMv
bXRkL25hbmQvc3BpL21pY3Jvbi5jICAgICB8ICAgOCArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkv
dG9zaGliYS5jICAgIHwgICAzICstCiBkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgICAg
fCAxMjkgKysrKysrKysrLS0tLQogZHJpdmVycy9zcGkvc3BpLW1lbS5jICAgICAgICAgICAgIHwg
IDE1ICstCiBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggICAgICAgfCAxNjEgKysrKysrKysr
KysrKystLQogaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oICAgICAgIHwgIDE0ICstCiAxMCBm
aWxlcyBjaGFuZ2VkLCA2NTEgaW5zZXJ0aW9ucygrKSwgMTI3IGRlbGV0aW9ucygtKQotLS0KYmFz
ZS1jb21taXQ6IGY3ZmFlMTk3MzE3NzljNDU0MTZlMzk2MWZhNzEyN2NhMjI1NTU0YTAKY2hhbmdl
LWlkOiAyMDI1MTAzMS13aW5ib25kLXY2LTE3LXJjMS1vZGRyLTM4NWYwNDY4NGFkOQoKQmVzdCBy
ZWdhcmRzLAotLSAKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
