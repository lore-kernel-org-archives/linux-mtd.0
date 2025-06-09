Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118CBC61CE8
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWeqBpgg5mdxWsajCnM6DHv35KG1lyK07ggNlImvvf4=; b=gz0HaAYyWilO4k
	MRI0OGSHRgBZygYejvtcZrBZyR9c4u7qZdmakG+TG0tZlRsqPJghdQH86DzFL3zLW2ezTAnewAO1K
	KEfICozbEFYOqANUnEe28HxwEoc0tvTRY5H3nuZqfBoWRzu6V0ZDfiEHSaZGY4FpfA0I39f5z/uDK
	IA6gKcljyPMKzzqMxvErsaWi0KAE+AOdIgOrjFoowPwx1xTGqYsIWqKzeX4DAoh/BpzWlI97ysj1t
	i3gVM46LtfQpLSZnK/YvdHV1Z6o/A8EcSeo1vK3GWN+fCk8JAjyTlhdQYD1BPZzMyk4ZKtq9BpXiL
	SNjYevoU4pubWbah9Bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZEH-00000003qQv-2C8Z;
	Mon, 09 Jun 2025 09:55:45 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZ2K-00000003oXZ-3MVr
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 09:43:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 840E743122;
	Mon,  9 Jun 2025 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4UgXCTTbnvHTrs3VX9TJ5+oerjkN8m/Ze1sEVtj3/o=;
	b=F2FIVahqxhWL8ygtZGnIRv3UVAlCxUn+9Pw6GtMfhalXGsZlVkZ2Rm77s3BY2zuRdb78lr
	jBXlvV57Sbhiflz9/0iFKSwL7sL+8yDcQY0TvU7Hp6tULiFFlnkE7r4VF41OmUr7q3rtVB
	L1TzWHN6FWANQcJ0muLsWtNyf8t5YA69TKnHn+K4yvWTbZJre6jUooiF4PkTlUri1jKsWt
	Q+HlcSNyYvCrQQutvNPU8/0bEfydjmOTvGZ/eiwd8j9w/wYeIPU5kaU7lmfkicjuzgcOhN
	6bS1QVLEEvUNVmeQ4s/HH1ZEOH93UvyG7zhSp3QvAg7M+uVMBhcP4sH1hVLQew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  "Vivi, Rodrigo"
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
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net> (Guenter
	Roeck's message of "Sun, 8 Jun 2025 17:59:37 -0700")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
	<20250302140921.504304-2-alexander.usyskin@intel.com>
	<9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
	<CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<87bjqyja7o.fsf@bootlin.com>
	<2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Jun 2025 11:43:19 +0200
Message-ID: <87ikl5xnbc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutedtfeelvefgjeevuedukefhtefgiefftdekffffteduheduheelgedutdetueenucffohhmrghinhepughtshhirdhishenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrt
 ghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_024325_447905_40252811 
X-CRM114-Status: GOOD (  14.75  )
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

Cj4+Pj4gU2V2ZXJhbCBvZiBteSBxZW11IGJvb3QgdGVzdHMgZmFpbCB0byBib290IGZyb20gbXRk
IGRldmljZXMgd2l0aCB0aGlzIHBhdGNoCj4+Pj4gaW4gdGhlIG1haW5saW5lIGtlcm5lbC4gUmV2
ZXJ0aW5nIGl0IGZpeGVzIHRoZSBwcm9ibGVtLiBBcyBmYXIgYXMgSSBjYW4KPj4+PiBzZWUgdGhp
cyBhZmZlY3RzIGNvbmZpZ3VyYXRpb25zIHdpdGggQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNU
RVI9eQo+Pj4+IHdoZW4KPj4+PiB0cnlpbmcgdG8gYm9vdCBmcm9tIGFuIG10ZCBwYXJ0aXRpb24g
b3RoZXIgdGhhbiBtdGRibG9jazAsIHdpdGggdGhlCj4+Pj4gbXRkIHBhcnRpdGlvbiBkYXRhIGlu
IGRldmljZXRyZWUgKC4uLi9hc3BlZWQvb3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaSkuCj4+Pj4g
SXMgdGhlcmUgYSBndWlkYW5jZSBkZXNjcmliaW5nIHRoZSBjaGFuZ2VkIGJlaGF2aW9yLCBieSBh
bnkgY2hhbmNlLAo+Pj4+IGFuZCBob3cgdGhlIGJvb3QgY29tbWFuZCBsaW5lIG5vdyBuZWVkcyB0
byBsb29rIGxpa2Ugd2hlbiB1c2luZyBvbmUgb2YKPj4+PiB0aGUgZmxhc2ggcGFydGl0aW9ucyBh
cyByb290IGZpbGUgc3lzdGVtID8KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBHdWVudGVyCj4+Pgo+
Pj4gSSd2ZSB0cmllZCB0byBtYWtlIGlzIGFzIHRyYW5zcGFyZW50IGFzIHBvc3NpYmxlIGZvciB0
aGUgZXhpc3RpbmcgdXNlcnMuCj4+PiBPbmx5IGNoYW5nZSBpcyB0aGF0IG5vdyBldmVyeSBwYXJ0
aXRpb24gaGFzIG1hc3RlciB0aGF0IGlzIG5vdCBwYXJ0aXRpb25lZC4KPj4+IElzIHRoZSBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj1uIGZpeGVkIHRoZSBwcm9ibGVtIGZvciB5b3U/Cj4+
IE5vIGNoYW5nZSBpcyBleHBlY3RlZCwgY2FuIHlvdSBwbGVhc2UgZGVzY3JpYmUgdGhlIGRldmlj
ZXMgdGhhdCB5b3UKPj4gb2JzZXJ2ZSB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaD8gTWF5YmUg
dGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIGluCj4+IHRoZSBjb3JlIGxvZ2ljLgo+PiAKPgo+IEkg
YW0gdHJ5aW5nIHRvIGJvb3Qgc3VwZXJtaWNyby14MTFzcGktYm1jIGluIHFlbXUgZnJvbSBmbGFz
aCBwYXJ0aXRpb24gNi4KPiBUaGUgcWVtdSBjb21tYW5kIGxpbmUgaXMgc29tZXRoaW5nIGxpa2UK
Pgo+ICAgICBxZW11LXN5c3RlbS1hcm0gLU0gc3VwZXJtaWNyby14MTFzcGktYm1jLGZtYy1tb2Rl
bD1uMjVxMjU2YTEzLHNwaS1tb2RlbD1uMjVxMjU2YTEzIFwKPiAJLWtlcm5lbCBhcmNoL2FybS9i
b290L3pJbWFnZSAtbm8tcmVib290IC1zbmFwc2hvdCBcCj4gCS1hdWRpbyBub25lIFwKPiAJLWRy
aXZlIGZpbGU9L3RtcC9mbGFzaCxmb3JtYXQ9cmF3LGlmPW10ZCxpbmRleD0xIFwKPiAJLW5pYyB1
c2VyIFwKPiAJLS1hcHBlbmQgInJvb3Q9L2Rldi9tdGRibG9jazYgcm9vdHdhaXQgY29uc29sZT10
dHlTNCwxMTUyMDAgZWFybHljb249dWFydDgyNTAsbW1pbzMyLDB4MWU3ODQwMDAsMTE1MjAwbjgi
IFwKPiAJLWR0YiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWJtYy1zdXBlcm1pY3Jv
LXgxMXNwaS5kdGIgXAo+IAktbm9ncmFwaGljIC1tb25pdG9yIG51bGwgLXNlcmlhbCBzdGRpbwo+
Cj4gVGhpcyBpcyB3aXRoIGFzcGVlZF9nNV9kZWZjb25maWcuIE5vdGUgdGhhdCB0aGUgZmxhc2gg
bW9kZWxzIG5lZWQgdG8gYmUgc3BlY2lmaWVkLgo+IFRoZSBkZWZhdWx0IGZsYXNoZXMgYXJlIG5v
IGxvbmdlciByZWNvZ25pemVkIHdoZW4gYm9vdGluZyBmcm9tIHFlbXUgc2luY2UgY29tbWl0Cj4g
OTQ3Yzg2ZTQ4MWEwICgibXRkOiBzcGktbm9yOiBtYWNyb25peDogRHJvcCB0aGUgcmVkdW5kYW50
IGZsYXNoIGluZm8gZmllbGRzIikuCj4KPiBUaGUgYWJvdmUgb25seSB3b3JrcyB3aXRoIHRoaXMg
cGF0Y2ggcmV2ZXJ0ZWQgKG9yIHdpdGggdjYuMTUgYW5kIG9sZGVyLCBvZiBjb3Vyc2UpLgo+Cj4g
R3VlbnRlcgoKQWxleGFuZGVyLCBjYW4geW91IHBsZWFzZSBpbnZlc3RpZ2F0ZT8gV2UgbmVlZCBh
IGZpeCBiZWNhdXNlIEd1ZW50ZXIKbWlnaHQgbm90IGJlIHRoZSBvbmx5IGFmZmVjdGVyIHVzZXIu
IE90aGVyd2lzZSB0aGlzIHBhdGNoIGNhbid0IHN0YW5kLAp1bmZvcnR1bmF0ZWx5LgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
