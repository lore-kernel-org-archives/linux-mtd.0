Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725F2C71136
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ9H5ahbdU7PLbHB7YV40zGM2YoFBd6JHcX7vn+oZ2g=; b=z//orBLWQ5NnC1
	NIO6R+m6wdQN6IG5g9JETZZ2gWaZ0Fe7ZmWjE5rfYnf+J3gyZdqGGyjlDZhdxk2Zc5FBcEzuvm4vY
	hFWg+1JUOkZ8QuBUJKa87ryRNEd8oOp/k/RLNDzvFwxgRw9Kzd9FXqqnkJBrBv4QmJfmHJVrSr49/
	ReLk9u1XGjhlaffLkmKpTOhfgphM6NUT9PCF7FKYp0HmWMxTFnavQCR7akUZiqSIPUfr44VVR3PaV
	9IKCnRHA9awxpC79z0m+TcdpgnHLle0T5Gx1EEjnz2nCdhcfoG3Kg+sZwueBo7H7xQv5HXg+PpnLO
	iZPpVrN0QH3Gy80l/jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkz-0000000A9j3-2d5F;
	Wed, 11 Jun 2025 14:48:49 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHr0-00000009UGL-0QHH
	for linux-mtd@lists.infradead.org;
	Wed, 11 Jun 2025 09:34:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F5F043892;
	Wed, 11 Jun 2025 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749634467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTWVYcBwptCdDBnF3kGmXjZmZTDyF4Frz+J6o+FH2MA=;
	b=lvwelx4kVGW22Z4IvdtLWkF3fN2blgoJPRxQOY3wdzY/CH7Q/4PPHRwf3I3eeiOvInNLLm
	lx5EWeemSQaEK6K+gyrHSocE852TsxYM1RAyPtQ1Q/CX+BBB+pyGZbsLzgh/H+cdRSOcyj
	GiLrUfiWQDI6Fxj3ZdcukmRhRKMAmVh2W8fG4MqSwKX0h/XGen9CK1h0X0xEmbTZxCD0i6
	RVFjX+gznOqxAnIaLbvbfSJ0n6A/uHVszsZ/jAq1oWSDRbotgFnUJ0LZEjk8FyZMyI29fz
	VSp6WxG4MfGhU7gdxoqrqqRhGRlUr7c3tmB6UePCDNSgZy31zn2t4PX0uUxNlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Weinberger <richard@nod.at>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
  linux-mtd <linux-mtd@lists.infradead.org>,  DRI mailing list
 <dri-devel@lists.freedesktop.org>,  intel-gfx
 <intel-gfx@lists.freedesktop.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net> (Guenter
	Roeck's message of "Tue, 10 Jun 2025 09:15:25 -0700")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
	<87ikl5xnbc.fsf@bootlin.com>
	<CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
	<CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
	<1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
	<CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
	<c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 11 Jun 2025 11:34:25 +0200
Message-ID: <877c1ivcym.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmr
 ghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_023442_599293_D6C724BA 
X-CRM114-Status: GOOD (  12.82  )
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

T24gMTAvMDYvMjAyNSBhdCAwOToxNToyNSAtMDcsIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4gd3JvdGU6Cgo+IE9uIDYvMTAvMjUgMDU6NTQsIFJpY2hhcmQgV2VpbmJlcmdlciB3
cm90ZToKPj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gVm9uOiAiQWxleGFu
ZGVyIFVzeXNraW4iIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4+PiBSaWNoYXJkLCBJ
J3ZlIHJlcHJvZHVjZWQgeW91ciBzZXR1cCAobW9kdWxvIHRoYXQgSSBtdXN0IGxvYWQgbXRkcmFt
IG1hbnVhbGx5KQo+Pj4gYW5kIHBhdGNoIHByb3ZpZGVkIGluIHRoaXMgdGhyZWFkIGhlbHBzIHRv
IGZpeCB0aGUgaXNzdWUuCj4+PiBDYW4geW91IGFwcGx5IGFuZCBjb25maXJtPwo+PiBZZXMsIGl0
IGZpeGVzIHRoZSBpc3N1ZSBoZXJlISA6LSkKPj4gCj4KPiBJdCBkb2Vzbid0IHNlZW0gdG8gZml4
IHRoZSBpc3N1ZSBpZiB0aGUgcGFydGl0aW9uIGRhdGEgaXMgaW4KPiBkZXZpY2V0cmVlLgoKSSBo
YWQgYSBsb29rIGF0IHRoZSBwYXRjaCBhZ2Fpbi4gVGhlIHdob2xlIG10ZCBjb3JlIG1ha2VzIGFz
c3VtcHRpb25zIG9uCnBhcmVudGluZywgd2hpY2ggaXMgdG90YWxseSBjaGFuZ2VkIHdpdGggdGhp
cyBwYXRjaC4gVGhlcmUgYXJlIHNvIG1hbnkKY3JlYXRpdmUgd2F5cyB0aGlzIGNhbiBicmVhaywg
SSBkb24ndCBiZWxpZXZlIHdlIGFyZSBnb2luZyB0byBjb250aW51ZQp0aGlzIHJvdXRlLiBJIHBy
b3Bvc2UgdG8gcmV2ZXJ0IHRoZSBwYXRjaCBlbnRpcmVseSBmb3Igbm93LiBXZSBuZWVkIHRvCmZp
bmQgYW5vdGhlciBhcHByb2FjaCwgSSdtIHNvcnJ5LgoKQWxleGFuZGVyLCBjYW4geW91IHBsZWFz
ZSByZW1pbmQgbWUgd2hhdCB3YXMgeW91ciBpbml0aWFsIHByb2JsZW0/IEkKYmVsaWV2ZSB5b3Ug
bmVlZGVkIHRvIGFuY2hvciBydW50aW1lIFBNIG9uIHRoZSBtYXN0ZXIgZGV2aWNlLiBDYW4geW91
CnBsZWFzZSBlbGFib3JhdGUgYWdhaW4/IFdoeSB0YWtpbmcgdGhlIGNvbnRyb2xsZXIgYXMgc291
cmNlICh0aGUKZGVmYXVsdCwgYmVmb3JlIHlvdXIgY2hhbmdlKSBkaWQgbm90IHdvcms/IEFsc28g
d2h5IHdhcyBzZWxlY3RpbmcKTVREX1BBUlRJVElPTkVEX01BU1RFUiBub3QgYW4gb3B0aW9uIGZv
ciB5b3U/IEknbSB0cnlpbmcgdG8gZ2V0IHRvIHRoZQpyb290IG9mIHRoaXMgY2hhbmdlIGFnYWlu
LCBzbyB3ZSBjYW4gZmluZCBhIHNvbHV0aW9uIGZpeGluZyAidGhlIHdvcmxkIgooZmFzdCkgYW5k
IGluIGEgc2Vjb25kIHRpbWUgYSB3YXkgdG8gYWRkcmVzcyB5b3VyIHByb2JsZW0uCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
