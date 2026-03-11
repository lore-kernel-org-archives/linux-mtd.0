Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F312FD88DA
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJLR/owCHOaFWrDpGaFXDRL0UP4iOYf9JRuZ/ZrK1nk=; b=2ro+wabB4kb4qo
	RSf9/dYRVfeUkpbuaJfrKTXPWQ8L1mM6phSlfECwi2rDG6Zi8GlksWmKL/aG+PEwagHzCUIwKGirV
	/sDJ0WC7byfkV8OpC9wuj5kKJqEoVvqzXamPSX6RsjDKXAqthQUmS+WZ570ZrXv3B0iucidFRkEg/
	ZVd4i+RUJ260qAwp+l5fORKAY9gRJtxLDcSzF+uCFUqT+PfVEL1NZQ/0JuMsK90vFeOeTw5nTum3S
	PpjPIYDW9I5FBbgWI9ZKnTjla/7UuEiMgCPxIY3h2sBIT8VLnZ1iS3/n2susUUYXqLFH2vucZAJXu
	AFjJYrFUlkQ4EtZtXYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FU4-0000000BDlE-363c;
	Wed, 11 Mar 2026 09:04:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FU0-0000000BDjz-0QG9
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 09:04:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06F344E42606;
	Wed, 11 Mar 2026 09:03:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF82B60004;
	Wed, 11 Mar 2026 09:03:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24429103688EF;
	Wed, 11 Mar 2026 10:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773219833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rJKFrJpCitYhJZxGKlOQSS+IwR1qpI8gDUOpVd9xOh8=;
	b=LSCzTaSp+i76jdg7TU+B4qaun9/pP2DoEtljcjqUIiEvfuOqsaf/eWt0MSz1+HSuURsOFa
	Mh6RHq8+znEQAw0YfUh/lbjRKcTergtiQVEOPszEoDvnjSOvXWc8S0GGJvnnCZ88kCHNKG
	IEfIrSSIEMS8qljmlGN4MJQtt6ecBEFzgLEr5bAmMMMWGNHo6SzsFNVjed2QtGbJvyc2sm
	ssSK7grTQwvhiSftt8aDda4S06LPDVnTP/L0Mhvlxg7SwXvnkdp5qW189kK0wTJsn1O+Kb
	uzOJnF8fx3wEfxZlM1Ulz19U9T50TDxQ8k9xylJeitwWtVpo3KTpnMCoKVgPmw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Akhila YS <akhilayalmati@gmail.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix spear600-smi YAML conversion
In-Reply-To: <CAL_Jsq+WE33tSSqywbPN3g8i92foVmqna6K2zaFO1RUreMvB-w@mail.gmail.com>
	(Rob Herring's message of "Tue, 10 Mar 2026 13:30:02 -0500")
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
	<CAL_Jsq+WE33tSSqywbPN3g8i92foVmqna6K2zaFO1RUreMvB-w@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 11 Mar 2026 10:03:49 +0100
Message-ID: <87h5qmn3ey.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_020400_269369_393C2A08 
X-CRM114-Status: GOOD (  10.15  )
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

SGkgUm9iLAoKT24gMTAvMDMvMjAyNiBhdCAxMzozMDowMiAtMDUsIFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCAxMDoyNOKAr0FN
IE1pcXVlbCBSYXluYWwKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+
IFJlY2VudCBjb252ZXJzaW9uIGZyb20gdHh0IHRvIHlhbWwgb2YgdGhlIFNwZWFyNjAwIFNNSSBi
aW5kaW5nIGJ5IEFraGlsYQo+PiBsZWFkIHRvIHdhcm5pbmdzLiBUaGVzZSBhcmUgbXkgMmN0cyBp
biBnZXR0aW5nIHRoZSB5YW1sIGNvbnZlcnNpb24gZG9uZQo+PiA6LSkKPj4KPj4gQ2hlZXJzLAo+
PiBNaXF1w6hsCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiBNaXF1ZWwgUmF5bmFsICgzKToKPj4gICAgICAgZHQt
YmluZGluZ3M6IG10ZDogc3Qsc3BlYXI2MDAtc21pOiBGaXggZGVzY3JpcHRpb24KPj4gICAgICAg
ZHQtYmluZGluZ3M6IG10ZDogc3Qsc3BlYXI2MDAtc21pOiAjYWRkcmVzcy9zaXplLWNlbGxzIGlz
IG1hbmRhdG9yeQo+PiAgICAgICBkdC1iaW5kaW5nczogbXRkOiBzdCxzcGVhcjYwMC1zbWk6IEZp
eCBleGFtcGxlCj4+Cj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3Qsc3BlYXI2MDAt
c21pLnlhbWwgICB8IDI2ICsrKysrKysrKysrKysrKystLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gU3RpbGwgd2FybmluZyBpbiBu
ZXh0IGFuZCB2Ny4wLXJjIHdpdGhvdXQgdGhlc2UgZml4ZXMuIFBsZWFzZSBhcHBseQo+IHRoZW0g
c29vbi4KClllcywgSSB3aWxsIGRvIGl0IHRoaXMgd2Vlay4KClRoYW5rcyBmb3IgdGhlIHJlbWlu
ZGVyLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
