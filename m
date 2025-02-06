Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755FFC0219B
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zf6aKT37YPsLUJGTE68Lm45PEKHlvx9NMyY/ij7qQl4=; b=ryYYAIvpRgy/9t
	uxcPcC+SkwAmV3L9qx5Zac3AvOkQLk8FJvL3s4NYNoYjE3CVWDFbcdPtIa8qxEkrqbden7szl1UdK
	t0V89YoJoYojOUIbvrwDVs5OI+E+RwObZNGzcJsT5s6DGKnYb9Trr4x7tWXCSiMbEvbLdVchWGCRV
	2K+1kfMvI4yi7M3NaOIpjsYzq5+zZZO/ISjAslyVCRr4wdrl2ZDGgCnL8oXbiZdrDb6jqlNEGgPSd
	SjmpB0nx77EA5PqEfPfyBPsloiNrpKUsuwD06QJGbrBB2j1N0McY7ziK8G2UlVFGEN+qO+yKURI2s
	zLfxKTscj8Tl1UF0MxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Fy-00000006vhX-3SGd;
	Thu, 06 Feb 2025 17:01:38 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Fw-00000006vgS-3lSd
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 17:01:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54F02441CC;
	Thu,  6 Feb 2025 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJQQI/vkueVkM4LiOEGZpMl39Ri+HuaVkJJe4HFDf9s=;
	b=SRkeT0/0Z/bP3Ro4IzZ+8dyfhzZfsQt9nEN5/uqUx/7pjuFUaQwBWLfN3D/cmOnADFtOfQ
	jrOaPT02dUXFK0osuNgv+3BOxVncBdweltrde428ViMvo1LAKNOQkC1AZfE5tLBApS4lgS
	B+mo0cgeCwMzzvhKLF9OsclOAPecgsgK9qprjpKjXusE26JsVJotK2dzyXQMwrOQdHSQJW
	dfd/1x7m75Es/XA8esWOpEtJs0+tc/4tVSCoCOUlU93uo8rvjHth4q631Q64woWeh3qJdW
	OpfoBmqzsPBF6xuOW+RhpMZuwr51uZ+JVAGacgRAKcEacATJ5e814G7CdcfsvQ==
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
In-Reply-To: <BL3PR11MB653239DDBD9D8E7D413B60F4A2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Tue, 4 Feb 2025 14:11:16 +0000")
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
	<87frkt96nw.fsf@bootlin.com>
	<BL3PR11MB653239DDBD9D8E7D413B60F4A2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:01:30 +0100
Message-ID: <877c6357o5.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhhirhgrvhhkuhhmrghrrdhlrdhrrggsrghrrgesihhnthgvlhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehshhgvnhhlihgthhhurghnsehvihhvo
 hdrtghomhdprhgtphhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_090137_072720_131269EF 
X-CRM114-Status: GOOD (  14.05  )
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

