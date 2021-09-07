Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C61C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 21:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0737761100
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 21:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0737761100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ufPQ2wbDe7zLFG587uJ0OL4upsBwLTiWeepNUlsBXZs=; b=pFZjmekCEPv+14
	863nSBpO83rvTVScHkWFey9GkTSNAaQiP4XMDPsOpdXXRFhb/YJNRq6xV0W5vblumIEjHt7tQwsNa
	w9penUh74AzGy3cMJJ+ihZgLO0IYixAC1lZwKvy0ItZeeV4GCuVz+oITWT6Faij36ZIc7XPsJq+xU
	y+mpNUrzJmaNK4XF995jDDZHb8YjACdycIkLR5T73T5yztv3uc3chzZNuUIJL5nLIf+2GVlz/aIfs
	jhQUffTF8eXSbTv7Yiwz0/kN55ay6/lqYbrauYFfJo8CXvzMsxRnv7lWozvtpRrCM55kVDqsHfizh
	zKOFb9UhZ2jjMhOCKyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNiq6-004oBc-Df; Tue, 07 Sep 2021 21:41:10 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNiq0-004o9s-SX
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 21:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631050853;
 bh=O4Xjaa3CVehRBqgEALO8jVADPCCOyw7S8wTQUWfE5Mo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CB1k1CSPKcABaRX4aJePVf79KJSZ0Z3ZqgXv+jIoqMAnfHdNT5vZWyinwdt02LoIr
 6P8m0KvwlDZ//xkTeL4Gt9hP9SanOEezciDabWOGYEdgza0Dn5I2wEJui3jsJbZhSc
 NnSSnT5MRqyww1Ea4VIo7rA1RlPCnY3iKhVKmHto=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MdNcG-1mwmbU25pY-00ZS0s; Tue, 07 Sep 2021 23:40:53 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id 4E122899915; Tue,  7 Sep 2021 14:40:37 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Stefan Schaeckeler <schaecsn@gmx.net>
Subject: [PATCH 0/1] ubifs: ubifs to export filesystem error counters
Date: Tue,  7 Sep 2021 14:40:33 -0700
Message-Id: <20210907214034.11676-1-schaecsn@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:lnmes0eC3agU7xRNb2bPqHt1WNyrwciGY3duVu4Eo43/B8mRyzr
 QY+QKzlPOuu4n/e6ipRfGgRlui9kgyAwKFoViCD+OGpiP1y+aWZYHd2iwR1Ijy6trAAPSGj
 0mr6E02DarpwYbvzc672Hfl49mXRPIY5v+ng4BUh5GZYDth69v7dfTu8fOLoJx+Jj9lVkvW
 2MBGAu/QM/5YpEQCHdVDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oq0yCJm1D9g=:ALKhSM+fRSDy+YumBfZXTc
 D5lLxpRlgDhkhChpA0u+M1ZHiSqCWr7Bio74OilQaMH5lrmeVyiJXRL+ASpI81k0/xEDXS2Hw
 DgGCX3t4ZHD0urRRY7ntMw42fQ1mLgQPD5tN60n3ZmB8UMj0/1lLGqP8kzMoQurf4ut/UR7fT
 xm8GTV3a7/rKjteGAgCagbY+8XPE7urVuF/8tFLQOj3pRTXhoxtfoYMJLYog1YQEbJ+hVNXfh
 wVg+/KW6Y/+vgVf/r5/v3xIb1NI5ISgtnvXA/Pmql8fr+9cB9yaWPQezGvczbb0meN4EwaNc+
 F4RqwPCWCLHiMAwhcc8AYnkSWuMchWVLLPLZoHruMCAc7lAn9dXjhnD0/yptCnvyM9YT7Cn4m
 jBCQbDW+xYga8yRlzns4jlkIf/77klF7gaJDtjh9YkxusRcaqaEmo09Wi09544HPd9vZbN398
 bITHQKttWGczyGemGyug1gCuz7NjxrwrAS4yfKz0C+G0tXlyZE6va+3DRPza2jMA/Y1g4Y4pI
 ALVJkBeRDPSw9KTKsW5B6I1kTWWYK0WeIP820fOQx2txWhcwKgrGJuMdnLuF20GhtqpQxDsCq
 2+pkqQeBJgWj/sxuYT6Wn7zyw9j6g543UCb1WFbLUUAB0ZYQaJb8Gx9srZOIebFhhTRX19TpJ
 dicUitr3z5PeMChJGMHMwI3g+BLPoK86KE3WvLgbubo1u3fpiNnat06VM67IT976dq8WBvD+q
 GtYdWWDutg93ybAdGmFMUuKsVsbcWP1rIat1xBw7nmnj74xiMOU9QouRDfN+maBx3CVmNO5Qp
 gVSf7mYHtMhEYhCRwjzBSaUQv3YvuZk6cCecmRbOxiq/jcdPHvFZ8IsbIACDfd3BdPSxQBKlB
 FJMkUkZnKgtukJcZlEek3KO+TQr0plkacgfOpPjcCyuMcW0eT/LWjcMQWy6JF29lCuB+oZssv
 sJmkpx/ystceKYiY5Bfn0UpJA/Lc9/lkhf14FtKN7y6RhlLPZk8RAgqa0HKlKhEgtriKnHkzM
 QNXROneOdD82ulu88XvN3LQ8kmsLbaJLbCcnigigG0xHuTYzZCJUtvNyRJL2QA+dZi2XDV1RG
 Erk3Eq0WqYQACQZpxnRwJR2CCAHxTOC2xrTpfd1OIuUeu0GXWAydTI1DA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_144105_267587_3057061C 
