Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD33606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gxKKG+An;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mteItAuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gqzzsrLeT/ZLmfuD0Z381pw4XwhuXItuFovnrMgzyts=; b=gxKKG+AnvGiIGGxEWD5a0zFIrZ
	pJmWboDf8GeSGZ5Qv9foeo49X0FuSKnFzvvBd4oPh9TaOZPKJ+X7o3TLLaU1hIs7wdMXmJcLpjXYN
	2xeJd12ftO19wgqrMzVrTPTKe7Ah+DjfykNzxjoTaE4i/ickdBdWf581YPiqOF7AqVtgCyKynSy1a
	RLBaySdXs1vkD8Ymw2GHSA6kMXmYl16S+PZg85N5ck+7Z5g1Eg7aBpvgItkTsHka4n9H2Bk5h3y/0
	tJV7PjDjgY91/A6vP8mrlt5Z+Y+rMo1cSXjEIrUUzk/J31/dsAwhhgZDr5HG8f8u/Wp3pckJOAQ81
	qB9tI3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Zg-0000000BvNK-074m;
	Thu, 19 Nov 2026 12:49:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Zb-0000000BvKx-0tOg;
	Thu, 19 Nov 2026 12:49:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A16E1A1711;
	Thu, 19 Nov 2026 12:49:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F14960237;
	Thu, 19 Nov 2026 12:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC49311BC0673;
	Thu, 19 Nov 2026 13:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795092535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FrqcePVIbKpJOlr0CwwEXmHuYmHa3yUMeo1BTUrWcl0=;
	b=mteItAuJBxCXIm6o7Tz4CiCkaMG9jXhvMU2sSQLnSpwBcZpG8f2MBEvcJ1Bx2lQIvEFPHc
	cDtQgbCpT1F3jW229XoKlV3ReW5mnP/ABdent9sCr/5183826BqbllILfT90L05VaHMgtP
	dUJUiAyMuYUR1NhbdpZFwHZONdW4QU9si+WZSm1qV6DhZI6XlaK2xQVRCAOzwBKLP1wBFh
	3qw4wVp4q47Ts1Jsp/lIRy+UYxCPzeFEV89KDKzTVDondoVzVYjpyUCZKV/Oz4GxrsbGus
	YTBzHCONs5aDQShHm1+BnPAiQ9L4baKhNKmb68Cs/uKC0//BXan270Bf1Uz6BQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Srinivas Kandagatla <srini@kernel.org>,
  Tze Yee Ng <tze.yee.ng@altera.com>,  Richard Cochran
 <richardcochran@gmail.com>,  Jonathan Lemon <jonathan.lemon@gmail.com>,
  Vadim Fedorenko <vadim.fedorenko@linux.dev>,  Yuqiang Sun
 <izaiahsun@gmail.com>,  Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>,  "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Kees Cook <kees@kernel.org>,
  linux-hardening@vger.kernel.org,  Arseniy Krasnov
 <AVKrasnov@sberdevices.ru>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  Samuel Holland <samuel@sholland.org>,
  Chen-Yu Tsai <wens@kernel.org>,  David Woodhouse <dwmw2@infradead.org>,
  Thomas Gleixner <tglx@kernel.org>,  Vitaly Wool <vitalywool@gmail.com>,
  David Woodhouse <David.Woodhouse@intel.com>,  Russell King
 <rmk+kernel@arm.linux.org.uk>,  Mike Rapoport <rppt@kernel.org>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,  Christophe Kerello
 <christophe.kerello@st.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Jason Roberts <jason.e.roberts@intel.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>,  Michal Simek <michal.simek@amd.com>,
  Mason Yang <masonccyang@mxic.com.tw>,  Ramuthevar Vadivel Murugan
 <vadivel.muruganx.ramuthevar@linux.intel.com>,  Lucas Stach
 <dev@lynxeye.de>,  Dmitry Osipenko <digetx@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  linux-tegra@vger.kernel.org,  Stefan Agner
 <stefan@agner.ch>,  Thierry Reding <thierry.reding@kernel.org>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  linux-mediatek@lists.infradead.org,  Matthias Brugger
 <matthias.bgg@gmail.com>,  Heiko Stuebner <heiko@sntech.de>,
  linux-rockchip@lists.infradead.org,  Yifeng Zhao
 <yifeng.zhao@rock-chips.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Keguang Zhang <keguang.zhang@gmail.com>,  linux-mips@vger.kernel.org,
  Shan-Chun Hung <schung@nuvoton.com>,  Jacky Huang <ychuang3@nuvoton.com>,
  Fabio Estevam <festevam@gmail.com>,  Frank Li <Frank.Li@nxp.com>,
  imx@lists.linux.dev,  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Han Xu <han.xu@nxp.com>,
  linux-renesas-soc@vger.kernel.org,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Jerome Brunet <jbrunet@baylibre.com>,
  Kevin Hilman <khilman@baylibre.com>,  Liang Yang
 <liang.yang@amlogic.com>,  linux-amlogic@lists.infradead.org,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  linux-arm-msm@vger.kernel.org,  Manivannan
 Sadhasivam <mani@kernel.org>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Kamal Dasu
 <kamal.dasu@broadcom.com>,  Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,  Paul Cercueil
 <paul@crapouillou.net>,  Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH v5 00/58] mtd: rawnand: retain chip and controller state
 across removal
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
	(James Hilliard's message of "Sun, 15 Nov 2026 23:29:15 -0700")
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 13:48:02 +0100
Message-ID: <87v75tc7i5.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044907_408309_11A5BFE7 
X-CRM114-Status: GOOD (  22.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmFtZXMsCgpPbiAxNS8xMS8yMDI2IGF0IDIzOjI5OjE1IC0wNywgSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBbiBNVEQgaGFuZGxlIGNhbiBv
dXRsaXZlIGNvbnRyb2xsZXIgdW5iaW5kLiBJdHMgbWV0YWRhdGEgYW5kIE5BTkQgbG9ja3MKPiBt
dXN0IHJlbWFpbiB2YWxpZCwgaW5jbHVkaW5nIHdoZW4gYSB3cml0YWJsZSBmaWxlIGNsb3NlcyBh
bmQgY2FsbHMgc3luYywKPiB3aGlsZSBmdXJ0aGVyIGhhcmR3YXJlIGFjY2VzcyBtdXN0IGJlIHJl
amVjdGVkIGFmdGVyIGRpc2Nvbm5lY3Rpb24uCj4KPiBUaGlzIGJ1aWxkcyBvbiBlYXJsaWVyIE1U
RCByZW1vdmFsLWxpZmV0aW1lIHdvcmsuIENvbW1pdCAxOWJmYTllYmViYjUKPiAoIm10ZDogdXNl
IHJlZmNvdW50IHRvIHByZXZlbnQgY29ycnVwdGlvbiIpIGFkZGVkIE1URCByZWZlcmVuY2UgY291
bnRpbmcKPiBbMF0sIGJ1dCByZXRhaW5pbmcgYW4gTVREIHJlZmVyZW5jZSBkb2VzIG5vdCBieSBp
dHNlbGYgcmV0YWluIHRoZQo+IGRyaXZlci1vd25lZCBhbGxvY2F0aW9uIGNvbnRhaW5pbmcgdGhl
IG1hc3Rlci4gVGhlIHJlYWQvdW5iaW5kIGRpc2N1c3Npb24KPiBhbHNvIGNvdmVyZWQgcmF3IE5B
TkQgWzFdIGFuZCBkcmFpbmluZyBhY3RpdmUgb3BlcmF0aW9ucyBbMl0uIFR6ZSBZZWUgTmcncwo+
IFNQSS1OT1Igc2VyaWVzIGFkZHJlc3NlcyB0aGUgY29ycmVzcG9uZGluZyBTUEktTk9SIHBhdGhz
IFszXS4KPgo+IEZvbGxvd2luZyBHcmVnJ3MgcmV2aWV3IFs3XSwgc2VwYXJhdGUgY2xhc3MtZGV2
aWNlIGRhdGEgZnJvbSB0aGUgTVRECj4gYmFja2luZyBhbGxvY2F0aW9uLiBEZWxldGUgdGhlIGRl
dmljZSdzIGludGVyZmFjZXMgYW5kIGRyYWluIE5WTUVNIGFuZAo+IGNsYXNzIFBNIGNhbGxiYWNr
cyBiZWZvcmUgcmVsZWFzaW5nIGJhY2tpbmcgZGF0YS4gQmFyZSBkZXZpY2UgcmVmZXJlbmNlcwo+
IHJldGFpbiBhbiBpbmRlcGVuZGVudGx5IGFsbG9jYXRlZCBkZXZpY2UsIHdob3NlIHR5cGUsIFBN
IGRpc3BhdGNoIGFuZAo+IGZpbmFsIHJlbGVhc2UgYXJlIGJ1aWx0IGluIGV2ZW4gd2hlbiBNVEQg
aXMgbW9kdWxhci4gTlZNRU0gc2ltaWxhcmx5Cj4gZGlzY29ubmVjdHMgYW5kIGRyYWlucyBwcm92
aWRlciBhbmQgbGF5b3V0IGNhbGxiYWNrcyBiZWZvcmUgdW5yZWdpc3Rlcgo+IHJldHVybnM7IHJl
dGFpbmVkIGNvbnN1bWVycyBrZWVwIGNvcmUtb3duZWQgbWV0YWRhdGEgYW5kIHJlY2VpdmUgLUVO
T0RFVgo+IG9uIHN1YnNlcXVlbnQgYWNjZXNzLgo+Cj4gSW50cm9kdWNlIG9wdC1pbiBiYWNraW5n
LW9iamVjdCBvd25lcnNoaXAgZm9yIE1URCBtYXN0ZXJzLiBSZWdpc3RlcmVkCj4gbm9kZXMgYW5k
IGFjcXVpcmVkIE1URCBoYW5kbGVzIHJldGFpbiB0aGUgY2hpcCwgd2hpbGUgbmVzdGVkIHBhcnRp
dGlvbnMKPiBhbHNvIHJldGFpbiB0aGVpciBwYXJlbnQgbWV0YWRhdGEuIFVucmVnaXN0ZXIgZmly
c3Qgc28gcmVtb3ZhbCBub3RpZmllcnMKPiBjYW4gZmluaXNoIEkvTywgdGhlbiBkaXNjb25uZWN0
IHJhdyBOQU5EIGFuZCBkcmFpbiBhZG1pdHRlZCBvcGVyYXRpb25zLgo+IEhhcmR3YXJlIHJlc291
cmNlcyBjYW4gYmUgcmVsZWFzZWQgd2l0aG91dCB3YWl0aW5nIGZvciBvcGVuIGZpbGVzIHRvIGNs
b3NlLgo+Cj4gVmlydHVhbCBjb25jYXRlbmF0aW9ucyBzZXJpYWxpemUgcHVibGljYXRpb24gYW5k
IHJlbW92YWwgYWNyb3NzIHBoeXNpY2FsCj4gY29udHJvbGxlcnMuIERpc2Nvbm5lY3QgYW5kIGRy
YWluIGEgcHVibGlzaGVkIGNvbmNhdGVuYXRpb24gYmVmb3JlIGFueQo+IGNvbXBvbmVudCBjYW4g
ZGlzYXBwZWFyLCB0aGVuIHJlbGVhc2UgaXRzIGNvbXBvbmVudCByZWZlcmVuY2VzLiBBbiBvbGQK
PiBoYW5kbGUga2VlcHMgdGhlIGRpc2Nvbm5lY3RlZCB2aXJ0dWFsIGRldmljZSwgaW5kZXBlbmRl
bnRseSBvZiBhIGxhdGVyCj4gcmVwbGFjZW1lbnQuCj4KPiBSdW4gTkFORCBhbmQgY29udHJvbGxl
ci1zcGVjaWZpYyBjbGVhbnVwIGR1cmluZyBkaXNjb25uZWN0aW9uLCB3aGlsZQo+IHRoZSBjb250
cm9sbGVyIGRyaXZlciBpcyBzdGlsbCBib3VuZC4gU25hcHNob3QgdGhlIE9PQiBsYXlvdXQgaW4g
Y29yZS1vd25lZAo+IGRhdGEgYmVmb3JlIHB1YmxpY2F0aW9uIHNvIG1ldGFkYXRhIHF1ZXJpZXMg
cmVtYWluIHZhbGlkIHdpdGhvdXQgZHJpdmVyCj4gY2FsbGJhY2tzLiBUaGUgTkFORCBjb3JlIGZy
ZWVzIHJldGFpbmVkIGNoaXAgYW5kIGNvbnRyb2xsZXIgYWxsb2NhdGlvbnM7Cj4gdGhlIGZpbmFs
IE1URCBwdXQgbmV2ZXIgY2FsbHMgYmFjayBpbnRvIHRoZSBjb250cm9sbGVyIG1vZHVsZS4gT3Jk
aW5hcnkKPiBNVEQgYW5kIE5WTUVNIGhhbmRsZXMgcmV0YWluIHRoZSBOQU5EIGNvcmUgdGhhdCBp
bXBsZW1lbnRzIHRoZWlyCj4gb3BlcmF0aW9ucywgcmF0aGVyIHRoYW4gdGhlIGhhcmR3YXJlIGRy
aXZlci4KPgo+IFNoYXJlIGFsbG9jYXRpb24gb3duZXJzaGlwIGFjcm9zcyB0aGUgcmF3LU5BTkQg
ZHJpdmVycywgaW5jbHVkaW5nCj4gcGFydGlhbGx5IHB1Ymxpc2hlZCBwcm9iZXMuIFNoYXJlZCBj
b250cm9sbGVycyByZW1haW4gYWxsb2NhdGVkIHVudGlsCj4gdGhlaXIgbGFzdCByZXRhaW5lZCBj
aGlwIGlzIHJlbGVhc2VkLiBSODUyIGFsbG9jYXRlcyBhIG5ldyBjaGlwIGZvciBlYWNoCj4gY2Fy
ZCwgYW5kIE5ERkMgYWxsb2NhdGVzIGNvbnRyb2xsZXIgc3RhdGUgcGVyIGJpbmRpbmcuCj4KPiBC
YXNlZCBvbiBOQU5EIG5leHQgYXQgMzBkYWFmM2U3ODk3LCB3aXRoIFR6ZSBZZWUgTmcncyBtb2R1
bGUtcmVmZXJlbmNlCj4gb3JkZXJpbmcgZml4IFs0XSwgS2FybCBNZWhsdHJldHRlcidzIE9UUCBj
bGVhbnVwIGZpeCBbNl0sIGFuZCB0aGUgc2VwYXJhdGVseQo+IHBvc3RlZCByZWdpc3RyYXRpb24s
IG9wZXJhdGlvbi1sb2NraW5nIGFuZCBjb250cm9sbGVyIHByb2JlL3RlYXJkb3duIGZpeGVzCj4g
aWRlbnRpZmllZCBieSB0aGUgcHJlcmVxdWlzaXRlIG1ldGFkYXRhLiBUTEErIG1vZGVscyBhbmQg
dGhlaXIgYXNzdW1wdGlvbnMKPiBhbmQgY292ZXJhZ2UgbGltaXRzIGFyZSBhdmFpbGFibGUgaW4g
WzVdLgoKV2hpbGUgbGlmZXRpbWUgaXNzdWVzIGFyZSBhIHJlYWwgY29uY2VybiBpbiB0aGUga2Vy
bmVsLCBwbGVhc2Ugbm90ZSB0aGF0CmluIGdlbmVyYWwsIHJlbW92aW5nIG9yIHVuYmluZGluZyB0
aGUgZmxhc2ggY29udHJvbGxlciBkcml2ZXIgaXMgbm90IGEKcHJhY3RpY2FsIG9wZXJhdGlvbi4g
V2hpbGUgaGlnaGx5IHVubGlrZWx5LCB0aGlzIGlzIHBvc3NpYmxlIHRob3VnaC4gQnV0CkkgYW0g
bm90IGdvaW5nIHRvIHNhY3JpZmljZSBhbGwgdGhlIGRldm1fIGNhbGxzIGluIGZhdm9yIG9mIHJl
aW5zdGF0aW5nCm1hbnVhbCBlcnJvciBoYW5kbGluZyBqdXN0IGZvciB0aGF0LiBJZiB0aGVyZSBp
cyBhIHdheSwgaXQgbXVzdCBiZQpkaWZmZXJlbnQuCgpBbHNvLCB0aGlzIGtpbmQgb2YgY29udHJp
YnV0aW9uIGNhbiBvbmx5IGJlIGRvbmUgaWYgeW91ICp1bmRlcnN0YW5kKgp3aGF0IHlvdSBhcmUg
ZG9pbmcuIEdldHRpbmcgdGhlIGJpZyBwaWN0dXJlIGhlcmUgaXMgbm90IG9wdGlvbmFsLgoKTWF5
YmUgdGhlIHByb2JsZW0gaXMgTVREIHJlZmNvdW50aW5nPyBNYXliZSB0aGUgcHJvYmxlbSBpcyB0
aGUgZGV2bV8Kb3JkZXJnaW5nPyBJIGRvbid0IGtub3csIEkgaGF2ZW4ndCBsb29rZWQgaW4gZGVw
dGggYXQgYWxsIHRoZQpwYXRjaGVzLiBCdXQgdGhlIGN1cnJlbnQgYXBwcm9hY2ggaXMgY2xlYXJs
eSBub3QgYWNjZXB0YWJsZS4KClRoYW5rcywKTUlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
