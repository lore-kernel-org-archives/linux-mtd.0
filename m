Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E83C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B3D20879
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glvDweLy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bofh-nu.20150623.gappssmtp.com header.i=@bofh-nu.20150623.gappssmtp.com header.b="ivQv7Did"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49B3D20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bofh.nu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ODAoDrBlWnx4DBf5LehRcmqX5ZocHeEMYKyk097Mgfc=; b=glvDweLySSjDQPDoD5PEyDuA54
	Q35lqE7Bsh1GjI4AQ2MgXZkcGzuU749geS9W4XAVC2rXfe86uiR5PWCG7B/Keuc46/xocNRIF/YCu
	V6+wP5AThGl9cJA0D2wq1W6PraMcXUni32PBxax/6W1O7uCMgy6HMXp+H8hvF9Y9DKme1s9XLSyUa
	BDaCA+l2flkUjQjk7CHrEd1fxpid2vMyGWsFLg/mSyAmTay+3y6hyQZo+6gA9kpakOnLB2eAX0/+E
	psu2Ol0URqgWijNbeFuhI9ZESpdQ8YqpzHMA09wrx1F/KJWoCqgI99pBbMI3FGG/kGqh1O44CnxKk
	Oi5Umrwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mjx-0007BM-8O; Mon, 25 Mar 2019 10:22:01 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Mjs-0007AX-Jd
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2019 10:21:59 +0000
Received: by mail-ot1-x344.google.com with SMTP id t8so2215966otp.7
 for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2019 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=PUOeVj/JeuKAXZkHmEsqJQBp/hgVKNZIqe/nowUnPSs=;
 b=ivQv7DidbztT+qhpZX/682LaShA38A/Aup+TxoN78vA830cDBk0v+D2hK83Epz6/Zx
 pjOG3k+y6ET7mqXvT9GYWZMS7Pp6X46WUknaKRro8JViJj2sBr0tsZC/XrmFPnGSkvTc
 GCme5QKaVcq1LvVfHdj8YbMlESz+H/SF+lvezvLxCETAe1yZvC9Tjh92l3i/c3YJTMYH
 oPDKIM1lubcRzUH+wWKH1+lPOrjyy4ECERxyS4mMkz7u5WUsr5axGCjGMvnlKPtVdY69
 cFyYaheSSjlQarGhVOtikvp/Itjw6ys8FeXX0tWRELKE9pEWzJ8oxzeNLvuiJ8SzvdZX
 TSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=PUOeVj/JeuKAXZkHmEsqJQBp/hgVKNZIqe/nowUnPSs=;
 b=hHb3j8PCp1ad4DBwdriTC9MaxcQ+ptUtFW8RV8HV8UGCA6Ya7Dihx5r/iSvcAW0rHA
 2tXI8a6OZBVViVFg2M99OhsZhBSgJsH7eukbPOzFHQotdv0+NBWd719J271hoaOnXcrN
 x5Qjn05laPuI97VGHQc0axScK8iQxlqF5wlj4XVJ72jNhLrnra51jArj6OccbO33drLf
 SPmZcvDwaPc5yEBEnvQbNNXgOwVkWCX/PunvHQv5ns07G1dmqdXFtACb4iTnyHiax/j2
 PeshHhhpvdozDjTTXtm4Ev3jPEpMqvmtro35j81Yv5FR84A4RNdC0NEH8ORIaJc/KigK
 Zowg==
X-Gm-Message-State: APjAAAVaq7oVBx8ESxVT8TkfC17B7119CdgJQ59JeITk+2Blh5o0b2Xj
 ugJQiYGMcnnWiVX6D1v5cMXCiNmq/D2O4TU3YmdnH+4eXQQ=
X-Google-Smtp-Source: APXvYqxybpm42cC4A+K6r8H78ML1vrjut0No20kjqZojqPsqgscATctsf9NZSQwhXKLrzeyc/Rhh8br9zQ7Js+cgwWU=
X-Received: by 2002:a05:6830:144e:: with SMTP id
 w14mr17956745otp.170.1553509312845; 
 Mon, 25 Mar 2019 03:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
