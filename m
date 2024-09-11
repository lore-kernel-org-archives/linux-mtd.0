Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5162EE49BC
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2024 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jumDoC65R7ySxMuRfPUFz5N4mEDOfwTdcnt9jmlA3sI=; b=zDXEYlz8CQDnjVT7K0MLfls0tc
	Le2MoljFdULWZEHX2s4beh0/p7nsFN500RqoSopvlDGhE1/v35GNenHcSkyOhNrn9UNDKnn6/FX1p
	f03Ns5SLj5ncKcBGtPxJp5zykIQn8mtOkYCeqKFyN2yAjY5t58fpVrrt7x8F2NlFYEO2TRTkEvwiu
	Y19QIMH3OlzhedDtmyS4Q8STPRROYyMfdGqdkmc4jT5H3ZHg8q4tNxGH7LbVmP5s6M6R214jWJxlD
	/P0bTt5BHZfZu6hhcl8qk9OYoEaFRNco2J5L9A2DTPAvmd9pZ/i/13XN4cmpSQCCIk6KSdouaigx1
	ePDEBPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPAp-0000000A7yK-1pBe;
	Wed, 11 Sep 2024 15:22:27 +0000
Received: from flow8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soP1u-0000000A5cH-40sZ;
	Wed, 11 Sep 2024 15:13:16 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 7C9EA2001A5;
	Wed, 11 Sep 2024 11:13:13 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 11 Sep 2024 11:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726067593;
	 x=1726074793; bh=W3/bFLF5GPmG/oJuoeXrc+CcLB5pp1RgCukpWqx8NY4=; b=
	d1FqCsPhahhr2Dwr0XhrBSK7PBKhdl7kI1nAgf00eCbyFC3vScqgPILeiWLRy9hy
	a4lO0s3Scill0gwpM/UBvLTdJMscXqSM2VFAsYG1+NoCJKaY9wISL6D34pDBkkLQ
	t9r/A/L85Q/EsPnej4osD2co4XsYgrUYP+Rkha0LGyvvRv5L5Siv/SzxkF0RGUjj
	tTslxZAr3dO0T05TmrYsAxurjvThNSfHsg/5VlmWemjcFPSKn6rh32tR0LPcX1Ry
	Jm215fJWfFOvjQbaXBM/rfNP0IqwTiS6iKK9glQn55ItjILGpjpr1d4+5JBu+8pr
	Xbpo3pGRUXteq9y9osONcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726067593; x=
	1726074793; bh=W3/bFLF5GPmG/oJuoeXrc+CcLB5pp1RgCukpWqx8NY4=; b=W
	JHEzuoO4E7PRxiBieiNSNuPJb4Yr2Tuy4vWbEXgdu4gj5HKRFgXN6/EUdTycU5CF
	LT5ga6nz4aVl6f8wSmNowcpZikl5UwHsKgnOITVHnEOZBo9Y1IJcp+dDVIniLPjz
	e1viD/oIGj3nwee812PuibrlGfCu5DeEBTZOp3yo3NjJQeTQWKL2xkpyhsES0BjK
	AEZtCZPryrR9qTzhFoRv14kxWofl0C/yr5K/RMRVg7kbZslIowPSShqlctUDzE+f
	hH29FlukC/fnufte5CTQ+hrLebOEikXOBU95oyfXOnorHMQzy2Up3zSoVLXz2DBd
	p9Bhz9jQqwRNibXrZlPKw==
X-ME-Sender: <xms:hrPhZnfTX_VylO-PNCzmdjPTic9z8BGVcJxI88meJ27e9r2pOSFL5Q>
    <xme:hrPhZtMPdP0AD192qTqmmh8z6yEcM-y6QqpnpZixQ5Mxf_3q1NXlYfZrhn8s3ywTt
    jIcY4d7mCJjNb6xF9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejuddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrghrohhnrdifuhesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdp
    rhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpth
    htohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihn
    rghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhloh
    hfthdrnhgvthdprhgtphhtthhopehluhhkmhgrseguvghngidruggvpdhrtghpthhtohep
    rghlvgigrghnuggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:hrPhZginhrjXLqpwTCFTnXWpiAEfHo6FpQYq-qC18dJws16a01kLeg>
    <xmx:hrPhZo-6qbuPN1Aw9mzuLb4wUz9doIfVj9TzCNgYoAyNBZYVif6F-Q>
    <xmx:hrPhZjut-J77GVyanCLtqtITaVUJE3vOfi2whVrSShNt_nC9ni0KDA>
    <xmx:hrPhZnFgz3iQgcxly9ZYIMYBR37m-rLjANIkLGUC3G67NEHKp35kDw>
    <xmx:ibPhZu-Qtm3ps0O94A68wPefYRL6CBcJRGkpn-4RQLmjUBM57R5KGzrl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2F2D222006F; Wed, 11 Sep 2024 11:13:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 11 Sep 2024 15:12:49 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nikita Shubin" <nikita.shubin@maquefel.me>,
 "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: "Hartley Sweeten" <hsweeten@visionengravers.com>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Lukasz Majewski" <lukma@denx.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Mark Brown" <broonie@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Sergey Shtylyov" <s.shtylyov@omp.ru>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Ralf Baechle" <ralf@linux-mips.org>, "Aaron Wu" <Aaron.Wu@analog.com>,
 "Lee Jones" <lee@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 "Niklas Cassel" <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Andrew Lunn" <andrew@lunn.ch>
