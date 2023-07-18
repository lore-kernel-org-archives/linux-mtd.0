Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64114C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVeBUheM3QcI0QRnjj7bp63TUY7TnVMdWRyx6lju7tc=; b=QNRxW3pXGUUzzA0+Zf7vLJd/xy
	++690kRHSswfDeHki/+772axPUNHj8XJneRFPgxERhAECLbS37TIBG4dG3WdF90X8F7d9O0l8sGMw
	FEZCwuqsvSYMlabbZfkuZC+hHu+izp8DM3sg9sgt9fvEgrsy9MZCiSaAJzSURqAP06ZyvF0EjOipy
	6NMfsnyvmeFqRjY4BhLjayWsF0/jc/X1fmFwCIGRZASUS4H5bVuQHMzI0Esqbiv0Xn6Z8K1RtXcwa
	gAzVhwlmWo1eu7BUqEb2upo1G0h7kZHW7gHY+65tL9ZctOLjwok+47f31fTLHCDabfdvdTT0j+V/n
	zxzN6I7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0yr-005u6l-1H;
	Wed, 19 Jul 2023 06:48:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0yp-005u5H-1T
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7nqEl5vVDDtjQs2PqQlI42wDXMcc3lqreflb3AUnXXU=; b=bDv9KbDVSg2E2LcnlwaDrKIOnZ
	z0t0qQ1I2y8kYaG71aI3urxiN73Ijs3/KA+2u4OhwWDUnQSXJNz+9Lih+281Exe6lZVvmw/8jYeYg
	pTjZ6/6eKfij4R7n4oj44wKg7lOr8kxnTEww5p99Ta8y+Z6S2DFT5mq+Wq32JgZYgZkwN7FiotjfF
	vqrpDLAv/BvBJZW3rD9cVPPPqwQGiXvTO3WkixO9D8NWER6LMq35ES6/R7tX63FyZghRic2PbeNsh
	t17+iXMqz/gJkA1SEF3GZdssyuhDXX6zv//s6hp7Kc8T/wNxcWafvgQnG7yPQT4rJBaWBGZlCbqB2
	d2m3ezXw==;
Received: from 4.mo561.mail-out.ovh.net ([178.33.46.10])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLo2X-00Bo3W-1Y
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 16:59:11 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.16.135])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 53DC42456D
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 16:59:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zfdpl (unknown [10.110.115.151])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B81521FDF3;
	Tue, 18 Jul 2023 16:59:01 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net ([176.31.235.81])
	by ghost-submission-6684bf9d7b-zfdpl with ESMTPSA
	id utcTHtXEtmSNUQEAfcRA7w
	(envelope-from <rafal@milecki.pl>); Tue, 18 Jul 2023 16:59:01 +0000
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 18:59:01 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Alban Bedel <albeu@free.fr>, Christian Marangi
 <ansuelsmth@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "nvmem: add new config option"
In-Reply-To: <202307182316.AVNL1wNs-lkp@intel.com>
References: <20230718084804.20139-1-zajec5@gmail.com>
 <202307182316.AVNL1wNs-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d9aea2179b54f83084e22eee137819b7@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 14184087028245310427
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeetheelfefgjedutdeivdduvdethffhhedulefggeeitdejudfhkeetjeekieejgfenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudejiedrfedurddvfeehrdekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_175909_679399_DC9A6BBE 
X-CRM114-Status: UNSURE (   5.65  )
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

On 2023-07-18 18:00, kernel test robot wrote:
>    drivers/mtd/mtdcore.c: In function 'mtd_nvmem_add':
>>> drivers/mtd/mtdcore.c:542:29: warning: unused variable 'node' 
>>> [-Wunused-variable]
>      542 |         struct device_node *node = mtd_get_of_node(mtd);
>          |                             ^~~~

My patch I mentioned:
[PATCH V4] nvmem: add explicit config option to read old syntax fixed OF 
cells

adds following line:
config.add_legacy_fixed_of_cells = of_device_is_compatible(node, 
"nvmem-cells");

So this is a false kernel bot warning (but I understand kernel bot
couldn't understand it needs my other patch).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
