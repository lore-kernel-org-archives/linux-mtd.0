Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF1CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16F061054
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D16F061054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jb+DpMd0n4S3jyGAgplmvcWVKt1Evx5Rr/VdU/5Rew=; b=rS5QtyFdo626MM
	Dc395hKMiqw+PahwQaMmfVX+WGrt4B/XZfsWG/1OvfPaCYZAfj7zAdH849QQpZGbbp2AyKo5NvhfK
	OrPEVi0oeiQKn+pm5JK6DQoi0ghejY1GGoGRLJshwQYlpY81BkemCmGhLXIF9rD75borLCX7HyvJk
	LBBFzlcUl2Qk7Rz9eRqUAQcT5DmAmkzlj7wnLCjjCHZJNxI5kRk+z4Gm/mxBz3nZ3ZBXmA0hKKuQt
	t5xY9jBkhmgn7Ij49qMmE56eBHTevtcA+XEvCdXiocEdPhIYfGQ1P8WjvRuxcMa0nFUhIL52Yv0DK
	9jJaD5FMsocUy8xrO+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOjo-001cc5-E0; Tue, 09 Nov 2021 10:52:24 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOjl-001cax-Ei
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 10:52:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D7424240004;
 Tue,  9 Nov 2021 10:52:16 +0000 (UTC)
Date: Tue, 9 Nov 2021 11:52:15 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Kamal
 Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 1/2] dt-bindings: mtd: brcmnand: add "no-wp" property
Message-ID: <20211109115215.5bcef0db@xps13>
In-Reply-To: <48cb0c8c-c752-0832-1e1a-836303926ed3@milecki.pl>
References: <20211103151117.18690-1-zajec5@gmail.com>
 <48cb0c8c-c752-0832-1e1a-836303926ed3@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_025221_649590_84C8CA60 
X-CRM114-Status: GOOD (  18.50  )
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

SGVsbG8sCgpyYWZhbEBtaWxlY2tpLnBsIHdyb3RlIG9uIFR1ZSwgOSBOb3YgMjAyMSAwODo0OToz
NiArMDEwMDoKCj4gT24gMDMuMTEuMjAyMSAxNjoxMSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+
ID4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gCj4gPiBJdCdz
IHJlcXVpcmVkIHRvIHByb3Blcmx5IGRlc2NyaWJlIGJvYXJkcyB3aXRob3V0IGNvbm5lY3RlZCBX
UCBwaW4gKGUuZy4KPiA+IEFzdXMgR1QtQUM1MzAwKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gLS0tCj4gPiAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sIHwgNSArKysr
Kwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFu
ZC55YW1sCj4gPiBpbmRleCBkZDVhNjQ5NjllMzcuLjQ5Yzc4NjBjMGRhZCAxMDA2NDQKPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55
YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20s
YnJjbW5hbmQueWFtbAo+ID4gQEAgLTExMSw2ICsxMTEsMTEgQEAgcHJvcGVydGllczoKPiA+ICAg
ICAgICAgZWFybGllciB2ZXJzaW9ucyBvZiB0aGlzIGNvcmUgdGhhdCBpbmNsdWRlIFdQCj4gPiAg
ICAgICB0eXBlOiBib29sZWFuICAKPiA+ICAgPiArICBuby13cDogIAo+ID4gKyAgICBkZXNjcmlw
dGlvbjoKPiA+ICsgICAgICBUaGlzIHByb3BlcnR5IG1hcmtzIGJvYXJkcyB3aXRoIFdQIHBpbiBu
b3QgY29ubmVjdGVkIHRvIHRoZSBOQU5EIGNoaXAuCj4gPiArICAgIHR5cGU6IGJvb2xlYW4gIAo+
IAo+IEkgc3RhcnRlZCByZXRoaW5raW5nIHRoaXMuIFNpbmNlIHdlIGFscmVhZHkgaGF2ICJicmNt
LG5hbmQtaGFzLXdwIgo+IChib29sZWFuKSwgd291bGQgbWFrZXMgbW9yZSBzZW5zZToKPiAxLiBB
ZGQgIm5vLXdwIiBib29sZWFuIChhcyBwcm9wb3NlZCBpbiB0aGlzIHBhdGNoKQo+IDIuIEFkZCAi
d3AiIChvciBzaW1pbGFyKSB3aXRoIFswLCAxXSBhbmQgZGVwcmVjYXRlICJicmNtLG5hbmQtaGFz
LXdwIgoKTWF5YmUgdGhpcyBzaG91bGQgYmUgYSByYXcgTkFORCB3aWRlIHByb3BlcnR5LCBhdCBs
ZWFzdCBpbiB0aGUgYmluZGluZ3MKZm9yIG5vdzogbmFuZC13cCAoc3VjaCBhcyBuYW5kLXJiKSBh
bmQgdGhpcyBwcm9wZXJ0eSBzaG91bGQgY29udGFpbiB0aGUKd3AgbGluZSBpZC4KCkZvciBtZSwg
YnJjbSxuYW5kLWhhcy13cCBtZWFucyB0aGF0IHRoZSBuYW5kIHdwIGlzIGNvbm5lY3RlZCwgbm90
IHRoYXQKaXQgImNhbiBiZSIgY29ubmVjdGVkLiBUaGUgZmFjdCB0aGF0IHRoZSBjb250cm9sbGVy
IGhhcyBhIHdwIHBpbiBvciBub3QKc2hvdWxkIGJlIGludGVybmFsIHRvIHRoZSBjb250cm9sbGVy
IGRyaXZlciAoZGlmZmVyZW50IGNvbXBhdGlibGUgb3IgaHcKdmVyc2lvbiBjaGVjaykuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
