Return-Path: <SRS0=mYMn=LT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715F7C2B9F4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 08:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FE760200
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 08:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FE760200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sq78d/tOv5lsKXc+MFtDJ2pVytESkw9VVnLzjJbRdEQ=; b=w9wehuvxu7iUKX
	oDI642Exh0i+NkcaS+bZ51dcnGErKaWGOQTKAa2IvmEK/3IEo3EiXiBSKdTKVW5kcE/t+ahG/kA4l
	IiT5h0PU5QEaUfH4PCRtXcRQgeP8LO6270Abg6O0U04kJsvDgHur65msI4jz/cWogLJ3WxFUndHyf
	RXJgBMfkrEntefRw1bNglGYCb9OTl5VAbKcu2629DBd3OXXKKibgkYT1gnocPDMO31j8oegl3qhBT
	u9JKJq66zKHxE7U8lOSPWbeD+4vqqteLXRx8Q75581TonhXtM0IPuhIs30Bx+OSDpAom4Oo28Y8Fl
	+gNWGKfnqTdeN+HA/6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwgoT-000CKC-T4; Fri, 25 Jun 2021 08:03:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwgWK-00061Q-6s
 for linux-mtd@lists.infradead.org; Fri, 25 Jun 2021 07:45:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A988A60010;
 Fri, 25 Jun 2021 07:44:54 +0000 (UTC)
Date: Fri, 25 Jun 2021 09:44:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.14
Message-ID: <20210625094453.63a0663e@xps13>
In-Reply-To: <c02e435b-6c6e-ec6d-b912-e7bb997baa03@ti.com>
References: <20210623120125.1f02792e@xps13>
 <c02e435b-6c6e-ec6d-b912-e7bb997baa03@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_004500_470518_169D8356 
X-CRM114-Status: GOOD (  18.34  )
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

SGkgVmlnbmVzaCwKClZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4gd3JvdGUg
b24gRnJpLCAyNSBKdW4gMjAyMQoxMjowMToyOCArMDUzMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9u
IDYvMjMvMjEgMzozMSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFJpY2hhcmQsCj4g
PiAKPiA+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9yIDUuMTQuCj4gPiAKPiA+IFRoaXMgUFIgaW5j
bHVkZXMgcGF0Y2hlcyBmcm9tIHRoZSBtZW1vcnkgYnVzIHRyZWUgYWZ0ZXIgbWVyZ2Ugb2YgYW4K
PiA+IGltbXV0YWJsZSBicmFuY2ggcHJvdmlkZWQgYnkgS3J6eXN6dG9mIEtvemxvd3NraTsgSSBo
b3BlIHRoaXMgaXMgdGhlCj4gPiByaWdodCB3YXkgdG8gaGFuZGxlIHN1Y2ggc2l0dWF0aW9uLgo+
ID4gCj4gPiBUaGVyZSBpcyBhbHNvIGEga25vd24gY29uZmxpY3Qgd2l0aCB0aGUgZGV2aWNldHJl
ZSB0cmVlIHdoaWNoIGlzIHRyaXZpYWwKPiA+IHRvIHJlc29sdmU6Cj4gPiAKPiA+IAk5YjM1OGFm
N2M4MTggKCJkdC1iaW5kaW5nczogbXV4OiBDb252ZXJ0IG11eCBjb250cm9sbGVyCj4gPiAJYmlu
ZGluZ3MgdG8gc2NoZW1hIikgLT4gVXBkYXRlcyBhbGwgdGhlIGZpbGVzIHJlZmVyZW5jaW5nIHRo
ZSBtdXgtY29udHJvbGxlci50eHQKPiA+IAliaW5kaW5nIGFzIHRoZSBmaWxlIG5hbWUgY2hhbmdl
ZCAocy90eHQveWFtbC8pLiAgCj4gCj4gCj4gPiAKPiA+IAk2OTQ3YWQ2NzQ5NDQgKCJkdC1iaW5k
aW5nczogbXRkOiBDb252ZXJ0IHRpLCBhbTY1NC1oYm1jLnR4dCB0bwo+ID4gCVlBTUwgc2NoZW1h
IikgIAo+ID4gCS0+IENvbnZlcnRzIG9uZSBvZiB0aGVzZSBmaWxlcyB0byB5YW1sLCB0aGUgcmVm
ZXJlbmNlIHRvICAKPiA+IAltdXgtY29udHJvbGxlci57dHh0LHlhbWx9IGJlaW5nIGRyb3BwZWQg
ZHVyaW5nIHRoZSBjb252ZXJzaW9uLgo+ID4gCj4gPiBJdCBpcyB0aGVuIG9ubHkgbmVlZGVkIHRv
IGp1c3QgdGFrZSB0aGUgdGksYW02NTQtaGJtYyB5YW1sIGNvbnZlcnNpb24KPiA+IGFzIGl0IGlz
LiAgCj4gCj4gVGhpcyBjb21taXQgaXMgaW4gbXRkL25leHQgYW5kIG5vdCBpbiBuYW5kL25leHQu
IFNvIHRoaXMgUFIgc2hvdWxkIG5vdAo+IHJlc3VsdCBpbiBjb25mbGljdCBvbiB0aSxhbTY1NC1o
Ym1jLnR4dC4KCk1tbWggcmlnaHQsIEkgbWl4ZWQgdGhlIHR3byBpbiBteSBtaW5kLiBBdCBsZWFz
dCB0aGUgc2VudGVuY2UgaXMgcmVhZHkKZm9yIHRoZSBmaW5hbCBQUiA6KQoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
