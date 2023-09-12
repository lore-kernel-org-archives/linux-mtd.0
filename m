Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15B5CA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKgzPu8dT0a8dVQFRbv8slWdT/NLyQjPdgimwLDG6P8=; b=vNlJcK7rXqH+As
	XRBKwaUqzGk/bIOPgg1/1jZm5WEwEpo0uJ7Jv2nhySt4C2j/qdniFrYY4RId8Y9Fj7pBPbKOTSu38
	eE1yppMk31IOesiO8+M2vEFhTT4fGFaWR54tzcWElgDftLrm19iXu5d9BXeE+/nrvvQpAt5jp/F4q
	m6w/JDkjbcUAh19IHQKlU28BiS/GSX9mMU+5pqCSi6JpzAy0noXFQbmJSpzuqz3E34k6A8HpRCRhb
	/a6Ta6DL7U32g3Xmmlg2cIEXJhRJrqNYw5qtxgIp6elbwXpMRgo6Cf3hEHhyk6+dEnq0CUoAM2tNr
	N4311SWfGFK2IFnke9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3KL-003Pcr-2y;
	Tue, 12 Sep 2023 13:21:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3KI-003PcP-1J
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 13:21:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 075BB2000C;
	Tue, 12 Sep 2023 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694524865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZWZL1Aw34+UH6DNxwAGQdMbtI0hmjsgK4JYw4ZgLak=;
	b=IQp4OLO/cIRSSzuN/DBJ9UArUhb8+kmnpScQeZrHsvqW/4vTtTDQw51/81qrq6MfQ6HIJu
	eSTXwBivKA37CSBJhez2Sonb70bV2gvNRX9VeMpAmv7ixRcoUPtv0IKo4U64klUwGygKG7
	0isaTNY/APmtMAkO0hsr02mnrrUtKtYRADky80lJ1Ig+H4KDn4IRMzoAjjCNcBMDHlXyrf
	E9XvvwkzKdiMdR46CMIMcNFq536ahn6gSpdps16XVSJisojj5YCNGyDYoa2i9AKyr36Q2y
	OthlWc9qU07hOTHej6RQEJRwcJx5gvrTbsMOwksrlkcyeyx8kMYHZnS8XR/kYw==
Date: Tue, 12 Sep 2023 15:21:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Message-ID: <20230912152102.0dfe7558@xps-13>
In-Reply-To: <CY5PR11MB63667AB9958A23970B4B0D3EEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230911094233.326fd936@xps-13>
	<CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<0d60a78b-0305-4cb3-babe-4eefe5001b29@sirena.org.uk>
	<CY5PR11MB63667AB9958A23970B4B0D3EEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_062110_756880_C8DA983B 
X-CRM114-Status: GOOD (  13.25  )
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

SGksCgphbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20gd3JvdGUgb24gVHVlLCAxMiBTZXAgMjAy
MyAxMzoxNTo1OCArMDAwMDoKCj4gPiAgIAo+ID4gPiBUaGUgc3BpIGNvbnRyb2xsZXIgb24gZGlz
Y3JlZXQgZ3JhcGhpY3MgY2FyZCBpcyBub3QgdmlzaWJsZSB0byB1c2VyLXNwYWNlLgo+ID4gPiBT
cGkgYWNjZXNzIGZsb3dzIGFyZSBzdXBwb3J0ZWQgYnkgYW5vdGhlciBoYXJkd2FyZSBtb2R1bGUg
YW5kIHJlbGV2YW50ICAKPiA+IHJlZ2lzdGVycyBhcmUgIAo+ID4gPiBhdmFpbGFibGUgb24gZ3Jh
cGhpY3MgZGV2aWNlIG1lbW9yeSBiYXIuICAKPiA+IAo+ID4gTm8gU1BJIGNvbnRyb2xsZXJzIGFy
ZSBkaXJlY3RseSB2aXNpYmxlIHRvIHVzZXJzcGFjZSwgc29tZSBTUEkgZGV2aWNlcwo+ID4gYXJl
IHNlbGVjdGl2ZWx5IGV4cG9zZWQgYnV0IHRoYXQgbmVlZHMgdG8gYmUgZXhwbGljaXRseSByZXF1
ZXN0ZWQgYW5kIGlzCj4gPiBnZW5lcmFsbHkgZGlzY291cmFnZWQuICAKPiAKPiBXaGF0IGFyZSB0
aGUgb3B0aW9ucyBoZXJlPyBFeHBsaWNpdGx5IHJlcXVlc3QgZXhjZXB0aW9uIGlzIHRoZSBvbmUu
Cj4gQW55IG90aGVyIHdheSB0byBhZGQgYWNjZXNzIHRvIGZsYXNoIG1lbW9yeSBjb25uZWN0ZWQg
aW4gc3VjaCB3YXk/CgpSZWdpc3RlciBhIHNwaSBjb250cm9sbGVyIHdpdGggYXQgbGVhc3Qgc3Bp
LW1lbSBvcHMsIGFzIHN1Z2dlc3RlZApwcmV2aW91c2x5LCBpcyB0aGUgc3RhbmRhcmQgd2F5IEkg
Z3Vlc3MuIElmIHlvdSdyZSBub3Qgd2lsbGluZyB0byBkbwpzbywgaXQgbXVzdCBiZSBqdXN0aWZp
ZWQsIEkgZ3Vlc3M/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
