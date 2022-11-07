Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5CC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uP/U6x6Xcym1b2BWcW02mb42N07SZmUkv4pceMGioWA=; b=kPq92BYV8C+7dP
	J/Oiyek4LLfJSxnRXs58VhuZStNt9zHmUSFwmVXw6EpJEmaefBGEUKyLp6n4iolXJvk4kQAa/SB17
	jMV9R3MJnuq92WAyrOmGIiDpIO2srTWJ36TRypkBCOXyJUNFUbhkTsgHotKYIOUBl8pzU1QykA0cG
	nP8hrIw+oMzFUbSeG5jT2b0pWzQPHVgm40aShWNwixXXeGUXQ/0ILdqmYFF1OspXwSVx5a90I5evA
	0gwUzGUkHfVU8Cj+wS1YT/LG6DTu298vIpbqqvyZttZR+xJ47FZJr1aVxO0sw6AM3ldWV7lNzy6nU
	66aXRWZG9UBvOSxG6ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os53w-00GDbY-LT; Mon, 07 Nov 2022 16:33:28 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4tA-00G8nE-TC
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:22:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 42B0340009;
	Mon,  7 Nov 2022 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZC1M6Tpkteg8GFZvteC51TWLngeC/mjVF6ztxGaGi0=;
	b=F98D/3wOFTABh7LiaxJxcN1x22ElYHu0ihar7jSVrEeHfznydYED8KMIxRib+wzbRhkYJC
	oQ+iXDOOxKUepUunmdfo0PYkrkL5BK9Vh0ytpBxVHjlo4Gk/lM2RwA8BFlpuNJUz9kbtK8
	ZXc3IrHtKmE/vvDB7qEJqERWg6yWpi1GHYfYJFfYfsTUBXZb1Odj1rQwLSFchD5Z/Hu2Gd
	i9DtfTyInnMJcKSV3BedIqzbJYA+VSPFEa6X9gswhmI81dj+nxFn1N2AKTskdJu17PoWif
	IgTYj83pgS826BVVHzzAxZqDDo0fB6pRtu0EZiIbZlUvm4O29Paqs0XbDr1GRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	dbrownell@users.sourceforge.net
Subject: Re: [PATCH] mtd: Fix device name leak when register device failed in add_mtd_device()
Date: Mon,  7 Nov 2022 17:22:16 +0100
Message-Id: <20221107162216.49173-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022121352.2534682-1-zhangxiaoxu5@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'895d68a39481a75c680aa421546931fb11942fa6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082221_163868_D919C7BF 
X-CRM114-Status: UNSURE (   6.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2022-10-22 at 12:13:52 UTC, Zhang Xiaoxu wrote:
> There is a kmemleak when register device failed:
>   unreferenced object 0xffff888101aab550 (size 8):
>     comm "insmod", pid 3922, jiffies 4295277753 (age 925.408s)
>     hex dump (first 8 bytes):
>       6d 74 64 30 00 88 ff ff                          mtd0....
>     backtrace:
>       [<00000000bde26724>] __kmalloc_node_track_caller+0x4e/0x150
>       [<000000003c32b416>] kvasprintf+0xb0/0x130
>       [<000000001f7a8f15>] kobject_set_name_vargs+0x2f/0xb0
>       [<000000006e781163>] dev_set_name+0xab/0xe0
>       [<00000000e30d0c78>] add_mtd_device+0x4bb/0x700
>       [<00000000f3d34de7>] mtd_device_parse_register+0x2ac/0x3f0
>       [<00000000c0d88488>] 0xffffffffa0238457
>       [<00000000b40d0922>] 0xffffffffa02a008f
>       [<0000000023d17b9d>] do_one_initcall+0x87/0x2a0
>       [<00000000770f6ca6>] do_init_module+0xdf/0x320
>       [<000000007b6768fe>] load_module+0x2f98/0x3330
>       [<00000000346bed5a>] __do_sys_finit_module+0x113/0x1b0
>       [<00000000674c2290>] do_syscall_64+0x35/0x80
>       [<000000004c6a8d97>] entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> If register device failed, should call put_device() to give up the
> reference.
> 
> Fixes: 1f24b5a8ecbb ("[MTD] driver model updates")
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