X-CRM114-Status: GOOD (  13.63  )
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

Not all ubifs filesystem errors are propagated to userspace, here is one
that is not propagaged to ls:

[node0_RP0_CPU0:~]$ls -la /mnt/mtd0
[562009.111309] UBIFS error (ubi0:0 pid 21670): ubifs_check_node [ubifs]: bad CRC: calculated 0x1b205ba3, read 0xb6eff0d9
[562009.123231] UBIFS error (ubi0:0 pid 21670): ubifs_check_node [ubifs]: bad node at LEB 112:29768
[562009.133042] magic          0x6101831
[562009.137312] crc            0xb6eff0d9
[562009.141678] node_type      2 (direntry node)
[562009.146706] group_type     1 (in node group)
[562009.151734] sqnum          334966
[562009.155709] len            82
[562009.159304] key            (1, direntry, 0xe933a79)
[562009.164999] inum           546
[562009.168687] type           0
[562009.172186] nlen           25
[562009.175779] name           inventor\xffffffff\xffffffff\xffffffff\xffffffffcal_log_4.txt
[562009.185308] CPU: 1 PID: 21670 Comm: ls Tainted: G           O    4.8.28-WR9.0.0.20_cgl #1
[562009.185309] Hardware name: Insyde Harrisonville/Type2 - Board Product Name1, BIOS 00.01.017 10/26/2018
[562009.185312]  0000000000000286 00000000f877ad2e ffffbb5b8e357c50 ffffffff9b3cfaab
[562009.185316]  00000000ffffff8b 0000000000007448 ffffbb5b8e357c90 ffffffffc022c0dd
[562009.185320]  00000000687aa008 0000000000007448 0000000000000070 0000000000000052
[562009.185324] Call Trace:
[562009.185332]  [<ffffffff9b3cfaab>] dump_stack+0x63/0x88
[562009.185345]  [<ffffffffc022c0dd>] ubifs_check_node+0xbd/0x270 [ubifs]
[562009.185357]  [<ffffffffc022db25>] ubifs_read_node+0x285/0x300 [ubifs]
[562009.185370]  [<ffffffffc024dfc7>] ubifs_tnc_read_node+0x127/0x1c0 [ubifs]
[562009.185382]  [<ffffffffc0230115>] ? matches_name+0x45/0xf0 [ubifs]
[562009.185394]  [<ffffffffc022ed9a>] tnc_read_node_nm+0xfa/0x220 [ubifs]
[562009.185407]  [<ffffffffc02330a4>] ubifs_tnc_next_ent+0x1f4/0x2a0 [ubifs]
[562009.185411]  [<ffffffff9b1f405e>] ? filldir+0xce/0x150
[562009.185422]  [<ffffffffc02244f8>] ubifs_readdir+0x188/0x4d0 [ubifs]
[562009.185425]  [<ffffffff9b1f3e62>] iterate_dir+0x172/0x190
[562009.185429]  [<ffffffff9b124e4a>] ? __audit_syscall_entry+0xba/0x100
[562009.185432]  [<ffffffff9b1f4399>] SyS_getdents+0x99/0x120
[562009.185434]  [<ffffffff9b1f3f90>] ? fillonedir+0x110/0x110
[562009.185437]  [<ffffffff9b002b76>] do_syscall_64+0x66/0x180
[562009.185441]  [<ffffffff9b8b9fce>] entry_SYSCALL_64_after_swapgs+0x58/0xc6
[562009.185454] UBIFS error (ubi0:0 pid 21670): ubifs_read_node [ubifs]: expected node type 2
[562009.194705] UBIFS error (ubi0:0 pid 21670): ubifs_readdir [ubifs]: cannot find next direntry, error -117
total 1080
drwxr-xr-x. 2 root root   3728 Jul  3 10:36 .
drwxrwxrwt. 5 root root    120 Jul  3 10:36 ..
-rw-rw-rw-. 1 root root   5413 May 24 10:59 alarm_0_PM1_remote_log_1.txt
-rw-rw-rw-. 1 root root      1 Sep 19  2020 alarm_banner.txt
-rw-rw-rw-. 1 root root  65465 Nov  5  2020 alarm_local_log_29.txt
-rw-rw-rw-. 1 root root  55441 Dec 18  2020 alarm_local_log_30.txt
-rw-rw-rw-. 1 root root  64826 Sep 20  2020 alarm_local_log_31.txt
-rw-rw-rw-. 1 root root  65019 Oct 25  2020 alarm_local_log_32.txt
-rw-rw-rw-. 1 root root  65880 Oct 26  2020 alarm_local_log_33.txt
-rw-rw-rw-. 1 root root  66296 Apr 17 10:35 alarm_local_log_34.txt
-rw-rw-rw-. 1 root test  64734 May  5 20:35 alarm_local_log_35.txt
-rw-rw-rw-. 1 root root  64924 Jun  4 07:39 alarm_local_log_36.txt
-rw-rw-rw-. 1 root root  50830 Jul  8 13:21 alarm_local_log_37.txt
-rw-rw-rw-. 1 root root      1 Sep 21  2020 fpd_banner.txt
-rw-rw-rw-. 1 root root  28518 Jul  2 23:19 fpd_local_log_2.txt
-rw-rw-rw-. 1 root root     96 Jul  9 22:37 int_uptime_dashboard.dat
-rw-rw-rw-. 1 root iosxr   540 Jun  8 00:06 inventory_local_log_1.txt
-rw-rw-rw-. 1 root iosxr   540 Jul  2 23:26 inventory_local_log_2.txt
-rw-rw-rw-. 1 root root  79293 Jul  3 10:37 inventory_local_log_3.txt
-rw-rw-rw-. 1 root test      4 Apr 17 10:33 obfl_data_version.dat
-rw-rw-rw-. 1 root root    364 Sep 19  2020 temperature_banner.txt
-rw-rw-rw-. 1 root root  19567 Dec 18  2020 temperature_local_log_3.txt
-rw-rw-rw-. 1 root root  65607 Sep 20  2020 temperature_local_log_4.txt
-rw-rw-rw-. 1 root root  66410 Apr 17 10:34 temperature_local_log_5.txt
-rw-rw-rw-. 1 root test  65607 Jun  1 21:26 temperature_local_log_6.txt
-rw-rw-rw-. 1 root root  54097 Jul  3 10:37 temperature_local_log_7.txt
-rw-rw-rw-. 1 root root  65160 Jun 25 23:56 voltage_local_log_10.txt
-rw-rw-rw-. 1 root root  28236 Jul  3 10:37 voltage_local_log_11.txt
[node0_RP0_CPU0:~]$echo $?
0

