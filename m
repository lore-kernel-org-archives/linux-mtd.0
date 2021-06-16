Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E81C48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:24:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41FC861246
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41FC861246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhAFZFLIbV4LhhPbl3wcYnQgYT6d12f1EVTJz5hnP4s=; b=YRoxe1KOi5Qxuu
	OKKZi4Zi67pmgIUu2ozCMZ0LMb2P38KnwyZiAktU23wHsXC0AgekZjSJC3DE8iRn9+XyTENkA0seP
	NQMGr7kx9bx13Z5er6DunOeWt4TSTgY65TIZS+mdH6sVSb3D+JyEeuVM4+F/kOSa29QH6FTys0rNT
	q93JMj1LyEP98mekaUqEKB1DBuwduKURGwo3kx5XKw43zfvOXftrmsKQwxSmYiXk2CZi+oiGfALoL
	X98xhQ0oa+8BiS8P9pzLat3lwQrwA/Abjw3yIuCVFdB9mrtlcr45OO1PP2W9pAmP4Y252f0M+oBY8
	OC58KGQQy1nzn9AkvAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQpw-005MjN-O3; Wed, 16 Jun 2021 08:23:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQpt-005MiP-9W
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 08:23:46 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ltQpd-0005HI-Ti; Wed, 16 Jun 2021 10:23:29 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ltQpb-0003rt-Rs; Wed, 16 Jun 2021 10:23:27 +0200
Date: Wed, 16 Jun 2021 10:23:27 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, yangds.fnst@cn.fujitsu.com, yi.zhang@huawei.com,
 houtao1@huawei.com, yukuai3@huawei.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ubifs: Fix races between xattr_{set|get} and
 listxattr operations
Message-ID: <20210616082327.GP9782@pengutronix.de>
References: <20210531125210.1173922-1-chengzhihao1@huawei.com>
 <20210531125210.1173922-2-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531125210.1173922-2-chengzhihao1@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:19:16 up 118 days, 11:43, 116 users,  load average: 0.04, 0.11,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_012345_384896_2B43CF08 
X-CRM114-Status: GOOD (  20.62  )
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

Hi,

On Mon, May 31, 2021 at 08:52:09PM +0800, Zhihao Cheng wrote:
> UBIFS may occur some problems with concurrent xattr_{set|get} and
> listxattr operations, such as assertion failure, memory corruption,
> stale xattr value[1].
> 
> Fix it by importing a new rw-lock in @ubifs_inode to serilize write
> operations on xattr, concurrent read operations are still effective,
> just like ext4.
> 
> [1] https://lore.kernel.org/linux-mtd/20200630130438.141649-1-houtao1@huawei.com

I had a closer look at it and reviewed that you carefully release the
lock where you claimed it. I can't tell if adding this lock is the right
approach, but for what it's worth you can add my

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -356,6 +356,7 @@ struct ubifs_gced_idx_leb {
>   * @ui_mutex: serializes inode write-back with the rest of VFS operations,
>   *            serializes "clean <-> dirty" state changes, serializes bulk-read,
>   *            protects @dirty, @bulk_read, @ui_size, and @xattr_size
> + * @xattr_sem: serilizes write operations (remove|set|create) on xattr

s/serilizes/serializes/

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
