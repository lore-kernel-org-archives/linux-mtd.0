Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C08C3ABA9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qzUiqeCmCJlLt4pI7SwjEge7ZvBDySMYp2JTkxwgSE=; b=A6BUF+Mcbh62eY
	mH1Q9T1faf6tIixxthM4aAlIP5PoySPpDiljvyejQxTlxDdgaIRCzQdDfXknx+DYjIM8ksWdgpW2t
	gFeLJ9xVWtYvgrxfNJO8rPpVbswy1i8Ar9vN5bD/fImlKaNfx0WScXgFOJnEZG9JrWLSQTK8mHZ8+
	Jyp1Lm+mRcbjulcmzvP7xITMA0yMT0C+LY5sLpueaG6XqMPR0BeRjm39gXL3ezNLaJWuH3H+0Pc/V
	FXUK96ARtJTcnaXj3uL7KEX4VpDGZeIBbhXQ2GCXTjTY9t7ZAxCNIT0nGQnTuZqzEqqa/yY1ZhmGz
	dpSDkgslL9om0E7VElGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hBN-000000096tp-0Emh;
	Tue, 29 Apr 2025 09:23:17 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hBK-000000096sR-1GCA
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:23:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6D0642E81;
	Tue, 29 Apr 2025 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2cGPRIrVD8SvLOeqH9eQ/+WFFo1HAM2HPHEdzfI61k=;
	b=afydCzvlZHCX4KBGrmWxUCAaohiMB8Z29EkDTIRA8n/F5RGPtvZ1C4MJ8ameuWwbE6YAm0
	sLp8LH3C/r13z6V9ae8XzqD57EaZEp8fRW7oMCMhuHEhI5QcSO+txJQpdgqsRpAhkE+6nG
	bcVkcRjxWCSZLdQ8PzoKa1Hcyt6G4CJj0AFEK0QF3bdl/4ygpeDGk5syq7km5x2He8Aa1Y
	DeVELxVU4M29fV7o6dYUvzK+yV59pKwx+zxL4ngzZDA4Py+6ioCju5j0Gu1c6zjgYtws1C
	bITu68gD/AQgt5t06KFc4Ld/0JOYl6pjMqv4EWHSmczzeiyKlo6ZaSlyIxWuMQ==
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
Date: Tue, 29 Apr 2025 11:23:08 +0200
Message-ID: <87ldrjtj7n.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvl
 hdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022314_519381_AF40C3D4 
X-CRM114-Status: UNSURE (   6.82  )
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

T24gMjYvMDMvMjAyNSBhdCAxNzoyNjoxMiArMDIsIEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5k
ZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBDcmVhdGUgbWFzdGVyIGRldmljZSB3aXRo
b3V0IHBhcnRpdGlvbiB3aGVuCj4gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIgZmxhZyBp
cyB1bnNldC4KPgo+IFRoaXMgc3RyZWFtbGluZXMgZGV2aWNlIHRyZWUgYW5kIGFsbG93cyB0byBh
bmNob3IKPiBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgb24gbWFzdGVyIGRldmljZSBpbiBhbGwg
Y2FzZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVz
eXNraW5AaW50ZWwuY29tPgoKQXBwbGllZCB0byBtdGQvbmV4dC4gVGhhbmtzIQoKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
