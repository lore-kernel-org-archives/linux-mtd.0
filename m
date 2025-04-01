Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30E3C36014
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Apr 2025 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djAcMzKI5xsEZQZcw+fjQb8n2GHPVdv/xhIy5gsiXXg=; b=ftzpm7tyPcWvvG
	Ldi1FemX4cv3GlRnsK0K9ZtnsjxQ2e/UxJ+XX3Pz8xCjBO2VJhp11lqxm+jh/n9pgzkp0065hOnMw
	mh3ELARi3LN4SU22mM+SVIoaHPLbChSSLFq+CbeJYn875M25lFEEU1eAEyUKfT1ny81/ORNfBGrpz
	hsmD6c22u3fpQP81PNL7yBwnXsxxMPYNrXSItrispjCgCc73LzISSnfSDuwQZmfgZouKvYNHbvmYW
	7ElVY1JA1M0xjI5+xSf792NhY0VkGJXDuqCA0s2n9Bk4rzIhGA9Fw7dAFhJLc/w3BFBJCxBjRKBTc
	k1ybZpOOTfOK89y0H9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd8H-00000003fDI-18mh;
	Tue, 01 Apr 2025 15:02:29 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd6e-00000003ep0-2XRs
	for linux-mtd@lists.infradead.org;
	Tue, 01 Apr 2025 15:00:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 921F5441C8;
	Tue,  1 Apr 2025 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743519646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6SUzGcMkPKel2Eccn/jYaKzkfn5nDr4VwnUJsYHcl0=;
	b=GMFYHBDmkQqPnwkmOAvUpfp7X/+LmL7dcjdsCjsTdJynnH4itkSn1hQxCz5+SCHo1uaclf
	DhgtZjY4wTeHh3eozM/vo5clyziidRAKCKFpzukdJ18oiayB6OHyD0IAd2+Luv1CSMp1gD
	zY/JN/ez/OxbyQY0KoB1rJxDH4cgB5kVBny+R9Xqxu+BqgxnjIxQ7QpvHp8Jrrz21EIWBv
	8JOX6UARWLuysU9uR3cJezATqmPZbdx1VtrBi/dHC/aKYZWjiGqymqvGJBV9Qw7YGDO25i
	GAc2Rla0P/hRZ+f7DASVPsS87VlZylgntjN5l/aSlpNhYftOGqddTvQHiMmsfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
  linux-mtd@lists.infradead.org,  dri-devel@lists.freedesktop.org,
  intel-gfx@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <20250326152623.3897204-2-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Wed, 26 Mar 2025 17:26:12 +0200")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 01 Apr 2025 17:00:43 +0200
Message-ID: <87ecycrko4.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeftdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdduleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvl
 hdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_080049_085826_9FF8260B 
X-CRM114-Status: GOOD (  12.16  )
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

SGVsbG8gQWxleGFuZGVyLAoKT24gMjYvMDMvMjAyNSBhdCAxNzoyNjoxMiArMDIsIEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBDcmVhdGUg
bWFzdGVyIGRldmljZSB3aXRob3V0IHBhcnRpdGlvbiB3aGVuCj4gQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIgZmxhZyBpcyB1bnNldC4KPgo+IFRoaXMgc3RyZWFtbGluZXMgZGV2aWNlIHRy
ZWUgYW5kIGFsbG93cyB0byBhbmNob3IKPiBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgb24gbWFz
dGVyIGRldmljZSBpbiBhbGwgY2FzZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5
c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPgoKSSBzdWNjZXNzZnVsbHkgdGVzdGVk
IGl0LCB0aGlzIHBhdGNoIHdpbGwgYmUgYXBwbGllZCBhdCAtcmMxIHRvIHRoZQptdGQvbmV4dCB0
cmVlLgoKSSB3YXMgd29uZGVyaW5nLCBkbyB5b3UgdGhpbmsgaXQgd291bGQgYmUgcG9zc2libGUg
dG8ga2VlcCB0aGUgY3JlYXRpb24Kb2YgbXRkX21hc3RlciBhbmQgbWFrZSBpdCBhIHN5bWJvbGlj
IGxpbmsgdG8gbXRkeCB3aGVuCk1URF9QQVJUSVRJT05FRF9NQVNURVI9eSBvciB3aGVuIHRoZXJl
IGlzIG5vIHBhcnRpdGlvbj8gSW4gc2hvcnQsIGFsd2F5cwpoYXZpbmcgbXRkX21hc3RlcngsIGJl
Y2F1c2UgSSBmZWFyIGF0IHNvbWUgcG9pbnQgd2UnbGwgaGF2ZSBwcm9ibGVtcwpvdGhlcndpc2Ug
Oi0pCgpSaWdodCBub3cgd2UgaGF2ZToKCi0gV2l0aG91dCBwYXJ0aXRpb246Cm10ZDAgKG10ZDBy
byBtdGRibG9jazApCi0gV2l0aCBwYXJ0aXRpb24gYW5kIE1URF9QQVJUSVRJT05FRF9NQVNURVI9
bgptdGQwIChtdGQwcm8gbXRkYmxvY2swKQptdGRfbWFzdGVyMAotIFdpdGggcGFydGl0aW9uIGFu
ZCBNVERfUEFSVElUSU9ORURfTUFTVEVSPXkKbXRkMCAobXRkMHJvIG10ZGJsb2NrMCkgW3RoaXMg
aXMgdGhlIG1hc3Rlcl0KbXRkMSAobXRkMXJvIG10ZGJsb2NrMSkKCkkgYW0gc3VnZ2VzdGluZzoK
LSBXaXRob3V0IHBhcnRpdGlvbjoKbXRkMCAobXRkMHJvIG10ZGJsb2NrMCkKbXRkX21hc3RlcjAg
LT4gbGluayB0byBtdGQwCi0gV2l0aCBwYXJ0aXRpb24gYW5kIE1URF9QQVJUSVRJT05FRF9NQVNU
RVI9bgptdGQwIChtdGQwcm8gbXRkYmxvY2swKQptdGRfbWFzdGVyMAotIFdpdGggcGFydGl0aW9u
IGFuZCBNVERfUEFSVElUSU9ORURfTUFTVEVSPXkKbXRkMCAobXRkMHJvIG10ZGJsb2NrMCkgW3Ro
aXMgaXMgdGhlIG1hc3Rlcl0KbXRkMSAobXRkMXJvIG10ZGJsb2NrMSkKbXRkX21hc3RlcjAgLT4g
bGluayB0byBtdGQwCgpXaGF0IGRvIHlvdSB0aGluaz8gT3IgbWF5YmUgZXZlbiBhbHdheXMgbXRk
X21hc3RlciBpbiB0aGUgZmlyc3QgcGxhY2UuCgpSaWNoYXJkLCB5b3VyIHBvaW50IG9mIHZpZXcg
b24gdGhpcz8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
