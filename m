Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48290D41C3B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Dec 2025 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/G+5XmXAt6q27PzdkDFMd+jQNdnPTTDiQ8HiyDsZ3Mo=; b=pZ12p64cbpRMB4
	wr4lrM2+wd7w8Bza6/JJiOn8THev1Ws+9qp8iQicyDDkdtdTOug03CNu8j8mOuMCs7Q8VtMfuPcip
	+M3WvIY669DiNvFHhtCo8oDkySe2nnsAs33skqoa5O0el/SWM5XgUO0z0m74+jUyGnwo18HULNr6o
	9ZFAtt281+UTF7faZHFediLK3zXBSaRgB6R1/pcMzbccGA8/8RdPvrV3VDbrJ/fZa6eQfro5JYiXW
	6O4ZOLJ/xOwFrxF/rFral307Sop1nC0278JZ1Ut4Ei1nR2dih1KzdXkLVreU3ue/6Bw/SaiDc3IIt
	vmwBzya0vp34eN6l67jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThW9-0000000GibM-2UFa;
	Thu, 11 Dec 2025 14:19:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThW6-0000000Giay-1c6y
	for linux-mtd@lists.infradead.org;
	Thu, 11 Dec 2025 14:19:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34F56C1934C;
	Thu, 11 Dec 2025 14:19:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1015E6068C;
	Thu, 11 Dec 2025 14:19:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61B29103C8C1E;
	Thu, 11 Dec 2025 15:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765462775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8rjys0EWHdXH6WGIS1Zzap+OABSzfKqtGnMMZqg29FI=;
	b=zeztCUkh2ghNaWhvbCqXv/dW6nAyuBawnJCDfOAjKgOB/lwpeHBaU/zyJlfOLfWxx7oMmv
	ojQc7vlyeliMXBXKgj3sFo2y1g4J1lXNjLXE8NBefvuXKslzYDA1wWMSggdLLjNHsprfZ9
	+fSVZjMMP3Jcor1nstjNVagQxP7YHarSP9Dar21M6+RY/Ubx0cEUn9Yq1ZLIEtpcPDl6qR
	LoJEAH/ri8YRBZmogJHQo3uVRxLEiLc5daO3KOgBDuf5FVMfGzoPZ2PG9fCAKyT7UYrY1a
	+ATM18UShpbTtfA3ygelN/vMGRenpIc+Mfbff/DWQ0MqwLre54yT/SZ0WcR72Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Michael Walle <mwalle@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  Santhosh Kumar K <s-k6@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 5/8] spi: spi-mem: Create a secondary read operation
In-Reply-To: <aTonE4REBDfaWBQo@sirena.co.uk> (Mark Brown's message of "Thu, 11
	Dec 2025 11:06:11 +0900")
References: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
	<20251205-winbond-v6-18-rc1-cont-read-v1-5-01bc48631c73@bootlin.com>
	<aTonE4REBDfaWBQo@sirena.co.uk>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 11 Dec 2025 15:19:31 +0100
Message-ID: <87345h6qz0.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_061938_577620_327EC14E 
X-CRM114-Status: GOOD (  11.82  )
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

T24gMTEvMTIvMjAyNSBhdCAxMTowNjoxMSArMDksIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgRGVjIDA1LCAyMDI1IGF0IDA4OjM4OjU2UE0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4KPj4gVGhlIGNob2ljZSBvZiBkZWZpbmluZyB0d28gdmFy
aWFibGVzIG5hbWVkIHByaW1hcnkgYW5kIHNlY29uZGFyeSBpbnN0ZWFkCj4+IG9mIHVzaW5nIGFu
IGFycmF5IG9mIHRlbXBsYXRlcyBpcyBvbiBwdXJwb3NlLCB0byBzaW1wbGlmeSB0aGUgcmVhZGlu
Zy4gSQo+PiBmaW5kIGxlc3Mgb2J2aW91cyB0aGUgdXNlIG9mIGFuIGFycmF5IGhlcmUgYnV0IHRo
aXMgaXMgcGVyc29uYWwgdGFzdGUuCj4KPiBUaGlzIG1ha2VzIHNlbnNlIHRvIG1lOgo+Cj4gQWNr
ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPgo+IEZlZWwgZnJlZSB0byBj
YXJyeSBib3RoIHRoZXNlIHBhdGNoZXMgYWxvbmcgd2l0aCB0aGUgcmVzdCBvZiB0aGUKPiBzZXJp
ZXMsIGlmL3doZW4geW91IGRvIGVuZCB1cCBhcHBseWluZyBpdCBhIHNpZ25lZCB0YWcgd291bGQg
cHJvYmFibHkgYmUKPiBhIGdvb2QgaWRlYSBpbiBjYXNlIHRoZXJlJ3Mgc29tZSBjb2xsaXNpb24g
d2l0aCBvdGhlciBTUEkgd29yay4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIGZlZWRiYWNrLgoKWWVz
LCB3aGVuIHRoZSBzZXJpZXMgaXMgY29uc2lkZXJlZCByZWFkeSwgSSdsbCB0YWtlIGNhcmUgb2Yg
dGhhdCB0YWcuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
