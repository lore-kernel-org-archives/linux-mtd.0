Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30C6CA0EEB
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vexCm5iHzoQD5ECRIC7j91eqimecZYxfUlluBxcF4Ug=; b=a+3zm5Xq0pipVm
	y45SiP8DSfi0vmjzk6PlTuSvAJA40ITc9WVmV6YdLszyls+Ms3buNMtCl+Yw26n35xcq1euyX3mxh
	PJw10CgFhYkk5MN6MVRPZxUBryfjhp3MQBjipolpfNFAjO77OShQtDOCy3GU2K0BcrmfoP386wZdv
	OAltMCzda68ycZeHqxv7xxkSDw0yeesO066EMcgNN4PKmn2vwDBE4/OloBCp/RsXIz42HIONUdE0j
	pk2HlVyoVW3amOrBcP4asEUduljUPIG21C8YSibhD509hdObDxCLnwALzj3gEd7+MdeYTKUr0P3n+
	vDSdt6O1o9d9F9SFvRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo04k-00000007WeU-0D5H;
	Mon, 18 Aug 2025 13:39:02 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvX6-00000006ySt-2Est
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 08:48:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5069A1F47D;
	Mon, 18 Aug 2025 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755506877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05uZQNCBQ/IPvhbxPL5JdbGCZAnK3adcFj09yVob0Hc=;
	b=PnBj5ONmj2Yn5z4ff+jP177N7rjlq64b37wwk7rHybTUCHIrFN6AqOup9BGYqFItEAqZl/
	/pES8TO8DayqbQUCGnIbFDy24UIqsywmZjqBH4kr3oTnZjFQhQizDtsqAMCA40/2npM075
	dbucluRnwlpwFrURVMiOnINoxTQdioxUi4f3DPJsGAaKe3K9EgKlov0wBqFpIpohjYqstm
	5vzDwB6fMuM0vbgUNq8a2UClNeBgh8YiNDxP0qwTy805EWBVULCTM+1j4yWT7fCS0GHlGE
	192aGCg5AtFEvdBaTVCRupO2r5LN5KMe+5v65ogfo4p07FbRm3HPK9cpwnXS+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
