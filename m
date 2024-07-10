Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E8EC3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mw+GgtAcFJZD6ja8cBkvwQU8cvHeWeebmkKi3WlfIg=; b=IvMSdr4dgRhc6g
	+dd4QbpzNw5SHYjid/XKW0qy01RoJ+hnontyXhduxWsSqYjczgvENH6/MvJO9Ch+eAqZ4nVT7bMb9
	zjvP32LPeuVcNiNfHP7KN5s8vdCgD/iWXb9v0VZPJQ0mDw54+gtx+s8VZZ0DUPmB/TGICm3Nv30jv
	dBjeOjeFxGCtBppl9qF3GAeK/vMIdk6Lom1Ei7/E6utclyXCGFj3jmWsgtE55WjOeGNHUVacyJu71
	m64PoKj8+gUgAuU6YwV0gi5RLRFG0Ps9WcaergVmflywp5A9ibhH6TgspGBZ7jGL83HsuwSuI/pYc
	jhuV8Mc2UW06XrUFbJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXy3-0000000AlWt-2zYB;
	Wed, 10 Jul 2024 14:06:47 +0000
Received: from flow2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXxm-0000000AlVf-25J5;
	Wed, 10 Jul 2024 14:06:31 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id B9B1820041E;
	Wed, 10 Jul 2024 10:06:28 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 10:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1720620388;
	 x=1720627588; bh=FPzIeyUoxgy/zsvmREOhCT66sbHOjXoV3rwrfvjo/oM=; b=
	b1QSu0yRwxmUk4T9e11CNmCLrSiiiDvCTM+p6gNGgF4NyrNSLVIOHkUZBUOxpgxl
	d9vXjGnvw1RIRFEnGbndv/NcsmA2GLHmGzS5rJQPxTUIVRHIc5YsWzN3YlDlG8/w
	vwY2PFDGlan7ERoJa/sElHU/md+4c0p5HPfL6l9s8ZmMuKw48t/vLeQtyNT7xGQA
	08JzF7ADIoyXkY9zBh7hy27GqOe5iBkl5T6KQBAg4I7sSnV3Bx0wxfh4IffSCDrD
	EIVAL8hHH2Si9T8S7nGauN4LncCjezn9OQ+3j17vNfQLsEMR2BpYb0oenTLEqeam
	BkMUq/IWBWnOKLgWug2rTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720620388; x=
	1720627588; bh=FPzIeyUoxgy/zsvmREOhCT66sbHOjXoV3rwrfvjo/oM=; b=l
	/UJxZbDwRbte/g2yuSkS7yviFUoG8LxQcRmLaiOWFtKAn6XFD9z5i8BhgFiwj0y8
	29JjOMIc2w4FtrW9IR6h2qT2CtX2uPI+r/FHtrpLoTkSoPbJe3J1cehcgwZANS3t
	XYMJKq7TPb5u/bjrOem4WITUkAc4LfU2b5bDaz8AwaT3QByZ35D8ZMjHSS1yi35y
	36/dyXCkN+nwX8HvtBeT3ddkLpikQS8EZ4XXcTy6LBfF5l17hW9zP7dZMzOmMwhD
	XVJREG2So1zHmWfmY5D9lvTGvCqcKkIECCEfL0l0Epvm0v8FzfUmUtTmU/hw+Ez6
	qJJNz78tvzr+wlzfmgwog==
X-ME-Sender: <xms:YZWOZnV51EQeUhqFAlZ7tF76IbGPDn0AZ7wRftLLqANLQ8M0Tit2-g>
    <xme:YZWOZvnwaOkIlW8JDpVJ4uVPdX-o79KWjlklZpPYf1atbq30ICIdwRgOUhrJ5p-D2
    Q0py9B8mmaXogLqMVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedvgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YZWOZjaoGrXUw2M4_1y1ixokbMZsjZ3j3fcIkHhdLxC9KxWjE7s4BQ>
    <xmx:YZWOZiWPJTo6_33m1wPp7E5VWb0uw6xuIw-rKVLCCKI-iKqUbc-UEw>
    <xmx:YZWOZhn1-MjLOZ3xu0SsbEEBMly36iOA_myUgrsipjQv0pKFdaMeCQ>
    <xmx:YZWOZvdtJ2DdefwHMUz8i_IkZzQem-fWQbBtb87UMDnBEk3or4GmNA>
    <xmx:ZJWOZilNKpqeyxqgV0ZboZyCiXV66jXIKgbBPX_yaK6wioTafD0Okj0c>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 213BBB6008F; Wed, 10 Jul 2024 10:06:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <64662665-929e-4d95-a9ac-c8f66bd83168@app.fastmail.com>
