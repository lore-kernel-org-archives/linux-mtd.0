Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B5CC6FD1C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMeujsnUzff77dGcdLc8Chk8Q0tptriacZCCtnEaZEI=; b=lQliGvJXUMPj/M
	j5O5ItBfcc2XsSah3yE9gn4dE5P8alWWIdCYXTgNF4yJ4aJlj1/Jvdzv7pXKGNThaT3fHdkgxURWx
	4nc1KtBHav+HfXWT+qxRwLmPBQ/3cNO5LjURrMNsbBBa2eg7lwom7LU9YajBNUovAYRHfKxx7ULt6
	nuIa+V+ws7NXyeMoqV9+xgVDVfYurhA5acnYoHEKq5YLo9SWSc0nGEPyn7IHupG6cUwCByMe45PMh
	zhEDhn5RVtOEw8uTLovd6XUpuukROAh3AEhQqtiQul+CD93SfLwzI60EFuaBz4bTbyNCOm2K4NttB
	I6nQ5hDnNLPCH5fGj8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfk91-004yNZ-1p;
	Fri, 24 Mar 2023 16:19:59 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfk8v-004yMI-1z
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 16:19:57 +0000
Received: from daria.iliad.local (unknown [IPv6:2a01:e0a:0:2290:ea94:f6ff:fe08:63f8])
	by smtp1-g21.free.fr (Postfix) with ESMTP id BDE84B00563;
	Fri, 24 Mar 2023 17:19:39 +0100 (CET)
From: Nicolas Schichan <nschichan@freebox.fr>
To: chengzhihao1@huawei.com
Cc: george.kennedy@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	s.hauer@pengutronix.de,
	yi.zhang@huawei.com,
	Nicolas Schichan <nschichan@freebox.fr>
Subject: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
Date: Fri, 24 Mar 2023 17:19:24 +0100
Message-Id: <20230324161923.1456371-1-nschichan@freebox.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306013308.3884777-1-chengzhihao1@huawei.com>
References: <20230306013308.3884777-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_091953_810587_62EA92D5 
X-CRM114-Status: UNSURE (   8.57  )
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


> Following process will make ubi attaching failed since commit
> 1b42b1a36fc946 ("ubi: ensure that VID header offset ... size"):
>
> ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB
> modprobe nandsim id_bytes=$ID
> flash_eraseall /dev/mtd0
> modprobe ubi mtd="0,2048"  # set vid_hdr offset as 2048 (one page)
> (dmesg):
>   ubi0 error: ubi_attach_mtd_dev [ubi]: VID header offset 2048 too large.
>   UBI error: cannot attach mtd0
>   UBI error: cannot initialize UBI, error -22
>
> Rework original solution, the key point is making sure
> 'vid_hdr_shift + UBI_VID_HDR_SIZE < ubi->vid_hdr_alsize',
> so we should check vid_hdr_shift rather not vid_hdr_offset.
> Then, ubi still support (sub)page aligined VID header offset.
>
> Fixes: 1b42b1a36fc946 ("ubi: ensure that VID header offset ... size")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  v2->v3: Use printing format '%zu' for UBI_VID_HDR_SIZE.
>  drivers/mtd/ubi/build.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

[...]

Hello,

Having had the problem, and found this patch as a fix, feel free to
add my:

Tested-by: Nicolas Schichan <nschichan@freebox.fr>

-- 
Nicolas Schichan


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
