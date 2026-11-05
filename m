Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE261606A32C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2Jklr3+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=NHdkSjwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NQQ8xDrGjY5x6xnMA3qxvxjrgQPUO52qtMCaay/+Z4M=; b=T2Jklr3+4iS1bM2rf+kVbjeHPa
	1h8YvEbCFodHKJwG62Wu89gr3IjpZGRZItdlfxW1gb7EtXtZMmP+vaxvHvbb4EUsm2261Nm4aHe4J
	AJoqZuztXIBaLbHfE1LtUgMcR1HBOrLcXIhw0TmdWfE4Tp85NBoexjMFdJCtxyRWpGT1k0UZwibKm
	u3G4G28NZH3BYGDS5M38AtaBV33m9+pMR8kq1lwNEvEkPU78P2ucMmguUYs6k0rETsfhg7ZDya9Ow
	u2B3GzuTzIH0hXD1uFyA+4tjiH2loSeyUowQZ7aCb36zdxN/qsBuNHAAAE1HIX0Tob9CbNLym7LeM
	5YUOAU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpLd-00000007oYH-3YDZ;
	Thu, 05 Nov 2026 04:45:13 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpLZ-00000007oUn-1r1S
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793853909; x=1825389909;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OLY+fK2buOemUlO1Z0CivAmC0sQIYBL6KveaXnqAsLg=;
  b=NHdkSjwixBxzbQj1lwRGA6csbLskWCIn5eMXoa8/IYVkXluwaq6/FRv5
   axuv1bO9YS+bHOngtknWcQ1ZBNj2lV3W9W7LUCHgjQO/aE5Yj6Ljc69uM
   AaxaQJY9PXcg2rVrvt9acaHo4b+lP1LDcwzT9b9GRCG0FHfINiOCCVFld
   Q=;
