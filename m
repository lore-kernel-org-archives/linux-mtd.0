Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB3C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKaPWuKz3TPxLUjj0MutE9Z+AhzOChn3Ed8j7DQqZfA=; b=H8PjZMfCjN7Thn
	0W1+Ch55xQy/IEtX2xV+8NcdHJ/BJ2HlIJ0BbWFlvPnLho/arYkHVxj4bi1IkksECxZd0qDdIdvhM
	R4wa8JvumOI4vn+UlVOrn8/H1o1xM2pZgQL+eiJ2ItyFK4PCbGJqAJw76Anm5BltNwQ+D677kw9NO
	eF0CULBBMbZRcEkWqpGr+wkKpBQdpCirjtiIK/eFLc4dT8ROA9vvVWImXh9+bblEgJPDzPxkDbtZh
	clbg/CieFmYFxjd2TY/Ht7m8q/hOJ5CjEiYbAt1vaxbkJYOrLfOcC3yDQLMjhfAZTny2njtAEieGL
	pKPUZFDVsV8T9L6uNwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZQ9-00000006S5B-0lP1;
	Tue, 18 Mar 2025 16:04:01 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZOo-00000006Rqz-0yqp
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 16:02:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B84CF4431C;
	Tue, 18 Mar 2025 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742313755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baOMbasIHySzN1tAztBhKFZtQWvc7C7Z2zw5B3J1lYM=;
	b=fM5q+AK1CwYjUwitI0Cpn3nkCc3ChML/bUVxQAO4WCOPMQBJbDA2kT6ZDrE3s9xL9XkiXa
	tidgSSlZ7Nupi/KYPMSJKw0HhIrPemspSi4GI5uaaPpZTDS4B3llqyLOMUbQcNXYW5zFz7
	1Zw8Tsa83IG1i1MN8kFMc86gDOEiejrvSKL9rJIASf2dGidPgfBJnUsh4sCRr1N4/zuBC/
	6BKmhNR7WCWdoPbbKnPSwIVzuA+C854HLUpohwXgGw0opkc9L0pV95P71bIHb4h+SlXDMJ
	OpYza+rkGP9mKQah9G3CMEk9LBt9a0q/gx+h5nNvkUXnL9V+z7ZwB0CYpMVKgA==
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
Subject: Re: [PATCH v6 00/11] mtd: add driver for Intel discrete graphics
In-Reply-To: <20250302140921.504304-1-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Sun, 2 Mar 2025 16:09:10 +0200")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 17:02:33 +0100
Message-ID: <87frja72ee.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrt
 ghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_090238_417192_F48E0FF4 
X-CRM114-Status: GOOD (  13.16  )
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

SGVsbG8gQWxleGFuZGVyLAoKT24gMDIvMDMvMjAyNSBhdCAxNjowOToxMCArMDIsIEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBBZGQgZHJp
dmVyIGZvciBhY2Nlc3MgdG8gSW50ZWwgZGlzY3JldGUgZ3JhcGhpY3MgY2FyZAo+IGludGVybmFs
IE5WTSBkZXZpY2UuCj4gRXhwb3NlIGRldmljZSBvbiBhdXhpbGlhcnkgYnVzIGJ5IGk5MTUgYW5k
IFhlIGRyaXZlcnMgYW5kCj4gcHJvdmlkZSBtdGQgZHJpdmVyIHRvIHJlZ2lzdGVyIHRoaXMgZGV2
aWNlIHdpdGggTVREIGZyYW1ld29yay4KPgo+IFRoaXMgaXMgYSByZXdyaXRlIG9mICJkcm0vaTkx
NS9zcGk6IHNwaSBhY2Nlc3MgZm9yIGRpc2NyZXRlIGdyYXBoaWNzIgo+IGFuZCAic3BpOiBhZGQg
ZHJpdmVyIGZvciBJbnRlbCBkaXNjcmV0ZSBncmFwaGljcyIKPiBzZXJpZXMgd2l0aCBjb25uZWN0
aW9uIHRvIHRoZSBYZSBkcml2ZXIgYW5kIHNwbGl0dGluZwo+IHRoZSBzcGkgZHJpdmVyIHBhcnQg
dG8gc2VwYXJhdGUgbW9kdWxlIGluIG10ZCBzdWJzeXN0ZW0uCj4KPiBUaGlzIHNlcmllcyBpbnRl
bmRlZCB0byBiZSBwdXNoZWQgdGhyb3VnaCBkcm0teGUtbmV4dC4KCkkgbmVlZCB0byB0ZXN0IHBh
dGNoIDEsIHNvcnJ5IGZvciB0aGUgZGVsYXksIEkgd2lsbCBkbyB0aGF0IGFuZCBpZiBJJ20KaGFw
cHkgd2l0aCB0aGUgcmVzdWx0IEknbGwgYXBwbHkgdGhpcyBwYXRjaCB0byBtdGQvbmV4dCBhdCAt
cmMxIChiZXR0ZXIKaGF2aW5nIHRoaXMga2luZCBvZiBjaGFuZ2UgZWFybHkgaW4gdGhlIGN5Y2xl
KS4KClRoZSBvdGhlciBwYXRjaGVzIGNhbiBnbyB0aHJvdWdoIGRybSBJIGd1ZXNzLCByZWdhcmRs
ZXNzIG9mIHRoZSBwcmVzZW5jZQpvZiBwYXRjaCAxLiBJJ2xsIHNlbmQgbXkgYWNrcyBhZnRlciB0
ZXN0aW5nLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
