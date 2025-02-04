Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1135CC02194
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/70ShxMMrD+gXgDOOeYlJ0owqof7HMMpPx6CSN8Hn0=; b=XXvMdVd3UqIjv1
	uHH1DGl7xgsEhHMzV4Ga1rKEj8C2qEnfxAtzMVZTbh+t+auRp0MlMhgm/zxw0Nbcr8eWB8z8OGctH
	9liKX1fEcAxF4X3zbz3IL5Y1DrRCpbujDEtjSGNRBRIPEavpMzeRan6hiqnWpAoiwCYZGAGviAXQW
	hKWu/1bzdK6Ibt7MRbpDP1I1utVuGl2gZjT/Wy8eQrFimlyxPDt77igUIVwpkgZznQ7DZTMwgVyk/
	Oct37BLjHWe2GLmMgfS66fqE8/3nAzII8EZ6z+wF8NSB1xx37L91YTCIzmX4cpvWbkDcl1FzxdCi7
	lhV3xdxEVC4lEKmYo0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJ2y-00000000Xrx-2MAe;
	Tue, 04 Feb 2025 13:33:00 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJ2v-00000000Xr3-2iQj
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 13:32:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF0C3204AC;
	Tue,  4 Feb 2025 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738675974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mH9LB5DunDIjPd1SMurzuCEO+7lGZ04kevPMYpIDU0=;
	b=Kv4bzN9oj1skiwQaACJfFZSDU+mIMpGXc9ncjJFp1/ku1ZBCY2IINbH7D9roCTDAZuBuGw
	IUdD8hJ7szkj2i1H5zMLYEgEbYqXY/tYhU3KPf2xrj3cHr26PrXU3r9BPZfS5jI1UplZ1m
	QN0+Kr+g+ODNjJ3wQ2Xtijw3Ux6v2Oh7S5ley8gwEW5SpNT7TITmGZ0prGtiBxCyK2fEfh
	G1xNi/Wg/e/Ydns8MZNQ+thHgnXMa8B/aiDlXkQwMBEJHQLhzh/fQTiuUHczKPuZ1eVI2G
	5XGtPF496+zdNeQedQNsd17w7+oX4bRhkcB0b0qDIVmd6TOXbneAJ5I1eSW89Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
 when DMA is not ready
In-Reply-To: <BL3PR11MB6532369D14375CC94AA2714BA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Tue, 4 Feb 2025 10:43:20 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87msf8z5uu.fsf@bootlin.com>
	<BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87o6zi83se.fsf@bootlin.com>
	<BL3PR11MB6532369D14375CC94AA2714BA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 14:32:51 +0100
Message-ID: <87frkt96nw.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhhirhgrvhhkuhhmrghrrdhlrdhrrggsrghrrgesihhnthgvlhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehshhgvnhhlihgthhhurghnsehvihhvo
 hdrtghomhdprhgtphhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_053257_987895_7BAF8629 
X-CRM114-Status: GOOD (  11.90  )
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

T24gMDQvMDIvMjAyNSBhdCAxMDo0MzoyMCBHTVQsICJSYWJhcmEsIE5pcmF2a3VtYXIgTCIgPG5p
cmF2a3VtYXIubC5yYWJhcmFAaW50ZWwuY29tPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cj4+IFNlbnQ6IFR1ZXNkYXksIDQgRmVicnVhcnksIDIwMjUgNToy
MCBQTQo+PiBUbzogUmFiYXJhLCBOaXJhdmt1bWFyIEwgPG5pcmF2a3VtYXIubC5yYWJhcmFAaW50
ZWwuY29tPgo+PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD47IFZpZ25l
c2ggUmFnaGF2ZW5kcmEKPj4gPHZpZ25lc2hyQHRpLmNvbT47IGxpbnV4QHRyZWJsaWcub3JnOyBT
aGVuIExpY2h1YW4gPHNoZW5saWNodWFuQHZpdm8uY29tPjsKPj4gSmluamllIFJ1YW4gPHJ1YW5q
aW5qaWVAaHVhd2VpLmNvbT47IHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb207IGxpbnV4LQo+
PiBtdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gbXRk
OiByYXduYW5kOiBjYWRlbmNlOiBzdXBwb3J0IGRlZmVycmVkIHByb2Igd2hlbgo+PiBETUEgaXMg
bm90IHJlYWR5Cj4+IAo+PiBIZWxsbywKPj4gCj4+ID4gTXkgYXBvbG9naWVzIGZvciB0aGUgY29u
ZnVzaW9uLgo+PiA+IFNsYXZlIERNQSB0ZXJtaW5vbG9neSB1c2VkIGluIGNhZGVuY2UgbmFuZCBj
b250cm9sbGVyIGJpbmRpbmdzIGFuZAo+PiA+IGRyaXZlciBpcyBpbmRlZWQgY29uZnVzaW5nLgo+
PiA+Cj4+ID4gVG8gYW5zd2VyIHlvdXIgcXVlc3Rpb24gaXQgaXMsCj4+ID4gMSAtIEV4dGVybmFs
IERNQSAoR2VuZXJpYyBETUEgY29udHJvbGxlcikuCj4+ID4KPj4gPiBOYW5kIGNvbnRyb2xsZXIg
SVAgZG8gbm90IGhhdmUgZW1iZWRkZWQgRE1BIGNvbnRyb2xsZXIgKDIgLSBwZXJpcGhlcmFsCj4+
IERNQSkuCj4+ID4KPj4gPiBGWVIsIGhvdyBleHRlcm5hbCBETUEgaXMgdXNlZC4KPj4gPiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMy4xL3NvdXJjZS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9jCj4+ID4gYWRlbmNlLW5hbmQtY29udHJvbGxlci5jI0wxOTYyCj4+IAo+PiBJbiB0
aGlzIGNhc2Ugd2Ugc2hvdWxkIGhhdmUgYSBkbWFzIHByb3BlcnR5IChhbmQgcGVyaGFwcyBkbWEt
bmFtZXMpLCBubz8KPj4gCj4gTm8sIEkgYmVsaWV2ZS4KPiBDYWRlbmNlIE5BTkQgY29udHJvbGxl
ciBJUCBkbyBub3QgaGF2ZSBkZWRpY2F0ZWQgaGFuZHNoYWtlIGludGVyZmFjZSB0byBjb25uZWN0
Cj4gd2l0aCBETUEgY29udHJvbGxlci4KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIGRtYXMgKGFuZCBk
bWEtbmFtZXMpIGFyZSBvbmx5IHVzZWQgZm9yIHRoZSBkZWRpY2F0ZWQgaGFuZHNoYWtlCj4gaW50
ZXJmYWNlIGJldHdlZW4gcGVyaXBoZXJhbCBhbmQgdGhlIERNQSBjb250cm9sbGVyLgoKSSBkb24n
dCBzZWUgd2VsbCBob3cgeW91IGNhbiBkZWZlciBpZiB0aGVyZSBpcyBubyByZXNvdXJjZSB0byBn
cmFiLiBBbmQKaWYgdGhlcmUgaXMgYSByZXNvdXJjZSB0byBncmFiLCB3aHkgaXMgaXQgbm90IGRl
c2NyaWJlZCBhbnl3aGVyZT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
