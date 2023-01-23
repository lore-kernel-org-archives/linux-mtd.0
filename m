Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE46C05027
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FW6e22elbCGG7d/FsT1IsC+ZianCm44bnsPklQgTaE=; b=HbQ7QesU+VXVrO
	rhI8SNrQ+AWf0zCXqhmXBUoc3bx2tx3LcNvfY8eFrlB50dXEgWSuCvx/2G8Dac9bPwMwIA1qjXKe+
	tplBbP10d1HibKw8TOepbV/9kruK6frOA+zhxLBMOtU3k0y3388iM4fEL0CVSIRPC7FhhEaZU4fNO
	dX0IjORc61zYNhwJoW1VxOkmJPBlREWlxOBzfULzk4YYydBXcuH+1WI/kGDm7u1/lv2F4olT8Y+D6
	TYcI0HJTbCIAsu1L4pbfq1lwEpraYGUe0CcG4EHHzfLwNrCFRPV6dx/gk+YuJM/NyH5IxLsJu2440
	POIh067BWChhej82JG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJwb6-00HL61-Hb; Mon, 23 Jan 2023 13:10:52 +0000
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJway-00HL1b-Fy
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 13:10:51 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 731DB2B568;
	Mon, 23 Jan 2023 13:10:17 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 23 Jan
 2023 14:10:10 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-109S0035e8cf7e5-490b-4306-97b9-26c7bcdb01f8,
                    A67B952EB2D8D9A0A9F9E7F867E869D975DF4B5D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d1743abc-3d9f-cdf4-dfbe-67aac4b1b8cd@kaod.org>
Date: Mon, 23 Jan 2023 14:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<jic23@kernel.org>, <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
	<sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
	<kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
	<sbranden@broadcom.com>, <eajames@linux.ibm.com>, <olteanv@gmail.com>,
	<han.xu@nxp.com>, <john.garry@huawei.com>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <narmstrong@baylibre.com>, <khilman@baylibre.com>,
	<matthias.bgg@gmail.com>, <haibo.chen@nxp.com>, <linus.walleij@linaro.org>,
	<daniel@zonque.org>, <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
	<agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
	<krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<skomatineni@nvidia.com>, <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, <j.neuschaefer@gmx.net>, <vireshk@kernel.org>,
	<rmfrfs@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
	<gregkh@linuxfoundation.org>
CC: <git@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<radu_nicolae.pirea@upb.ro>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<yogeshgaur.83@gmail.com>, <konrad.dybcio@somainline.org>,
	<alim.akhtar@samsung.com>, <ldewangan@nvidia.com>, <michal.simek@amd.com>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-wpan@vger.kernel.org>, <libertas-dev@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<lars@metafoo.de>, <Michael.Hennerich@analog.com>,
	<linux-iio@vger.kernel.org>, <michael@walle.cc>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <greybus-dev@lists.linaro.org>,
	<linux-staging@lists.linux.dev>, <amitrkcian2002@gmail.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d8c081e3-7749-496f-b92b-664d73f13c17
