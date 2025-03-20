Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A663FC28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDE3FP9MMei9OGkWxGgOkSQsozkDSHKT7GetEyH6Vbc=; b=gyi/GyWQstoMue
	vHORsAoyNR1zlr3nnkhUG8/WBoF3ebJ+dhqNrl6yeLLbQhJRPLsIzKmHgX0mxOYjnlhn8FJDqofXN
	Ky4SeU6ZJVomO/7nberzvySj0XCVhpix8e3PSLTEGH2PmPGahe/TMR9ky6nhoItL1yGf0JUSB4R3m
	vXMNEBQlZV5oUWUov6WFSBxTCJiNr9azqy7+6VOo0UobV5xNuMHLr6hDZPI3R21w37ebtWUgyJ/Xq
	h+uO9g4EkewkiU9gsg+aemWxE+neAFn+Zsj0XKPZXGQzCD367/d2UD4cJsqWeBDj/ZFzwkFPsJa2l
	eMoTECBjsFfLpOYvzVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE85-0000000BxKS-2VRK;
	Thu, 20 Mar 2025 11:32:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE82-0000000BxK4-0zL3
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 11:32:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEE7543150;
	Thu, 20 Mar 2025 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742470319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWcS7+LaqjyqkZYE4vdWzKlwoH9+A6aKT6QyHshPnaQ=;
	b=P9K6ugwTO5leK8GhtCbUb1gS4TsDUg1MMCfoFYEMUHnzfjo9NOyJgV9vAVd+IfShl0JvLt
	wf8xjXLHDumMs8GFxwFZVkjOxmR3ty7vc4FaqlMFjV6fTVxyqVKHkd7U6dJIdWxeZibCO4
	Sfo/8NByF4Nf0NehnKfkMOPgx+9cv+Chsqu0lWcqAERS3nzkOTXLsaqQsuWGtd+l9dehVh
	g4wNO4Ev3O6h4nTINUUjTppwm+t8UapIREdpcvZJxujPhvODlflgJe2YYDQhm7A750mGSJ
	egj4gHhqdftxnptwAlRt5QXbSyMcFVAIIrR3CfRMqIwITP1+H7/nnz8mLJSwCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/21] mtd: spinand: Use more specific naming for the
 reset op