SGVsbG8sCgo+PiA+PiA+IE15IGFwb2xvZ2llcyBmb3IgdGhlIGNvbmZ1c2lvbi4KPj4gPj4gPiBT
bGF2ZSBETUEgdGVybWlub2xvZ3kgdXNlZCBpbiBjYWRlbmNlIG5hbmQgY29udHJvbGxlciBiaW5k
aW5ncyBhbmQKPj4gPj4gPiBkcml2ZXIgaXMgaW5kZWVkIGNvbmZ1c2luZy4KPj4gPj4gPgo+PiA+
PiA+IFRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uIGl0IGlzLAo+PiA+PiA+IDEgLSBFeHRlcm5hbCBE
TUEgKEdlbmVyaWMgRE1BIGNvbnRyb2xsZXIpLgo+PiA+PiA+Cj4+ID4+ID4gTmFuZCBjb250cm9s
bGVyIElQIGRvIG5vdCBoYXZlIGVtYmVkZGVkIERNQSBjb250cm9sbGVyICgyIC0KPj4gPj4gPiBw
ZXJpcGhlcmFsCj4+ID4+IERNQSkuCj4+ID4+ID4KPj4gPj4gPiBGWVIsIGhvdyBleHRlcm5hbCBE
TUEgaXMgdXNlZC4KPj4gPj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4x
My4xL3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3JhCj4+ID4+ID4gdy9jCj4+ID4+ID4gYWRlbmNl
LW5hbmQtY29udHJvbGxlci5jI0wxOTYyCj4+ID4+Cj4+ID4+IEluIHRoaXMgY2FzZSB3ZSBzaG91
bGQgaGF2ZSBhIGRtYXMgcHJvcGVydHkgKGFuZCBwZXJoYXBzIGRtYS1uYW1lcyksIG5vPwo+PiA+
Pgo+PiA+IE5vLCBJIGJlbGlldmUuCj4+ID4gQ2FkZW5jZSBOQU5EIGNvbnRyb2xsZXIgSVAgZG8g
bm90IGhhdmUgZGVkaWNhdGVkIGhhbmRzaGFrZSBpbnRlcmZhY2UKPj4gPiB0byBjb25uZWN0IHdp
dGggRE1BIGNvbnRyb2xsZXIuCj4+ID4gTXkgdW5kZXJzdGFuZGluZyBpcyBkbWFzIChhbmQgZG1h
LW5hbWVzKSBhcmUgb25seSB1c2VkIGZvciB0aGUKPj4gPiBkZWRpY2F0ZWQgaGFuZHNoYWtlIGlu
dGVyZmFjZSBiZXR3ZWVuIHBlcmlwaGVyYWwgYW5kIHRoZSBETUEgY29udHJvbGxlci4KPj4gCj4+
IEkgZG9uJ3Qgc2VlIHdlbGwgaG93IHlvdSBjYW4gZGVmZXIgaWYgdGhlcmUgaXMgbm8gcmVzb3Vy
Y2UgdG8gZ3JhYi4gQW5kIGlmIHRoZXJlIGlzCj4+IGEgcmVzb3VyY2UgdG8gZ3JhYiwgd2h5IGlz
IGl0IG5vdCBkZXNjcmliZWQgYW55d2hlcmU/Cj4+IAo+Cj4gU2luY2UgTkFORCBjb250cm9sbGVy
IGRvIG5vdCBoYXZlIGhhbmRzaGFrZSBpbnRlcmZhY2Ugd2l0aCBETUEgY29udHJvbGxlci4KPiBE
cml2ZXIgaXMgdXNpbmcgZXh0ZXJuYWwgRE1BIGZvciBtZW1vcnktdG8tbWVtb3J5IGNvcHkuCgpJ
J20gc29ycnkgeW91IGxvc3QgbWUgYWdhaW4uIFdoYXQgZG8geW91IG1lYW4gaGFuZHNoYWtlPyBU
aGVyZSBpcyBubwpyZXF1ZXN0IGxpbmU/IFRoZXJlIGlzIG5vIHdheSB0aGUgTkFORCBjb250cm9s
bGVyIGNhbiB0cmlnZ2VyIERNQQp0cmFuc2ZlcnM/CgpXaGF0IGRvIHlvdSBtZWFuIG1lbS10by1t
ZW0sIGhvdyBpcyB0aGlzIHVzZWZ1bCB0byB0aGUgY29udHJvbGxlcj8KCj4gWW91ciBwb2ludCBp
cyBzaW5jZSB0aGUgZHJpdmVyIGlzIHVzaW5nIGV4dGVybmFsIERNQSBhbmQgaXQgc2hvdWxkIGJl
Cj4gZGVzY3JpYmVkIGluIGJpbmRpbmdzPwoKWWVzLiBCdXQgbWF5YmUgSSBzdGlsbCBkb24ndCBn
ZXQgaXQgY29ycmVjdGx5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
