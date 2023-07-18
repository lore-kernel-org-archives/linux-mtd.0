Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECD5EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtWlyyaitUiDpRjL90Kz+eGo0LJzP8WJu4LgJOKI61o=; b=k/mtwekHb9bTjS5I+3LgyWBImk
	q1ogzzP9P5ytdpnOew+FBWNdv/23AlC9S0E5oKhEEcbxT1G4hC0jHZisLvS+Byeu2GKMuAynaGTv2
	fU4S8OvxjJZgLkv3+KeB1zc0XscTBq1E/HQkGe6qUuXJxNkGzFy3uWSNCP1fFluoL7787G5Skd2Ks
	eA8eRV646VzrjVx7PeD4HBQAkzoGFCyQaVU2JQQj/QTdhU+GZqfDSl+IwXtbO5njNIQjZXqwziNVk
	HpRy/lFzYMAtuldlSm/poctvAzaaieRbeFg59wL1LQMGkS+iEQnr+UQ+PwO485VyvyuQf1kC+W7Kg
	HOkAMbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzv8-005NJ7-07;
	Wed, 19 Jul 2023 05:40:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzv5-005NHP-03
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wwFV/HSClZfL0mPQDWrZCZVgvJdfgHFUvV8Erj6RGss=; b=kckWEqQFbqe/5xTFy/GDfEjUPt
	XXPOMvjhBkkyXxZBhta2/rvLIJReD2IoAt5JTHIoswu/K4qhvQ7p+Zs9SrG3GFI+VIc504YfLmMwj
	0DukrEHiS9rsntrVyr4sv/yg8fhHF4XAfL4efjXjdGNbm7k0JEmPRKwZkqk8n/SBR9uT1C9LE1fH9
	bzj2vKBtmvUS4xZdZkNBVOiLGLnI+RdxYgvKzr4N1Ljsk2Ri7G+rGNpJfkV+Ppn596E36suPk8IAA
	zsL78C4qi8k9N58IGijbwJFU0liEn/QiDe3ACrZY/J5vXCMEdr+J6wOGMa6dPuDFdyKO1HeculbFS
	cuBCKWOg==;
Received: from 8.mo576.mail-out.ovh.net ([46.105.56.233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgso-00BM0y-28
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 09:20:41 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.1.121])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 28E9924F2D
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 09:19:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mn4ct (unknown [10.109.138.229])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9177E1FEB2;
	Tue, 18 Jul 2023 09:19:49 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net ([176.31.235.81])
	by ghost-submission-6684bf9d7b-mn4ct with ESMTPSA
	id gQ79HjVZtmSJDgAAInjvQA
	(envelope-from <rafal@milecki.pl>); Tue, 18 Jul 2023 09:19:49 +0000
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 11:19:49 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, linux-mtd@lists.infradead.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>,
 Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Richard
 Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, NXP Linux Team
 <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>, Orson Zhai
 <orsonzhai@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Walle <michael@walle.cc>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V4] nvmem: add explicit config option to
 read old syntax fixed OF cells
In-Reply-To: <e5a8524c-8961-9ff0-db30-3b648345319e@pengutronix.de>
References: <20230403225540.1931-1-zajec5@gmail.com>
 <e5a8524c-8961-9ff0-db30-3b648345319e@pengutronix.de>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d51234ebc05d2b9fe44625299c103caa@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 6429732894367460296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthejjhdttdervdenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgfeuleeuteetfeeuhefhhffgtedvgeejfeelffeuvdfhueffvdehgeeuveeuhfelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudejiedrfedurddvfeehrdekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_102038_787813_80BD11C7 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Ahmad,

On 2023-07-18 11:08, Ahmad Fatoum wrote:
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 60670b2f70b9..334adbae3690 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -522,6 +522,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>  	config.dev = &mtd->dev;
>>  	config.name = dev_name(&mtd->dev);
>>  	config.owner = THIS_MODULE;
>> +	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, 
>> "nvmem-cells");
> 
> How does the new binding look like in this situation?
> 
> Before it was:
> 
> &{flash/partitions} {
> 	compatible = "fixed-partitions";
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 
> 	partition@0 {
> 		compatible = "nvmem-cells";
> 		reg = <0 0x100>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		calib@1 {
> 			reg = <1 1>;
> 		};
> 	}
> };
> 
> It it now the same, but s/"nvmem-cells"/"fixed-layout"/ ?

Please take a look at those commits and examples:

bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bd912c991d2ef079a32558f057b8663bcf1fb6fc

fa7fbe53ecdc ("dt-bindings: nvmem: convert base example to use NVMEM 
fixed cells layout")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa7fbe53ecdc4e7d549a9f73a40e257b0046b4b9


Basically you need a "nvmem-layout" node with:
compatible = "fixed-layout";

So in your case that would be:

&{flash/partitions} {
	compatible = "fixed-partitions";

	partition@0 {
		reg = <0 0x100>;

		nvmem-layout {
			compatible = "fixed-layout";
			#address-cells = <1>;
			#size-cells = <1>;

			calib@1 {
				reg = <1 1>;
			};
		};
	}
};

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
