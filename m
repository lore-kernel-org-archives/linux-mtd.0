Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA203E7718B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2024 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVhGuqggbjX8MX/TZ7H6A3fqvbqwvVs1VKW8iRtRR+4=; b=MSiH9VotzZHn2E
	wbThmC8ExlMC9NHRmhU8B/0S6r1eNxYZTSEJHaXWui6ZHbaIu/vNfZuCudh1Q9y1Wc67Lxe5vMfwt
	GxadtFVRRPvhgcPb4Jc8m3pCKe/Cw3ueOyfIN9uHsdoZZltF/PL0k/stYyexEVz2xgRch2/d8DGUt
	pZ2faE3TgeOsgH0tgKmSPHOScUQM1iT2sekutNQQOlZGYVolK4+AQRYeZISBFHMvUNCK2kS0u0lL5
	cQnhzhb6K7Q7LOOf8VZzIQZJ1lANoty1XRT3WXj/Q0ksh8Nkwi1q7STEkzmdU5sEwRNTxCSn07FtU
	BeQ75TO0o1nE7rkU8HAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPn4S-0000000AXJQ-1jHr;
	Mon, 23 Dec 2024 18:22:24 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPn4P-0000000AXIu-1xFw
	for linux-mtd@lists.infradead.org;
	Mon, 23 Dec 2024 18:22:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A560FF803;
	Mon, 23 Dec 2024 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734978135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tv6iJmtFz4jTMYOEld5KmoNhqIuilNzkh9WY1WJn4gY=;
	b=BprkTsBJ7qEtphtbRAxKat6cRkjsX/srJJKRA1XLh5YWmoOAyCAPaqPgNW2Qqj0LLQwnqS
	9Ehjc1RPt1aXT9IyXvnCwO7qWEL5znOQG2uGXyfWlza6TT98LQMJEmwVQEg12UFq2o0026
	nWSsoblBr8IKNCQgnWKnK3SgH0EWLxLtq8c3NbAskr3sLXOoYYEt9PSTrYBsoG3WUJ1Ho+
	SWw+wNn+m2HX0WJCymjeEz9CGzeQMiy2+s6y/JwTJmlI5gNHhk1Kd95ez0CWTPpHe+WIm/
	R4HtCk4+2gURT+7vgn9XrcTpRCwPMPhTpy9jgetF7UuAp9/6as98X/bbBfONUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 24/24] mtd: spinand: winbond: Add support for DTR
 operations
In-Reply-To: <6029a01f-dc4d-4a35-ad21-fd17e3fed9fc@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 14:40:59 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-25-miquel.raynal@bootlin.com>
	<6029a01f-dc4d-4a35-ad21-fd17e3fed9fc@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:22:12 +0100
Message-ID: <87o712uunf.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_102221_666783_5DB8B2CE 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gVHVkb3IsCgpPbiAxMS8xMS8yMDI0IGF0IDE0OjQwOjU5IEdNVCwgVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMTAvMjUvMjQgNToxNSBQ
TSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gVzI1TjAxSlcgYW5kIFcyNU4wMkpXIHN1cHBvcnQg
bWFueSBEVFIgcmVhZCBtb2RlcyBpbiBzaW5nbGUsIGR1YWwgYW5kCj4+IHF1YWQgY29uZmlndXJh
dGlvbnMuCj4+IAo+PiBEVFIgbW9kZXMgaG93ZXZlciBjYW5ub3QgYmUgdXNlZCBhdCAxNjZNSHos
IGFzIHRoZSBidXMgZnJlcXVlbmN5IGluCj4+IHRoaXMgY2FzZSBtdXN0IGJlIGxvd2VyZWQgdG8g
ODBNSHouCj4KPiBoYSwgd2hhdCdzIHRoZSBiZW5lZml0IHRoZW4/IEFyZW4ndCB3ZSBiZXR0ZXIg
b2Ygd2l0aCBub24gZHRyIG1vZGVzCj4gdGhlbj8gODAgTUh6ICogMiA8IDE2NiBNSHo/CgpUaGlz
IGlzIGFjdHVhbGx5IGEgZ29vZCBxdWVzdGlvbiwgYW5kIHlvdSBhcmUgcmlnaHQgRERSIGluIHRo
aXMgY2FzZQpkb2VzIG5vdCBicmluZyBiZXR0ZXIgdGhyb3VnaHB1dHMsIGl0IGNhbiBldmVuIG1h
a2UgaXQgYSBsaXR0bGUgYml0CnNsb3dlci4gSSB0aGluayBob3dldmVyIHdlIHNob3VsZCBleHBl
Y3Qgc29tZSBnYWlucyBhdCB0aGUgUENCIGRlc2lnbgpzdGVwLCB3aGljaCBtYXkgYmUgd2F5IHNp
bXBsZXIgYXMgcm91dGluZyA4IDE2Nk1IeiBsaW5lcyBtaWdodAphcHBhcmVudGx5IGJlIGNoYWxs
ZW5naW5nLiBJdCBpcyBjb21tb24gdG8gaGF2ZSBQQ0IgbGltaXRhdGlvbnMgb24gdGhlCmZyZXF1
ZW5jeSwgc28gZW5hYmxpbmcgRERSIGNhbiBiZSBhIGdyZWF0IHdheSB0byBrZWVwIHNpZ25hbCBp
bnRlZ3JpdHkKd2hpbGUgZGVmaW5pdGVseSBpbXByb3ZpbmcgdGhlIHBlcmZvcm1hbmNlcy4gSG93
ZXZlciwgeW91J3JlIHJpZ2h0LCBJCnNob3VsZCBwcm9iYWJseSBtb3ZlIHRoZXNlIGRlZmluaXRp
b25zIGxvd2VyIGluIHRoZSB0YWJsZSB0byBtYWtlIHN1cmUKd2UgcnVuIGF0IDE2Nk1IeiBpZiB0
aGF0J3MgcG9zc2libGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
