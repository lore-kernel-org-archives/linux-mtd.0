Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6F606A682
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EYzVuUkP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cTb4l1cJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y0oaG8gMNypjsVK0ZEV5zvnSnI12vWzE1tuVhzUeI0Y=; b=EYzVuUkPKiNN8kw0AElF4B46pA
	JosvZnnvAZwRcL3XfdUkqZtwHpbXrF6PcAGCxa+e3F8ppyWuoCy0J06GdE0PtA9m3kjVyZozACH9G
	QwODIWyO0gp6qmIyPiwmgzwX0hN9GRhEw8mZH/O1KyAzVpqs50HiHyQ6otklYz3UyUo58ooThN1cN
	6PgwX/X9YA20f7Mb5OCaY/TQflAlpBAJDVC4Qbni8Sla3y6mY+7DJKJyoig2f3zTNlKYcF8StvYms
	egvSJHjQTxGNIfKLZWFilVODKC79oSb4JRMyew2wW4uJ9hWoxn+rD6AzPxaGBfazVP93mkUHiDEtF
	TU4+JdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWva-0000000ClYu-10IF;
	Thu, 26 Nov 2026 10:42:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWvW-0000000ClX6-2NXs;
	Thu, 26 Nov 2026 10:42:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 654104E4179E;
	Thu, 26 Nov 2026 10:42:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3280C60237;
	Thu, 26 Nov 2026 10:42:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 364FC11E6B305;
	Thu, 26 Nov 2026 11:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795689714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uheoRvhmn+YrPKS27YmgoKtAWg9YwsclVsNF7+M1D2A=;
	b=cTb4l1cJpCcYp3q2aGIWlRj7FvBcgz0uUKYYlYqqa5UwcH1jUj6SQXyQX9kJf5GRsaH3fE
	7nzKsqBjHYbI4v0yCa6EvGvnchrfXj/QG4Q25dBsKtPEHRP6nOAzZQdKNAcGel8NxWuCl8
	/UogoCled4Abz5qqLhRfe9EBcPYCKq0lj0YlM421XKJiKVLb8J73HWnTbfFaidWAakRDUI
	b8g6uiU/7Zm+9NDBBgVq+1RGa6wbQcoFDyM9l3vgGrsGxkIamS5EMGTKNmHk1jRT2TFSKO
	50QKKDM+v40MpF0N1CCiiA2gnNeu7HhRjnzL0TiEgFu/pSWGmX084+BB/y5b7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Joern Engel <joern@lazybastard.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>,  "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>,  Shrikanth Hegde <sshegde@linux.ibm.com>,  Michal
 Simek <michal.simek@amd.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Brian Norris <computersforpeace@gmail.com>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>,  William Zhang
 <william.zhang@broadcom.com>,  Anand Gore <anand.gore@broadcom.com>,
  Kursad Oney <kursad.oney@broadcom.com>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Ray
 Jui <rjui@broadcom.com>,  Scott Branden <sbranden@broadcom.com>,  Han Xu
 <han.xu@nxp.com>,  Paul Cercueil <paul@crapouillou.net>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Keguang Zhang <keguang.zhang@gmail.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,  Liang Yang
 <liang.yang@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Jerome Brunet
 <jbrunet@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Manivannan
 Sadhasivam <mani@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Stefan Agner <stefan@agner.ch>,  Lucas Stach <dev@lynxeye.de>,  Thierry
 Reding <thierry.reding@kernel.org>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun
 Hung <schung@nuvoton.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Linus Walleij <linusw@kernel.org>,  Kyungmin Park
 <kyungmin.park@samsung.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
  imx@lists.linux.dev,  linux-mips@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mediatek@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-rockchip@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,  linux-sunxi@lists.linux.dev,
  linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
In-Reply-To: <awcZcuSbse5g3FWK@monoceros> ("Uwe =?utf-8?Q?Kleine-K=C3=B6ni?=
 =?utf-8?Q?g=22's?= message of
	"Wed, 25 Nov 2026 18:25:04 +0100")
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
	<awcZcuSbse5g3FWK@monoceros>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 11:41:33 +0100
Message-ID: <87v75jyiw2.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_024206_754642_141CE6CE 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFphbGV3c2tpIDxwemFsZXdza2lAdGhlZ29vZHBlbmd1
aW4uY28udWs+Cj4KPiBBY2tlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BiYXlsaWJyZS5jb20+Cj4KPiB3aXRoIG9yIHdpdGhvdXQgYWRkcmVzc2luZyB0aGUgbml0cGlj
ayBJIGhhZCBmb3Igb25lIG9mIHRoZSBwYXRjaGVzLgoKTGV0IG1lIGtub3cgd2hhdCB5b3UgaW50
ZW5kIHRvIGRvLgoKTm90IHJlbGF0ZWQgYnV0IHNpbmNlIHlvdSB3ZXJlIHJlbW92aW5nIHRoZSAv
KiBzZW50aW5lbCAqLyBjb21tZW50CnNvbWV0aW1lcywgd2hlbiBkbyB3ZSBnZXQgcmlkIG9mIHRo
b3NlIGV4dHJhIGVudHJpZXMgZW50aXJlbHk/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