X-Ovh-Tracer-Id: 9743537793859029808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddukedgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhkohhnrhgrugdrugihsggtihhosehsohhmrghinhhlihhnvgdrohhrghdphihoghgvshhhghgruhhrrdekfeesghhmrghilhdrtghomhdpsggvnhhjrghmihhnfhgrihhrsehgohhoghhlvgdrtghomhdphihuvghnnhesghhoohhglhgvrdgtohhmpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpthgrlhhirdhpvghrrhihudesghhmrghilhdrtghomhdpthhmrghimhhonhejjeesghhmrghilhdrtg
 homhdprghvihhfihhshhhmrghnjedtsehgmhgrihhlrdgtohhmpdhmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtghomhdplhhinhhugidqihhmgiesnhigphdrtghomhdpfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdgrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdgstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdgtlhgruhguihhurdgsvgiinhgvrgesmhhitghrohgthhhiphdrtghomhdprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgrughupghnihgtohhlrggvrdhpihhrvggrsehuphgsrdhrohdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdpghhithesrghmugdrtghomhdpghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhluggvfigrnhhgrghnsehnvhhiughirgdrtghomhdpmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhlihhnuhigqdgrshhpvggvuge
 slhhishhtshdrohiilhgrsghsrdhorhhgpdhgrhgvhigsuhhsqdguvghvsehlihhsthhsrdhlihhnrghrohdrohhrghdpughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhmihgthhgrvghlseifrghllhgvrdgttgdplhhinhhugidqihhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpofhitghhrggvlhdrjfgvnhhnvghrihgthhesrghnrghlohhgrdgtohhmpdhlrghrshesmhgvthgrfhhoohdruggvpdhlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhisggvrhhtrghsqdguvghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdifphgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdplhhinhhugidqshgrmhhsuhhn
 ghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrghmlhhoghhitgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrhhpihdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdgvlhguvghrsehkvghrnhgvlhdrohhrghdplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidruggvvhdpjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhvihhrvghshhhksehkvghrnhgvlhdrohhrghdphhgrohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdgurghnihgvlhesiihonhhquhgvrdhorhhgpdhlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdphhgrihgsohdrtghhvghnsehngihprdgtohhmpdhmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdpshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhjohhhnhdrghgrr
 hhrhieshhhurgifvghirdgtohhmpdhhrghnrdiguhesnhigphdrtghomhdpohhlthgvrghnvhesghhmrghilhdrtghomhdpvggrjhgrmhgvsheslhhinhhugidrihgsmhdrtghomhdprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpdhssghrrghnuggvnhessghrohgruggtohhmrdgtohhmpdhfrdhfrghinhgvlhhlihesghhmrghilhdrtghomhdpkhgurghsuhdrkhguvghvsehgmhgrihhlrdgtohhmpdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpshgrnhhjuhdrmhgvhhhtrgesrghmugdrtghomhdpphhrrghthihushhhsehkvghrnhgvlhdrohhrghdpthhuughorhdrrghmsggrrhhushesmhhitghrohgthhhiphdrtghomhdpjhhitgdvfeeskhgvrhhnvghlrdhorhhgpdhvihhgnhgvshhhrhesthhirdgtohhmpdhrihgthhgrrhgusehnohgurdgrthdpmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrjhhuihessghrohgruggtohhmrdgtohhmpdgrghhrohhssheskhgvrhhnvghlrdhorhhgpdgsjhhorhhnrdgrnhguvghrshhsohhnsehlihhnrghrohdrohhrghdphhgvihhkohesshhnthgvtghhrdguvgdpjhdrnhgvuhhstghhrggvfhgvrhesghhmgidrnhgvthdptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhskh
 homhgrthhinhgvnhhisehnvhhiughirgdrtghomhdpjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdpkhhvrghloheskhgvrhhnvghlrdhorhhgpdhsthgvfhgrnhesuggrthgvnhhfrhgvihhhrghfvghnrdhorhhgpdgrlhgvgidrrghrihhnghesghhmrghilhdrtghomhdpphgrsggvnhhisehrvgguhhgrthdrtghomhdpkhhusggrsehkvghrnhgvlhdrohhrghdpvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdpuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdplhdrshhtvghlmhgrtghhsehsrghmshhunhhgrdgtohhmpdhmihhnghhosehrvgguhhgrthdrtghomhdprhhoshhtvgguthesghhoohgumhhishdrohhrghdpjhgrshifihhnuggvrhdrshhinhhghheslhhinhgrrhhordhorhhgpdhmrghsrghhihhsrgdrkhhojhhimhgrsehlihhnrghrohdrohhrghdpshgrmhhuvghlsehshhholhhlrghnugdrohhrghdpjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdifvghnshestghsihgvrdhorhhgpdgrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdpmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprghnughisegvthgviihirghnrdhorhhgpdhkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhhmfhhrfhhssehgmhgrihhlrdgtohhmpdg
 rmhhithhrkhgtihgrnhdvtddtvdesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_051044_887689_F24E9FDC 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8xOS8yMyAxOTo1MywgQW1pdCBLdW1hciBNYWhhcGF0cmEgd3JvdGU6Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVk
