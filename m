Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BB3C43218
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 14:52:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54F62088F
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 14:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kP8rCVOY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="GFD/090Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B54F62088F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzQGBjpRAl3g1oV5143U0Fq/eOcqyAQCXrpRNholugk=; b=kP8rCVOY0cvFIE
	u70txqdamvZW/NE5VD8bnZOQV3t8LcmvR8regQX83tRWpuvm6O838AnhNHHLmWYLIjG+h61ZXRBYH
	kycwzHPlrkpPAbJh+taZd5SXdwv82vXTsD0MH8Q2MWuJdeHkNIW6FMDefrbyrFc6m5UOgHKAFBR23
	MyMOuEkyPx0/lCGAFxva3ERgh2vojqK0r+Jd5imrejUASR6klONozn07w3ZdPRz9tcrCMADNm8Ez2
	zROtiVg6nfBIsuIaepY+yxmfpZrLS3hxG+tpenzrqQfHsnlAEExHxkjGbIChSRyip2tiHZ/VYM0rE
	vXX5ndOkiR6bfym3t0rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJfjA-0006Yy-2r; Thu, 25 Apr 2019 14:51:56 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJfj3-0006SD-Bb
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 14:51:51 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 25D725C0C14;
 Thu, 25 Apr 2019 16:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1556203905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iQ+ngMfAatSBb2nFtXOpxJkWVSRR7HD6AMLNmkpI6o=;
 b=GFD/090YBS9fyhzy7AJXnIlLRDJBqXppB+4ElLo+td68MUayhqY/g5AGZQQoD8O5PLtcFt
 E/6hvzDTKpJastRVyBGvLqGZL1vGRjZBLXeDnVJEumoiG/AOQFPUNldsDsAhD+HTE7PeW4
 Xbb09iiyxFvd2Di6CrViN7UuL8Okgto=
MIME-Version: 1.0
Date: Thu, 25 Apr 2019 16:51:45 +0200
From: Stefan Agner <stefan@agner.ch>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/3] UBIFS: xattr deletion rework
In-Reply-To: <20190404223438.29408-1-richard@nod.at>
References: <20190404223438.29408-1-richard@nod.at>
Message-ID: <41138279d104898cf1d38b913a4c9bd4@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_075149_859226_8C6EDA3B 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05.04.2019 00:34, Richard Weinberger wrote:
> UBIFS handles xattrs in most cases just like files.
> An inode can have child entries, which are inodes for xattrs.
> If an inode with xattrs is unlinked, only the hosting inode is
> referenced in the journal and the orphan list. Upon recovery
> all xattrs will be looked up from the TNC and also deleted.
> 
> This works in theory, but not in practice. The problem is that
> in many places UBIFS internally assumes that a directory inode
> can only be deleted if the directory is empty. Since xattr
> hosting inodes are treated like directories but you can unlink
> such an inode before all xattrs are gone, this assumption is violated.
> Therefore it can happen that the garbage collector consumes a LEB
> which hosts the information about xattr inodes because the host inode
> itself got unlinked. Upon recovery UBIFS is no longer able to
> locate these inodes and the free space accounting can get confused.
> This can lead to all kind of filesystem corruptions.
> 
> The solution is to log every inode in the journal upon unlink.
> This approach has one downside, we need to lower the amount of allowed
> xattrs per inode.
> With this changes applied UBIFS still supports dozens of xattrs per
> inode.
> 
> Hunting down this issue down was anything but easy.
> I'd like to thank Toradex AG for supporing this bug hunt.
> Special thanks to Stefan Agner for his constant support and testing my
> debug patches over and over.

Thanks Richard for working on that!

I applied the patches on v5.1-rc4 and tested it using our Colibri VF61
(vf610 NAND driver).

I continuously booted and power cut the modules every ~30 seconds on 7
modules 24/7 for the last two weeks (the same test setup where we
previously saw issues, a rootfs with systemd which makes use of
xattrs...). After ~380k cumulative boots and power cuts I haven't seen
any UBI issues! So:

Tested-by: Stefan Agner <stefan@agner.ch>

For reference, this are the type of issues we saw (this was on 4.18):

[    2.271180] ubi0: default fastmap pool size: 50
[    2.285825] ubi0: default fastmap WL pool size: 25
[    2.300231] ubi0: attaching mtd3
[    2.316948] random: fast init done
[    2.391213] ubi0: attached by fastmap
[    2.403786] ubi0: fastmap pool size: 50
[    2.416361] ubi0: fastmap WL pool size: 25
[    2.440920] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    2.455232] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976
bytes
[    2.471059] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size
2048
[    2.486807] ubi0: VID header offset: 2048 (aligned 2048), data
offset: 4096
[    2.502916] ubi0: good PEBs: 1000, bad PEBs: 8, corrupted PEBs: 0
[    2.518260] ubi0: user volume: 1, internal volumes: 1, max. volumes
count: 128
[    2.543867] ubi0: max/mean erase counter: 597/62, WL threshold: 4096,
image sequence number: 1260750483
[    2.572852] ubi0: available PEBs: 0, total reserved PEBs: 1000, PEBs
reserved for bad PEB handling: 12
[    2.602765] ubi0: background thread "ubi_bgt0d" started, PID 66
[    2.621396] rtc-ds1307 0-0068: hctosys: unable to read the hardware
clock
[    2.640776] ALSA device list:
[    2.654551]   No soundcards found.
[    2.672739] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started,
PID 67
[    2.723749] UBIFS (ubi0:0): recovery needed
[    3.045383] UBIFS error (ubi0:0 pid 1): ubifs_get_pnode.part.4: error
-22 reading pnode at 8:43200

--
Stefan

> 
> Richard Weinberger (3):
>   ubifs: journal: Handle xattrs like files
>   ubifs: orphan: Handle xattrs like files
>   ubifs: Limit number of xattrs per inode
> 
>  fs/ubifs/dir.c     |  15 +++-
>  fs/ubifs/journal.c |  72 ++++++++++++++++---
>  fs/ubifs/misc.h    |   8 +++
>  fs/ubifs/orphan.c  | 208 ++++++++++++++++++++++++++++++++++++-----------------
>  fs/ubifs/super.c   |   2 +
>  fs/ubifs/ubifs.h   |   4 ++
>  fs/ubifs/xattr.c   |  71 ++++++++++++++++--
>  7 files changed, 294 insertions(+), 86 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
