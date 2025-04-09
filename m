Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB8C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTx12ZyIxVNzzoPa5Fqa9o4R5JHmWIhUO+VFETBt4Lo=; b=Htejh9YWnbFfZB
	b5U9IJrLSQLkwdAOGHFx/bIERLKuLO7hljQ+7rOTaOOxh9MMDukkwSluJDMVBNxIC31q+TUbvpQsH
	lCfQFcSsdnD6UxgwNFX8HT2itD4V68KPfbCG2plD1Gaql1ynuNyNcEQxv1+Ra4JraER70jXcTSxlA
	nmi/gDbDJzWZcDrcOBwMWCtpofAEaBtht3mwOxCvG4u/82wzu2t7x5tMStrmLWXhtThwdjyoXkxJ6
	FhezWCV2rQg09vV9/4D3JH1N46Qrk5rmBXIsv1HWtViQb/Y9+SA0jpS3J7a70dtwkIbBFtybhunrX
	UA14SOnzs9vXq+B4Vluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SE1-00000006mKI-2ZTl;
	Wed, 09 Apr 2025 10:00:05 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SDx-00000006mJK-2ILZ
	for linux-mtd@lists.infradead.org;
	Wed, 09 Apr 2025 10:00:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90F6344387;
	Wed,  9 Apr 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744192799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbConos7mjcfP3FYJsI0LP/QcnEV6gac33lIOBxoVwo=;
	b=NuefhDuZ58M7ukgd0rEHcn7PjJC6ysu1fg9mQd0y0l0GoJcRc/078oc/pL16kVQZDXAEH4
	D8QtJCGqZF7lR9IOWpc46o2qMi+21f+63j2e2draKsgyvACU6QCOSvH2jXUGyJl8itCr1W
	dVJdNr0h07DqUE4ZKLboyDk7vqdVGbp/znB7aQ6Nsa2o3dIeAEmfwS/gOx+iaKLOwjWpmB
	00NL2c2kGo/gjhC4+NU5sgSjPj6KTXzlQmnnoddnqnP8kGNcij5LYTF5jmkv7jskxYoWvI
	D7XmkCKtDHwAD5Zf98ReHNfTeIO530Z8Spx76f1JoETuMuJtG29Jyw4zWku5NQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  "Vivi,
 Rodrigo"
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Poosa, Karthik" <karthik.poosa@intel.com>,  "Abliyev, Reuven"
 <reuven.abliyev@intel.com>,  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Mon, 7 Apr 2025 12:47:07 +0000")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
	<87ecycrko4.fsf@bootlin.com>
	<CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 11:59:57 +0200
Message-ID: <87zfgpejtu.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrt
 ghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_030002_061584_6F0CFCB9 
X-CRM114-Status: UNSURE (   9.35  )
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

SGVsbG8sCgo+IFRoZSBtdGRfbWFzdGVyIGlzIGNvbXBsZXRlbHkgZGlmZmVyZW50IGNsYXNzIHRv
IGF2b2lkIG10ZCB0cmVlIGRpc3R1cmJhbmNlcy4KPiBJdCBpcyByZWFsIGtlcm5lbCBkZXZpY2Ug
b2JqZWN0LCBJJ20gbm90IHN1cmUgaG93IHdlIGNhbiBkbyAnbGluayB0bycKPiBtYWdpYyBoZXJl
LgoKTWF5YmUgd2UgY2FuIGFkZCB0aGF0IGxhdGVyIGlmIHNvbWVvbmUgbmVlZHMuCgo+IEFib3V0
IE1URF9QQVJUSVRJT05FRF9NQVNURVIgLSB3ZSBjYW4gdHJlYXQgaXQgYXMgYW5vdGhlciBwYXJ0
aXRpb24gYW5kIAo+IGNyZWF0ZSBtYXN0ZXIgZGV2aWNlIHBsdXMgd2hvbGUgZGV2aWNlIHBhcnRp
dGlvbiBhcyBpdCdzIGNoaWxkIHdpdGggYWxsIG90aGVyCj4gcGFydGl0aW9ucyBhcyBjaGlsZHJl
biBvZiBtYXN0ZXIgZGV2aWNlLgo+IEZvciB1bnBhcnRpdGlvbmVkIGRldmljZSB0aGlzIG1lYW4g
dGhhdCB3ZSBjcmVhdGUgbWFzdGVyIGRldmljZSBhbmQgcGFydGl0aW9uCj4gcmVnYXJkbGVzcyBv
ZiBNVERfUEFSVElUSU9ORURfTUFTVEVSIGZsYWcuCgpJIGFtIG5vdCBzdXJlIEkgZm9sbG93IHlv
dS4gSSBhbSBwcm9wb3NpbmcgdG8gY3JlYXRlIHRoZSBtdGRfbWFzdGVyCmRldmljZSBpbiBhbGwg
Y2FzZXMuIEkgYmVsaWV2ZSB0aGlzIGlzIHRoZSBmdXR1cmUtcHJvb2YgYXBwcm9hY2guIENhbgp5
b3UgbWFrZSB0aGlzIGNoYW5nZT8KClJlZ2FyZGluZyB0aGUgaGllcmFyY2h5LCBJIGluZGVlZCBh
Z3JlZSB3aXRoIHdoYXQgeW91IHByb3Bvc2U6Cm10ZF9tYXN0ZXIgcGFyZW50IG9mIHdob2xlIHBh
cnRpdGlvbiBkZXZpY2UgKGlmIGFueSkgcGFyZW50IG9mCnBhcnRpdGlvbnMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