In-Reply-To: <CAAyq3SZbPpVX_LyoYaHYhA3ZNeb0NYWQ4KC6-+uubB1GGCqZag@mail.gmail.com>
	(Cheng Ming Lin's message of "Mon, 11 Aug 2025 11:01:25 +0800")
References: <20250808095503.906244-1-linchengming884@gmail.com>
	<20250808095503.906244-3-linchengming884@gmail.com>
	<87zfca9kur.fsf@bootlin.com>
	<CAAyq3SZbPpVX_LyoYaHYhA3ZNeb0NYWQ4KC6-+uubB1GGCqZag@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 18 Aug 2025 10:47:53 +0200
Message-ID: <87y0rhyq12.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeutdeuhfffffdugfehleevvdfffeevvedtgfeuteejieeggeeltdehleetgeegvdenucffohhmrghinhepmhigihgtrdgtohhmrdhtfienucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhgthhgvnhhgmhhinhhgkeekgeesghhmrghilhdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopegrlhhvihhniihhohhusehmgihitgdrtghomhdrthifpdhrtghpthhtoheplhgvohihuhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfi
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_014800_712333_CE5A0A98 
X-CRM114-Status: GOOD (  13.36  )
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

SGkgQ2hhbmcgTWluZywKCk9uIDExLzA4LzIwMjUgYXQgMTE6MDE6MjUgKzA4LCBDaGVuZyBNaW5n
IExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIE1pcXVlbCwKPgo+
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IOaWvCAyMDI15bm0OOac
iDjml6Ug6YCx5LqUIOS4i+WNiDY6MTnlr6vpgZPvvJoKPj4KPj4gT24gMDgvMDgvMjAyNSBhdCAx
Nzo1NTowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tPiB3
cm90ZToKPj4KPj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29t
LnR3Pgo+PiA+Cj4+ID4gRW5hYmxlIHJhbmRvbWl6ZXIgZnVuY3Rpb24gYnkgc3BlY2lmaWMgZmxv
d2NoYXJ0IHRvIHNldCB0aGUgZGVmYXVsdCB2YWx1ZQo+PiA+IG9mIFJBTkRFTiB0byAxLgo+PiA+
Cj4+ID4gUmFuZG9taXplciBpbnRyb2R1Y2VzIHR3byBuZXcgRFQgcHJvcGVydGllcyBmb3IgY2hp
bGQgbm9kZXMgdG8gY29uZmlndXJlCj4+ID4gdGhlIHJhbmRvbWl6ZXIgZnVuY3Rpb25hbGl0eSBh
bmQgY292ZXJhZ2Ugb3B0aW9ucy4KPj4gPiAgLSBteGljLGVuYWJsZS1yYW5kb21pemVyLW90cDog
U3BlY2lmeSB3aGV0aGVyIHRvIGFjdGl2YXRlIHRoZSByYW5kb21pemVyCj4+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZlYXR1cmUuCj4+ID4gIC0gbXhpYyxyYW5kb3B0OiBEZWZp
bmUgdGhlIHJhbmRvbWl6ZXIgYXJlYSBwZXIgcGFnZS4KPj4KPj4gQ2FuIHdlIGNyZWF0ZSBhIGds
b2JhbCBOQU5EIERUIHByb3BlcnR5IGZvciB0aGF0PyBFbmFibGluZyBhIHJhbmRvbWl6ZXIKPj4g
aXMgcXVpdGUgYSBnZW5lcmljIHN0ZXAuCj4+Cj4+ID4gVGhlIHBlbmFsdHkgb2YgcmFuZG9taXpl
ciBhcmUgc3VicGFnZSBhY2Nlc3NlcyBwcm9oaWJpdGVkIGFuZCBtb3JlIHRpbWUKPj4gPiBwZXJp
b2QgaXMgbmVlZGVkIGluIHByb2dyYW0gb3BlcmF0aW9uIGFuZCBlbnRlcmluZyBkZWVwIHBvd2Vy
LWRvd24gbW9kZS4KPj4gPiBpLmUuLCB0UFJPRyAzMjB1cyB0byAzNjB1cyAocmFuZG9taXplciBl
bmFibGVkKS4KPj4KPj4gRG8geW91IHdhbnQgdG8gc2hhcmUgd2hhdCBpcyB0aGUgYWRkZWQgdmFs
dWUgaW4gdGVybXMgb2YgbGlmZXRpbWUgdG8KPj4gZW5hYmxlIHRoZSByYW5kb21pemVyLCBnaXZl
biB0aGUgZHJhd2JhY2tzIHdoaWNoIGFyZSBzaWduaWZpY2FudD8KPgo+IFRoZSByYW5kb21pemVy
IG1haW5seSB0YXJnZXRzIGV4dHJlbWVseSB1bmJhbGFuY2VkIGRhdGEgcGF0dGVybnMsCj4gd2hp
Y2ggbWlnaHQgcG90ZW50aWFsbHkgbGVhZCB0byBkYXRhIGVycm9ycy4KPgo+IFBsZWFzZSByZWZl
ciB0byB0aGUgYXR0YWNoZWQgZG9jdW1lbnQ6Cj4gaHR0cHM6Ly93d3cubXhpYy5jb20udHcvTGlz
dHMvQXBwbGljYXRpb25Ob3RlL0F0dGFjaG1lbnRzLzIxNTEvQU4xMDUxVjEtVGhlJTIwSW50cm9k
dWN0aW9uJTIwb2YlMjBSYW5kb21pemVyJTIwRmVhdHVyZSUyMG9uJTIwTVgzMHhGeEcyOEFEX01Y
MzV4RnhHMjRBRC5wZGYKClRoYW5rcyBmb3IgdGhlIGxpbmssIGl0IG1heSBiZSBwb2ludGVkIHdp
dGggYSAiTGluazoiIHRhZyBpbiB5b3VyIGNvbW1pdAp0byBmdXJ0aGVyIGp1c3RpZnkgdGhpcyBh
ZGRpdGlvbi4gSG93ZXZlciBpdCBpcyBzcGFyc2Ugb24gZGV0YWlscy4gSQp3b3VsZCBiZSBpbnRl
cmVzdGVkIGJ5IG1vcmUgZGV0YWlscywgc3VjaCBhcyAiaG93IG1hbnkgMHM/IGhvdyBtYW55CmJp
dGZsaXBzPyBob3cgb2Z0ZW4vbGlrZWx5PyIKCj4gRmlndXJlIDEgc2hvd3MgdGhhdCBjb250aW51
b3VzbHkgcHJvZ3JhbW1pbmcgdG9vCj4gbWFueSAwcyBjYW4gcmVzdWx0IGluIGRhdGEgZXJyb3Jz
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