LXNtYy5jCj4gaW5kZXggODczZmYyY2Y3MmM5Li5iN2E5ZWM1NTBiYTEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1hc3Bl
ZWQtc21jLmMKPiBAQCAtMjk2LDcgKzI5Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVk
X3NwaV9kYXRhIGFzdDI0MDBfc3BpX2RhdGE7Cj4gICBzdGF0aWMgaW50IGRvX2FzcGVlZF9zcGlf
ZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3Ap
Cj4gICB7Cj4gICAJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRf
ZGV2ZGF0YShtZW0tPnNwaS0+bWFzdGVyKTsKPiAtCXN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNo
aXAgPSAmYXNwaS0+Y2hpcHNbbWVtLT5zcGktPmNoaXBfc2VsZWN0XTsKPiArCXN0cnVjdCBhc3Bl
ZWRfc3BpX2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hpcHNbc3BpX2dldF9jaGlwc2VsZWN0KG1lbS0+
c3BpLCAwKV07Cj4gICAJdTMyIGFkZHJfbW9kZSwgYWRkcl9tb2RlX2JhY2t1cDsKPiAgIAl1MzIg
Y3RsX3ZhbDsKPiAgIAlpbnQgcmV0ID0gMDsKPiBAQCAtMzc3LDcgKzM3Nyw4IEBAIHN0YXRpYyBj
b25zdCBjaGFyICphc3BlZWRfc3BpX2dldF9uYW1lKHN0cnVjdCBzcGlfbWVtICptZW0pCj4gICAJ
c3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShtZW0t
PnNwaS0+bWFzdGVyKTsKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBhc3BpLT5kZXY7Cj4gICAK
PiAtCXJldHVybiBkZXZtX2thc3ByaW50ZihkZXYsIEdGUF9LRVJORUwsICIlcy4lZCIsIGRldl9u
YW1lKGRldiksIG1lbS0+c3BpLT5jaGlwX3NlbGVjdCk7Cj4gKwlyZXR1cm4gZGV2bV9rYXNwcmlu
dGYoZGV2LCBHRlBfS0VSTkVMLCAiJXMuJWQiLCBkZXZfbmFtZShkZXYpLAo+ICsJCQkgICAgICBz
cGlfZ2V0X2NoaXBzZWxlY3QobWVtLT5zcGksIDApKTsKPiAgIH0KPiAgIAo+ICAgc3RydWN0IGFz
cGVlZF9zcGlfd2luZG93IHsKPiBAQCAtNTUzLDcgKzU1NCw3IEBAIHN0YXRpYyBpbnQgYXNwZWVk
X3NwaV9kb19jYWxpYnJhdGlvbihzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwKTsKPiAgIHN0
YXRpYyBpbnQgYXNwZWVkX3NwaV9kaXJtYXBfY3JlYXRlKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9k
ZXNjICpkZXNjKQo+ICAgewo+ICAgCXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gc3BpX2NvbnRy
b2xsZXJfZ2V0X2RldmRhdGEoZGVzYy0+bWVtLT5zcGktPm1hc3Rlcik7Cj4gLQlzdHJ1Y3QgYXNw
ZWVkX3NwaV9jaGlwICpjaGlwID0gJmFzcGktPmNoaXBzW2Rlc2MtPm1lbS0+c3BpLT5jaGlwX3Nl
bGVjdF07Cj4gKwlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwID0gJmFzcGktPmNoaXBzW3Nw
aV9nZXRfY2hpcHNlbGVjdChkZXNjLT5tZW0tPnNwaSwgMCldOwo+ICAgCXN0cnVjdCBzcGlfbWVt
X29wICpvcCA9ICZkZXNjLT5pbmZvLm9wX3RtcGw7Cj4gICAJdTMyIGN0bF92YWw7Cj4gICAJaW50
IHJldCA9IDA7Cj4gQEAgLTYyMCw3ICs2MjEsNyBAQCBzdGF0aWMgc3NpemVfdCBhc3BlZWRfc3Bp
X2Rpcm1hcF9yZWFkKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjLAo+ICAgCQkJCSAg
ICAgIHU2NCBvZmZzZXQsIHNpemVfdCBsZW4sIHZvaWQgKmJ1ZikKPiAgIHsKPiAgIAlzdHJ1Y3Qg
YXNwZWVkX3NwaSAqYXNwaSA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGRlc2MtPm1lbS0+
c3BpLT5tYXN0ZXIpOwo+IC0Jc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCA9ICZhc3BpLT5j
aGlwc1tkZXNjLT5tZW0tPnNwaS0+Y2hpcF9zZWxlY3RdOwo+ICsJc3RydWN0IGFzcGVlZF9zcGlf
Y2hpcCAqY2hpcCA9ICZhc3BpLT5jaGlwc1tzcGlfZ2V0X2NoaXBzZWxlY3QoZGVzYy0+bWVtLT5z
cGksIDApXTsKPiAgIAo+ICAgCS8qIFN3aXRjaCB0byBVU0VSIGNvbW1hbmQgbW9kZSBpZiBtYXBw
aW5nIHdpbmRvdyBpcyB0b28gc21hbGwgKi8KPiAgIAlpZiAoY2hpcC0+YWhiX3dpbmRvd19zaXpl
IDwgb2Zmc2V0ICsgbGVuKSB7Cj4gQEAgLTY3MCw3ICs2NzEsNyBAQCBzdGF0aWMgaW50IGFzcGVl
ZF9zcGlfc2V0dXAoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYXNw
ZWVkX3NwaSAqYXNwaSA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKHNwaS0+bWFzdGVyKTsK
PiAgIAljb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhICpkYXRhID0gYXNwaS0+ZGF0YTsKPiAt
CXVuc2lnbmVkIGludCBjcyA9IHNwaS0+Y2hpcF9zZWxlY3Q7Cj4gKwl1bnNpZ25lZCBpbnQgY3Mg
PSBzcGlfZ2V0X2NoaXBzZWxlY3Qoc3BpLCAwKTsKPiAgIAlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlw
ICpjaGlwID0gJmFzcGktPmNoaXBzW2NzXTsKPiAgIAo+ICAgCWNoaXAtPmFzcGkgPSBhc3BpOwo+
IEBAIC02OTcsNyArNjk4LDcgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX3NldHVwKHN0cnVjdCBz
cGlfZGV2aWNlICpzcGkpCj4gICBzdGF0aWMgdm9pZCBhc3BlZWRfc3BpX2NsZWFudXAoc3RydWN0
IHNwaV9kZXZpY2UgKnNwaSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IHNw
aV9jb250cm9sbGVyX2dldF9kZXZkYXRhKHNwaS0+bWFzdGVyKTsKPiAtCXVuc2lnbmVkIGludCBj
cyA9IHNwaS0+Y2hpcF9zZWxlY3Q7Cj4gKwl1bnNpZ25lZCBpbnQgY3MgPSBzcGlfZ2V0X2NoaXBz
ZWxlY3Qoc3BpLCAwKTsKPiAgIAo+ICAgCWFzcGVlZF9zcGlfY2hpcF9lbmFibGUoYXNwaSwgY3Ms
IGZhbHNlKTsKPiAgIAoKRm9yIHRoZSBBc3BlZWQgZHJpdmVyLAoKUmV2aWV3ZWQtYnk6IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpUaGFua3MsCgpDLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
