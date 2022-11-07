Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F98C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmPmED3hhK9SiThdymvaA8TsDG3d3iAFV4prOIYacP8=; b=VePaRmaTNHGlEy
	xBSCWFuYL9VhcNjkUT5VDQTP4Km0hqU6AMG50mK4MPLwrLcKRBKZs1fLyj4CI0XrzPFq9/QDq9GYo
	76gmW1AqP/AqKU7nnlwlusG3pTBNIx0ctFo4yP90jiQ3ZcRHcHA9WW/07SSiQbOR/CYxVv2s7qbPC
	7UnpKSyjsqK6/7n67MQ9w85dvY4KHkINdM7cnDavmufg1m+GunVTqZxE2KZC7aeVdwEpeejqixYGY
	d4LZv2HZ+2s5BRfQ3da3iRBWLyjhSrndbNusLyjSG8TwAa8L5z3PjhwYCzan0CurrEvb8wPB9gXCm
	be3/Bil+Jx3+RRNOrgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os52I-00GCke-SJ; Mon, 07 Nov 2022 16:31:47 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4rN-00G7gA-4Q
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:20:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4751724000E;
	Mon,  7 Nov 2022 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHG3jppfkWwhEZkwfJ5uJKnvwYJF8Yjo5Lkkp52i7vM=;
	b=PvV50IEuZ2K7a7T/gXp0TPvTRuGs6BqLuLlHORX3LeIMX1fIg5YjR0A0POzHxK0K6vzYsT
	zyQh7McDl1k+aOByFpYJ29BWzT+jxgo0zDB2BZZku1FrPVfBMLYVKvLk8g1o1TJNCV+ZCQ
	pFEGhbPTJaOkHgXzwodgcVBrntzReMgcmPBMNVabrwXazdUdPv6Z6kuea8GY46jxNBvBge
	pk4yR1Is7KuDFNfUSEYUWYhJiMDO9DcSaW31JvGr9thENOhoAQa/cL9DgO20pQfm3Ae8gY
	RAOlQ3mLcn6hd8fPYuymHFz2tkq3jFRW50ni0w4OGFE+rSyOJjb9hpVxi0BbkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	marek.vasut@gmail.com,
	jim_baxter@mentor.com,
	computersforpeace@gmail.com,
	Sandeep_Jain@mentor.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: core: fix possible resource leak in init_mtd()
Date: Mon,  7 Nov 2022 17:20:20 +0100
Message-Id: <20221107162020.48977-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024065109.2050705-1-cuigaosheng1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1aadf01e5076b9ab6bf294b9622335c651314895'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082029_346067_AF106EB0 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, 2022-10-24 at 06:51:09 UTC, Gaosheng Cui wrote:
> I got the error report while inject fault in init_mtd():
> 
> sysfs: cannot create duplicate filename '/devices/virtual/bdi/mtd-0'
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x67/0x83
>  sysfs_warn_dup+0x60/0x70
>  sysfs_create_dir_ns+0x109/0x120
>  kobject_add_internal+0xce/0x2f0
>  kobject_add+0x98/0x110
>  device_add+0x179/0xc00
>  device_create_groups_vargs+0xf4/0x100
>  device_create+0x7b/0xb0
>  bdi_register_va.part.13+0x58/0x2d0
>  bdi_register+0x9b/0xb0
>  init_mtd+0x62/0x171 [mtd]
>  do_one_initcall+0x6c/0x3c0
>  do_init_module+0x58/0x222
>  load_module+0x268e/0x27d0
>  __do_sys_finit_module+0xd5/0x140
>  do_syscall_64+0x37/0x90
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>  </TASK>
> kobject_add_internal failed for mtd-0 with -EEXIST, don't try to register
> 	things with the same name in the same directory.
> Error registering mtd class or bdi: -17
> 
> If init_mtdchar() fails in init_mtd(), mtd_bdi will not be unregistered,
> as a result, we can't load the mtd module again, to fix this by calling
> bdi_unregister(mtd_bdi) after out_procfs label.
> 
> Fixes: 445caaa20c4d ("mtd: Allocate bdi objects dynamically")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
