Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6662C5475B
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m61VR8O8pvQnWPQshN1leNO78pTqi0nI3woTYkrxx+o=; b=HYui3tgf/0ppNg
	o2nvEuvVpK54qnyMUiH9FGRgxvHQlPF/mn6UqgRM74mTxXs1ym1+g+gczx6RPa7IX3UCdufLPMqTh
	qTEisAU8dq9TW4Xra2BPP+eShVNUoDm6/11bAJMqb4IUHTMd0oE1oP2vfZmadpo20WBHXbZwOrdWO
	ES/A5ziK8DMpIYcc47cn0+8gFBrur705898F+rQUD+7y+Vu21e49ZzDLNyHxjZ0m7Xl4lydcHIrS7
	y1Yh7ZXLW1e1QqB2NdpMFKxO5Ib/51LcHx0jcyYF0HnDqs/uoYkg9eTiRKfgyVO8S0YeLaDmbfWqC
	CEEj+p012ml3TPj9MlBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcR8t-0000000F6c0-0qQp;
	Tue, 20 Feb 2024 14:30:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQ4f-0000000ErfZ-0Kr9
	for linux-mtd@bombadil.infradead.org;
	Tue, 20 Feb 2024 13:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ARy7Q4Eliz2JX6LXysl5nmstDWlOnwvyUH57xirN7sY=; b=UDdMZmzALRNuoorm3d5hpXOuIh
	+2WiefkE17UQ6f9/4B8FbUX/6sXtDEL/ajjkKAm3A6Es1keX/en+iUym1zO4ZLOoM2DnW5LZE3tHM
	MvKI9s4gEloBM9vthv4tIdag+J/VZnp/wuRKwFsP4iALEfFii4lp7ZyqAY09Kg/56RnP0feKnlvx1
	pkHzEaWt+crl8IKeIubMes+ZGg4ychob1wdRQNGZgo/W3igCA9N+90TIAT34TVgcp3nsxuBIbAqeJ
	rkc/cTYrbkakJRe/oCQQIYes7OM3eSRNmZLKVLQZ4e9Xu94i72Z0ihYV6vJpjzuFGu8NFEa/+qZqa
	lkY5uYng==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQ4X-00000001j2W-301n
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 13:22:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3ae9d1109so8493915ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1708435323; x=1709040123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARy7Q4Eliz2JX6LXysl5nmstDWlOnwvyUH57xirN7sY=;
        b=YijDkoocbArgyVUu7bA2F80nVgbWiMlk2jT5fWuoIRjn6a1DWx3qUIj0yyzk/nt3sJ
         8jniV1ylg6QdEq38VNRiUKHc/Y182H55fSiEGeBhka6INfkawxDhslfgpRFZBbZElf0R
         O7OYVpRkkNYwxih9fwmgA8F6uoQu2ZoF8knMxsFfTzFRxGW1uNUJNIicw2gWs2yFipQe
         lUzNSFneM1FDd5+bgzwzpMSxMeJRsR6M69udXfI8LVmb0h7gv5nAgUPsbR+I5M4tmuh5
         VW6ZF92VYqmAGG7dOmrk9Tfg4b3XqFPfx4Ub6NDFLfyLpZ+6sfeSZX1SnOQCs/jbipt+
         E8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708435323; x=1709040123;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARy7Q4Eliz2JX6LXysl5nmstDWlOnwvyUH57xirN7sY=;
        b=EXeUxmMsaErcnRYwn60oeB0dhiubm3fveiziNWhT+VFVBl3W/5YxVjnOc8e/K95euC
         6bkF38d3ZlbtaSY/Psi14+UpPAxPCQGIjSq/G3vC+mOFFXz0jeKSvaMweIVZCPW01CUh
         zznTMOw3PAu1fcN3wXue13J0y8wc/TZ5OznZQ8N5UVEraxbRYdGmqnwArT9uTwolKv3v
         WbDLeWse/ckqKJ1vjm/C0xVx3kdRFagobX8w6CGfOmTwjCt07WGYRyWBZPHYkl1keRwG
         CDgPnHzCOGKfPtZI5PNc7PEXEKD/EOc2ZrcezVe+n0GoLyuhaJ69mXyWscliUUTksIxV
         bq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMJEabMjYp9Qfyw91Mz0bRRyEfejMylbTrx4RD5rzqLv503StORj+ynkBIMtB0r8MRckwjRIqxBfIVpOwrqRBFoDT4aGJPhop5Pk5eGw==
X-Gm-Message-State: AOJu0Yys25wpP4nhwoGRWs1qzbJcrwHVPYPYW4k1cN6CW4KTrAz0Rw3a
	UmB9fR6aOgvcp0WkBoWyTvhulosUy9YxZFKVTrsC4zASnihZsMTdF2J5qdXqQsU=
X-Google-Smtp-Source: AGHT+IFDzsxf+QvkIBQ6Yn25tgbgykQJpLVIKvsCINFaIpP2CqGk59RWuZcUGoZYhYkVR41rTlrzkA==
X-Received: by 2002:a17:902:b113:b0:1dc:e32:d0b7 with SMTP id q19-20020a170902b11300b001dc0e32d0b7mr3120302plr.0.1708435323550;
        Tue, 20 Feb 2024 05:22:03 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001db5e807cd2sm6188911plb.82.2024.02.20.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 05:22:02 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
 Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
 Ilya Dryomov <idryomov@gmail.com>, 
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
 Ming Lei <ming.lei@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
 nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
