Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A46C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+pPLpIdkfiBpTK2+vRRJf+8fmg4THj3iHqy1etNlkY=; b=BBit9drDvajhxb
	wislTFyFedq63ykQoiikcy4Pfwy7v8XRMKbtZR04joFNxVw7ygVugOai87J32G5dUsL59a04Fry5C
	ViRHdiWHv9E+SUanrY9pjEdd2wabpel9FuKTICR2CReMeTeEV1ptRa3xZt9TWeQNrNFcofWA1coGx
	f9TnOd6r3/c5tkXRtlVhcJnv0/+Fs4roUYSuVHlHJ7P60ufu3vYyOAjkV7r7gxvrcO+yLLCdFSJ+O
	H9PB3AQKX4PQUBXbGEpD7iyNTJHxJBcKtDXSilSRcRheDhWrCMlFeroTJml1NMI0X5iQJ3G4yAkzy
	aL8AXRT8vffPFwYj47Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyW7n-006WRv-BM; Tue, 07 Jun 2022 10:07:47 +0000
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVvS-006RWa-TC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 09:55:05 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.44])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BE73D25B28;
	Tue,  7 Jun 2022 09:54:53 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 11:54:52 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-98R002e5252f13-1f90-45fc-b1c5-4aa178b34a63,
                    91B62C5DF406EA78EA4BF407C6AC564E114A3E29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3a62cd13-6937-8824-d503-3525ce7c30d8@kaod.org>
Date: Tue, 7 Jun 2022 11:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/14] mtd: spi-nor: aspeed-smc: Make
 aspeed_smc_unregister() return void
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@pengutronix.de>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Joel Stanley <joel@jms.id.au>,
	<kernel@pengutronix.de>, Michael Walle <michael@walle.cc>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
 <20220607092856.jh7jj4snlobx2kae@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220607092856.jh7jj4snlobx2kae@ti.com>
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e551fdba-14fc-4bd3-815a-e963f85f6d46
X-Ovh-Tracer-Id: 2336523782348901307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtheekleeitedvtdelgfevueehudehteelvddtgfefffelvdejkeejgeelvdekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_025503_289251_DA617747 
X-CRM114-Status: GOOD (  18.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpPbiA2LzcvMjIgMTE6MjgsIFByYXR5dXNoIFlhZGF2IHdyb3RlOgo+IEhpIFV3ZSwK
PiAKPiBPbiAwMy8wNi8yMiAxMTowN1BNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gVGhl
IGZ1bmN0aW9uIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHksIHNvIHNpbXBsaWZ5IHRvIG1h
a2UgaXQKPj4gb2J2aW91cyB0aGVyZSBpcyBubyBlcnJvciB0byBoYW5kbGUgaW4gdGhlIGNhbGxl
cnMuCj4+Cj4+IFRoaXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4gCj4gQ2VkcmljIHJlY2VudGx5IHBvcnRlZCB0aGUg
ZHJpdmVyIHRvIFNQSSBNRU0gYW5kIGl0IGhhcyBub3cgaGl0IHRoZQo+IGxpbnV4LW5leHQgdHJl
ZSBbMF0uIFRoaXMgZHJpdmVyIGlzIHBsYW5uZWQgdG8gYmUgcmVtb3ZlZC4gQ2FuIHlvdQo+IHBs
ZWFzZSBjaGVjayBpZiB0aGUgbmV3IGRyaXZlciBoYXMgdGhpcyBpc3N1ZSwgYW5kIGZpeCBpdCB0
aGVyZT8KPiAKPiBbMF0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQ/aWQ9OWM2M2I4NDZlNmRmNDNlNWIzZDMx
MjYzZjdkYjU0NWYzMmRlZWRhMwoKSXQgaXMgbWVyZ2VkIGluIC1yYzEgbm93IDoKCiAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90cmVlL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKCkkgdGhpbmsgYXNwZWVkX3Nw
aV9yZW1vdmUoKSBkb2VzIHdoYXQgeW91IHdhbnQgdGhlcmUuCgpUaGFua3MsCgpDLgoKCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvYXNw
ZWVkLXNtYy5jIHwgOCArKysrLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9y
L2NvbnRyb2xsZXJzL2FzcGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvYXNwZWVkLXNtYy5jCj4+IGluZGV4IGFjZmUwMTBmOWRkNy4uYmQxNDkxMDQ1MzNhIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2FzcGVlZC1zbWMuYwo+
PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2FzcGVlZC1zbWMuYwo+PiBA
QCAtMzk5LDcgKzM5OSw3IEBAIHN0YXRpYyBzc2l6ZV90IGFzcGVlZF9zbWNfd3JpdGVfdXNlcihz
dHJ1Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3QgdG8sCj4+ICAgCXJldHVybiBsZW47Cj4+ICAgfQo+
PiAgIAo+PiAtc3RhdGljIGludCBhc3BlZWRfc21jX3VucmVnaXN0ZXIoc3RydWN0IGFzcGVlZF9z
bWNfY29udHJvbGxlciAqY29udHJvbGxlcikKPj4gK3N0YXRpYyB2b2lkIGFzcGVlZF9zbWNfdW5y
ZWdpc3RlcihzdHJ1Y3QgYXNwZWVkX3NtY19jb250cm9sbGVyICpjb250cm9sbGVyKQo+PiAgIHsK
Pj4gICAJc3RydWN0IGFzcGVlZF9zbWNfY2hpcCAqY2hpcDsKPj4gICAJaW50IG47Cj4+IEBAIC00
MDksMTMgKzQwOSwxMyBAQCBzdGF0aWMgaW50IGFzcGVlZF9zbWNfdW5yZWdpc3RlcihzdHJ1Y3Qg
YXNwZWVkX3NtY19jb250cm9sbGVyICpjb250cm9sbGVyKQo+PiAgIAkJaWYgKGNoaXApCj4+ICAg
CQkJbXRkX2RldmljZV91bnJlZ2lzdGVyKCZjaGlwLT5ub3IubXRkKTsKPj4gICAJfQo+PiAtCj4+
IC0JcmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgYXNwZWVkX3NtY19yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+PiAgIHsKPj4gLQlyZXR1cm4gYXNwZWVk
X3NtY191bnJlZ2lzdGVyKHBsYXRmb3JtX2dldF9kcnZkYXRhKGRldikpOwo+PiArCWFzcGVlZF9z
bWNfdW5yZWdpc3RlcihwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpKTsKPj4gKwo+PiArCXJldHVy
biAwOwo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBh
c3BlZWRfc21jX21hdGNoZXNbXSA9IHsKPj4gLS0gCj4+IDIuMzYuMQo+Pgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
