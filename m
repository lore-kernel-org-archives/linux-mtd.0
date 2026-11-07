Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1296606A32D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AlmwZN5O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYEo0TeW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NlUG5gq23M2mu2GZfll+q+zjmX9LpdxvSeBFtqEBi3U=; b=AlmwZN5O8GJXjZvtNGO+EGSwph
	A+Hi9sHCjy7fWjrlpX6gpPx442EevHzaLIVjX/7oAbZagBq28YxUBQv7KwhY1hueQqShbyo2OqwAW
	G5LG9dpNDnqGn9+7Vz/IbaazlvTMrJNEDUUZsTvdhY6FLiq9O3Fu4X6mfaYnA4xc6mCRVrAhBt733
	vtEm5bSJOaAbaYxIhEY9ZwYTFuoeLd0UlawVdUYqTHmXvfzly/fOU4hJyCgEA8fdCNoSsbyQQBhuG
	NwbUP77VLggkhWpULsH67NyMXez/d7clYTQWjMatEmWQwpVb/2/CoAobgJ+vFk7J5lm3ANov56OsL
	mbe1bgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnEk-0000000FO7t-3RQk;
	Sat, 07 Nov 2026 20:42:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnEj-0000000FO7Y-1Dxi;
	Sat, 07 Nov 2026 20:42:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B65BB43EFE;
	Sat,  7 Nov 2026 20:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA301F0089F;
	Sat,  7 Nov 2026 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084123;
	bh=lwuEsjh9q5gPbKhlJcGbl7FK+AeSWFGu+PnGUu+3vhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYEo0TeWlYT8r1fdHC56Lgr3GMEibpbQNZUheFdun5BrOo095xOtsOOZ/ghwByI5N
	 zawR+YyAvrI4RgGMXY0G3SRK2ogBlbTFCe13Hyk7RIwW+RXbg+x6ojFL1MnrWqFCso
	 ZP/ZSxZOydWBDjrYq9IdzhcyFxcYMJyxm4kyOKp5XfojhupKlGP/qb7M+rla7KXA8p
	 JoshuHDiQOMUC3h/J8WL3WNHL7rRJuwWgY2CMY8321RptAnnG3iKZxbTVxIJf53X0k
	 84cDIMVugD4Wv30OcZqFvBpPO/zGF9NDRlQlnq6QKGQb9lBLNaljHsBzQ8mw8LRbll
	 fkC5snZSFp51Q==
Message-ID: <sashiko-outbox-203315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/58] mtd: rawnand: separate hardware disconnection
 from cleanup
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Vitaly Wool" <vitalywool@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "Russell King" <rmk+kernel@arm.linux.org.uk>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Mike Rapoport" <rppt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Christophe
 Kerello" <christophe.kerello@st.com>, "Jason Roberts" <jason.e.roberts@intel.com>, "Michal
 Simek" <michal.simek@amd.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Mason
 Yang" <masonccyang@mxic.com.tw>, "Ramuthevar Vadivel Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>, "Heiko Stuebner" <heiko@sntech.de>, "Yifeng
 Zhao" <yifeng.zhao@rock-chips.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Jacky Huang" <ychuang3@nuvoton.com>, "Shan-Chun
 Hung" <schung@nuvoton.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han
 Xu" <han.xu@nxp.com>, "Liang Yang" <liang.yang@amlogic.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Kamal Dasu" <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Harvey Hunt" <harveyhuntnexus@gmail.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, "Michael Walle" <michael@walle.cc>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Tze Yee Ng" <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-4-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-4-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:42:00 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBtdGQ6IHJhd25hbmQ6IHVu
