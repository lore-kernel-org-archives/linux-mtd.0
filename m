Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC89C0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6vd5eLyGCQ4fKTZGFCEONTSyCZjP1e/Kq0EjZ46aVo=; b=MaDg7anfIzamBa
	CtWxq5S18GkhXQ/sF4zdLCFG/r6MNHVKgKykPg5GSQduwkcv20vCAXiCdwT9zbNUAE/QRbDW05VCi
	+AXxTM5o2lUz7zr0BJy63knZ+rSPt0xKh8yoRydFuXuuglFaJAf2MdikvSxZqxT2axOoSIc7I1ydK
	XpaZ3jkcP1kuKIdD95YrI/zlFY6IIUMnLizFmYsEiNqRw8D4zP3fxTdhvIpVKezy/h3iGxSy0+Ghp
	s1/mVrf0FEniNV6shZ99q137JAxqECgFBkmYiixjRDM/pkBkOwIC14wXDrog8QSWmItnhFZfYlOQh
	iYWs+rs/2bIwdtwR7lTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4ip-00000006gcS-0uFg;
	Wed, 29 Jan 2025 09:50:59 +0000
Received: from relay0.mail.gandi.net ([2001:4b98:dc4:8::220])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4il-00000006gbG-3pQg
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 09:50:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDDCD43CE7;
	Wed, 29 Jan 2025 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738144252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5/hH2eQNIxaEKR4UZ9Yifx6/1l0+sclpZ9danicZY8=;
	b=XD36neVSI3h1WebmsU2nMfPdWrLKpbXdjiBx1m6SjRy/2Qy/WYjF++Kyba9tvZ7tUy88Xn
	nfZ/sGdny6WZxOByOWG3x8sFV4IYiCqzOGAMYJTMtIBANIkDwhE3tMBB2p/S+KH6r3wb/9
	MEhSHkrmnpLmYE3BI1mT5XeACzOOe1zjKIvCJov7MINCZ0Kaa6/8apvpCjmSEHZibKYVM5
	KLR1DYDl82rl86tg5+OZMt4YQrB/Q3JdJrD0WmmjJ+AnDqrBIQz5Fm76+L3w5jAdE+Vkdu
	2tZk/bDMi/J5/M5Pu3712VPTiZl84rIPGRtJB+S8iyJJibicFIciVCTorCRbUg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: cadence: use dma_map_resource for
 sdma address
In-Reply-To: <BL3PR11MB653280E16A4399DDBB300CA8A2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Wed, 29 Jan 2025 09:02:58 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-3-niravkumar.l.rabara@intel.com>
	<87ed0wpk6h.fsf@bootlin.com>
	<BL3PR11MB653280E16A4399DDBB300CA8A2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 29 Jan 2025 10:50:50 +0100
Message-ID: <87wmee0wzp.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnihhrrghvkhhumhgrrhdrlhdrrhgrsggrrhgrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorhhgpdhrtghpthhtohepshhhvghnlhhitghhuhgrnhesvhhivhhordgtohhmpdhrtghpthhtoheprhhurghnjhhinhhji
 hgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_015056_100236_F9E2AE65 
X-CRM114-Status: UNSURE (   9.96  )
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

SGVsbG8sCgo+PiA+IE1hcCB0aGUgc2xhdmUgRE1BIEkvTyBhZGRyZXNzIHVzaW5nIGRtYV9tYXBf
cmVzb3VyY2UuCj4+ID4gV2hlbiBBUk0gU01NVSBpcyBlbmFibGVkLCB1c2luZyBhIGRpcmVjdCBw
aHlzaWNhbCBhZGRyZXNzIG9mIFNETUEKPj4gPiByZXN1bHRzIGluIERNQSB0cmFuc2FjdGlvbiBm
YWlsdXJlLgo+PiAKPj4gSXQgaXMgaW4gZ2VuZXJhbCBhIGJldHRlciBwcmFjdGljZSBhbnl3YXku
IERyaXZlcnMgc2hvdWxkIGJlIHBvcnRhYmxlIGFuZAo+PiBhbHdheXMgcmVtYXAgcmVzb3VyY2Vz
LgoKSSBhY3R1YWxseSBoYWQgYSBsb29rIGF0IHRoZSBrZXJuZWwgc291cmNlcyBhZ2FpbiByZWdh
cmRpbmcgdGhlIHVzZSBvZgp0aGUgbWFwX3Jlc291cmNlKCkgaGVscGVyLCBhbmQgaXQgaXMgdmVy
eSBzdHJhbmdlbHkgdXNlZC4gU29tZXRpbWVzIHRoZQpETUEgY29udHJvbGxlciBkb2VzIHRoZSBy
ZW1hcHBpbmcsIHNvbWV0aW1lcyBpdCBpcyB0aGUgc2xhdmUgZGV2aWNlLiBUaGUKY29yZSBhbmQg
aGVhZGVycyBhcmUgdG90YWxseSB1bmNsZWFyIGFib3V0IHdobyBzaG91bGQgdGFrZSB0aGUgYWN0
aW9uLgpBbnl3YXksIHlvdXIgZGlmZiBpcyBmaW5lIEkgYmVsaWV2ZS4KCj4gRG8geW91IHRoaW5r
IHRoZSBjb21taXQgbWVzc2FnZSBiZWxvdyB3b3VsZCBiZSBiZXR0ZXIsIG9yIAo+IHN0aWNrIHdp
dGggdGhlIGV4aXN0aW5nIG9uZT8KPgo+IFJlbWFwIHRoZSBzbGF2ZSBETUEgSS9PIHJlc291cmNl
cyB0byBlbmhhbmNlIGRyaXZlciBwb3J0YWJpbGl0eS4KPiBVc2luZyBhIHBoeXNpY2FsIGFkZHJl
c3MgY2F1c2VzIERNQSB0cmFuc2xhdGlvbiBmYWlsdXJlIHdoZW4gdGhlCj4gQVJNIFNNTVUgaXMg
ZW5hYmxlZC4KCkZpbmUgYnkgbWUhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