A direntry node got corrupted. The filename inventory_local_log_4.txt got
corrupted to inventor\xffffffff\xffffffff\xffffffff\xffffffffcal_log_4.txt
and is not passed down to ls. ls exits with a clean exit code of 0.

We can't really detect this corruption from user space. This is required to
take action such as for a fresh start with re-creating the filesystem.

Every access to the mounted filesystem results in a kernel backtrace. This
trashes the dmesg buffer and the systemd journal over time.


This patch introduces a sysfs filesystem for ubifs. The first three sysfs
nodes are error counters:

 /sys/fs/ubifs/ubiX_Y/errors_magic
 /sys/fs/ubifs/ubiX_Y/errors_node
 /sys/fs/ubifs/ubiX_Y/errors_crc

This allows userspace to notice filesystem corruption. Over time, more
sysfs nodes can be added.

Stefan Schaeckeler (1):
  ubifs: ubifs to export filesystem error counters

 fs/ubifs/Makefile |   2 +-
 fs/ubifs/io.c     |   6 ++
 fs/ubifs/super.c  |  17 ++++-
 fs/ubifs/sysfs.c  | 187 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/sysfs.h  |  39 ++++++++++
 fs/ubifs/ubifs.h  |  11 +++
 6 files changed, 260 insertions(+), 2 deletions(-)
 create mode 100644 fs/ubifs/sysfs.c
 create mode 100644 fs/ubifs/sysfs.h

--
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