In-Reply-To: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
From: Lars Persson <lists@bofh.nu>
Date: Mon, 25 Mar 2019 11:21:42 +0100
Message-ID: <CADnJP=vdeXvBcrY+AS8ASSMpfN0WkGAZgM+VPh8ZXeHN95_Gmg@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_032156_695098_6F609733 
X-CRM114-Status: GOOD (  14.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 21, 2019 at 11:02 AM Lars Persson <lists@bofh.nu> wrote:
>
> Hi
>
> We have recently encountered multiple cases of corrupted UBIFS volumes that
> were triggered by a power-cut during startup. It may be a regression in the
> 4.14 stable branch.
>
> The symptom is seen when accessing a file in the corrupted FS:
>   UBIFS error (ubi0:20 pid 513): ubifs_iget: failed to read inode 348, error -2
>   UBIFS error (ubi0:20 pid 513): ubifs_lookup: dead directory entry
> 'tampering.conf', error -2
>   UBIFS warning (ubi0:20 pid 513): ubifs_ro_mode.part.0: switched to
> read-only mode, error -2
>   [<80506a51>] (dump_stack) from [<80297e2f>] (ubifs_lookup+0x29b/0x300)
>   [<80297e2f>] (ubifs_lookup) from [<80226169>] (lookup_slow+0x69/0xe4)
>
> We enabled chk_fs and reproduced it:
>   UBIFS error (ubi0:20 pid 120): read_add_inode: inode 352 not found in index
>   UBIFS error (ubi0:20 pid 120): check_leaf: error -2 while processing
> entry node and trying to find inode node 352
>   UBIFS (ubi0:20): dump of node at LEB 29:94656
>         magic          0x6101831
>         crc            0xda5d6bee
>         node_type      2 (direntry node)
>         group_type     1 (in node group)
>         sqnum          4079
>         len            70
>         key            (66, direntry, 0x4974b0f)
>         inum           352
>         type           0
>         nlen           13
>         name           emotiond.conf
>   UBIFS error (ubi0:20 pid 120): dbg_walk_index: leaf checking
> function returned error -2, for leaf at LEB 29:94656
>   UBIFS (ubi0:20): dump of znode at LEB 37:57680
>   znode be0bf000, LEB 37:57680 len 128 parent be0af800 iip 1 level 0
> child_cnt 5 flags 0
>   zbranches:
>         0: LNC   (null) LEB 32:53248 len 81 key (66, direntry, 0x363e97f)
>         1: LNC   (null) LEB 29:94208 len 63 key (66, direntry, 0x3f88c71)
>         2: LNC   (null) LEB 12:92160 len 74 key (66, direntry, 0x477308e)
>         3: LNC   (null) LEB 29:94656 len 70 key (66, direntry, 0x4974b0f)
>         4: LNC be084600 LEB 814:49152 len 63 key (66, direntry, 0x49bb6f7)
>   UBIFS error (ubi0:20 pid 120): dbg_check_filesystem: file-system
> check failed with error -2
>
> The setup of our system is:
> An overlayfs stack for /etc with:
> - The lower file-system is a read-only squashfs on ubi
> - The upper file-system is an ubifs
>
> The ubi partition resides on an SLC NAND from Toshiba (TH58NVG2S3HBAI4).
>
> The missing inode is always triggered on those two particular files
> emotiond.conf and tampering.conf that share the same write pattern at startup:
>
>  cp file file.tmp
>  echo some data > file.tmp
>  mv file.tmp file
>  fsync file
>
> Do not ask me about the logic of this script :> It overwrites the result of cp
> and does not implement a proper atomic move.. Anyway the end result must not be
> a file-system that is corrupt and mounts as RO.
>

Further debug information with dbg_rcvry, dbg_mnt, dbg_jnl and
dbg_jnlk prints enabled.
Let me know if additional information is needed.

The recovery code is dropping the inode, claiming it is orphaned.


UBIFS DBG rcvry (pid 103): checking index head at 37:92160
UBIFS DBG rcvry (pid 103): checking LPT head at 7:18432
UBIFS DBG mnt (pid 103): start replaying the journal
UBIFS DBG mnt (pid 103): replay log LEB 3:0
UBIFS DBG mnt (pid 103): commit start sqnum 7367
UBIFS DBG mnt (pid 103): add replay bud LEB 831:110592, head 1
UBIFS DBG mnt (pid 103): add replay bud LEB 823:49152, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 828:124928, head 1
UBIFS DBG mnt (pid 103): add replay bud LEB 822:0, head 1
UBIFS DBG mnt (pid 103): add replay bud LEB 821:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 820:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 819:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 818:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 817:0, head 1
UBIFS DBG mnt (pid 103): add replay bud LEB 816:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 815:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 814:0, head 1
UBIFS DBG mnt (pid 103): add replay bud LEB 813:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 812:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 811:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 810:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 809:0, head 2
UBIFS DBG mnt (pid 103): add replay bud LEB 808:0, head 1
UBIFS DBG mnt (pid 103): replay log LEB 4:0
UBIFS DBG mnt (pid 103): replay bud LEB 831, head 1, offs 110592, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 831 replied: dirty 12608, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 823, head 2, offs 49152, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 823 replied: dirty 20376, free 2048
UBIFS DBG mnt (pid 103): replay bud LEB 828, head 1, offs 124928, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 828 replied: dirty 1488, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 822, head 1, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 822 replied: dirty 93248, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 821, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 821 replied: dirty 608, free 2048
UBIFS DBG mnt (pid 103): replay bud LEB 820, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 820 replied: dirty 608, free 2048
UBIFS DBG mnt (pid 103): replay bud LEB 819, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 819 replied: dirty 10736, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 818, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 818 replied: dirty 27608, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 817, head 1, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 817 replied: dirty 90896, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 816, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 816 replied: dirty 20456, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 815, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 815 replied: dirty 8352, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 814, head 1, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 814 replied: dirty 87888, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 813, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 813 replied: dirty 1864, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 812, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 812 replied: dirty 632, free 2048
UBIFS DBG mnt (pid 103): replay bud LEB 811, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 811 replied: dirty 800, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 810, head 2, offs 0, is_last 0
UBIFS DBG mnt (pid 103): bud LEB 810 replied: dirty 24776, free 0
UBIFS DBG mnt (pid 103): replay bud LEB 809, head 2, offs 0, is_last 1
UBIFS DBG rcvry (pid 103): 809:0, jhead 2, grouped 1
UBIFS DBG rcvry (pid 103): found corruption (-1) at 809:26624
UBIFS DBG rcvry (pid 103): cleaning corruption at 809:26624
UBIFS DBG rcvry (pid 103): fixing LEB 809 start 0 endpt 26624
UBIFS DBG mnt (pid 103): bud LEB 809 replied: dirty 9592, free 100352
UBIFS DBG mnt (pid 103): replay bud LEB 808, head 1, offs 0, is_last 1
UBIFS DBG rcvry (pid 103): 808:0, jhead 1, grouped 1
UBIFS DBG rcvry (pid 103): found corruption (-1) at 808:53248
UBIFS DBG rcvry (pid 103): cleaning corruption at 808:53248
UBIFS DBG rcvry (pid 103): fixing LEB 808 start 0 endpt 53248
UBIFS DBG mnt (pid 103): bud LEB 808 replied: dirty 19608, free 73728
UBIFS DBG mnt (pid 103): bud LEB 822 was GC'd (126976 free, 30920 dirty)
UBIFS DBG mnt (pid 103): LEB 822 lp: 126976 free 30920 dirty replay: 0
free 93248 dirty
UBIFS DBG mnt (pid 103): bud LEB 818 was GC'd (126976 free, 336 dirty)
UBIFS DBG mnt (pid 103): LEB 818 lp: 126976 free 336 dirty replay: 0
free 27608 dirty
UBIFS DBG mnt (pid 103): bud LEB 817 was GC'd (126976 free, 30344 dirty)
UBIFS DBG mnt (pid 103): LEB 817 lp: 126976 free 30344 dirty replay: 0
free 90896 dirty
UBIFS DBG mnt (pid 103): bud LEB 815 was GC'd (126976 free, 760 dirty)
UBIFS DBG mnt (pid 103): LEB 815 lp: 126976 free 760 dirty replay: 0
free 8352 dirty
UBIFS DBG mnt (pid 103): bud LEB 814 was GC'd (126976 free, 31152 dirty)
UBIFS DBG mnt (pid 103): LEB 814 lp: 126976 free 31152 dirty replay: 0
free 87888 dirty
UBIFS DBG mnt (pid 103): bud LEB 811 was GC'd (126976 free, 400 dirty)
UBIFS DBG mnt (pid 103): LEB 811 lp: 126976 free 400 dirty replay: 0
free 800 dirty
UBIFS DBG mnt (pid 103): bud LEB 810 was GC'd (126976 free, 4336 dirty)
UBIFS DBG mnt (pid 103): LEB 810 lp: 126976 free 4336 dirty replay: 0
free 24776 dirty
UBIFS DBG mnt (pid 103): bud LEB 808 was GC'd (126976 free, 5000 dirty)
UBIFS DBG mnt (pid 103): LEB 808 lp: 126976 free 5000 dirty replay:
73728 free 19608 dirty
UBIFS DBG mnt (pid 103): finished, log head LEB 3:34816, max_sqnum
9265, highest_inum 721
UBIFS DBG rcvry (pid 103): LEB 9
UBIFS DBG rcvry (pid 103): deleting orphaned inode 218
UBIFS DBG mnt (pid 103): ino 218, new 0, tot 1
UBIFS DBG rcvry (pid 103): last orph node for commit 15 at 9:0
UBIFS DBG rcvry (pid 103): deleting orphaned inode 237
UBIFS DBG mnt (pid 103): ino 237, new 0, tot 2
UBIFS DBG rcvry (pid 103): last orph node for commit 17 at 9:2048
UBIFS DBG rcvry (pid 103): deleting orphaned inode 247
UBIFS DBG mnt (pid 103): ino 247, new 0, tot 3
UBIFS DBG rcvry (pid 103): last orph node for commit 19 at 9:4096
UBIFS DBG rcvry (pid 103): deleting orphaned inode 250
UBIFS DBG mnt (pid 103): ino 250, new 0, tot 4
UBIFS DBG rcvry (pid 103): last orph node for commit 21 at 9:6144
UBIFS DBG rcvry (pid 103): deleting orphaned inode 253
UBIFS DBG mnt (pid 103): ino 253, new 0, tot 5
UBIFS DBG rcvry (pid 103): last orph node for commit 23 at 9:8192
UBIFS DBG rcvry (pid 103): deleting orphaned inode 256
UBIFS DBG mnt (pid 103): ino 256, new 0, tot 6
UBIFS DBG rcvry (pid 103): last orph node for commit 25 at 9:10240
UBIFS DBG rcvry (pid 103): deleting orphaned inode 259
UBIFS DBG mnt (pid 103): ino 259, new 0, tot 7
UBIFS DBG rcvry (pid 103): last orph node for commit 27 at 9:12288
UBIFS DBG rcvry (pid 103): deleting orphaned inode 262
UBIFS DBG mnt (pid 103): ino 262, new 0, tot 8
UBIFS DBG rcvry (pid 103): last orph node for commit 29 at 9:14336
UBIFS DBG rcvry (pid 103): deleting orphaned inode 265
UBIFS DBG mnt (pid 103): ino 265, new 0, tot 9
UBIFS DBG rcvry (pid 103): last orph node for commit 31 at 9:16384
UBIFS DBG rcvry (pid 103): deleting orphaned inode 268
UBIFS DBG mnt (pid 103): ino 268, new 0, tot 10
UBIFS DBG rcvry (pid 103): last orph node for commit 33 at 9:18432
UBIFS DBG rcvry (pid 103): deleting orphaned inode 272
UBIFS DBG mnt (pid 103): ino 272, new 0, tot 11
UBIFS DBG rcvry (pid 103): last orph node for commit 35 at 9:20480
UBIFS DBG rcvry (pid 103): deleting orphaned inode 275
UBIFS DBG mnt (pid 103): ino 275, new 0, tot 12
UBIFS DBG rcvry (pid 103): last orph node for commit 37 at 9:22528
UBIFS DBG rcvry (pid 103): deleting orphaned inode 278
UBIFS DBG mnt (pid 103): ino 278, new 0, tot 13
UBIFS DBG rcvry (pid 103): last orph node for commit 39 at 9:24576
UBIFS DBG rcvry (pid 103): deleting orphaned inode 281
UBIFS DBG mnt (pid 103): ino 281, new 0, tot 14
UBIFS DBG rcvry (pid 103): last orph node for commit 41 at 9:26624
UBIFS DBG rcvry (pid 103): deleting orphaned inode 284
UBIFS DBG mnt (pid 103): ino 284, new 0, tot 15
UBIFS DBG rcvry (pid 103): last orph node for commit 43 at 9:28672
UBIFS DBG rcvry (pid 103): deleting orphaned inode 287
UBIFS DBG mnt (pid 103): ino 287, new 0, tot 16
UBIFS DBG rcvry (pid 103): last orph node for commit 45 at 9:30720
UBIFS DBG rcvry (pid 103): deleting orphaned inode 290
UBIFS DBG mnt (pid 103): ino 290, new 0, tot 17
UBIFS DBG rcvry (pid 103): last orph node for commit 47 at 9:32768
UBIFS DBG rcvry (pid 103): deleting orphaned inode 293
UBIFS DBG mnt (pid 103): ino 293, new 0, tot 18
UBIFS DBG rcvry (pid 103): last orph node for commit 49 at 9:34816
UBIFS DBG rcvry (pid 103): deleting orphaned inode 296
UBIFS DBG mnt (pid 103): ino 296, new 0, tot 19
UBIFS DBG rcvry (pid 103): last orph node for commit 51 at 9:36864
UBIFS DBG rcvry (pid 103): deleting orphaned inode 299
UBIFS DBG mnt (pid 103): ino 299, new 0, tot 20
UBIFS DBG rcvry (pid 103): last orph node for commit 53 at 9:38912
UBIFS DBG rcvry (pid 103): deleting orphaned inode 302
UBIFS DBG mnt (pid 103): ino 302, new 0, tot 21
UBIFS DBG rcvry (pid 103): last orph node for commit 55 at 9:40960
UBIFS DBG rcvry (pid 103): deleting orphaned inode 305
UBIFS DBG mnt (pid 103): ino 305, new 0, tot 22
UBIFS DBG rcvry (pid 103): last orph node for commit 57 at 9:43008
UBIFS DBG rcvry (pid 103): deleting orphaned inode 308
UBIFS DBG mnt (pid 103): ino 308, new 0, tot 23
UBIFS DBG rcvry (pid 103): last orph node for commit 59 at 9:45056
UBIFS DBG rcvry (pid 103): deleting orphaned inode 311
UBIFS DBG mnt (pid 103): ino 311, new 0, tot 24
UBIFS DBG rcvry (pid 103): last orph node for commit 61 at 9:47104
UBIFS DBG rcvry (pid 103): deleting orphaned inode 314
UBIFS DBG mnt (pid 103): ino 314, new 0, tot 25
UBIFS DBG rcvry (pid 103): last orph node for commit 63 at 9:49152
UBIFS DBG rcvry (pid 103): deleting orphaned inode 317
UBIFS DBG mnt (pid 103): ino 317, new 0, tot 26
UBIFS DBG rcvry (pid 103): last orph node for commit 65 at 9:51200
UBIFS DBG rcvry (pid 103): deleting orphaned inode 320
UBIFS DBG mnt (pid 103): ino 320, new 0, tot 27
UBIFS DBG rcvry (pid 103): last orph node for commit 68 at 9:53248
UBIFS DBG rcvry (pid 103): deleting orphaned inode 349
UBIFS DBG mnt (pid 103): ino 349, new 0, tot 28
UBIFS DBG rcvry (pid 103): last orph node for commit 72 at 9:55296
UBIFS DBG rcvry (pid 103): deleting orphaned inode 466
UBIFS DBG mnt (pid 103): ino 466, new 0, tot 29
UBIFS DBG rcvry (pid 103): last orph node for commit 127 at 9:57344
UBIFS DBG rcvry (pid 103): LEB 10
UBIFS DBG rcvry (pid 103): GC head LEB -1, offs -1
UBIFS DBG rcvry (pid 103): found empty LEB 807, run commit
UBIFS error (ubi0:20 pid 103): read_add_inode: inode 349 not found in index
UBIFS error (ubi0:20 pid 103): check_leaf: error -2 while processing
entry node and trying to find inode node 349
 magic          0x6101831
 crc            0xba9856a7
 node_type      2 (direntry node)
 group_type     1 (in node group)
 sqnum          4115
 len            70
 key            (66, direntry, 0x4974b0f)
 inum           349
 type           0
 nlen           13
 name           emotiond.conf
UBIFS error (ubi0:20 pid 103): dbg_walk_index: leaf checking function
returned error -2, for leaf at LEB 29:90112
znode be091400, LEB 37:92496 len 128 parent be089600 iip 1 level 0
child_cnt 5 flags 0
zbranches:
 0: LNC   (null) LEB 32:24576 len 81 key (66, direntry, 0x363e97f)
 1: LNC   (null) LEB 29:100352 len 63 key (66, direntry, 0x3f88c71)
 2: LNC   (null) LEB 12:94208 len 74 key (66, direntry, 0x477308e)
 3: LNC   (null) LEB 29:90112 len 70 key (66, direntry, 0x4974b0f)
 4: LNC be0590c0 LEB 814:73728 len 63 key (66, direntry, 0x49bb6f7)
UBIFS error (ubi0:20 pid 103): dbg_check_filesystem: file-system check
failed with error -2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