X-CSE-ConnectionGUID: Ugs3KXr0SXOtj5jyI359hQ==
X-CSE-MsgGUID: 2JryHZ1IRoCRR9jOD8PPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="116531502"
X-IronPort-AV: E=Sophos;i="6.27,196,1787004000"; 
   d="scan'208";a="116531502"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 05:44:02 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 05:44:02 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE815.infineon.com
 (172.23.29.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 05:44:02 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 5 Nov 2026 05:44:02 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <nuno.sa@analog.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
Subject: RE: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Thread-Topic: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Thread-Index: AQHdasSUzP6S2xaSGUGYHgMvhOFISrce4XNA
Date: Thu, 5 Nov 2026 04:44:01 +0000
Message-ID: <0cbfb61d062b437b8e860a9c93b13e4d@infineon.com>
References: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
In-Reply-To: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204509_878870_42CDAB4E 
X-CRM114-Status: GOOD (  18.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRywgYSAxIEdiaXQgKDEy
OCBNaUIpIG9jdGFsIE5PUiBmbGFzaC4NCj4gVGhlIHBhcnQgaXMgZnVsbHkgZGVzY3JpYmVkIGJ5
IFNGRFAsIHNvIG9ubHkgdGhlIGZsYXNoIElEIGFuZCBhIHNtYWxsDQo+IHBvc3RfYmZwdCBmaXh1
cCBhcmUgbmVlZGVkLg0KPiANCj4gV1JJVEUgU1RBVFVTIFJFR0lTVEVSICgwMWgpIHRha2VzIGEg
c2luZ2xlIGRhdGEgYnl0ZSBhbmQgb25seSBhZmZlY3RzDQo+IHN0YXR1cyByZWdpc3RlciBiaXRz
IDc6Miwgc28gdGhlIGRlZmF1bHQgMTYtYml0IFdyaXRlIFN0YXR1cyBhc3N1bXB0aW9uDQo+IGRv
ZXMgbm90IGhvbGQuIENsZWFyIHdyaXRlX3NyMV9hbmRfc3IyIHNvIHRoYXQgdGhlIHNpbmdsZSBi
eXRlIHdyaXRlX3NyMQ0KPiBwYXRoIGlzIHRha2VuOyB3cml0ZV9zcjEgaXMgYWxyZWFkeSBzZXQg
dG8gMDFoIGJ5IHRoZSBCRlBUIHBhcnNpbmcuDQo+IA0KPiBUaGUgZmxhc2ggYWxzbyBoYXMgbm8g
U3RhdHVzIFJlZ2lzdGVyIDIuIENvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGFyZSByZWFkDQo+IHdp
dGggQjVoLzg1aCBhbmQgd3JpdHRlbiB3aXRoIEIxaC84MWgsIGFuZCB0aGUgMzVoIFJlYWQgQ29u
ZmlndXJhdGlvbg0KPiBSZWdpc3RlciBjb21tYW5kIGRvZXMgbm90IGV4aXN0LCBzbyBjbGVhciBy
ZWFkX3NyMiBhcyB3ZWxsLg0KPiANCj4gU29mdHdhcmUgd3JpdGUgcHJvdGVjdGlvbiBpcyBkb25l
IHRocm91Z2ggdGhlIGJsb2NrIHByb3RlY3QgYml0cyBpbiB0aGUNCj4gc3RhdHVzIHJlZ2lzdGVy
OiBCUDAtQlAyIGF0IGJpdHMgNDoyLCBCUDMgYXQgYml0IDYgYW5kIGEgVG9wL0JvdHRvbSBiaXQg
YXQNCj4gYml0IDUsIHdoaWNoIGlzIGV4YWN0bHkgd2hhdCBTUElfTk9SX0hBU19MT0NLLCBTUElf
Tk9SXzRCSVRfQlAsDQo+IFNQSV9OT1JfQlAzX1NSX0JJVDYgYW5kIFNQSV9OT1JfSEFTX1RCIGRl
c2NyaWJlLCBzbyBzZXQgdGhvc2UgZmxhZ3MgdG8gZ2V0DQo+IHRoZSBnZW5lcmljIGxvY2tpbmcg
c3VwcG9ydC4NCj4gDQo+IE5vdGUgdGhhdCBnaXZlbiB0aGF0IHRoZSBGbGFnIFN0YXR1cyBSZWdp
c3RlciAoRlNSKSBoYW5kbGluZyBpcyB0aGUgc2FtZQ0KPiBhcyBpbiBzb21lIG1pY3JvbiBkZXZp
Y2VzLCB3ZXJlJ3JlIGFkZGluZyB0aGUgaXNzaSBjaGlwIGRpcmVjdGx5IG9uIHRoZQ0KPiBtaWNy
b24tc3QgZHJpdmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4NCg0KUGxlYXNlIGFkZCBMaW5rOiB0YWcgYXMgTWljaGFlbCBtZW50aW9uZWQgaW4g
WzFdLg0KDQpbLi4uXQ0KDQo+IEBAIC02NTUsNiArNjgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzcGlfbm9yX2ZpeHVwcyBtaWNyb25fc3Rfbm9yX2ZpeHVwcyA9IHsNCj4gDQo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXAgbWljcm9uX2ZpeHVwc1tdID0gew0KPiAgICAgICAg
IHsgLmZpeHVwcyA9ICZtaWNyb25fc3Rfbm9yX2ZpeHVwcyB9LA0KPiArICAgICAgIHsgLmlkID0g
U05PUl9JRCgweDlkLCAweDViLCAweDFiKSwgLmZpeHVwcyA9ICZpczI1d3gwMWdfZml4dXBzIH0s
DQoNClNhc2hpa28ncyBjb21tZW50IFsyXSBsb29rcyB2YWxpZCB0byBtZSBhcyB0aGlzIGNoaXAg
c3VwcG9ydHMgOEQtOEQtOEQuDQpDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29rPw0KDQpUaGFu
a3MsDQpUYWthaGlybw0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL0RM
RVRSUlZSVVdFUC4xVlUxRUhBUkQzTVNIQGtlcm5lbC5vcmcvDQpbMl0gaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTAyLW10ZC1zcGktbm9yLW5ldy1pc3NpLWNoaXAtdjMtMS1m
NWUzOGUyMDBmYzglNDBhbmFsb2cuY29tDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
