Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C37AECAAD2
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Aug 2022 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7sxg3jOZXHLJMSvf0mSfzSDEfe2zmcExQJw0VabocY=; b=0zTc20Eu/ynSCk
	+hAvmZIhRsvcqayn+sH1M0xT/i2rhI10X/25WA7Rbmerbm+CNNoexxuYFo3o/3/0zBrovwK3zjIMW
	yISgkLr4cKYK+MY3uHn6gOGVSC9GYIxr9HtkAwi3lL8fMSzG8FAf0cpJ4wRnMsDzeeNeMCZsA0hhh
	03TWiaYjJhi10G4i9fX/WJUGpwqjydMJzfOukU0q3CIjMmFjEuAOK7mUw5IjuJnHIt3g0fKPP2483
	9OF2pO7ijDe3SwnX3WeVz8uMuM4JbLTYf0Z3LT0jRYBL0IVlSGK5eKNofBgS4/NTjyB20Oa7GJVB0
	HtCGs4L70KcI8fIHCUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSIly-00HHOD-Gp; Sun, 28 Aug 2022 13:56:22 +0000
Received: from 11.mo550.mail-out.ovh.net ([188.165.48.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSIll-00HHFt-Cg
	for linux-mtd@lists.infradead.org; Sun, 28 Aug 2022 13:56:11 +0000
Received: from player157.ha.ovh.net (unknown [10.108.4.200])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 3CD8122ED8
	for <linux-mtd@lists.infradead.org>; Sun, 28 Aug 2022 13:55:55 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
	(Authenticated sender: rafal@milecki.pl)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 1047C2DF32520;
	Sun, 28 Aug 2022 13:55:32 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003f23c38e5-03f4-4967-903a-0a692511f0a2,
                    E8B3FA25B4F8D98D1FC0498694F8FFDB0E70245B) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <ca7d8fe6-023f-1e2d-da34-c23d0cdc3b03@milecki.pl>
Date: Sun, 28 Aug 2022 15:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [RFC PATCH v1 13/14] nvmem: layouts: u-boot-env: add device node
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
 <20220825214423.903672-14-michael@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20220825214423.903672-14-michael@walle.cc>
X-Ovh-Tracer-Id: 8352488460933508027
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejledgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpefftedtteffieevudduueelkeeukefhhfelvdevleffhfeiueelffegtddvudejvdenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehhedt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_065609_975108_4B472845 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
> Register the device node so we can actually make use of the cells from
> within the device tree.
> 
> This obviously only works if the environment variable name can be mapped
> to the device node, which isn't always the case. Think of "_" vs "-".
> But for simple things like ethaddr, this will work.

We probably shouldn't support undocumented syntax (bindings).

I've identical local patch that waits for
[PATCH] dt-bindings: nvmem: u-boot,env: add basic NVMEM cells
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220703084843.21922-1-zajec5@gmail.com/
to be accepted.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