In-Reply-To: <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
 <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
 <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
Date: Wed, 10 Jul 2024 16:06:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, imx@lists.linux.dev,
 "Tony Lindgren" <tony@atomide.com>,
 "Marco Felsch" <m.felsch@pengutronix.de>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "WANG Xuerui" <kernel@xen0n.name>, "Fabio Estevam" <festevam@gmail.com>,
 linux-aspeed@lists.ozlabs.org, "Richard Weinberger" <richard@nod.at>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jon Hunter" <jonathanh@nvidia.com>, "Joel Stanley" <joel@jms.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, loongarch@lists.linux.dev,
 linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Shawn Guo" <shawnguo@kernel.org>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_070630_625937_92D76C75 
X-CRM114-Status: GOOD (  11.18  )
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

T24gV2VkLCBKdWwgMTAsIDIwMjQsIGF0IDE0OjU5LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3Rl
Ogo+IE9uIFdlZCwgSnVsIDEwLCAyMDI0IGF0IDI6NDnigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPiB3cm90ZToKPj4KPj4gT24gTW9uLCBKdWwgMSwgMjAyNCwgYXQgMTU6NTMsIE1h
cmNvIEZlbHNjaCB3cm90ZToKPj4gPiBUaGUgRUVQUk9NX0FUMjQgS2NvbmZpZyBzeW1ib2wgaXMg
bWFya2VkIGFzIGRlcHJlY2F0ZWQuIE1ha2UgdXNlIG9mIHRoZQo+PiA+IG5ldyBLY29uZmlnIHN5
bWJvbCB0byBzZWxlY3QgdGhlIEkyQyBFRVBST00gZHJpdmVyIHN1cHBvcnQuCj4+ID4KPj4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPgo+PiA+
IC0tLQo+PiA+ICBhcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcgICB8IDIgKy0K
Pj4gPiAgYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnICAgfCAyICstCj4+ID4g
IGFyY2gvYXJtL2NvbmZpZ3MvYXQ5MV9kdF9kZWZjb25maWcgICAgIHwgMiArLQo+PiA+ICBhcmNo
L2FybS9jb25maWdzL2F4bTU1eHhfZGVmY29uZmlnICAgICB8IDIgKy0KPj4gPiAgYXJjaC9hcm0v
Y29uZmlncy9kYXZpbmNpX2FsbF9kZWZjb25maWcgfCAyICstCj4+ID4gIGFyY2gvYXJtL2NvbmZp
Z3MvaW14X3Y0X3Y1X2RlZmNvbmZpZyAgIHwgMiArLQo+PiA+ICBhcmNoL2FybS9jb25maWdzL2lt
eF92Nl92N19kZWZjb25maWcgICB8IDIgKy0KPj4gPiAgYXJjaC9hcm0vY29uZmlncy9peHA0eHhf
ZGVmY29uZmlnICAgICAgfCAyICstCj4+ID4gIGFyY2gvYXJtL2NvbmZpZ3Mva2V5c3RvbmVfZGVm
Y29uZmlnICAgIHwgMiArLQo+PiA+ICBhcmNoL2FybS9jb25maWdzL2xwYzE4eHhfZGVmY29uZmln
ICAgICB8IDIgKy0KPj4KPj4gQXBwbGllZCB0byBzb2MvZGVmY29uZmlnLCB0aGFua3MKPgo+IE5v
ISBXaHk/IFRoaXMgaXMgc3RpbGwgYmVpbmcgZGlzY3Vzc2VkIGFuZCBpdCdzIG5vdCBjbGVhciBp
dCB3aWxsIGV2ZW4KPiBtYWtlIGl0IHVwc3RyZWFtLgoKT2ssIGRyb3BwZWQgYWdhaW4sIHRoYW5r
cyBmb3IgY2F0Y2hpbmcgdGhpcy4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
