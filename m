Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049B4C4321E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJ/sAhWyW1PGG5L/xiblRxKKdIFTuh4B9QT66NTcNbA=; b=rJTlfVO0EAMSp2
	CPvQ2Xk08WAinAt6J5JnANC6HEn9tFU3zkE2OH3/jJvWsucdXd8UIf74XB+R5/Gd4/UmhXkM2OyRV
	ACt2x1ELtgx3Thdw9TgjPXs4t7OkHioIiVjXiBCeprZnGkoUm/xbgkZCbItErvn2EwbFsE/btfA0I
	KmrjePPqovW1DmNAoCLGXQyPE0Eeh5upPnbulE8njI7tXsLLoAhKg2YskujG7b6NEm6B2GZGrJdUk
	ua2RR2OURRBHZrym05Rp60A12h0cLMJiYLYGeEt/9AOhwPz0EclCW/Bb+cfUZbs+F4AgrBQ0YZNAQ
	fqHZDLStRrfNU3sMnToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWg-00875J-FM; Thu, 24 Nov 2022 11:36:18 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWd-00873O-UM
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 11:36:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 97B0C1C000F;
	Thu, 24 Nov 2022 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669289773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn1cRX0hFAv2o/xi7nhIXwgVpgT36zbOpL1Is72gOws=;
	b=IIIAKssjYQbkINF8jVlDT8Yiy0/ieRRtySzwcnGWTHz8xV/d7yWxfDIYlHtTEhckmcv/Ax
	B7CCRPfzcgxpRKpeWBIxvDBK03WZPansxdHWZUG/kLvmRDdE2BRBrePs0lG3STPAXchvUJ
	+juZBxaR4HU1m3POwS3JWseYCLa6208RDsgwKnEH3XDYXLssqrvYcQp1aluvklIaclPwQW
	Y+669zfhiANnq/bUEC+D0reLOU1NNPD85rt1Cfo9q6jv1PHM4a8MfPuw/7asMYi/PBd5Jh
	aihUEImwl/zeO5h7sGzTqL74/6IV+RaKR7lAohNBK0xJEZDL/e+bBJXfmaojaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	zev@bewilderbeest.net,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: core: Fix ERROR of refcount due to del_mtd_device()
Date: Thu, 24 Nov 2022 12:36:11 +0100
Message-Id: <20221124113611.266285-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221119063915.11108-1-shangxiaojing@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'56570bdad5e31c5c538cd6efff5c4510256e1bb4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_033616_149164_40005B80 
X-CRM114-Status: UNSURE (   8.65  )
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

On Sat, 2022-11-19 at 06:39:15 UTC, Shang XiaoJing wrote:
> del_mtd_device() will call of_node_put() to mtd_get_of_node(mtd), which
> is mtd->dev.of_node. However, memset(&mtd->dev, 0) is called before
> of_node_put(). As the result, of_node_put() won't do anything in
> del_mtd_device(), and causes the refcount leak.
> 
> del_mtd_device()
>     memset(&mtd->dev, 0, sizeof(mtd->dev) # clear mtd->dev
>     of_node_put()
>         mtd_get_of_node(mtd) # mtd->dev is cleared, can't locate of_node
>                              # of_node_put(NULL) won't do anything
> 
> Fix the ERROR by caching the pointer of the device_node.
> 
> OF: ERROR: memory leak, expected refcount 1 instead of 2,
> of_node_get()/of_node_put() unbalanced - destroy cset entry: attach
> overlay node /spi/spi-sram@0
> CPU: 3 PID: 275 Comm: python3 Tainted: G N 6.1.0-rc3+ #54
>     0d8a1edddf51f172ff5226989a7565c6313b08e2
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
> Call Trace:
> <TASK>
>     dump_stack_lvl+0x67/0x83
>     kobject_get+0x155/0x160
>     of_node_get+0x1f/0x30
>     of_fwnode_get+0x43/0x70
>     fwnode_handle_get+0x54/0x80
>     fwnode_get_nth_parent+0xc9/0xe0
>     fwnode_full_name_string+0x3f/0xa0
>     device_node_string+0x30f/0x750
>     pointer+0x598/0x7a0
>     vsnprintf+0x62d/0x9b0
>     ...
>     cfs_overlay_release+0x30/0x90
>     config_item_release+0xbe/0x1a0
>     config_item_put+0x5e/0x80
>     configfs_rmdir+0x3bd/0x540
>     vfs_rmdir+0x18c/0x320
>     do_rmdir+0x198/0x330
>     __x64_sys_rmdir+0x2c/0x40
>     do_syscall_64+0x37/0x90
>     entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> Fixes: 00596576a051 ("mtd: core: clear out unregistered devices a bit more")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