bG9ja2VkIGhhcmR3YXJlIGFjY2VzcyBhZnRlciBuYW5kX2Rpc2Nvbm5lY3QoKQogIGluIHdyaXRl
X2JidCgpCi0gW01lZGl1bV0gbXRkOiByYXduYW5kOiBuYW5kX3N1c3BlbmQoKSByZXR1cm5pbmcg
LUVOT0RFViBhYm9ydHMgc3lzdGVtCiAgc3VzcGVuZAotLQoKY29tbWl0IDBkNjk4MjgwMzBkMjFm
MmU4YzNmMzkxNTQ0ZWU1YTU2NDA2ZTc5OTYKQXV0aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4KCm10ZDogcmF3bmFuZDogc2VwYXJhdGUgaGFyZHdhcmUgZGlz
Y29ubmVjdGlvbiBmcm9tIGNsZWFudXAKClRoaXMgY29tbWl0IGFkZHMgbmFuZF9kaXNjb25uZWN0
KCkgdG8gbWFyayBhIE5BTkQgY2hpcCBhcyBkaXNjb25uZWN0ZWQKdW5kZXIgdGhlIGNoaXAgYW5k
IGNvbnRyb2xsZXIgbG9ja3MgYW5kIG1ha2VzIG5hbmRfZ2V0X2RldmljZSgpLApuYW5kX3N1c3Bl
bmQoKSwgbmFuZF9yZXN1bWUoKSwgYW5kIHBhbmljX25hbmRfd3JpdGUoKSByZWplY3QgaGFyZHdh
cmUKYWNjZXNzIG9uY2UgZGlzY29ubmVjdGVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+
IGluZGV4IGE1YjI3OGFiOTM4NGYuLjhmN2QyNTcxZThkOWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYwoKWyAuLi4gXQoKPiBAQCAtNTgxLDcgKzYwNyw5IEBAIHN0YXRpYyBpbnQgbmFu
ZF9ibG9ja19tYXJrYmFkX2xvd2xldmVsKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZfdCBv
ZnMpCj4gIAkJbmFuZF9lcmFzZV9uYW5kKGNoaXAsICZlaW5mbywgMCk7Cj4gIAo+ICAJCS8qIFdy
aXRlIGJhZCBibG9jayBtYXJrZXIgdG8gT09CICovCj4gLQkJbmFuZF9nZXRfZGV2aWNlKGNoaXAp
Owo+ICsJCXJldCA9IG5hbmRfZ2V0X2RldmljZShjaGlwKTsKPiArCQlpZiAocmV0KQo+ICsJCQly
ZXR1cm4gcmV0Owo+ICAKPiAgCQlyZXQgPSBuYW5kX21hcmtiYWRfYmJtKGNoaXAsIG9mcyk7Cj4g
IAkJbmFuZF9yZWxlYXNlX2RldmljZShjaGlwKTsKCltTZXZlcml0eTogSGlnaF0KQ2FuIGEgY29u
Y3VycmVudCBuYW5kX2Rpc2Nvbm5lY3QoKSBjYXVzZSB3cml0ZV9iYnQoKSB0byBpc3N1ZSB1bmxv
Y2tlZApoYXJkd2FyZSBvcGVyYXRpb25zIG9uIHRoZSBkaXNjb25uZWN0ZWQgY29udHJvbGxlciB3
aGVuIHVwZGF0aW5nIGFuCm9uLWZsYXNoIEJCVD8KCm5hbmRfYmxvY2tfbWFya2JhZF9sb3dsZXZl
bCgpIHJlbGVhc2VzIHRoZSBjaGlwIGFuZCBjb250cm9sbGVyIGxvY2tzCmJlZm9yZSBjYWxsaW5n
IG5hbmRfbWFya2JhZF9iYnQoKSAtPiBuYW5kX3VwZGF0ZV9iYnQoKSAtPiB3cml0ZV9iYnQoKS4K
SWYgbmFuZF9kaXNjb25uZWN0KCkgcnVucyBiZWZvcmUgd3JpdGVfYmJ0KCkgY2FsbHMgbmFuZF9l
cmFzZV9uYW5kKCkgb3IKc2Nhbl93cml0ZV9iYnQoKSwgbmFuZF9nZXRfZGV2aWNlKCkgcmV0dXJu
cyAtRU5PREVWLCB3aGljaCB3cml0ZV9iYnQoKQp0cmVhdHMgYXMgYSBiYWQgQkJUIGVyYXNlYmxv
Y2s6Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jOndyaXRlX2JidCgpIHsKCS4uLgoJ
CXJlcyA9IG5hbmRfZXJhc2VfbmFuZCh0aGlzLCAmZWluZm8sIDEpOwoJCWlmIChyZXMgPCAwKSB7
CgkJCXByX3dhcm4oIm5hbmRfYmJ0OiBlcnJvciB3aGlsZSBlcmFzaW5nIEJCVCBibG9jayAlZFxu
IiwKCQkJCXJlcyk7CgkJCW1hcmtfYmJ0X2Jsb2NrX2JhZCh0aGlzLCB0ZCwgY2hpcCwgYmxvY2sp
OwoJCQljb250aW51ZTsKCQl9CgkuLi4KfQoKbWFya19iYnRfYmxvY2tfYmFkKCkgdGhlbiBtYXJr
cyBlYWNoIHJlc2VydmVkIEJCVCBibG9jayB3b3JuIGluIG1lbW9yeQphbmQgY2FsbHMgbmFuZF9t
YXJrYmFkX2JibSgpIC0+IG5hbmRfZGVmYXVsdF9ibG9ja19tYXJrYmFkKCkgLT4KbmFuZF9kb193
cml0ZV9vb2IoKSB3aXRob3V0IGNhbGxpbmcgbmFuZF9nZXRfZGV2aWNlKCksIGFjY2Vzc2luZwpj
b250cm9sbGVyIHJlc291cmNlcyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIGZyZWVkIGFmdGVyCm5h
bmRfZGlzY29ubmVjdCgpIHJldHVybmVkLgoKWyAuLi4gXQoKPiBAQCAtNDY4OCwxMCArNDcyOCwx
NCBAQCBzdGF0aWMgaW50IG5hbmRfc3VzcGVuZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgCWlu
dCByZXQgPSAwOwo+ICAKPiAgCW11dGV4X2xvY2soJmNoaXAtPmxvY2spOwo+ICsJaWYgKGNoaXAt
PmRpc2Nvbm5lY3RlZCkgewo+ICsJCW11dGV4X3VubG9jaygmY2hpcC0+bG9jayk7Cj4gKwkJcmV0
dXJuIC1FTk9ERVY7Cj4gKwl9Cj4gIAlpZiAoY2hpcC0+b3BzLnN1c3BlbmQpCj4gIAkJcmV0ID0g
Y2hpcC0+b3BzLnN1c3BlbmQoY2hpcCk7Cj4gIAlpZiAoIXJldCkKPiAtCQljaGlwLT5zdXNwZW5k
ZWQgPSAxOwo+ICsJCVdSSVRFX09OQ0UoY2hpcC0+c3VzcGVuZGVkLCB0cnVlKTsKPiAgCW11dGV4
X3VubG9jaygmY2hpcC0+bG9jayk7Cj4gIAo+ICAJcmV0dXJuIHJldDsKCltTZXZlcml0eTogTWVk
aXVtXQpEb2VzIHJldHVybmluZyAtRU5PREVWIGZyb20gbmFuZF9zdXNwZW5kKCkgYWJvcnQgc3lz
dGVtIHN1c3BlbmQgd2hlbiBhbgpvcGVuIE1URCBoYW5kbGUgb3V0bGl2ZXMgY29udHJvbGxlciB1
bmJpbmQ/CgpXaGlsZSBhbiBNVEQgaGFuZGxlIHJlbWFpbnMgb3BlbiBhZnRlciBkZWxfbXRkX2Rl
dmljZSgpIGFuZApuYW5kX2Rpc2Nvbm5lY3QoKSwgbXRkLT5kZXYgc3RheXMgcmVnaXN0ZXJlZCBv
biBkcG1fbGlzdCB1bnRpbCB0aGUgbGFzdApyZWZlcmVuY2UgaXMgcHV0IGluIG10ZF9kZXZpY2Vf
cmVsZWFzZSgpLiAgRHVyaW5nIHN5c3RlbSBzdXNwZW5kLAptdGRfY2xzX3N1c3BlbmQoKSBjYWxs
cyBtdGRfc3VzcGVuZCgpIC0+IG5hbmRfc3VzcGVuZCgpLCBhbmQgcmV0dXJuaW5nCi1FTk9ERVYg
ZmFpbHMgZHBtX3N1c3BlbmQoKSBpbnN0ZWFkIG9mIHRyZWF0aW5nIHRoZSBkaXNjb25uZWN0ZWQg
Y2hpcCBhcwphIG5vLW9wIGxpa2UgbmFuZF9yZXN1bWUoKSBhbmQgbmFuZF9zeW5jKCkgZG8uCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYxMTA3LXN1Ym1pdC1yYXduYW5kLXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12MS0wLTAx
ODFlZjBjYzRjOEBnbWFpbC5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