Subject: Re: pass queue_limits to blk_mq_alloc_disk for simple drivers
Message-Id: <170843532172.4095460.11560055671499890721.b4-ty@kernel.dk>
Date: Tue, 20 Feb 2024 06:22:01 -0700
MIME-Version: 1.0
X-Mailer: b4 0.12.5-dev-2aabd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_132212_198849_0704C247 
X-CRM114-Status: GOOD (  11.89  )
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


On Thu, 15 Feb 2024 08:02:43 +0100, Christoph Hellwig wrote:
> this series converts all "simple" blk-mq drivers that don't have complex
> internal layering or other oddities to pass the queue_limits to
> blk_mq_alloc_disk.  None of these drivers updates the limits at runtime.
> 
> Diffstat:
>  arch/um/drivers/ubd_kern.c          |    8 +-
>  drivers/block/aoe/aoeblk.c          |   15 ++---
>  drivers/block/floppy.c              |    6 +-
>  drivers/block/mtip32xx/mtip32xx.c   |   13 ++--
>  drivers/block/nbd.c                 |   13 ++--
>  drivers/block/ps3disk.c             |   17 +++---
>  drivers/block/rbd.c                 |   29 +++++-----
>  drivers/block/rnbd/rnbd-clt.c       |   64 +++++++++--------------
>  drivers/block/sunvdc.c              |   18 +++---
>  drivers/block/ublk_drv.c            |   90 +++++++++++++++------------------
>  drivers/cdrom/gdrom.c               |   14 ++---
>  drivers/memstick/core/ms_block.c    |   14 ++---
>  drivers/memstick/core/mspro_block.c |   15 ++---
>  drivers/mmc/core/queue.c            |   97 +++++++++++++++++++-----------------
>  drivers/mtd/mtd_blkdevs.c           |   12 ++--
>  drivers/mtd/ubi/block.c             |    6 +-
>  drivers/s390/block/scm_blk.c        |   17 +++---
>  17 files changed, 222 insertions(+), 226 deletions(-)
> 
> [...]

Applied, thanks!

[01/17] ubd: pass queue_limits to blk_mq_alloc_disk
        commit: 5d6789ce33a97718564d0b8d2ea34e03d650e624
[02/17] aoe: pass queue_limits to blk_mq_alloc_disk
        commit: 9999200f583107f7e244e50935d480433b7d8a3b
[03/17] floppy: pass queue_limits to blk_mq_alloc_disk
        commit: 48bc8c7ba6fb39a4325b07f3abe8fe5a77361c7e
[04/17] mtip: pass queue_limits to blk_mq_alloc_disk
        commit: 68c3135fb5fbd85c7b2ca851184f30f54433a9d3
[05/17] nbd: pass queue_limits to blk_mq_alloc_disk
        commit: 9a0d4970288de29191fa45bf0ab4d8398bfa3a01
[06/17] ps3disk: pass queue_limits to blk_mq_alloc_disk
        commit: a7f18b74dbe171625afc2751942a92f71a4dd4ba
[07/17] rbd: pass queue_limits to blk_mq_alloc_disk
        commit: 24f30b770c0f450346f1c99120427b2e938cdfd0
[08/17] rnbd-clt: pass queue_limits to blk_mq_alloc_disk
        commit: e6ed9892f10d7195d621ede1cedc41421f1ca607
[09/17] sunvdc: pass queue_limits to blk_mq_alloc_disk
        commit: d0fa9a8b0af71b69cf3dec10feaebe19d55a72cf
[10/17] gdrom: pass queue_limits to blk_mq_alloc_disk
        commit: a339cf2bbfbe6e16ead79276d608912d36065884
[11/17] ms_block: pass queue_limits to blk_mq_alloc_disk
        commit: f93b43ae3feafedc5777099ca1a0e05352b92671
[12/17] mspro_block: pass queue_limits to blk_mq_alloc_disk
        commit: 9f633ecd43046659e3345bc4a4404e1d2ba67463
[13/17] mtd_blkdevs: pass queue_limits to blk_mq_alloc_disk
        commit: 3ec44e52bfce60f6da65165bc86eb382462d173d
[14/17] ubiblock: pass queue_limits to blk_mq_alloc_disk
        commit: 21b700c0812b6aa8f794c36b971772b2b08dab9a
[15/17] scm_blk: pass queue_limits to blk_mq_alloc_disk
        commit: 066be10aef5a7ddd8ad537db7a5145c6d79d4ea2
[16/17] ublk: pass queue_limits to blk_mq_alloc_disk
        commit: 494ea040bcb5f4cc78c37dc53c7915752c24f739
[17/17] mmc: pass queue_limits to blk_mq_alloc_disk
        commit: 616f8766179277324393f7b77e07f14cb3503825

Best regards,
-- 
Jens Axboe




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
