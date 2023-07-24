Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39481C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 11:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bt8mdQ7kEaze6+F7VqaCK85+nqc2JJDJ0rOaT/a9/Oc=; b=wT1WpUA/MxzNrI
	1+BBNQc7AWBYTI88kgfUh6wiWq9x3Kl3NlOybsm22s6ln3XIIKEqIqJ1RXxvvLHy/EjzkkmQe0seg
	/SWw7eP/UuuQIgFVoOBDpZX5u4O2aHEPI9I8qaMcuLbDX9ODFdAzEsvEjRdRdpFruu9QlIlv1A2CL
	gy7G8vuWuhqIOepc7h7/1OK3Yv62MKxHkQaHxtmJWMVtyHMXjjELFtskmK3ijY26pgRyu8RrU6SRX
	b/PgqFbFa2EH+OyMQ6RJNdlZbRBtqqWnFibmwby+TW8cu9OLqYzq27eDfw2AHJQNABsYm6ypiMC6r
	anEDzbR3AVcXFLvEzrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNu67-0047Ve-1q;
	Mon, 24 Jul 2023 11:51:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNu64-0047Tk-0i
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 11:51:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13E6A2000B;
	Mon, 24 Jul 2023 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690199482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swBC1u58UcJrYvXzFzmEWYLfz7PfdG+uUqjDujcLpw8=;
	b=jwUbBSovrWXMt0eCf+HkdZX7N0TFiGd0HubR783jyVrAgPnQbPXrbhEdpWE8Xxk4eo09Kg
	QsnOipFtXqnjPamqsXHMrCzF0aotO/SGslxxUn4+VxO37tLz2INw2m0X2DFoJbeuOJrqDa
	tc8QcPRrSGSPbd7bQ/8VuTz3TB2Sya1mAtyvsGCCwpHqTJ+LELrhjfSX+w6GmhhYVYbZnO
	LENWRsxmvoCqSUpvIS9sS458ZNCtMkTec+iK2kREIIxkrur/qe4Kh2ri7jNWGjGUWA+Lp3
	Cp2lOrxtXcLKwW2yVNOCFFv6R4A5fNa0HtvC6mSEA+sIcdmmaHPYwbosp/gb1w==
Date: Mon, 24 Jul 2023 13:51:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Lubart, Vitaly"
 <vitaly.lubart@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 1/2] mtd: use refcount to prevent corruption
Message-ID: <20230724135118.54e39faf@xps-13>
In-Reply-To: <CY5PR11MB6366C254F767B6C432C98A0CED02A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
	<20230620131905.648089-2-alexander.usyskin@intel.com>
	<TYWPR01MB87756794A30EB389AB017EB1C234A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
	<20230715174112.3909e43f@xps-13>
	<CY5PR11MB63666C8DA33C93E1DC3BCB21ED3AA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20230716153926.5e975231@xps-13>
	<CY5PR11MB6366C254F767B6C432C98A0CED02A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_045128_395103_B8B8DD6D 
X-CRM114-Status: GOOD (  17.18  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIE1vbiwg
MjQgSnVsIDIwMjMgMTE6NDM6NTkgKzAwMDA6Cgo+ID4gPiA+ID4gV2l0aCB0aGlzIHBhdGNoIGFw
cGxpZWQsIHdoZW4gSSBsb2FkIHVwIHRoZSBtb2R1bGUsIEkgZ2V0IHRoZSBzYW1lIDMKPiA+ID4g
PiA+IGRldmljZXM6Cj4gPiA+ID4gPiAvZGV2L210ZDAKPiA+ID4gPiA+IC9kZXYvbXRkMHJvCj4g
PiA+ID4gPiAvZGV2L210ZGJsb2NrMAo+ID4gPiA+ID4KPiA+ID4gPiA+IFVwb24gcmVtb3ZhbCwg
dGhlIGJlbG93IDIgZGV2aWNlcyBzdGlsbCBoYW5nIGFyb3VuZDoKPiA+ID4gPiA+IC9kZXYvbXRk
MAo+ID4gPiA+ID4gL2Rldi9tdGQwcm8gIAo+ID4gPiA+ICAKPiA+ID4gT3VyIHVzZS1jYXNlIGRv
IG5vdCBwcm9kdWNlIG10ZGJsb2NrLCBtYXliZSB0aGVyZSBhcmUgc29tZSBpbWJhbGFuY2VzICAK
PiA+IG9mIGdldC9wdXQ/ICAKPiA+ID4gSSBoYXZlIHNvbWV3aGVyZSB2ZXJzaW9uIHdpdGggcHJf
ZGVidWcgYWZ0ZXIgZXZlcnkga3JlZl9nZXQvcHV0LiBUaGF0IG1heSAgCj4gPiBoZWxwIHRvIGNh
dGNoIHdoZXJlICAKPiA+ID4gaXQgbWlzc2VkLCBJIGhvcGUuICAKPiA+IAo+ID4gSSBiZWxpZXZl
IG10ZGJsb2NrIGlzIHRoZSBnb29kIGNpdGl6ZW4gaGVyZS4gSnVzdCBkaXNhYmxlCj4gPiBDT05G
SUdfTVREX0JMT0NLIGZyb20geW91ciBjb25maWd1cmF0aW9uIGFuZCB5b3Ugd2lsbCBsaWtlbHkg
b2JzZXJ2ZQo+ID4gdGhlIHNhbWUgaXNzdWUsIGp1c3QgYSBiaXQgbmFycm93ZWQsIHBlcmhhcHMu
IEluZGVlZCwgaWYgeW91IG1hbmFnZSB0bwo+ID4gZm9sbG93IGFsbCB0aGUgZ2V0L3B1dCBjYWxs
cyBpdCBjYW4gaGVscCB0byBmaW5kIGFuIGltYmFsYW5jZS4KPiA+IAo+ID4gVGhhbmtzLAo+ID4g
TWlxdcOobCAgCj4gCj4gTWlxdWVsLCBkbyB5b3UgaGF2ZSBDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUiBzZXQgaW4geW91ciBjb25maWc/CgpOb3Qgc3VyZSBJIGdldCB5b3VyIHF1ZXN0aW9u
LiBZb3UgY2FuIGVuYWJsZSBvciBkaXNhYmxlIGl0LCBpdCBzaG91bGQKd29yayBpbiBib3RoIGNh
c2VzICh5ZXQsIHRoZSBoYW5kbGluZyBpcyBvZiBjb3Vyc2UgYSBiaXQgZGlmZmVyZW50IGFzCnRo
ZSB0b3AgbGV2ZWwgZGV2aWNlIHdpbGwgYmUgcmV0YWluZWQvbm90IHJldGFpbmVkKS4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
