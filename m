Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A565AC369A1
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WVGnYQd9Zwkhdtjt87LEY/BiND7nYPNHWmaFyhvh9Y=; b=oJDG5Jap0jOh4v
	wwNgS1tDOcDe9NCZNItjEoeaHDTjk+Jd9V6B20pjeSb2g081Ose8CFhFCaZ1XKeIz9F5nhXaopDzd
	WNsZCX6YDBKumZvUXgkg0LLxOkznEL2KYm4qovDL7qz0MYzTxhX+kuxkNrc9bqPYJ4yVijvKav/qu
	XrdbrhuOea8mUdUXFaGctuXjgiPVpojT5nVlbjjPJ47erPfmn8mM+5A6ERNCT4tZR8qonK442ynaE
	ot/xn5w84Ps1EIVfgw2vlvXFNXKVxgMCNP6uMnolhrOWPxjXMvE0U7mAjEZ/sccO6MAAuHLmrnqgW
	Z2G7FUz5QW9HP1svWKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gnz-0000000Gjn6-0RWr;
	Mon, 07 Apr 2025 07:22:03 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gjD-0000000GiHA-1S3l
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:17:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84A8820579;
	Mon,  7 Apr 2025 07:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744010224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKwzOYh8aAJuS+S3TkD57w5LMO2QhltXuYUO7CZQNWM=;
	b=RXDCWCMNUclxLzRL6AiK1Fmxi79I2R8O37PVEhcp5lNPDKqaT2r42YJRp2/v6lyOzf7QvT
	Poqw1OEyv/XO2jhlihzZshc2WMeMl7V4OOVUlEQNW5c7VVdVuhAEUy4ZkefKIl9703X1Lx
	aAi1UzRmliogVdI/Dzk5IgeFfmxAWEkSE9Kw0iXCYDiRyFV4nqEO1cGUZiFM0IWD5b7G5o
	DU2u9aAZF+fuxVjmSuQ9BSlPVAT+BkcQ53Xvf2ODYFcAKdiGeaAGrYC4gKCtMlUnUXrwXJ
	ZKOPY2qIfBOv/d9TlmMIKVrLwer5cQD1ax7aZq/lwXkJYaybnVH5MuItoHd4cA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  <linux-kernel@vger.kernel.org>,  Steam Lin <stlin2@winbond.com>,  Jean
 Delvare <jdelvare@suse.de>,  kernel test robot <lkp@intel.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Fix build with gcc < 7.5
In-Reply-To: <20250401133637.219618-1-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Tue, 1 Apr 2025 15:36:37 +0200")
References: <20250401133637.219618-1-miquel.raynal@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 09:16:59 +0200
Message-ID: <87ikngh250.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeeftdefledvieegvdejlefgleegjefhgfeuleevgfdtjeehudffhedvheegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpt
 hhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001707_532154_F4C432C7 
X-CRM114-Status: GOOD (  10.55  )
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

SGVsbG8sCgpPbiAwMS8wNC8yMDI1IGF0IDE1OjM2OjM3ICswMiwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IF9fVkFfT1BUX18gaXMgYSBtYWNybyB0
aGF0IGlzIHVzZWZ1bCB3aGVuIHNvbWUgYXJndW1lbnRzIGNhbiBiZSBwcmVzZW50Cj4gb3Igbm90
IHRvIGVudGlyZWx5IHNraXAgc29tZSBwYXJ0IG9mIGEgZGVmaW5pdGlvbi4gVW5mb3J0dW5hdGVs
eSwgaXQKPiBpcyBhIHRvbyByZWNlbnQgYWRkaXRpb24gdGhhdCBzb21lIG9mIHRoZSBzdGlsbCBz
dXBwb3J0ZWQgb2xkIEdDQwo+IHZlcnNpb25zIGRvIG5vdCBrbm93IGFib3V0LCBhbmQgaXMgYW55
d2F5IG5vdCBwYXJ0IG9mIEMxMSB0aGF0IGlzIHRoZQo+IHZlcnNpb24gdXNlZCBpbiB0aGUga2Vy
bmVsLgo+Cj4gRmluZCBhIHRyaWNrIHRvIHJlbW92ZSB0aGlzIG1hY3JvLCB0eXBpY2FsbHkgJ19f
VkFfQVJHU19fICsgMCcgaXMgYQo+IHdvcmthcm91bmQgdXNlZCBpbiBuZXRsaW5rLmggd2hpY2gg
d29ya3MgdmVyeSB3ZWxsIGhlcmUsIGFzIHdlIGVpdGhlcgo+IGV4cGVjdDoKPiAtIDAKPiAtIEEg
cG9zaXRpdmUgdmFsdWUKPiAtIE5vIHZhbHVlLCB3aGljaCBtZWFucyB0aGUgZmllbGQgc2hvdWxk
IGJlIDAuCj4KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwMzE4
MTMzMC5ZY0RYR3k3Ri1sa3BAaW50ZWwuY29tLwo+IEZpeGVzOiA3Y2UwZDE2ZDU4MDIgKCJtdGQ6
IHNwaW5hbmQ6IEFkZCBhbiBvcHRpb25hbCBmcmVxdWVuY3kgdG8gcmVhZCBmcm9tIGNhY2hlIG1h
Y3JvcyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQXBwbGllZCBvbiB0b3Agb2Yg
bXRkL2ZpeGVzIHdpdGggYW4gdW5yZWxhdGVkIGNvbmZsaWN0IHJlc29sdmVkLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