In-Reply-To: <ba99ef52-0c98-45a9-91e0-4fd205649e00@linaro.org> (Tudor
	Ambarus's message of "Thu, 20 Mar 2025 08:08:50 +0000")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
	<9004166e-5535-4024-8114-9fdb217407bb@linaro.org>
	<87v7skrgjl.fsf@bootlin.com>
	<f1111d1b-a111-4171-9467-450d90a14c0a@linaro.org>
	<87iko50vvb.fsf@bootlin.com>
	<ba99ef52-0c98-45a9-91e0-4fd205649e00@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Mar 2025 12:31:55 +0100
Message-ID: <87msdgvsyc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdduleeihfettdfgieevtdffjeeggfefveetudeludekieffhfeiffduvdehffenucffohhmrghinhepfihinhgsohhnugdrtghomhenucfkphepledvrddukeegrdduuddtrdeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrfedtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_043202_888946_325CDAEF 
X-CRM114-Status: GOOD (  18.66  )
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

Cj4+PiBIb3cgZG8geW91IGZlZWwgYWJvdXQgYSBPUC1Bbi1Cbi1Dbi10cmFuc2FjdGlvbi1mb3Jt
YXQsCj4+PiAJd2hlcmUgQSwgQiwgQyBpcyB7MSwgMiwgNCwgOH0KPj4+IAluIGlzIHtTLCBEfQo+
Pj4gCXRyYW5zYWN0aW9uIGZvcm1hdCBpcyB7MCwxLDIsM317QSxCLEMsLi4ufQo+Pj4KPj4+IENh
cmUgbXVzdCBiZSB0YWtlbiBjYXJlIG9mIGF0IHRoZSB0cmFuc2FjdGlvbiBmb3JtYXQsIGFzIEkg
c2VlIHRoZXJlIGFyZQo+Pj4gYSBmZXcsIGRlcGVuZGluZyBvbiB0aGUgeFNQSSBwcm9maWxlIGFu
ZCBwcm90b2NvbCBtb2RlLgo+PiAKPj4gSSBtdXN0IGFkbWl0IEkgcmVhbGx5IGRpc2xpa2UgdGhl
IHRyYW5zYWN0aW9uIGZvcm1hdCBhYmJyZXZpYXRpb24gYmVjYXVzZQo+Cj4gSSdtIG5vdCBpbiBs
b3ZlIHdpdGggdGhlICJ0cmFuc2FjdGlvbiBmb3JtYXQiIGVpdGhlci4KPgo+PiBpdCBpcyBzcGVj
aWZpYyB0byBhIHNwZWMgd2UgZG8gbm90IGZvbGxvdyBhbmQgaXMgbm90IGV4cGxpY2l0LiBJIGhh
dmUgYQo+PiBzdHJvbmcgcHJlZmVyZW5jZSB0b3dhcmRzIGtlZXBpbmcganVzdCAiQW4tQm4tQ24i
LCBsaWtlIEkgZGlkIGluIHRoaXMKPgo+IE9rYXkuCj4KPj4gc2VyaWVzLiBJZiBwZW9wbGUgYXJl
IGluIGRvdWJ0LCB0aGV5IGNhbiBjaGVjayB3aGF0IGlzIGluIHRoZSBvcCwgaXQgaXMKPj4gc2Vs
ZiBleHBsYW5hdG9yeS4gSSBjaG9zZSB0aGlzIGluIHRoZSBmaXJzdCBwbGFjZSBiZWNhdXNlIGl0
IGlzIG1vcmUKPj4gZXhwbGljaXQgdGhhbiBqdXN0ICJBbiIgd2hpY2ggbWF5IGZlZWwgbGlrZSBh
IGNyb3BwZWQKPj4gYWNyb255bS4gRnVydGhlcm1vcmUsIG1vc3Qgb2N0YWwgY2FwYWJsZSBkYXRh
c2hlZXRzIEkndmUgbG9va2VkIGF0IHNlZW0KPj4gdG8gdXNlIHRoZSAiQW4tQm4tQ24iIGZvcm1h
dCwgZXZlbiBmb3Igc2luZ2xlIG9wY29kZXMuCj4KPiBTbyBmb3IgUkVTRVQsIFdSRU4sIFdSREkg
YW5kIG90aGVyIG9wY29kZXMgdGhhdCBkb24ndCByZXF1aXJlIGFkZHJlc3MKPiBhbmQgZGF0YSwg
YXJlIHRob3NlIGRhdGFzaGVldHMgcmVmZXJyaW5nIHRvIHRoZXNlIG9wY29kZXMgYXMgMS0xLTEg
Y29tbWFuZHM/Cj4gQ2FuIHlvdSBwb2ludCBtZSB0byBvbmUgb2YgdGhlc2UgZGF0YXNoZWV0cywg
cGxlYXNlPwoKQWxsIFdpbmJvbmQgZGF0YXNoZWV0cyB1c2UgdGhpcyBjb252ZW50aW9uOgpodHRw
czovL3d3dy53aW5ib25kLmNvbS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hlZXQvVzM1TjAx
SldfRGF0YXNoZWV0X0JyaWVmLnBkZgpTZWUgNy4xLjIgSW5zdHJ1Y3Rpb24gU2V0IFRhYmxlIHAu
MjUuCgpJIGNoZWNrZWQgTWFjcm9uaXggYW5kIEdpZ2FkZXZpY2UgZGF0YXNoZWV0cywgdGhleSBz
aW1wbHkgbmV2ZXIgIm5hbWUiCnRoZXNlIG9wY29kZXMgY2xlYXJseS4KCj4gSW4gU1BJIE5PUiwg
V1JFTiBpcyBqdXN0IFdSRU4sIHJlZ2FyZGxlc3Mgb2YgdGhlIG51bWJlciBvZiBsaW5lcyBpdCBp
cwo+IHNlbnQgb24sIDEsIDQsIG9yIDguIEhvdyB3b3VsZCB5b3UgbW9kZWwgaXQgaGVyZSwgMS0w
LTAsIDQtMC0wLCA4LTAtMAo+IHVzaW5nIHRoZSBzYW1lIG9wY29kZT8KCkkgZ3Vlc3MsIHllcy4K
Cj4+IFNvIHVubGVzcyB0aGVyZSBhcmUgc3Ryb25nIGFyZ3VtZW50cyBhZ2FpbnN0LCBJJ2QgcHJl
ZmVyIHRvIGtlZXAgdGhlCj4+IGN1cnJlbnQgZm9ybWF0dGluZy4gVEJILCBpdCBpcyBub3Qgc2V0
IGluIHN0b25lIGFuZCBjYW4gc3RpbGwgZXZvbHZlCj4+IGxhdGVyIGlmIHRoYXQncyBuZWVkZWQu
Cj4KPiBJIGZpbmQgdGhlIG5hbWluZyBzY2hlbWUgQW4tQm4tQ24gZ29vZCwgSSdtIGFyZ3Vpbmcg
dGhhdCBpdCdzIG5vdCBuZWVkZWQKPiBldmVyeXdoZXJlLCBvcGNvZGUgb25seSBjb21tYW5kcyBh
cmUgYmV0dGVyIG9mZiB3aXRoIGl0LCBJIHRoaW5rLgoKT2ssIEkgY2FuIGRyb3AgdGhlIC0wLTAg
aW4gdGhpcyBjYXNlIGlmIHlvdSBwcmVmZXIuCgpUaGFua3MsCk1pcXXDqGwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