Message-Id: <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
In-Reply-To: <0e3902c9a42b05b0227e767b227624c6fe8fd2bb.camel@maquefel.me>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
 <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
 <0e3902c9a42b05b0227e767b227624c6fe8fd2bb.camel@maquefel.me>
Subject: Re: [PATCH v12 00/38] ep93xx device tree conversion
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_081315_100238_C83560AC 
X-CRM114-Status: GOOD (  16.72  )
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

T24gTW9uLCBTZXAgOSwgMjAyNCwgYXQgMDk6MDIsIE5pa2l0YSBTaHViaW4gd3JvdGU6Cj4gT24g
TW9uLCAyMDI0LTA5LTA5IGF0IDExOjQ5ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+
IE9uIE1vbiwgU2VwIDksIDIwMjQgYXQgMTE6MTLigK9BTSBOaWtpdGEgU2h1YmluIHZpYSBCNCBS
ZWxheQo+PiA8ZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVlZmVsLm1lQGtlcm5lbC5vcmc+IHdy
b3RlOgo+PiA+IAo+PiA+IFRoZSBnb2FsIGlzIHRvIHJlY2lldmUgQUNLcyBmb3IgYWxsIHBhdGNo
ZXMgaW4gc2VyaWVzIHRvIG1lcmdlIGl0Cj4+ID4gdmlhIEFybmQgYnJhbmNoLgo+PiA+IAo+PiA+
IEl0IHdhcyBkZWNpZGVkIGZyb20gdGhlIHZlcnkgYmVnaW5uaW5nIG9mIHRoZXNlIHNlcmllcywg
bW9zdGx5Cj4+ID4gYmVjYXVzZQo+PiA+IGl0J3MgYSBmdWxsIGNvbnZlcnNpb24gb2YgcGxhdGZv
cm0gY29kZSB0byBEVCBhbmQgaXQgc2VlbWVkIG5vdAo+PiA+IGNvbnZlbmllbnQgdG8gbWFpbnRh
aW4gY29tcGF0aWJpbGl0eSB3aXRoIGJvdGggcGxhdGZvcm0gYW5kIERULgo+PiA+IAo+PiA+IEZv
bGxvd2luZyBwYXRjaGVzIHJlcXVpcmUgYXR0ZW50aW9uIGZyb20gU3RlcGhlbiBCb3lkIG9yIGNs
awo+PiA+IHN1YnN5c3RlbToKPj4gCj4+IERvZXMgaXQgbWVhbiB5b3Ugc3RpbGwgaGF2ZSBhIGZl
dyBwYXRjaGVzIHdpdGhvdXQgdGFncz8KPj4gV2hhdCBhcmUgdGhlaXIgcmVzcGVjdGl2ZSBudW1i
ZXJzPwo+Cj4gVGhlIGNsayBpcyB0aGUgbGFzdCBvbmUgYXMgaSB0aGluaywgYWxsIG90aGVycyBj
YW4gYmUgQUNLZWQgYnkKPiBBbGV4YW5kZXIgb3IgYnkgQXJuZCBoaW1zZWxmLgoKSSd2ZSBtZXJn
ZWQgdGhlIHNlcmllcyBpbnRvIHRoZSBmb3ItbmV4dCBicmFuY2ggb2YgdGhlIGFybS1zb2MKdHJl
ZSBub3cuIFRoZSB0aW1pbmcgaXNuJ3QgZ3JlYXQgYXMgSSB3YXMgc3RpbGwgd2FpdGluZyBmb3IK
dGhhdCBmaW5hbCBBY2ssIGJ1dCBpdCBzZWVtIGJldHRlciB0byBoYXZlIGl0IGRvbmUgdGhhbiB0
byBrZWVwCnJlc3Bpbm5pbmcgdGhlIHNlcmllcy4KCkkgd29uJ3Qgc2VuZCBpdCB3aXRoIHRoZSBp
bml0aWFsIHB1bGwgcmVxdWVzdHMgdGhpcyB3ZWVrCmJ1dCBob3BlIHRvIHNlbmQgdGhpcyBvbmUg
b25jZSBJIGdldCBiZWNrIGZyb20gTFBDLCBwcm92aWRlZAp0aGVyZSBhcmUgbm8gc3VycHJpc2Vz
IHRoYXQgcmVxdWlyZSBhIHJlYmFzZS4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
