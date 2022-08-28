Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E4DECAAD2
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Aug 2022 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4t0O6nlxmTnZWjM7pl3f08+EJ5bUZm+1PbgvBgO59s=; b=ORlTOYwpTz6KUm
	Re2sITQvstvWBEqd7476ixPmnPtDoeTI48yKCfM/wRrxGyZomF1bWD5u2jfKojnoQMk/ERQ+rOMIm
	Amgp4bHu9R8qjWIqU+jiKpbIHq+PgRe7dcj2KKO5lyNskyoYe2TqaiBS/3p9Fr5qSdHQhwdXsJiqJ
	/w16QbflT1UUmhpTqaZOQD3lCaekPv5uSfVpORhmKAuH+I2vXzEaTPjslSEchF3RrxoObCiVpHVWc
	+eJVd//rPV4Nr3rt3+c+Fs/lxwWrL7KHhN1+TnUf5mnli/UULv3xhS9yI/amtcjVIAx9kNqYkb3Rk
	zLOE1f0tK2escdGdpH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSIuj-00HLb1-9G; Sun, 28 Aug 2022 14:05:25 +0000
Received: from 7.mo560.mail-out.ovh.net ([188.165.48.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSIua-00HLUi-Hk
	for linux-mtd@lists.infradead.org; Sun, 28 Aug 2022 14:05:21 +0000
Received: from player157.ha.ovh.net (unknown [10.108.16.222])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 7426521B94
	for <linux-mtd@lists.infradead.org>; Sun, 28 Aug 2022 14:05:11 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
	(Authenticated sender: rafal@milecki.pl)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 61D582DF32C4F;
	Sun, 28 Aug 2022 14:04:50 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-101G00488ca032a-118b-4694-88e1-9351a19d5173,
                    E8B3FA25B4F8D98D1FC0498694F8FFDB0E70245B) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <f830543b-9b66-5785-60f8-27ea05d49eee@milecki.pl>
Date: Sun, 28 Aug 2022 16:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [RFC PATCH v1 12/14] nvmem: layouts: rewrite the u-boot-env
 driver as a NVMEM layout
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-13-michael@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20220825214423.903672-13-michael@walle.cc>
X-Ovh-Tracer-Id: 8509270023987571643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejledgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpedtgeetheeutddvudekuddtkeetveehteegleehffetkeehjeetfffgveegkeefueenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheeitd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_070517_434929_B32D1BF9 
X-CRM114-Status: GOOD (  13.76  )
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

On 25.08.2022 23:44, Michael Walle wrote:
> Instead of hardcoding the underlying access method mtd_read() and
> duplicating all the error handling, rewrite the driver as a nvmem
> layout which just uses nvmem_device_read() and thus works with any
> NVMEM device.
> 
> But because this is now not a device anymore, the compatible string
> will have to be changed so the device will still be probed:
>    compatible = "u-boot,env";
> to
>    compatible = "u-boot,env", "nvmem-cells";
> 
> "nvmem-cells" will tell the mtd layer to register a nvmem_device().
> "u-boot,env" will tell the NVMEM that it should apply the u-boot
> environment layout to the NVMEM device.

That's fishy but maybe we can ignore backward compatibility at
point.

Still you need to update DT binding.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
