Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C00C3ABBC
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6WeKVNrJmJlzKt51MZJKM2r7coNlb5CiOpt7Rpp8Kw=; b=ciELrhEwrTz/gY
	pwISsDNr5GQtglzLQ0sugxkPmDV1274Z/5B2FfQjcqXdxa23BvQ6WpDRgXokd/nqqanuu8Hy0PHWt
	/4ImSuvPq1oKgu4wwoWEAhtYCeD4zZbfUfnSdKhUKgy9LtpyaYYkC4m5njmTfHBnMITJVN24i9wHN
	kqKnKXMnD3HNbvWbVrdy0DVR7p2MBPksY4wziEWzkifx1QquLfeII7dMouL4+Xdq8G2UDdOzGxTTD
	JsnI+17hiYYkrW6DBErglJ2TDAQ+mONTbWy62K1moz5PZlhxP2qHq70I9qklBZC+bLLP14DVsE1gT
	9yETy9oZuLXB9CROP7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQNT-000000095x3-0OAv;
	Mon, 12 May 2025 10:27:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPys-0000000933F-1yg0
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 10:01:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5419433E9;
	Mon, 12 May 2025 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747044111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23/KllP1Vs2xVFOmNRG8GlctBkDoHOk55ezgK8BXOUY=;
	b=S2t2lVKCHSX+Pvb0Cy6ezCRITtuaBvgqqxJxHdHge7MRpTtFm6Fc74aZuRFzNCExVU7uej
	JsvO2Q/6gxMMV5CeOML88qNGwLBKAfjcy5x81fhr3FFIZ752NFvgXQi17jtQQl1rIVJPgR
	Fdi13vV00/fYO6CU7anq4ynM8HI6vIxq6XyTee6haGxsIp5kXSBRQNqD+yl7Yp/V3jggC2
	d3NusWAq0bgwsW8TtJs1PFjC4pOYD+374mBBoaU1Jm8jhUOTVDz9TKeMAzsZP/JEQZXVtK
	iOVk0II5ppF0936fAYEsrm29BU/vN/JDQD9nU8mFFJKKyrYe20oBzqlEvMLxLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  "git
 (AMD-Xilinx)" <git@amd.com>,  "amitrkcian2002@gmail.com"
 <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Wed, 30 Apr 2025 14:18:34 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 12:01:50 +0200
Message-ID: <87o6vyjgfl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_030154_638194_D0AFAE84 
X-CRM114-Status: GOOD (  14.34  )
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

Cj4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYucGFyZW50ID0gY29uY2F0LT5zdWJkZXZbMF0tPmRl
di5wYXJlbnQ7Cj4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYgPSBjb25jYXQtPnN1YmRldlswXS0+
ZGV2Owo+PiA+ICsKPj4gPiArICAgICAgICAgICAvKiBSZWdpc3RlciB0aGUgcGxhdGZvcm0gZGV2
aWNlICovCj4+ID4gKyAgICAgICAgICAgcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5V
TEwsIDApOwo+PiA+ICsgICAgICAgICAgIGlmIChyZXQpCj4+ID4gKyAgICAgICAgICAgICAgICAg
ICBnb3RvIGRlc3Ryb3lfY29uY2F0Owo+PiA+ICsgICB9Cj4+ID4gKwo+PiA+ICsgICByZXR1cm4g
MDsKPj4gPiArCj4+ID4gK2Rlc3Ryb3lfY29uY2F0Ogo+PiA+ICsgICBtdGRfY29uY2F0X2Rlc3Ry
b3kobXRkKTsKPj4gPiArCj4+ID4gKyAgIHJldHVybiByZXQ7Cj4+ID4gK30KPj4gPiArCj4+ID4g
K2xhdGVfaW5pdGNhbGwobXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9qb2luKTsKPj4KPj4gVGhlIGN1
cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lcyBub3Qgc3VwcG9ydCBwcm9iZSBkZWZlcnJhbHMsIEkg
YmVsaWV2ZSBpdCBzaG91bGQgYmUKPj4gaGFuZGxlZC4KPgo+IEkgc2VlIHRoYXQgdGhlIHBhcnNl
X210ZF9wYXJ0aXRpb25zKCkgQVBJIGNhbiByZXR1cm4gLUVQUk9CRV9ERUZFUiBkdXJpbmcKPiBN
VEQgZGV2aWNlIHJlZ2lzdHJhdGlvbiwgYnV0IHRoaXMgYmVoYXZpb3IgaXMgc3BlY2lmaWMgdG8g
dGhlCj4gcGFyc2VfcWNvbXNtZW1fcGFydCBwYXJzZXIuIE5vbmUgb2YgdGhlIG90aGVyIHBhcnNl
cnMgYXBwZWFyIHRvIHN1cHBvcnQKPiBwcm9iZSBkZWZlcnJhbC4gQXMgZGlzY3Vzc2VkIGluIFJG
QyBbMV0sIHRoZSB2aXJ0dWFsIGNvbmNhdCBmZWF0dXJlIGlzCj4gcHVyZWx5IGEgZml4ZWQtcGFy
dGl0aW9uIGNhcGFiaWxpdHksIGFuZCBiYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5nLCB0aGUKPiBm
aXhlZC1wYXJ0aXRpb24gcGFyc2VyIGRvZXMgbm90IHN1cHBvcnQgcHJvYmUgZGVmZXJyYWwuCj4g
UGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBjYW4gdGhpbmsgb2YgYW55IG90aGVyIHByb2JlIGRl
ZmVycmFsIHNjZW5hcmlvcwo+IHRoYXQgbWlnaHQgaW1wYWN0IHRoZSB2aXJ0dWFsIGNvbmNhdCBk
cml2ZXIuCgpUaGF0J3MgdHJ1ZSwgYnV0IEkga2luZCBvZiBkaXNsaWtlIHRoZSBsYXRlX2luaXRj
YWxsLCBJIGZlYXIgaXQgbWlnaHQKYnJlYWsgaW4gY3JlYXRpdmUgd2F5cy4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
