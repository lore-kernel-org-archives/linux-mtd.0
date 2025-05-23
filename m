Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D07C54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oH3/BrbXJVSCTzcZiYOtyqNrdtteG78u2uTwaFQribw=; b=McbcqDAkTf7hY4
	dEBc/RKyT4LTH/RIU8xinKY0pMnkZKam86WwaZbygXHY7qyQNR8tpHi80Sdc0+rRnBUOr5UkXaJmZ
	Mvfpya0X7pKn4UYXnPoWT5pVoAUmVFtVjeClSczcRcHqCyccY6/RDEu6KAAcSUCO/db8a/yC2z0SN
	JLA/FpTKyLROwWB9dcps2ekhCOZmuj2bGCZwtB33NBsbzxvw6Kzcl8t/8BszJ7V4DuDmPTU/oVDSr
	swQQjQV2CsQUPdif0l5GKORk+MeZZhN7+GrHXSfdTd8Oefdb2lqkrOZpHKt9frPngOwpffdKFWTJ0
	tbce5YHj4YrzNeOAqzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU1o-00000004CEo-44bW;
	Fri, 23 May 2025 15:09:44 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITYq-000000045PJ-2oJO
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 14:39:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CD534397D;
	Fri, 23 May 2025 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748011176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOCK6JsdZd/ExEyqrEPPTB1IZhrxIX3Mph1RiKKr0VI=;
	b=OBVIR7YFZYAUkFrhZKMUINmFTYrEstapjIs7fISyxAuP6w6BZeuHjCzzh2WzYmq/RDOvK0
	qSo+jIEmhlJo1ptMCBgSzlIeCevKk2ejF4fpyJPQK2fQrqPE3inng3jBTQHjihbaTAHUR7
	Wfku5P8ArQRpTqmoskd15GoP1wkQrBXqscUxBh1FSH7P4YTTCsH8op/L5rub8Q4lEpOOPe
	IxNNjYjmwAjiyQ6BBOU7RNONEQmj4doZdwbkYyiKqAh0wqVAvKt5a4NcyqNHcrjHrJq2VX
	2/fFDa9SjE8340EeZ62B2SIs0qXboBRweqI/NMb5GWwhysh0y9gJzvM9D7KVkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] spi: spi-qpic-snand: overestimate corrected bitflips
In-Reply-To: <20250522-qpic-snand-overestimate-bitflips-v1-1-35c65c05068e@gmail.com>
	(Gabor Juhos's message of "Thu, 22 May 2025 19:33:26 +0200")
References: <20250522-qpic-snand-overestimate-bitflips-v1-1-35c65c05068e@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 23 May 2025 16:39:33 +0200
Message-ID: <875xhr5r2y.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeluddvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeeftdefledvieegvdejlefgleegjefhgfeuleevgfdtjeehudffhedvheegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedrleekrddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrtddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehjgehgkeihjeesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghvrghrrggurgesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggps
 hhrihgthhgrrhgrsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_073948_857976_31116C72 
X-CRM114-Status: GOOD (  12.78  )
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

T24gMjIvMDUvMjAyNSBhdCAxOTozMzoyNiArMDIsIEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwu
Y29tPiB3cm90ZToKCj4gVGhlIFFQSUMgaGFyZHdhcmUgaXMgbm90IGNhcGFibGUgb2YgcmVwb3J0
aW5nIHRoZSBleGFjdCBudW1iZXIgb2YgdGhlCj4gY29ycmVjdGVkIGJpdGZsaXBzLCBpdCBvbmx5
IHJlcG9ydHMgdGhlIG51bWJlciBvZiB0aGUgY29ycmVjdGVkIGJ5dGVzLgo+IEhvd2V2ZXIgdGhl
IGN1cnJlbnQgY29kZSB0cmVhdHMgdGhhdCBhcyBjb3JyZWN0ZWQgYml0ZmxpcHMgd2hpY2ggaXMK
PiBxdWl0ZSBpbmFjY3VyYXRlIGluIG1vc3QgY2FzZXMuIEZvciBleGFtcGxlLCBldmVuIGlmIHRo
ZSBoYXJkd2FyZSByZXBvcnRzCj4gb25seSBvbmUgYnl0ZSBhcyBjb3JyZWN0ZWQsIHRoYXQgYnl0
ZSBtYXkgaGF2ZSBjb250YWluZWQgbXVsdGlwbGUgYml0Cj4gZXJyb3JzIGZyb20gb25lIHVwIHRv
IHRoZSBtYXhpbXVtIG51bWJlciBvZiBjb3JyZWN0YWJsZSBiaXRzLgo+Cj4gQ2hhbmdlIHRoZSBj
b2RlIHRvIHJlcG9ydCB0aGUgbWF4aW11bSBvZiB0aGUgcG9zc2libHkgY29ycmVjdGVkIGJpdHMs
Cj4gdGh1cyBhbGxvd2luZyB1cHBlciBsYXllcnMgdG8gZG8gY2VydGFpbiBhY3Rpb25zIGJlZm9y
ZSB0aGUgZGF0YSBnZXRzCj4gbG9zdCBkdWUgdG8gdW5jb3JyZWN0YWJsZSBlcnJvcnMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KPiAtLS0KPiBUaGUg
cGF0Y2ggdHJpZXMgdG8gYWRkcmVzcyBNaXF1ZWwncyBjb25jZXJucyBbMV0gYWJvdXQgdGhlIGNv
cnJlY3RlZCBiaXQKPiBlcnJvciByZXBvcnRpbmcgY2FwYWJpbGl0aWVzIG9mIHRoZSBRUElDIGhh
cmR3YXJlLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC84N2g2MWU4a293LmZz
ZkBib290bGluLmNvbQoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgYXR0ZW1wdGluZyB0byBpbXBy
b3ZlIHRoZSBzaXR1YXRpb24uIEdpdmluZyB0aGlzCmEgc2Vjb25kIGxvb2ssIGl0IHdpbGwgbm90
IHdvcmsgZWl0aGVyIGFuZCB3aWxsIGJlIGV2ZW4gd29yc2UsIGZvcmNpbmcKd2VhciBsZXZlbGxp
bmcgYWZ0ZXIgZWFjaCByZWFkLiBTbyBsZXQncyBub3QgY2hhbmdlIHRoZSByZXR1cm5lZCB2YWx1
ZSwKaG9wZWZ1bGx5IHRoZSByZWFsIGxpZmUgaXMgZGlmZmVyZW50IGFzIHRoZSB0ZXN0IGNhc2Ug
YW5kIG1vc3QgYml0ZmxpcHMKd2lsbCBiZSBzcHJlYWQgYW5kIG5vdCBjb25jZW50cmF0ZWQgaW4g
YSBzaW5nbGUgYnl0ZS4gSG93ZXZlciBJJ2QKd2VsY29tZSBlaXRoZXIgYSBwcl93YXJuX29uY2Uo
KSBvciBhdCBsZWFzdCBhIGNvbW1lbnQgc29tZXdoZXJlIGFib3V0CnRoaXMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
