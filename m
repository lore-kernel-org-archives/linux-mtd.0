Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91F3ECE588
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 17:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C43D2084B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 17:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnZbxJcl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcoN15e5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C43D2084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Foykk9bs1je8GB5tDToYqj8GXNguHTxpsGdzBFWjBjs=; b=YnZbxJclkqnfvx+b5/XcNwNDtF
	z0x1t921mKwefwch+1NUFG3BCBadrf9jcorGJ2RDtNfyvdlBKQ1uKar6aQMXvLzFjrRNS71xmWalL
	Gc6jmKjffKl6SO/d5pom9LXCAEYDviZ9W/euQswI+YrO6YyTTVye10TuMiy88pduexXcfpL3TeABF
	PCH5oTc5jxWNBAzR47G+rLlDNKpUo++HhoDPnGByEw8EpfATaC5UyIJp7cWUWiGj/j1D7sVW1sVom
	LE7DBvVRpel4lmWJ99STKBHnNc/fdmvs1K6wJAA9mjKkWd/rNwfIN2ufak5P3Y18R+mbW1tcCNP2U
	adm3ddog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKQBB-0005bC-8x; Tue, 15 Oct 2019 17:00:13 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKQB6-0004r7-2L
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 17:00:11 +0000
Received: by mail-pl1-x643.google.com with SMTP id q15so9861995pll.11
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HFgGqTcLkA0F69/oZHiozs1rjpBCzqWPQd1LbRs11Oo=;
 b=CcoN15e5UKSl77V8Bh/jsutX6LirygHrKB4S8safR9INbN3xKozOzZnbzwTuuPMlk4
 KgcVJtyhSW7Bi5WIayIDJjyukg1Brp3cJ0oP1n5z8Fd9uhueb37UEPd+IMWBQgR9U2lY
 mQHq4Mvnt/UPKNfF93GS+lS8puHG6VjL1QCQIjBAeO+VAYC6GEBV0sMo5Ri1Ve16OaE8
 UUrKTqgGtQMC23b4SodOeFGxQKeC7KkPURGFimwOmr8TmRIKlmBu/9gifO4NwgF1LaHg
 CxY4Rv7n8skpDWaO7kRmUSrYrVfUh0hJDagYizsoqmeFpWNrJUGT6hK9i/+hXuRnFQ47
 SmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HFgGqTcLkA0F69/oZHiozs1rjpBCzqWPQd1LbRs11Oo=;
 b=i0GInphGjf8lCXX+3W8BwQ4RGqL750OMdMrPXdga27wdwWC7v6PAXUnew9XKZw/sdj
 pzfreLxXEA5yQOBl3Wfwn48MfwqefT+FUIV37t26j3XHQu+RFQn4PwTyErwR6oWismCa
 QkyKim2+EYN/jt0xOU4qTCqLtkxQbbpzIyxqk39zWOkglR9Ew4l5vHUs0IkrTi/oy/2x
 iZWrZTVLMFoE9QAYSYfy4aIDEXo+txz/b8k8PXDCHOATTGiQxtlyXB29UariTRcir20D
 4VLG9SwqA9QQOLyWP3CsYbaSNr+3mF2bUxuhq8VZnFpUwIobU5tAc67+Er1T/lbc2naI
 txBw==
X-Gm-Message-State: APjAAAUDBVLgFyK1DXWFvxzInMYTl0eVZybByTB+Aw+Pp2knnyAEPzOh
 Crp1HVF1mLAOqqRceKYrKVdCN+X6i4JFDpMM1HBxHtqM4N4=
X-Google-Smtp-Source: APXvYqwCnt5JtVgxlC4Zo6JeMndAqbmiroBH1w4JZD2DYzl6Ru0AhYUQPFZ4G3E50+UoAgjbMi5yPmsDvr+pZqMXLQE=
X-Received: by 2002:a17:902:6b05:: with SMTP id
 o5mr36008469plk.33.1571158806364; 
 Tue, 15 Oct 2019 10:00:06 -0700 (PDT)
MIME-Version: 1.0
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Tue, 15 Oct 2019 18:59:54 +0200
Message-ID: <CAO1O6seC1UFVrDM1FxP09uPrQhAUxp3pU=YUy09Vj98mpcU=Cw@mail.gmail.com>
Subject: mtdswap + ubi results in deadlock
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="0000000000008a34650594f5eaa6"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_100008_159950_284720DF 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--0000000000008a34650594f5eaa6
Content-Type: text/plain; charset="UTF-8"

Hi. I'm trying to use mtdswap together with ubi increase memory.
Normally mtdswap has its own wear leveling but I want ubi to do that
job instead. So I removed all wear leveling and oob usage from mtdswap
(or really it doesn't do wear leveling if the mtd device has no oob)
and am now using it with a gluebi mtd partition on top of ubi. It
works good but in some occasions it deadlocks because ubi internally
uses kmalloc, which in case of low memory, waits for swap to complete.
But swap won't complete until the data is written to flash.

Do you have any idea how to mitigate this issue?

I'm attaching the patched mtdswap.c file. Here is the kernel hung message:

[ 5161.590076] INFO: task kworker/0:0H:4 blocked for more than 61 seconds.
[ 5161.596700]       Tainted: G           O
5.2.0-rc3-00024-g788a024921c4-dirty #175
[ 5161.604615] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[ 5161.612440] kworker/0:0H    D    0     4      2 0x00000000
[ 5161.617938] Workqueue: kblockd blk_mq_run_work_fn
[ 5161.622663] [<c04afa5d>] (__schedule) from [<c04afc0d>] (schedule+0x29/0x78)
[ 5161.629710] [<c04afc0d>] (schedule) from [<c012b253>] (io_schedule+0xf/0x28)
[ 5161.636771] [<c012b253>] (io_schedule) from [<c023e607>]
(blk_mq_get_tag+0x123/0x1f8)
[ 5161.644604] [<c023e607>] (blk_mq_get_tag) from [<c023b137>]
(blk_mq_get_request+0x8b/0x23c)
[ 5161.652954] [<c023b137>] (blk_mq_get_request) from [<c023c967>]
(blk_mq_make_request+0x87/0x244)
[ 5161.661739] [<c023c967>] (blk_mq_make_request) from [<c0235f81>]
(generic_make_request+0xa5/0x194)
[ 5161.670706] [<c0235f81>] (generic_make_request) from [<c02360a3>]
(submit_bio+0x33/0xf8)
[ 5161.678792] [<c02360a3>] (submit_bio) from [<c0196441>]
(__swap_writepage+0x251/0x280)
[ 5161.686719] [<c0196441>] (__swap_writepage) from [<c01755ed>]
(shrink_page_list+0x6f1/0xacc)
[ 5161.695158] [<c01755ed>] (shrink_page_list) from [<c0175f37>]
(shrink_inactive_list+0x13f/0x26c)
[ 5161.703939] [<c0175f37>] (shrink_inactive_list) from [<c0176649>]
(shrink_node+0x371/0x6a8)
[ 5161.712289] [<c0176649>] (shrink_node) from [<c0176af9>]
(try_to_free_pages+0x179/0x498)
[ 5161.720375] [<c0176af9>] (try_to_free_pages) from [<c0192ecb>]
(__alloc_pages_nodemask+0x30b/0x8c0)
[ 5161.729414] [<c0192ecb>] (__alloc_pages_nodemask) from [<c019bcab>]
(new_slab+0x7f/0x294)
[ 5161.737592] [<c019bcab>] (new_slab) from [<c019cbad>]
(___slab_alloc.constprop.13+0xfd/0x218)
[ 5161.746111] [<c019cbad>] (___slab_alloc.constprop.13) from
[<c019cd47>] (__kmalloc+0x7f/0xc4)
[ 5161.754635] [<c019cd47>] (__kmalloc) from [<c02e0c6b>]
(sync_erase+0x57/0x14c)
[ 5161.761856] [<c02e0c6b>] (sync_erase) from [<c02e1115>]
(__erase_worker+0x21/0x294)
[ 5161.769503] [<c02e1115>] (__erase_worker) from [<c02e1393>]
(erase_worker+0xb/0x44)
[ 5161.777157] [<c02e1393>] (erase_worker) from [<c02e1e03>]
(ubi_wl_flush+0x7f/0xd4)
[ 5161.784725] [<c02e1e03>] (ubi_wl_flush) from [<c02e577f>]
(gluebi_erase+0x113/0x148)
[ 5161.792469] [<c02e577f>] (gluebi_erase) from [<c02d4ccb>]
(mtdswap_erase_block+0x6f/0xc0)
[ 5161.800642] [<c02d4ccb>] (mtdswap_erase_block) from [<c02d4fa5>]
(mtdswap_gc+0x195/0x548)
[ 5161.808810] [<c02d4fa5>] (mtdswap_gc) from [<c02d5691>]
(mtdswap_background+0x19/0x20)
[ 5161.816724] [<c02d5691>] (mtdswap_background) from [<c02d41ff>]
(mtd_queue_rq+0x357/0x40c)
[ 5161.824985] [<c02d41ff>] (mtd_queue_rq) from [<c023cba1>]
(blk_mq_dispatch_rq_list+0x7d/0x378)
[ 5161.833595] [<c023cba1>] (blk_mq_dispatch_rq_list) from
[<c023f273>] (blk_mq_do_dispatch_sched+0x43/0x8c)
[ 5161.843158] [<c023f273>] (blk_mq_do_dispatch_sched) from
[<c023f671>] (blk_mq_sched_dispatch_requests+0x8d/0xf0)
[ 5161.853325] [<c023f671>] (blk_mq_sched_dispatch_requests) from
[<c023badb>] (__blk_mq_run_hw_queue+0x37/0xb4)
[ 5161.863237] [<c023badb>] (__blk_mq_run_hw_queue) from [<c0122909>]
(process_one_work+0x11d/0x2a8)
[ 5161.872107] [<c0122909>] (process_one_work) from [<c0122b81>]
(worker_thread+0xed/0x3a0)
[ 5161.880195] [<c0122b81>] (worker_thread) from [<c01263f1>]
(kthread+0xe9/0xf0)
[ 5161.887410] [<c01263f1>] (kthread) from [<c01010f9>]
(ret_from_fork+0x11/0x38)
[ 5161.894625] Exception stack(0xc2841fb0 to 0xc2841ff8)
[ 5161.899672] 1fa0:                                     00000000
00000000 00000000 00000000
[ 5161.907843] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 5161.916013] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 5161.922686] INFO: task kswapd0:86 blocked for more than 61 seconds.
[ 5161.928944]       Tainted: G           O
5.2.0-rc3-00024-g788a024921c4-dirty #175
[ 5161.936858] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[ 5161.944682] kswapd0         D    0    86      2 0x00000000
[ 5161.950180] [<c04afa5d>] (__schedule) from [<c04afc0d>] (schedule+0x29/0x78)
[ 5161.957222] [<c04afc0d>] (schedule) from [<c012b253>] (io_schedule+0xf/0x28)
[ 5161.964275] [<c012b253>] (io_schedule) from [<c023e607>]
(blk_mq_get_tag+0x123/0x1f8)
[ 5161.972107] [<c023e607>] (blk_mq_get_tag) from [<c023b137>]
(blk_mq_get_request+0x8b/0x23c)
[ 5161.980454] [<c023b137>] (blk_mq_get_request) from [<c023c967>]
(blk_mq_make_request+0x87/0x244)
[ 5161.989230] [<c023c967>] (blk_mq_make_request) from [<c0235f81>]
(generic_make_request+0xa5/0x194)
[ 5161.998210] [<c0235f81>] (generic_make_request) from [<c02360a3>]
(submit_bio+0x33/0xf8)
[ 5162.006304] [<c02360a3>] (submit_bio) from [<c0196441>]
(__swap_writepage+0x251/0x280)
[ 5162.014224] [<c0196441>] (__swap_writepage) from [<c01755ed>]
(shrink_page_list+0x6f1/0xacc)
[ 5162.022661] [<c01755ed>] (shrink_page_list) from [<c0175f37>]
(shrink_inactive_list+0x13f/0x26c)
[ 5162.031442] [<c0175f37>] (shrink_inactive_list) from [<c0176649>]
(shrink_node+0x371/0x6a8)
[ 5162.039785] [<c0176649>] (shrink_node) from [<c0177077>] (kswapd+0x25f/0x548)
[ 5162.046922] [<c0177077>] (kswapd) from [<c01263f1>] (kthread+0xe9/0xf0)
[ 5162.053537] [<c01263f1>] (kthread) from [<c01010f9>]
(ret_from_fork+0x11/0x38)
[ 5162.060751] Exception stack(0xc293ffb0 to 0xc293fff8)
[ 5162.065797] ffa0:                                     00000000
00000000 00000000 00000000
[ 5162.073969] ffc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 5162.082140] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 5162.088878] INFO: task klogd:151 blocked for more than 61 seconds.
[ 5162.095068]       Tainted: G           O
5.2.0-rc3-00024-g788a024921c4-dirty #175
[ 5162.102977] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[ 5162.110798] klogd           D    0   151      1 0x00000000
[ 5162.116289] [<c04afa5d>] (__schedule) from [<c04afc0d>] (schedule+0x29/0x78)
[ 5162.123342] [<c04afc0d>] (schedule) from [<c012b253>] (io_schedule+0xf/0x28)
[ 5162.130393] [<c012b253>] (io_schedule) from [<c023e607>]
(blk_mq_get_tag+0x123/0x1f8)
[ 5162.138214] [<c023e607>] (blk_mq_get_tag) from [<c023b137>]
(blk_mq_get_request+0x8b/0x23c)
[ 5162.146563] [<c023b137>] (blk_mq_get_request) from [<c023c967>]
(blk_mq_make_request+0x87/0x244)
[ 5162.155352] [<c023c967>] (blk_mq_make_request) from [<c0235f81>]
(generic_make_request+0xa5/0x194)
[ 5162.164309] [<c0235f81>] (generic_make_request) from [<c02360a3>]
(submit_bio+0x33/0xf8)
[ 5162.172397] [<c02360a3>] (submit_bio) from [<c0196441>]
(__swap_writepage+0x251/0x280)
[ 5162.180314] [<c0196441>] (__swap_writepage) from [<c01755ed>]
(shrink_page_list+0x6f1/0xacc)
[ 5162.188743] [<c01755ed>] (shrink_page_list) from [<c0175f37>]
(shrink_inactive_list+0x13f/0x26c)
[ 5162.197524] [<c0175f37>] (shrink_inactive_list) from [<c0176649>]
(shrink_node+0x371/0x6a8)
[ 5162.205873] [<c0176649>] (shrink_node) from [<c0176af9>]
(try_to_free_pages+0x179/0x498)
[ 5162.213961] [<c0176af9>] (try_to_free_pages) from [<c0192ecb>]
(__alloc_pages_nodemask+0x30b/0x8c0)
[ 5162.223004] [<c0192ecb>] (__alloc_pages_nodemask) from [<c019bcab>]
(new_slab+0x7f/0x294)
[ 5162.231185] [<c019bcab>] (new_slab) from [<c019cbad>]
(___slab_alloc.constprop.13+0xfd/0x218)
[ 5162.239700] [<c019cbad>] (___slab_alloc.constprop.13) from
[<c019dfeb>] (__kmalloc_track_caller+0x7f/0xc4)
[ 5162.249355] [<c019dfeb>] (__kmalloc_track_caller) from [<c0391c0b>]
(__kmalloc_reserve.constprop.23+0x17/0x44)
[ 5162.259353] [<c0391c0b>] (__kmalloc_reserve.constprop.23) from
[<c0391c9b>] (__alloc_skb+0x63/0x118)
[ 5162.268482] [<c0391c9b>] (__alloc_skb) from [<c0392433>]
(alloc_skb_with_frags+0x27/0x104)
[ 5162.276745] [<c0392433>] (alloc_skb_with_frags) from [<c038d4ed>]
(sock_alloc_send_pskb+0x1ad/0x1c4)
[ 5162.285878] [<c038d4ed>] (sock_alloc_send_pskb) from [<c0402141>]
(unix_dgram_sendmsg+0x12d/0x3a4)
[ 5162.294836] [<c0402141>] (unix_dgram_sendmsg) from [<c038ab2f>]
(sock_sendmsg+0xb/0x18)
[ 5162.302840] [<c038ab2f>] (sock_sendmsg) from [<c038b917>]
(__sys_sendto+0x77/0x9c)
[ 5162.310409] [<c038b917>] (__sys_sendto) from [<c038b94f>] (sys_send+0xf/0x14)
[ 5162.317537] [<c038b94f>] (sys_send) from [<c0101001>]
(ret_fast_syscall+0x1/0x62)
[ 5162.325012] Exception stack(0xc215ffa8 to 0xc215fff0)
[ 5162.330064] ffa0:                   00000001 0009f008 00000003
0009f180 0000002d 00004000
[ 5162.338231] ffc0: 00000001 0009f008 00000014 00000121 ffffffff
b6fa9000 000819b2 be910cd0
[ 5162.346401] ffe0: 00000000 be910c0c b6f50dcb b6f544d8
[ 5162.351577] INFO: task ntpd:267 blocked for more than 62 seconds.
[ 5162.357672]       Tainted: G           O
5.2.0-rc3-00024-g788a024921c4-dirty #175
[ 5162.365590] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[ 5162.373413] ntpd            D    0   267      1 0x00000001
[ 5162.378904] [<c04afa5d>] (__schedule) from [<c04afc0d>] (schedule+0x29/0x78)
[ 5162.385957] [<c04afc0d>] (schedule) from [<c012b253>] (io_schedule+0xf/0x28)
[ 5162.393011] [<c012b253>] (io_schedule) from [<c023e607>]
(blk_mq_get_tag+0x123/0x1f8)
[ 5162.400841] [<c023e607>] (blk_mq_get_tag) from [<c023b137>]
(blk_mq_get_request+0x8b/0x23c)
[ 5162.409183] [<c023b137>] (blk_mq_get_request) from [<c023c967>]
(blk_mq_make_request+0x87/0x244)
[ 5162.417968] [<c023c967>] (blk_mq_make_request) from [<c0235f81>]
(generic_make_request+0xa5/0x194)
[ 5162.426925] [<c0235f81>] (generic_make_request) from [<c02360a3>]
(submit_bio+0x33/0xf8)
[ 5162.435013] [<c02360a3>] (submit_bio) from [<c01965cf>]
(swap_readpage+0x133/0x198)
[ 5162.442669] [<c01965cf>] (swap_readpage) from [<c0196fcd>]
(read_swap_cache_async+0x2d/0x40)
[ 5162.451102] [<c0196fcd>] (read_swap_cache_async) from [<c0197321>]
(swapin_readahead+0x81/0x32c)
[ 5162.459887] [<c0197321>] (swapin_readahead) from [<c0185f57>]
(do_swap_page+0x2bf/0x3ac)
[ 5162.467971] [<c0185f57>] (do_swap_page) from [<c018651f>]
(handle_mm_fault+0x293/0x750)
[ 5162.475977] [<c018651f>] (handle_mm_fault) from [<c010d633>]
(do_page_fault+0xd3/0x280)
[ 5162.483982] [<c010d633>] (do_page_fault) from [<c010d8f1>]
(do_DataAbort+0x2d/0x78)
[ 5162.491636] [<c010d8f1>] (do_DataAbort) from [<c0101e4f>]
(__dabt_usr+0x4f/0x60)

/Emil

--0000000000008a34650594f5eaa6
Content-Type: text/x-csrc; charset="UTF-8"; name="mtdswap.c"
Content-Disposition: attachment; filename="mtdswap.c"
Content-Transfer-Encoding: base64
Content-ID: <f_k1s35usj0>
X-Attachment-Id: f_k1s35usj0

LyoKICogU3dhcCBibG9jayBkZXZpY2Ugc3VwcG9ydCBmb3IgTVREcwogKiBUdXJucyBhbiBNVEQg
ZGV2aWNlIGludG8gYSBzd2FwIGRldmljZSB3aXRoIGJsb2NrIHdlYXIgbGV2ZWxpbmcKICoKICog
Q29weXJpZ2h0IMKpIDIwMDcsMjAxMSBOb2tpYSBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KICoKICogQXV0aG9yczogSmFya2tvIExhdmluZW4gPGphcmtrby5sYXZpbmVuQG5va2lh
LmNvbT4KICoKICogQmFzZWQgb24gUmljaGFyZCBQdXJkaWUncyBlYXJsaWVyIGltcGxlbWVudGF0
aW9uIGluIDIwMDcuIEJhY2tncm91bmQKICogc3VwcG9ydCBhbmQgbG9jay1sZXNzIG9wZXJhdGlv
biB3cml0dGVuIGJ5IEFkcmlhbiBIdW50ZXIuCiAqCiAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICogbW9kaWZ5IGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKICogdmVyc2lvbiAy
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgogKgogKiBUaGlz
IHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1
bCwgYnV0CiAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YKICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKICogR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgogKgogKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQogKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYg
bm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQogKiBGb3VuZGF0aW9uLCBJbmMuLCA1MSBG
cmFua2xpbiBTdCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEKICogMDIxMTAtMTMwMSBVU0EKICov
CgojaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KI2lu
Y2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KI2luY2x1ZGUgPGxpbnV4L210ZC9ibGt0cmFucy5oPgoj
aW5jbHVkZSA8bGludXgvcmJ0cmVlLmg+CiNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgojaW5jbHVk
ZSA8bGludXgvc2xhYi5oPgojaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgojaW5jbHVkZSA8bGlu
dXgvZ2VuaGQuaD4KI2luY2x1ZGUgPGxpbnV4L3N3YXAuaD4KI2luY2x1ZGUgPGxpbnV4L2RlYnVn
ZnMuaD4KI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+CiNpbmNsdWRlIDxsaW51eC9kZXZpY2Uu
aD4KI2luY2x1ZGUgPGxpbnV4L21hdGg2NC5oPgoKI2RlZmluZSBNVERTV0FQX1BSRUZJWCAibXRk
c3dhcCIKCi8qCiAqIFRoZSBudW1iZXIgb2YgZnJlZSBlcmFzZWJsb2NrcyB3aGVuIEdDIHNob3Vs
ZCBzdG9wCiAqLwojZGVmaW5lIENMRUFOX0JMT0NLX1RIUkVTSE9MRAkyMAoKLyoKICogTnVtYmVy
IG9mIGZyZWUgZXJhc2VibG9ja3MgYmVsb3cgd2hpY2ggR0MgY2FuIGFsc28gY29sbGVjdCBsb3cg
ZnJhZwogKiBibG9ja3MuCiAqLwojZGVmaW5lIExPV19GUkFHX0dDX1RIUkVTSE9MRAk1CgovKgog
KiBXZWFyIGxldmVsIGNvc3QgYW1vcnRpemF0aW9uLiBXZSB3YW50IHRvIGRvIHdlYXIgbGV2ZWxp
bmcgb24gdGhlIGJhY2tncm91bmQKICogd2l0aG91dCBkaXN0dXJiaW5nIGdjIHRvbyBtdWNoLiBU
aGlzIGlzIG1hZGUgYnkgZGVmaW5pbmcgbWF4IEdDIGZyZXF1ZW5jeS4KICogRnJlcXVlbmN5IHZh
bHVlIDYgbWVhbnMgMS82IG9mIHRoZSBHQyBwYXNzZXMgd2lsbCBwaWNrIGFuIGVyYXNlIGJsb2Nr
IGJhc2VkCiAqIG9uIHRoZSBiaWdnZXN0IHdlYXIgZGlmZmVyZW5jZSByYXRoZXIgdGhhbiB0aGUg
YmlnZ2VzdCBkaXJ0aW5lc3MuCiAqCiAqIFRoZSBsb3dlciBmcmVxMiBzaG91bGQgYmUgY2hvc2Vu
IHNvIHRoYXQgaXQgbWFrZXMgc3VyZSB0aGUgbWF4aW11bSBlcmFzZQogKiBkaWZmZXJlbmNlIHdp
bGwgZGVjcmVhc2UgZXZlbiBpZiBhIG1hbGljaW91cyBhcHBsaWNhdGlvbiBpcyBkZWxpYmVyYXRl
bHkKICogdHJ5aW5nIHRvIG1ha2UgZXJhc2UgZGlmZmVyZW5jZXMgbGFyZ2UuCiAqLwojZGVmaW5l
IE1BWF9FUkFTRV9ESUZGCQk0MDAwCiNkZWZpbmUgQ09MTEVDVF9OT05ESVJUWV9CQVNFCU1BWF9F
UkFTRV9ESUZGCiNkZWZpbmUgQ09MTEVDVF9OT05ESVJUWV9GUkVRMQk2CiNkZWZpbmUgQ09MTEVD
VF9OT05ESVJUWV9GUkVRMgk0CgojZGVmaW5lIFBBR0VfVU5ERUYJCVVJTlRfTUFYCiNkZWZpbmUg
QkxPQ0tfVU5ERUYJCVVJTlRfTUFYCiNkZWZpbmUgQkxPQ0tfRVJST1IJCShVSU5UX01BWCAtIDEp
CiNkZWZpbmUgQkxPQ0tfTUFYCQkoVUlOVF9NQVggLSAyKQoKI2RlZmluZSBFQkxPQ0tfQkFECQko
MSA8PCAwKQojZGVmaW5lIEVCTE9DS19OT01BR0lDCQkoMSA8PCAxKQojZGVmaW5lIEVCTE9DS19C
SVRGTElQCQkoMSA8PCAyKQojZGVmaW5lIEVCTE9DS19GQUlMRUQJCSgxIDw8IDMpCiNkZWZpbmUg
RUJMT0NLX1JFQURFUlIJCSgxIDw8IDQpCiNkZWZpbmUgRUJMT0NLX0lEWF9TSElGVAk1CgpzdHJ1
Y3Qgc3dhcF9lYiB7CglzdHJ1Y3QgcmJfbm9kZSByYjsKCXN0cnVjdCByYl9yb290ICpyb290OwoK
CXVuc2lnbmVkIGludCBmbGFnczsKCXVuc2lnbmVkIGludCBhY3RpdmVfY291bnQ7Cgl1bnNpZ25l
ZCBpbnQgZXJhc2VfY291bnQ7Cgl1bnNpZ25lZCBpbnQgcGFkOwkJLyogc3BlZWRzIHVwIHBvaW50
ZXIgZGVjcmVtZW50ICovCn07CgojZGVmaW5lIE1URFNXQVBfRUNOVF9NSU4ocmJyb290KSAocmJf
ZW50cnkocmJfZmlyc3QocmJyb290KSwgc3RydWN0IHN3YXBfZWIsIFwKCQkJCXJiKS0+ZXJhc2Vf
Y291bnQpCiNkZWZpbmUgTVREU1dBUF9FQ05UX01BWChyYnJvb3QpIChyYl9lbnRyeShyYl9sYXN0
KHJicm9vdCksIHN0cnVjdCBzd2FwX2ViLCBcCgkJCQlyYiktPmVyYXNlX2NvdW50KQoKc3RydWN0
IG10ZHN3YXBfdHJlZSB7CglzdHJ1Y3QgcmJfcm9vdCByb290OwoJdW5zaWduZWQgaW50IGNvdW50
Owp9OwoKZW51bSB7CglNVERTV0FQX0NMRUFOLAoJTVREU1dBUF9VU0VELAoJTVREU1dBUF9MT1dG
UkFHLAoJTVREU1dBUF9ISUZSQUcsCglNVERTV0FQX0RJUlRZLAoJTVREU1dBUF9CSVRGTElQLAoJ
TVREU1dBUF9GQUlMSU5HLAoJTVREU1dBUF9UUkVFX0NOVCwKfTsKCnN0cnVjdCBtdGRzd2FwX2Rl
diB7CglzdHJ1Y3QgbXRkX2Jsa3RyYW5zX2RldiAqbWJkX2RldjsKCXN0cnVjdCBtdGRfaW5mbyAq
bXRkOwoJc3RydWN0IGRldmljZSAqZGV2OwoKCXVuc2lnbmVkIGludCAqcGFnZV9kYXRhOwoJdW5z
aWduZWQgaW50ICpyZXZtYXA7CgoJdW5zaWduZWQgaW50IGVibGtzOwoJdW5zaWduZWQgaW50IHNw
YXJlX2VibGtzOwoJdW5zaWduZWQgaW50IHBhZ2VzX3Blcl9lYmxrOwoJdW5zaWduZWQgaW50IG1h
eF9lcmFzZV9jb3VudDsKCXN0cnVjdCBzd2FwX2ViICplYl9kYXRhOwoKCXN0cnVjdCBtdGRzd2Fw
X3RyZWUgdHJlZXNbTVREU1dBUF9UUkVFX0NOVF07CgoJdW5zaWduZWQgbG9uZyBsb25nIHNlY3Rf
cmVhZF9jb3VudDsKCXVuc2lnbmVkIGxvbmcgbG9uZyBzZWN0X3dyaXRlX2NvdW50OwoJdW5zaWdu
ZWQgbG9uZyBsb25nIG10ZF93cml0ZV9jb3VudDsKCXVuc2lnbmVkIGxvbmcgbG9uZyBtdGRfcmVh
ZF9jb3VudDsKCXVuc2lnbmVkIGxvbmcgbG9uZyBkaXNjYXJkX2NvdW50OwoJdW5zaWduZWQgbG9u
ZyBsb25nIGRpc2NhcmRfcGFnZV9jb3VudDsKCgl1bnNpZ25lZCBpbnQgY3Vycl93cml0ZV9wb3M7
CglzdHJ1Y3Qgc3dhcF9lYiAqY3Vycl93cml0ZTsKCgljaGFyICpwYWdlX2J1ZjsKCWNoYXIgKm9v
Yl9idWY7Cn07CgpzdHJ1Y3QgbXRkc3dhcF9vb2JkYXRhIHsKCV9fbGUxNiBtYWdpYzsKCV9fbGUz
MiBjb3VudDsKfSBfX3BhY2tlZDsKCiNkZWZpbmUgTVREU1dBUF9NQUdJQ19DTEVBTgkweDIwOTUK
I2RlZmluZSBNVERTV0FQX01BR0lDX0RJUlRZCShNVERTV0FQX01BR0lDX0NMRUFOICsgMSkKI2Rl
ZmluZSBNVERTV0FQX1RZUEVfQ0xFQU4JMAojZGVmaW5lIE1URFNXQVBfVFlQRV9ESVJUWQkxCiNk
ZWZpbmUgTVREU1dBUF9PT0JTSVpFCQlzaXplb2Yoc3RydWN0IG10ZHN3YXBfb29iZGF0YSkKCiNk
ZWZpbmUgTVREU1dBUF9FUkFTRV9SRVRSSUVTCTMgLyogQmVmb3JlIG1hcmtpbmcgZXJhc2UgYmxv
Y2sgYmFkICovCiNkZWZpbmUgTVREU1dBUF9JT19SRVRSSUVTCTMKCmVudW0gewoJTVREU1dBUF9T
Q0FOTkVEX0NMRUFOLAoJTVREU1dBUF9TQ0FOTkVEX0RJUlRZLAoJTVREU1dBUF9TQ0FOTkVEX0JJ
VEZMSVAsCglNVERTV0FQX1NDQU5ORURfQkFELAp9OwoKLyoKICogSW4gdGhlIHdvcnN0IGNhc2Ug
bXRkc3dhcF93cml0ZXNlY3QoKSBoYXMgYWxsb2NhdGVkIHRoZSBsYXN0IGNsZWFuCiAqIHBhZ2Ug
ZnJvbSB0aGUgY3VycmVudCBibG9jayBhbmQgaXMgdGhlbiBwcmUtZW1wdGVkIGJ5IHRoZSBHQwog
KiB0aHJlYWQuIFRoZSB0aHJlYWQgY2FuIGNvbnN1bWUgYSBmdWxsIGVyYXNlIGJsb2NrIHdoZW4g
bW92aW5nIGEKICogYmxvY2suCiAqLwojZGVmaW5lIE1JTl9TUEFSRV9FQkxPQ0tTCTIKI2RlZmlu
ZSBNSU5fRVJBU0VfQkxPQ0tTCShNSU5fU1BBUkVfRUJMT0NLUyArIDEpCgojZGVmaW5lIFRSRUVf
Uk9PVChkLCBuYW1lKSAoJmQtPnRyZWVzW01URFNXQVBfICMjIG5hbWVdLnJvb3QpCiNkZWZpbmUg
VFJFRV9FTVBUWShkLCBuYW1lKSAoVFJFRV9ST09UKGQsIG5hbWUpLT5yYl9ub2RlID09IE5VTEwp
CiNkZWZpbmUgVFJFRV9OT05FTVBUWShkLCBuYW1lKSAoIVRSRUVfRU1QVFkoZCwgbmFtZSkpCiNk
ZWZpbmUgVFJFRV9DT1VOVChkLCBuYW1lKSAoZC0+dHJlZXNbTVREU1dBUF8gIyMgbmFtZV0uY291
bnQpCgojZGVmaW5lIE1URFNXQVBfTUJEX1RPX01URFNXQVAoZGV2KSAoKHN0cnVjdCBtdGRzd2Fw
X2RldiAqKWRldi0+cHJpdikKCnN0YXRpYyBjaGFyIHBhcnRpdGlvbnNbMTI4XSA9ICIiOwptb2R1
bGVfcGFyYW1fc3RyaW5nKHBhcnRpdGlvbnMsIHBhcnRpdGlvbnMsIHNpemVvZihwYXJ0aXRpb25z
KSwgMDQ0NCk7Ck1PRFVMRV9QQVJNX0RFU0MocGFydGl0aW9ucywgIk1URCBwYXJ0aXRpb24gbnVt
YmVycyB0byB1c2UgYXMgc3dhcCAiCgkJInBhcnRpdGlvbnM9XCIxLDMsNVwiIik7CgpzdGF0aWMg
dW5zaWduZWQgaW50IHNwYXJlX2VibG9ja3MgPSAxMDsKbW9kdWxlX3BhcmFtKHNwYXJlX2VibG9j
a3MsIHVpbnQsIDA0NDQpOwpNT0RVTEVfUEFSTV9ERVNDKHNwYXJlX2VibG9ja3MsICJQZXJjZW50
YWdlIG9mIHNwYXJlIGVyYXNlIGJsb2NrcyBmb3IgIgoJCSJnYXJiYWdlIGNvbGxlY3Rpb24gKGRl
ZmF1bHQgMTAlKSIpOwoKc3RhdGljIGJvb2wgaGVhZGVyOyAvKiBmYWxzZSAqLwptb2R1bGVfcGFy
YW0oaGVhZGVyLCBib29sLCAwNDQ0KTsKTU9EVUxFX1BBUk1fREVTQyhoZWFkZXIsCgkJIkluY2x1
ZGUgYnVpbHRpbiBzd2FwIGhlYWRlciAoZGVmYXVsdCAwLCB3aXRob3V0IGhlYWRlcikiKTsKCnN0
YXRpYyBpbnQgbXRkc3dhcF9nYyhzdHJ1Y3QgbXRkc3dhcF9kZXYgKmQsIHVuc2lnbmVkIGludCBi
YWNrZ3JvdW5kKTsKCnN0YXRpYyBpbnQgbXRkc3dhcF9jYW5fdXNlX29vYihzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCkKewoJcmV0dXJuIG10ZC0+b29ic2l6ZSAmJiBtdGQtPm9vYmF2YWlsID49IE1URFNX
QVBfT09CU0laRTsKfQoKc3RhdGljIGxvZmZfdCBtdGRzd2FwX2ViX29mZnNldChzdHJ1Y3QgbXRk
c3dhcF9kZXYgKmQsIHN0cnVjdCBzd2FwX2ViICplYikKewoJcmV0dXJuIChsb2ZmX3QpKGViIC0g
ZC0+ZWJfZGF0YSkgKiBkLT5tdGQtPmVyYXNlc2l6ZTsKfQoKc3RhdGljIHZvaWQgbXRkc3dhcF9l
Yl9kZXRhY2goc3RydWN0IG10ZHN3YXBfZGV2ICpkLCBzdHJ1Y3Qgc3dhcF9lYiAqZWIpCnsKCXVu
c2lnbmVkIGludCBvbGRpZHg7CglzdHJ1Y3QgbXRkc3dhcF90cmVlICp0cDsKCglpZiAoZWItPnJv
b3QpIHsKCQl0cCA9IGNvbnRhaW5lcl9vZihlYi0+cm9vdCwgc3RydWN0IG10ZHN3YXBfdHJlZSwg
cm9vdCk7CgkJb2xkaWR4ID0gdHAgLSAmZC0+dHJlZXNbMF07CgoJCWQtPnRyZWVzW29sZGlkeF0u
Y291bnQtLTsKCQlyYl9lcmFzZSgmZWItPnJiLCBlYi0+cm9vdCk7Cgl9Cn0KCnN0YXRpYyB2b2lk
IF9fbXRkc3dhcF9yYl9hZGQoc3RydWN0IHJiX3Jvb3QgKnJvb3QsIHN0cnVjdCBzd2FwX2ViICpl
YikKewoJc3RydWN0IHJiX25vZGUgKipwLCAqcGFyZW50ID0gTlVMTDsKCXN0cnVjdCBzd2FwX2Vi
ICpjdXI7CgoJcCA9ICZyb290LT5yYl9ub2RlOwoJd2hpbGUgKCpwKSB7CgkJcGFyZW50ID0gKnA7
CgkJY3VyID0gcmJfZW50cnkocGFyZW50LCBzdHJ1Y3Qgc3dhcF9lYiwgcmIpOwoJCWlmIChlYi0+
ZXJhc2VfY291bnQgPiBjdXItPmVyYXNlX2NvdW50KQoJCQlwID0gJigqcCktPnJiX3JpZ2h0OwoJ
CWVsc2UKCQkJcCA9ICYoKnApLT5yYl9sZWZ0OwoJfQoKCXJiX2xpbmtfbm9kZSgmZWItPnJiLCBw
YXJlbnQsIHApOwoJcmJfaW5zZXJ0X2NvbG9yKCZlYi0+cmIsIHJvb3QpOwp9CgpzdGF0aWMgdm9p
ZCBtdGRzd2FwX3JiX2FkZChzdHJ1Y3QgbXRkc3dhcF9kZXYgKmQsIHN0cnVjdCBzd2FwX2ViICpl
YiwgaW50IGlkeCkKewoJc3RydWN0IHJiX3Jvb3QgKnJvb3Q7CgoJaWYgKGViLT5yb290ID09ICZk
LT50cmVlc1tpZHhdLnJvb3QpCgkJcmV0dXJuOwoKCW10ZHN3YXBfZWJfZGV0YWNoKGQsIGViKTsK
CXJvb3QgPSAmZC0+dHJlZXNbaWR4XS5yb290OwoJX19tdGRzd2FwX3JiX2FkZChyb290LCBlYik7
CgllYi0+cm9vdCA9IHJvb3Q7CglkLT50cmVlc1tpZHhdLmNvdW50Kys7Cn0KCnN0YXRpYyBzdHJ1
Y3QgcmJfbm9kZSAqbXRkc3dhcF9yYl9pbmRleChzdHJ1Y3QgcmJfcm9vdCAqcm9vdCwgdW5zaWdu
ZWQgaW50IGlkeCkKewoJc3RydWN0IHJiX25vZGUgKnA7Cgl1bnNpZ25lZCBpbnQgaTsKCglwID0g
cmJfZmlyc3Qocm9vdCk7CglpID0gMDsKCXdoaWxlIChpIDwgaWR4ICYmIHApIHsKCQlwID0gcmJf
bmV4dChwKTsKCQlpKys7Cgl9CgoJcmV0dXJuIHA7Cn0KCnN0YXRpYyBpbnQgbXRkc3dhcF9oYW5k
bGVfYmFkYmxvY2soc3RydWN0IG10ZHN3YXBfZGV2ICpkLCBzdHJ1Y3Qgc3dhcF9lYiAqZWIpCnsK
CWludCByZXQ7Cglsb2ZmX3Qgb2Zmc2V0OwoKCWQtPnNwYXJlX2VibGtzLS07CgllYi0+ZmxhZ3Mg
fD0gRUJMT0NLX0JBRDsKCW10ZHN3YXBfZWJfZGV0YWNoKGQsIGViKTsKCWViLT5yb290ID0gTlVM
TDsKCgkvKiBiYWRibG9ja3Mgbm90IHN1cHBvcnRlZCAqLwoJaWYgKCFtdGRfY2FuX2hhdmVfYmIo
ZC0+bXRkKSkKCQlyZXR1cm4gMTsKCglvZmZzZXQgPSBtdGRzd2FwX2ViX29mZnNldChkLCBlYik7
CglkZXZfd2FybihkLT5kZXYsICJNYXJraW5nIGJhZCBibG9jayBhdCAlMDhsbHhcbiIsIG9mZnNl
dCk7CglyZXQgPSBtdGRfYmxvY2tfbWFya2JhZChkLT5tdGQsIG9mZnNldCk7CgoJaWYgKHJldCkg
ewoJCWRldl93YXJuKGQtPmRldiwgIk1hcmsgYmxvY2sgYmFkIGZhaWxlZCBmb3IgYmxvY2sgYXQg
JTA4bGx4ICIKCQkJImVycm9yICVkXG4iLCBvZmZzZXQsIHJldCk7CgkJcmV0dXJuIHJldDsKCX0K
CglyZXR1cm4gMTsKCn0KCnN0YXRpYyBpbnQgbXRkc3dhcF9oYW5kbGVfd3JpdGVfZXJyb3Ioc3Ry
dWN0IG10ZHN3YXBfZGV2ICpkLCBzdHJ1Y3Qgc3dhcF9lYiAqZWIpCnsKCXVuc2lnbmVkIGludCBt
YXJrZWQgPSBlYi0+ZmxhZ3MgJiBFQkxPQ0tfRkFJTEVEOwoJc3RydWN0IHN3YXBfZWIgKmN1cnJf
d3JpdGUgPSBkLT5jdXJyX3dyaXRlOwoKCWViLT5mbGFncyB8PSBFQkxPQ0tfRkFJTEVEOwoJaWYg
KGN1cnJfd3JpdGUgPT0gZWIpIHsKCQlkLT5jdXJyX3dyaXRlID0gTlVMTDsKCgkJaWYgKCFtYXJr
ZWQgJiYgZC0+Y3Vycl93cml0ZV9wb3MgIT0gMCkgewoJCQltdGRzd2FwX3JiX2FkZChkLCBlYiwg
TVREU1dBUF9GQUlMSU5HKTsKCQkJcmV0dXJuIDA7CgkJfQoJfQoKCXJldHVybiBtdGRzd2FwX2hh
bmRsZV9iYWRibG9jayhkLCBlYik7Cn0KCnN0YXRpYyBpbnQgbXRkc3dhcF9yZWFkX29vYihzdHJ1
Y3QgbXRkc3dhcF9kZXYgKmQsIGxvZmZfdCBmcm9tLAoJCQlzdHJ1Y3QgbXRkX29vYl9vcHMgKm9w
cykKewoJaW50IHJldCA9IG10ZF9yZWFkX29vYihkLT5tdGQsIGZyb20sIG9wcyk7CgoJaWYgKG10
ZF9pc19iaXRmbGlwKHJldCkpCgkJcmV0dXJuIHJldDsKCglpZiAocmV0KSB7CgkJZGV2X3dhcm4o
ZC0+ZGV2LCAiUmVhZCBPT0IgZmFpbGVkICVkIGZvciBibG9jayBhdCAlMDhsbHhcbiIsCgkJCXJl
dCwgZnJvbSk7CgkJcmV0dXJuIHJldDsKCX0KCglpZiAob3BzLT5vb2JyZXRsZW4gPCBvcHMtPm9v
YmxlbikgewoJCWRldl93YXJuKGQtPmRldiwgIlJlYWQgT09CIHJldHVybiBzaG9ydCByZWFkICgl
emQgYnl0ZXMgbm90ICIKCQkJIiV6ZCkgZm9yIGJsb2NrIGF0ICUwOGxseFxuIiwKCQkJb3BzLT5v
b2JyZXRsZW4sIG9wcy0+b29ibGVuLCBmcm9tKTsKCQlyZXR1cm4gLUVJTzsKCX0KCglyZXR1cm4g
MDsKfQoKc3RhdGljIGludCBtdGRzd2FwX3JlYWRfbWFya2VycyhzdHJ1Y3QgbXRkc3dhcF9kZXYg
KmQsIHN0cnVjdCBzd2FwX2ViICplYikKewoJc3RydWN0IG10ZHN3YXBfb29iZGF0YSAqZGF0YSwg
KmRhdGEyOwoJaW50IHJldDsKCWxvZmZfdCBvZmZzZXQ7CglzdHJ1Y3QgbXRkX29vYl9vcHMgb3Bz
OwoKCWlmICghbXRkc3dhcF9jYW5fdXNlX29vYihkLT5tdGQpKSB7CgkJZWItPmZsYWdzIHw9IEVC
TE9DS19OT01BR0lDOwoJCXJldHVybiBNVERTV0FQX1NDQU5ORURfRElSVFk7Cgl9CgoJb2Zmc2V0
ID0gbXRkc3dhcF9lYl9vZmZzZXQoZCwgZWIpOwoKCS8qIENoZWNrIGZpcnN0IGlmIHRoZSBibG9j
ayBpcyBiYWQuICovCglpZiAobXRkX2Nhbl9oYXZlX2JiKGQtPm10ZCkgJiYgbXRkX2Jsb2NrX2lz
YmFkKGQtPm10ZCwgb2Zmc2V0KSkKCQlyZXR1cm4gTVREU1dBUF9TQ0FOTkVEX0JBRDsKCglvcHMu
b29ibGVuID0gMiAqIGQtPm10ZC0+b29iYXZhaWw7CglvcHMub29iYnVmID0gZC0+b29iX2J1ZjsK
CW9wcy5vb2JvZmZzID0gMDsKCW9wcy5kYXRidWYgPSBOVUxMOwoJb3BzLm1vZGUgPSBNVERfT1BT
X0FVVE9fT09COwoKCXJldCA9IG10ZHN3YXBfcmVhZF9vb2IoZCwgb2Zmc2V0LCAmb3BzKTsKCglp
ZiAocmV0ICYmICFtdGRfaXNfYml0ZmxpcChyZXQpKQoJCXJldHVybiByZXQ7CgoJZGF0YSA9IChz
dHJ1Y3QgbXRkc3dhcF9vb2JkYXRhICopZC0+b29iX2J1ZjsKCWRhdGEyID0gKHN0cnVjdCBtdGRz
d2FwX29vYmRhdGEgKikKCQkoZC0+b29iX2J1ZiArIGQtPm10ZC0+b29iYXZhaWwpOwoKCWlmIChs
ZTE2X3RvX2NwdShkYXRhLT5tYWdpYykgPT0gTVREU1dBUF9NQUdJQ19DTEVBTikgewoJCWViLT5l
cmFzZV9jb3VudCA9IGxlMzJfdG9fY3B1KGRhdGEtPmNvdW50KTsKCQlpZiAobXRkX2lzX2JpdGZs
aXAocmV0KSkKCQkJcmV0ID0gTVREU1dBUF9TQ0FOTkVEX0JJVEZMSVA7CgkJZWxzZSB7CgkJCWlm
IChsZTE2X3RvX2NwdShkYXRhMi0+bWFnaWMpID09IE1URFNXQVBfTUFHSUNfRElSVFkpCgkJCQly
ZXQgPSBNVERTV0FQX1NDQU5ORURfRElSVFk7CgkJCWVsc2UKCQkJCXJldCA9IE1URFNXQVBfU0NB
Tk5FRF9DTEVBTjsKCQl9Cgl9IGVsc2UgewoJCWViLT5mbGFncyB8PSBFQkxPQ0tfTk9NQUdJQzsK
CQlyZXQgPSBNVERTV0FQX1NDQU5ORURfRElSVFk7Cgl9CgoJcmV0dXJuIHJldDsKfQoKc3RhdGlj
IGludCBtdGRzd2FwX3dyaXRlX21hcmtlcihzdHJ1Y3QgbXRkc3dhcF9kZXYgKmQsIHN0cnVjdCBz
d2FwX2ViICplYiwKCQkJCXUxNiBtYXJrZXIpCnsKCXN0cnVjdCBtdGRzd2FwX29vYmRhdGEgbjsK
CWludCByZXQ7Cglsb2ZmX3Qgb2Zmc2V0OwoJc3RydWN0IG10ZF9vb2Jfb3BzIG9wczsKCglpZiAo
IW10ZHN3YXBfY2FuX3VzZV9vb2IoZC0+bXRkKSkgewoJCXJldHVybiAwOwoJfQoKCW9wcy5vb2Jv
ZmZzID0gMDsKCW9wcy5vb2JidWYgPSAodWludDhfdCAqKSZuOwoJb3BzLm1vZGUgPSBNVERfT1BT
X0FVVE9fT09COwoJb3BzLmRhdGJ1ZiA9IE5VTEw7CgoJaWYgKG1hcmtlciA9PSBNVERTV0FQX1RZ
UEVfQ0xFQU4pIHsKCQluLm1hZ2ljID0gY3B1X3RvX2xlMTYoTVREU1dBUF9NQUdJQ19DTEVBTik7
CgkJbi5jb3VudCA9IGNwdV90b19sZTMyKGViLT5lcmFzZV9jb3VudCk7CgkJb3BzLm9vYmxlbiA9
IE1URFNXQVBfT09CU0laRTsKCQlvZmZzZXQgPSBtdGRzd2FwX2ViX29mZnNldChkLCBlYik7Cgl9
IGVsc2UgewoJCW4ubWFnaWMgPSBjcHVfdG9fbGUxNihNVERTV0FQX01BR0lDX0RJUlRZKTsKCQlv
cHMub29ibGVuID0gc2l6ZW9mKG4ubWFnaWMpOwoJCW9mZnNldCA9IG10ZHN3YXBfZWJfb2Zmc2V0
KGQsIGViKSArIGQtPm10ZC0+d3JpdGVzaXplOwoJfQoKCXJldCA9IG10ZF93cml0ZV9vb2IoZC0+
bXRkLCBvZmZzZXQsICZvcHMpOwoKCWlmIChyZXQpIHsKCQlkZXZfd2FybihkLT5kZXYsICJXcml0
ZSBPT0IgZmFpbGVkIGZvciBibG9jayBhdCAlMDhsbHggIgoJCQkiZXJyb3IgJWRcbiIsIG9mZnNl
dCwgcmV0KTsKCQlpZiAocmV0ID09IC1FSU8gfHwgbXRkX2lzX2VjY2VycihyZXQpKQoJCQltdGRz
d2FwX2hhbmRsZV93cml0ZV9lcnJvcihkLCBlYik7CgkJcmV0dXJuIHJldDsKCX0KCglpZiAob3Bz
Lm9vYnJldGxlbiAhPSBvcHMub29ibGVuKSB7CgkJZGV2X3dhcm4oZC0+ZGV2LCAiU2hvcnQgT09C
IHdyaXRlIGZvciBibG9jayBhdCAlMDhsbHg6ICIKCQkJIiV6ZCBub3QgJXpkXG4iLAoJCQlvZmZz
ZXQsIG9wcy5vb2JyZXRsZW4sIG9wcy5vb2JsZW4pOwoJCXJldHVybiByZXQ7Cgl9CgoJcmV0dXJu
IDA7Cn0KCi8qCiAqIEFyZSB0aGVyZSBhbnkgZXJhc2UgYmxvY2tzIHdpdGhvdXQgTUFHSUNfQ0xF
QU4gaGVhZGVyLCBwcmVzdW1hYmx5CiAqIGJlY2F1c2UgcG93ZXIgd2FzIGN1dCBvZmYgYWZ0ZXIg
ZXJhc2UgYnV0IGJlZm9yZSBoZWFkZXIgd3JpdGU/IFdlCiAqIG5lZWQgdG8gZ3Vlc3RpbWF0ZSB0
aGUgZXJhc2UgY291bnQuCiAqLwpzdGF0aWMgdm9pZCBtdGRzd2FwX2NoZWNrX2NvdW50cyhzdHJ1
Y3QgbXRkc3dhcF9kZXYgKmQpCnsKCXN0cnVjdCByYl9yb290IGhpc3Rfcm9vdCA9IFJCX1JPT1Q7
CglzdHJ1Y3QgcmJfbm9kZSAqbWVkcmI7CglzdHJ1Y3Qgc3dhcF9lYiAqZWI7Cgl1bnNpZ25lZCBp
bnQgaSwgY250LCBtZWRpYW47CgoJY250ID0gMDsKCWZvciAoaSA9IDA7IGkgPCBkLT5lYmxrczsg
aSsrKSB7CgkJZWIgPSBkLT5lYl9kYXRhICsgaTsKCgkJaWYgKGViLT5mbGFncyAmIChFQkxPQ0tf
Tk9NQUdJQyB8IEVCTE9DS19CQUQgfCBFQkxPQ0tfUkVBREVSUikpCgkJCWNvbnRpbnVlOwoKCQlf
X210ZHN3YXBfcmJfYWRkKCZoaXN0X3Jvb3QsIGViKTsKCQljbnQrKzsKCX0KCglpZiAoY250ID09
IDApCgkJcmV0dXJuOwoKCW1lZHJiID0gbXRkc3dhcF9yYl9pbmRleCgmaGlzdF9yb290LCBjbnQg
LyAyKTsKCW1lZGlhbiA9IHJiX2VudHJ5KG1lZHJiLCBzdHJ1Y3Qgc3dhcF9lYiwgcmIpLT5lcmFz
ZV9jb3VudDsKCglkLT5tYXhfZXJhc2VfY291bnQgPSBNVERTV0FQX0VDTlRfTUFYKCZoaXN0X3Jv
b3QpOwoKCWZvciAoaSA9IDA7IGkgPCBkLT5lYmxrczsgaSsrKSB7CgkJZWIgPSBkLT5lYl9kYXRh
ICsgaTsKCgkJaWYgKGViLT5mbGFncyAmIChFQkxPQ0tfTk9NQUdJQyB8IEVCTE9DS19SRUFERVJS
KSkKCQkJZWItPmVyYXNlX2NvdW50ID0gbWVkaWFuOwoKCQlpZiAoZWItPmZsYWdzICYgKEVCTE9D
S19OT01BR0lDIHwgRUJMT0NLX0JBRCB8IEVCTE9DS19SRUFERVJSKSkKCQkJY29udGludWU7CgoJ
CXJiX2VyYXNlKCZlYi0+cmIsICZoaXN0X3Jvb3QpOwoJfQp9CgpzdGF0aWMgdm9pZCBtdGRzd2Fw
X3NjYW5fZWJsa3Moc3RydWN0IG10ZHN3YXBfZGV2ICpkKQp7CglpbnQgc3RhdHVzOwoJdW5zaWdu
ZWQgaW50IGksIGlkeDsKCXN0cnVjdCBzd2FwX2ViICplYjsKCglmb3IgKGkgPSAwOyBpIDwgZC0+
ZWJsa3M7IGkrKykgewoJCWViID0gZC0+ZWJfZGF0YSArIGk7CgoJCXN0YXR1cyA9IG10ZHN3YXBf
cmVhZF9tYXJrZXJzKGQsIGViKTsKCQlpZiAoc3RhdHVzIDwgMCkKCQkJZWItPmZsYWdzIHw9IEVC
TE9DS19SRUFERVJSOwoJCWVsc2UgaWYgKHN0YXR1cyA9PSBNVERTV0FQX1NDQU5ORURfQkFEKSB7
CgkJCWViLT5mbGFncyB8PSBFQkxPQ0tfQkFEOwoJCQljb250aW51ZTsKCQl9CgoJCXN3aXRjaCAo
c3RhdHVzKSB7CgkJY2FzZSBNVERTV0FQX1NDQU5ORURfQ0xFQU46CgkJCWlkeCA9IE1URFNXQVBf
Q0xFQU47CgkJCWJyZWFrOwoJCWNhc2UgTVREU1dBUF9TQ0FOTkVEX0RJUlRZOgoJCWNhc2UgTVRE
U1dBUF9TQ0FOTkVEX0JJVEZMSVA6CgkJCWlkeCA9IE1URFNXQVBfRElSVFk7CgkJCWJyZWFrOwoJ
CWRlZmF1bHQ6CgkJCWlkeCA9IE1URFNXQVBfRkFJTElORzsKCQl9CgoJCWViLT5mbGFncyB8PSAo
aWR4IDw8IEVCTE9DS19JRFhfU0hJRlQpOwoJfQoKCW10ZHN3YXBfY2hlY2tfY291bnRzKGQpOwoK
CWZvciAoaSA9IDA7IGkgPCBkLT5lYmxrczsgaSsrKSB7CgkJZWIgPSBkLT5lYl9kYXRhICsgaTsK
CgkJaWYgKGViLT5mbGFncyAmIEVCTE9DS19CQUQpCgkJCWNvbnRpbnVlOwoKCQlpZHggPSBlYi0+
ZmxhZ3MgPj4gRUJMT0NLX0lEWF9TSElGVDsKCQltdGRzd2FwX3JiX2FkZChkLCBlYiwgaWR4KTsK
CX0KfQoKLyoKICogUGxhY2UgZWJsayBpbnRvIGEgdHJlZSBjb3JyZXNwb25kaW5nIHRvIGl0cyBu
dW1iZXIgb2YgYWN0aXZlIGJsb2NrcwogKiBpdCBjb250YWlucy4KICovCnN0YXRpYyB2b2lkIG10
ZHN3YXBfc3RvcmVfZWIoc3RydWN0IG10ZHN3YXBfZGV2ICpkLCBzdHJ1Y3Qgc3dhcF9lYiAqZWIp
CnsKCXVuc2lnbmVkIGludCB3ZWlnaHQgPSBlYi0+YWN0aXZlX2NvdW50OwoJdW5zaWduZWQgaW50
IG1heHdlaWdodCA9IGQtPnBhZ2VzX3Blcl9lYmxrOwoKCWlmIChlYiA9PSBkLT5jdXJyX3dyaXRl
KQoJCXJldHVybjsKCglpZiAoZWItPmZsYWdzICYgRUJMT0NLX0JJVEZMSVApCgkJbXRkc3dhcF9y
Yl9hZGQoZCwgZWIsIE1URFNXQVBfQklURkxJUCk7CgllbHNlIGlmIChlYi0+ZmxhZ3MgJiAoRUJM
T0NLX1JFQURFUlIgfCBFQkxPQ0tfRkFJTEVEKSkKCQltdGRzd2FwX3JiX2FkZChkLCBlYiwgTVRE
U1dBUF9GQUlMSU5HKTsKCWlmICh3ZWlnaHQgPT0gbWF4d2VpZ2h0KQoJCW10ZHN3YXBfcmJfYWRk
KGQsIGViLCBNVERTV0FQX1VTRUQpOwoJZWxzZSBpZiAod2VpZ2h0ID09IDApCgkJbXRkc3dhcF9y
Yl9hZGQoZCwgZWIsIE1URFNXQVBfRElSVFkpOwoJZWxzZSBpZiAod2VpZ2h0ID4gKG1heHdlaWdo
dC8yKSkKCQltdGRzd2FwX3JiX2FkZChkLCBlYiwgTVREU1dBUF9MT1dGUkFHKTsKCWVsc2UKCQlt
dGRzd2FwX3JiX2FkZChkLCBlYiwgTVREU1dBUF9ISUZSQUcpOwp9CgpzdGF0aWMgaW50IG10ZHN3
YXBfZXJhc2VfYmxvY2soc3RydWN0IG10ZHN3YXBfZGV2ICpkLCBzdHJ1Y3Qgc3dhcF9lYiAqZWIp
CnsKCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZC0+bXRkOwoJc3RydWN0IGVyYXNlX2luZm8gZXJh
c2U7Cgl1bnNpZ25lZCBpbnQgcmV0cmllcyA9IDA7CglpbnQgcmV0OwoKCWViLT5lcmFzZV9jb3Vu
dCsrOwoJaWYgKGViLT5lcmFzZV9jb3VudCA+IGQtPm1heF9lcmFzZV9jb3VudCkKCQlkLT5tYXhf
ZXJhc2VfY291bnQgPSBlYi0+ZXJhc2VfY291bnQ7CgpyZXRyeToKCW1lbXNldCgmZXJhc2UsIDAs
IHNpemVvZihzdHJ1Y3QgZXJhc2VfaW5mbykpOwoJZXJhc2UuYWRkcgk9IG10ZHN3YXBfZWJfb2Zm
c2V0KGQsIGViKTsKCWVyYXNlLmxlbgk9IG10ZC0+ZXJhc2VzaXplOwoKCXJldCA9IG10ZF9lcmFz
ZShtdGQsICZlcmFzZSk7CglpZiAocmV0KSB7CgkJaWYgKHJldHJpZXMrKyA8IE1URFNXQVBfRVJB
U0VfUkVUUklFUykgewoJCQlkZXZfd2FybihkLT5kZXYsCgkJCQkiZXJhc2Ugb2YgZXJhc2UgYmxv
Y2sgJSNsbHggb24gJXMgZmFpbGVkIiwKCQkJCWVyYXNlLmFkZHIsIG10ZC0+bmFtZSk7CgkJCXlp
ZWxkKCk7CgkJCWdvdG8gcmV0cnk7CgkJfQoKCQlkZXZfZXJyKGQtPmRldiwgIkNhbm5vdCBlcmFz
ZSBlcmFzZSBibG9jayAlI2xseCBvbiAlc1xuIiwKCQkJZXJhc2UuYWRkciwgbXRkLT5uYW1lKTsK
CgkJbXRkc3dhcF9oYW5kbGVfYmFkYmxvY2soZCwgZWIpOwoJCXJldHVybiAtRUlPOwoJfQoKCXJl
dHVybiAwOwp9CgpzdGF0aWMgaW50IG10ZHN3YXBfbWFwX2ZyZWVfYmxvY2soc3RydWN0IG10ZHN3
YXBfZGV2ICpkLCB1bnNpZ25lZCBpbnQgcGFnZSwKCQkJCXVuc2lnbmVkIGludCAqYmxvY2spCnsK
CWludCByZXQ7CglzdHJ1Y3Qgc3dhcF9lYiAqb2xkX2ViID0gZC0+Y3Vycl93cml0ZTsKCXN0cnVj
dCByYl9yb290ICpjbGVhbl9yb290OwoJc3RydWN0IHN3YXBfZWIgKmViOwoKCWlmIChvbGRfZWIg
PT0gTlVMTCB8fCBkLT5jdXJyX3dyaXRlX3BvcyA+PSBkLT5wYWdlc19wZXJfZWJsaykgewoJCWRv
IHsKCQkJaWYgKFRSRUVfRU1QVFkoZCwgQ0xFQU4pKQoJCQkJcmV0dXJuIC1FTk9TUEM7CgoJCQlj
bGVhbl9yb290ID0gVFJFRV9ST09UKGQsIENMRUFOKTsKCQkJZWIgPSByYl9lbnRyeShyYl9maXJz
dChjbGVhbl9yb290KSwgc3RydWN0IHN3YXBfZWIsIHJiKTsKCQkJcmJfZXJhc2UoJmViLT5yYiwg
Y2xlYW5fcm9vdCk7CgkJCWViLT5yb290ID0gTlVMTDsKCQkJVFJFRV9DT1VOVChkLCBDTEVBTikt
LTsKCgkJCXJldCA9IG10ZHN3YXBfd3JpdGVfbWFya2VyKGQsIGViLCBNVERTV0FQX1RZUEVfRElS
VFkpOwoJCX0gd2hpbGUgKHJldCA9PSAtRUlPIHx8IG10ZF9pc19lY2NlcnIocmV0KSk7CgoJCWlm
IChyZXQpCgkJCXJldHVybiByZXQ7CgoJCWQtPmN1cnJfd3JpdGVfcG9zID0gMDsKCQlkLT5jdXJy
X3dyaXRlID0gZWI7CgkJaWYgKG9sZF9lYikKCQkJbXRkc3dhcF9zdG9yZV9lYihkLCBvbGRfZWIp
OwoJfQoKCSpibG9jayA9IChkLT5jdXJyX3dyaXRlIC0gZC0+ZWJfZGF0YSkgKiBkLT5wYWdlc19w
ZXJfZWJsayArCgkJZC0+Y3Vycl93cml0ZV9wb3M7CgoJZC0+Y3Vycl93cml0ZS0+YWN0aXZlX2Nv
dW50Kys7CglkLT5yZXZtYXBbKmJsb2NrXSA9IHBhZ2U7CglkLT5jdXJyX3dyaXRlX3BvcysrOwoK
CXJldHVybiAwOwp9CgpzdGF0aWMgdW5zaWduZWQgaW50IG10ZHN3YXBfZnJlZV9wYWdlX2NudChz
dHJ1Y3QgbXRkc3dhcF9kZXYgKmQpCnsKCXJldHVybiBUUkVFX0NPVU5UKGQsIENMRUFOKSAqIGQt
PnBhZ2VzX3Blcl9lYmxrICsKCQlkLT5wYWdlc19wZXJfZWJsayAtIGQtPmN1cnJfd3JpdGVfcG9z
Owp9CgpzdGF0aWMgdW5zaWduZWQgaW50IG10ZHN3YXBfZW5vdWdoX2ZyZWVfcGFnZXMoc3RydWN0
IG10ZHN3YXBfZGV2ICpkKQp7CglyZXR1cm4gbXRkc3dhcF9mcmVlX3BhZ2VfY250KGQpID4gZC0+
cGFnZXNfcGVyX2VibGs7Cn0KCnN0YXRpYyBsb2ZmX3QgbXRkc3dhcF9ibG9ja3Bvc190b19tdGRw
b3Moc3RydWN0IG10ZHN3YXBfZGV2ICpkLCB1bnNpZ25lZCBpbnQgYnApCnsKCXVuc2lnbmVkIGlu
dCBlYmxrID0gYnAgLyBkLT5wYWdlc19wZXJfZWJsazsKCXVuc2lnbmVkIGludCBwYWdlX29mZnNl
dF9pbl9lYmxrID0gYnAgJSBkLT5wYWdlc19wZXJfZWJsazsKCglyZXR1cm4gZWJsayAqIGQtPm10
ZC0+ZXJhc2VzaXplICsgKHBhZ2Vfb2Zmc2V0X2luX2VibGsgPDwgUEFHRV9TSElGVCk7Cn0KCnN0
YXRpYyBpbnQgbXRkc3dhcF93cml0ZV9ibG9jayhzdHJ1Y3QgbXRkc3dhcF9kZXYgKmQsIGNoYXIg
KmJ1ZiwKCQkJdW5zaWduZWQgaW50IHBhZ2UsIHVuc2lnbmVkIGludCAqYnAsIGludCBnY19jb250
ZXh0KQp7CglzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IGQtPm10ZDsKCXN0cnVjdCBzd2FwX2ViICpl
YjsKCXNpemVfdCByZXRsZW47Cglsb2ZmX3Qgd3JpdGVwb3M7CglpbnQgcmV0OwoKcmV0cnk6Cglp
ZiAoIWdjX2NvbnRleHQpCgkJd2hpbGUgKCFtdGRzd2FwX2Vub3VnaF9mcmVlX3BhZ2VzKGQpKQoJ
CQlpZiAobXRkc3dhcF9nYyhkLCAwKSA+IDApCgkJCQlyZXR1cm4gLUVOT1NQQzsKCglyZXQgPSBt
dGRzd2FwX21hcF9mcmVlX2Jsb2NrKGQsIHBhZ2UsIGJwKTsKCWViID0gZC0+ZWJfZGF0YSArICgq
YnAgLyBkLT5wYWdlc19wZXJfZWJsayk7CgoJaWYgKHJldCA9PSAtRUlPIHx8IG10ZF9pc19lY2Nl
cnIocmV0KSkgewoJCWQtPmN1cnJfd3JpdGUgPSBOVUxMOwoJCWViLT5hY3RpdmVfY291bnQtLTsK
CQlkLT5yZXZtYXBbKmJwXSA9IFBBR0VfVU5ERUY7CgkJZ290byByZXRyeTsKCX0KCglpZiAocmV0
IDwgMCkKCQlyZXR1cm4gcmV0OwoKCXdyaXRlcG9zID0gbXRkc3dhcF9ibG9ja3Bvc190b19tdGRw
b3MoZCwgKmJwKTsKCXJldCA9ICBtdGRfd3JpdGUobXRkLCB3cml0ZXBvcywgUEFHRV9TSVpFLCAm
cmV0bGVuLCBidWYpOwoJaWYgKHJldCA9PSAtRUlPIHx8IG10ZF9pc19lY2NlcnIocmV0KSkgewoJ
CWQtPmN1cnJfd3JpdGVfcG9zLS07CgkJZWItPmFjdGl2ZV9jb3VudC0tOwoJCWQtPnJldm1hcFsq
YnBdID0gUEFHRV9VTkRFRjsKCQltdGRzd2FwX2hhbmRsZV93cml0ZV9lcnJvcihkLCBlYik7CgkJ
Z290byByZXRyeTsKCX0KCglpZiAocmV0IDwgMCkgewoJCWRldl9lcnIoZC0+ZGV2LCAiV3JpdGUg
dG8gTVREIGRldmljZSBmYWlsZWQ6ICVkICglemQgd3JpdHRlbikiLAoJCQlyZXQsIHJldGxlbik7
CgkJZ290byBlcnI7Cgl9CgoJaWYgKHJldGxlbiAhPSBQQUdFX1NJWkUpIHsKCQlkZXZfZXJyKGQt
PmRldiwgIlNob3J0IHdyaXRlIHRvIE1URCBkZXZpY2U6ICV6ZCB3cml0dGVuIiwKCQkJcmV0bGVu
KTsKCQlyZXQgPSAtRUlPOwoJCWdvdG8gZXJyOwoJfQoKCXJldHVybiByZXQ7CgplcnI6CglkLT5j
dXJyX3dyaXRlX3Bvcy0tOwoJZWItPmFjdGl2ZV9jb3VudC0tOwoJZC0+cmV2bWFwWypicF0gPSBQ
QUdFX1VOREVGOwoKCXJldHVybiByZXQ7Cn0KCnN0YXRpYyBpbnQgbXRkc3dhcF9tb3ZlX2Jsb2Nr
KHN0cnVjdCBtdGRzd2FwX2RldiAqZCwgdW5zaWduZWQgaW50IG9sZGJsb2NrLAoJCXVuc2lnbmVk
IGludCAqbmV3YmxvY2spCnsKCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZC0+bXRkOwoJc3RydWN0
IHN3YXBfZWIgKmViLCAqb2xkZWI7CglpbnQgcmV0OwoJc2l6ZV90IHJldGxlbjsKCXVuc2lnbmVk
IGludCBwYWdlLCByZXRyaWVzOwoJbG9mZl90IHJlYWRwb3M7CgoJcGFnZSA9IGQtPnJldm1hcFtv
bGRibG9ja107CglyZWFkcG9zID0gbXRkc3dhcF9ibG9ja3Bvc190b19tdGRwb3MoZCwgb2xkYmxv
Y2spOwoJcmV0cmllcyA9IDA7CgpyZXRyeToKCXJldCA9IG10ZF9yZWFkKG10ZCwgcmVhZHBvcywg
UEFHRV9TSVpFLCAmcmV0bGVuLCBkLT5wYWdlX2J1Zik7CgoJaWYgKHJldCA8IDAgJiYgIW10ZF9p
c19iaXRmbGlwKHJldCkpIHsKCQlvbGRlYiA9IGQtPmViX2RhdGEgKyBvbGRibG9jayAvIGQtPnBh
Z2VzX3Blcl9lYmxrOwoJCW9sZGViLT5mbGFncyB8PSBFQkxPQ0tfUkVBREVSUjsKCgkJZGV2X2Vy
cihkLT5kZXYsICJSZWFkIEVycm9yOiAlZCAoYmxvY2sgJXUpXG4iLCByZXQsCgkJCW9sZGJsb2Nr
KTsKCQlyZXRyaWVzKys7CgkJaWYgKHJldHJpZXMgPCBNVERTV0FQX0lPX1JFVFJJRVMpCgkJCWdv
dG8gcmV0cnk7CgoJCWdvdG8gcmVhZF9lcnJvcjsKCX0KCglpZiAocmV0bGVuICE9IFBBR0VfU0la
RSkgewoJCWRldl9lcnIoZC0+ZGV2LCAiU2hvcnQgcmVhZDogJXpkIChibG9jayAldSlcbiIsIHJl
dGxlbiwKCQkgICAgICAgb2xkYmxvY2spOwoJCXJldCA9IC1FSU87CgkJZ290byByZWFkX2Vycm9y
OwoJfQoKCXJldCA9IG10ZHN3YXBfd3JpdGVfYmxvY2soZCwgZC0+cGFnZV9idWYsIHBhZ2UsIG5l
d2Jsb2NrLCAxKTsKCWlmIChyZXQgPCAwKSB7CgkJZC0+cGFnZV9kYXRhW3BhZ2VdID0gQkxPQ0tf
RVJST1I7CgkJZGV2X2VycihkLT5kZXYsICJXcml0ZSBlcnJvcjogJWRcbiIsIHJldCk7CgkJcmV0
dXJuIHJldDsKCX0KCgllYiA9IGQtPmViX2RhdGEgKyAqbmV3YmxvY2sgLyBkLT5wYWdlc19wZXJf
ZWJsazsKCWQtPnBhZ2VfZGF0YVtwYWdlXSA9ICpuZXdibG9jazsKCWQtPnJldm1hcFtvbGRibG9j
a10gPSBQQUdFX1VOREVGOwoJZWIgPSBkLT5lYl9kYXRhICsgb2xkYmxvY2sgLyBkLT5wYWdlc19w
ZXJfZWJsazsKCWViLT5hY3RpdmVfY291bnQtLTsKCglyZXR1cm4gMDsKCnJlYWRfZXJyb3I6Cglk
LT5wYWdlX2RhdGFbcGFnZV0gPSBCTE9DS19FUlJPUjsKCWQtPnJldm1hcFtvbGRibG9ja10gPSBQ
QUdFX1VOREVGOwoJcmV0dXJuIHJldDsKfQoKc3RhdGljIGludCBtdGRzd2FwX2djX2VibG9jayhz
dHJ1Y3QgbXRkc3dhcF9kZXYgKmQsIHN0cnVjdCBzd2FwX2ViICplYikKewoJdW5zaWduZWQgaW50
IGksIGJsb2NrLCBlYmxrX2Jhc2UsIG5ld2Jsb2NrOwoJaW50IHJldCwgZXJyY29kZTsKCgllcnJj
b2RlID0gMDsKCWVibGtfYmFzZSA9IChlYiAtIGQtPmViX2RhdGEpICogZC0+cGFnZXNfcGVyX2Vi
bGs7CgoJZm9yIChpID0gMDsgaSA8IGQtPnBhZ2VzX3Blcl9lYmxrOyBpKyspIHsKCQlpZiAoZC0+
c3BhcmVfZWJsa3MgPCBNSU5fU1BBUkVfRUJMT0NLUykKCQkJcmV0dXJuIC1FTk9TUEM7CgoJCWJs
b2NrID0gZWJsa19iYXNlICsgaTsKCQlpZiAoZC0+cmV2bWFwW2Jsb2NrXSA9PSBQQUdFX1VOREVG
KQoJCQljb250aW51ZTsKCgkJcmV0ID0gbXRkc3dhcF9tb3ZlX2Jsb2NrKGQsIGJsb2NrLCAmbmV3
YmxvY2spOwoJCWlmIChyZXQgPCAwICYmICFlcnJjb2RlKQoJCQllcnJjb2RlID0gcmV0OwoJfQoK
CXJldHVybiBlcnJjb2RlOwp9CgpzdGF0aWMgaW50IF9fbXRkc3dhcF9jaG9vc2VfZ2NfdHJlZShz
dHJ1Y3QgbXRkc3dhcF9kZXYgKmQpCnsKCWludCBpZHgsIHN0b3BhdDsKCglpZiAoVFJFRV9DT1VO
VChkLCBDTEVBTikgPCBMT1dfRlJBR19HQ19USFJFU0hPTEQpCgkJc3RvcGF0ID0gTVREU1dBUF9M
T1dGUkFHOwoJZWxzZQoJCXN0b3BhdCA9IE1URFNXQVBfSElGUkFHOwoKCWZvciAoaWR4ID0gTVRE
U1dBUF9CSVRGTElQOyBpZHggPj0gc3RvcGF0OyBpZHgtLSkKCQlpZiAoZC0+dHJlZXNbaWR4XS5y
b290LnJiX25vZGUgIT0gTlVMTCkKCQkJcmV0dXJuIGlkeDsKCglyZXR1cm4gLTE7Cn0KCnN0YXRp
YyBpbnQgbXRkc3dhcF93bGZyZXEodW5zaWduZWQgaW50IG1heGRpZmYpCnsKCXVuc2lnbmVkIGlu
dCBoLCB4LCB5LCBkaXN0LCBiYXNlOwoKCS8qCgkgKiBDYWxjdWxhdGUgbGluZWFyIHJhbXAgZG93
biBmcm9tIGYxIHRvIGYyIHdoZW4gbWF4ZGlmZiBnb2VzIGZyb20KCSAqIE1BWF9FUkFTRV9ESUZG
IHRvIE1BWF9FUkFTRV9ESUZGICsgQ09MTEVDVF9OT05ESVJUWV9CQVNFLiAgU2ltaWxhcgoJICog
dG8gdHJpYW5nbGUgd2l0aCBoZWlnaHQgZjEgLSBmMSBhbmQgd2lkdGggQ09MTEVDVF9OT05ESVJU
WV9CQVNFLgoJICovCgoJZGlzdCA9IG1heGRpZmYgLSBNQVhfRVJBU0VfRElGRjsKCWlmIChkaXN0
ID4gQ09MTEVDVF9OT05ESVJUWV9CQVNFKQoJCWRpc3QgPSBDT0xMRUNUX05PTkRJUlRZX0JBU0U7
CgoJLyoKCSAqIE1vZGVsbGluZyB0aGUgc2xvcCBhcyByaWdodCBhbmd1bGFyIHRyaWFuZ2xlIHdp
dGggYmFzZQoJICogQ09MTEVDVF9OT05ESVJUWV9CQVNFIGFuZCBoZWlnaHQgZnJlcTEgLSBmcmVx
Mi4gVGhlIHJhdGlvIHkveCBpcwoJICogZXF1YWwgdG8gdGhlIHJhdGlvIGgvYmFzZS4KCSAqLwoJ
aCA9IENPTExFQ1RfTk9ORElSVFlfRlJFUTEgLSBDT0xMRUNUX05PTkRJUlRZX0ZSRVEyOwoJYmFz
ZSA9IENPTExFQ1RfTk9ORElSVFlfQkFTRTsKCgl4ID0gZGlzdCAtIGJhc2U7Cgl5ID0gKHggKiBo
ICsgYmFzZSAvIDIpIC8gYmFzZTsKCglyZXR1cm4gQ09MTEVDVF9OT05ESVJUWV9GUkVRMiArIHk7
Cn0KCnN0YXRpYyBpbnQgbXRkc3dhcF9jaG9vc2Vfd2xfdHJlZShzdHJ1Y3QgbXRkc3dhcF9kZXYg
KmQpCnsKCXN0YXRpYyB1bnNpZ25lZCBpbnQgcGlja19jbnQ7Cgl1bnNpZ25lZCBpbnQgaSwgaWR4
ID0gLTEsIHdlYXIsIG1heDsKCXN0cnVjdCByYl9yb290ICpyb290OwoKCW1heCA9IDA7Cglmb3Ig
KGkgPSAwOyBpIDw9IE1URFNXQVBfRElSVFk7IGkrKykgewoJCXJvb3QgPSAmZC0+dHJlZXNbaV0u
cm9vdDsKCQlpZiAocm9vdC0+cmJfbm9kZSA9PSBOVUxMKQoJCQljb250aW51ZTsKCgkJd2VhciA9
IGQtPm1heF9lcmFzZV9jb3VudCAtIE1URFNXQVBfRUNOVF9NSU4ocm9vdCk7CgkJaWYgKHdlYXIg
PiBtYXgpIHsKCQkJbWF4ID0gd2VhcjsKCQkJaWR4ID0gaTsKCQl9Cgl9CgoJaWYgKG1heCA+IE1B
WF9FUkFTRV9ESUZGICYmIHBpY2tfY250ID49IG10ZHN3YXBfd2xmcmVxKG1heCkgLSAxKSB7CgkJ
cGlja19jbnQgPSAwOwoJCXJldHVybiBpZHg7Cgl9CgoJcGlja19jbnQrKzsKCXJldHVybiAtMTsK
fQoKc3RhdGljIGludCBtdGRzd2FwX2Nob29zZV9nY190cmVlKHN0cnVjdCBtdGRzd2FwX2RldiAq
ZCwKCQkJCXVuc2lnbmVkIGludCBiYWNrZ3JvdW5kKQp7CglpbnQgaWR4OwoKCWlmIChUUkVFX05P
TkVNUFRZKGQsIEZBSUxJTkcpICYmCgkJKGJhY2tncm91bmQgfHwgKFRSRUVfRU1QVFkoZCwgQ0xF
QU4pICYmIFRSRUVfRU1QVFkoZCwgRElSVFkpKSkpCgkJcmV0dXJuIE1URFNXQVBfRkFJTElORzsK
CglpZHggPSBtdGRzd2FwX2Nob29zZV93bF90cmVlKGQpOwoJaWYgKGlkeCA+PSBNVERTV0FQX0NM
RUFOKQoJCXJldHVybiBpZHg7CgoJcmV0dXJuIF9fbXRkc3dhcF9jaG9vc2VfZ2NfdHJlZShkKTsK
fQoKc3RhdGljIHN0cnVjdCBzd2FwX2ViICptdGRzd2FwX3BpY2tfZ2NfZWJsayhzdHJ1Y3QgbXRk
c3dhcF9kZXYgKmQsCgkJCQkJdW5zaWduZWQgaW50IGJhY2tncm91bmQpCnsKCXN0cnVjdCByYl9y
b290ICpycCA9IE5VTEw7CglzdHJ1Y3Qgc3dhcF9lYiAqZWIgPSBOVUxMOwoJaW50IGlkeDsKCglp
ZiAoYmFja2dyb3VuZCAmJiBUUkVFX0NPVU5UKGQsIENMRUFOKSA+IENMRUFOX0JMT0NLX1RIUkVT
SE9MRCAmJgoJCVRSRUVfRU1QVFkoZCwgRElSVFkpICYmIFRSRUVfRU1QVFkoZCwgRkFJTElORykp
CgkJcmV0dXJuIE5VTEw7CgoJaWR4ID0gbXRkc3dhcF9jaG9vc2VfZ2NfdHJlZShkLCBiYWNrZ3Jv
dW5kKTsKCWlmIChpZHggPCAwKQoJCXJldHVybiBOVUxMOwoKCXJwID0gJmQtPnRyZWVzW2lkeF0u
cm9vdDsKCWViID0gcmJfZW50cnkocmJfZmlyc3QocnApLCBzdHJ1Y3Qgc3dhcF9lYiwgcmIpOwoK
CXJiX2VyYXNlKCZlYi0+cmIsIHJwKTsKCWViLT5yb290ID0gTlVMTDsKCWQtPnRyZWVzW2lkeF0u
Y291bnQtLTsKCXJldHVybiBlYjsKfQoKc3RhdGljIHVuc2lnbmVkIGludCBtdGRzd2FwX3Rlc3Rf
cGF0dCh1bnNpZ25lZCBpbnQgaSkKewoJcmV0dXJuIGkgJSAyID8gMHg1NTU1NTU1NSA6IDB4QUFB
QUFBQUE7Cn0KCnN0YXRpYyB1bnNpZ25lZCBpbnQgbXRkc3dhcF9lYmxrX3Bhc3NlcyhzdHJ1Y3Qg
bXRkc3dhcF9kZXYgKmQsCgkJCQkJc3RydWN0IHN3YXBfZWIgKmViKQp7CglzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCA9IGQtPm10ZDsKCXVuc2lnbmVkIGludCB0ZXN0LCBpLCBqLCBwYXR0LCBtdGRfcGFn
ZXM7Cglsb2ZmX3QgYmFzZSwgcG9zOwoJdW5zaWduZWQgaW50ICpwMSA9ICh1bnNpZ25lZCBpbnQg
KilkLT5wYWdlX2J1ZjsKCXVuc2lnbmVkIGNoYXIgKnAyID0gKHVuc2lnbmVkIGNoYXIgKilkLT5v
b2JfYnVmOwoJc3RydWN0IG10ZF9vb2Jfb3BzIG9wczsKCWludCByZXQ7CgoJb3BzLm1vZGUgPSBN
VERfT1BTX0FVVE9fT09COwoJb3BzLmxlbiA9IG10ZC0+d3JpdGVzaXplOwoJb3BzLm9vYmxlbiA9
IG10ZC0+b29iYXZhaWw7CglvcHMub29ib2ZmcyA9IDA7CglvcHMuZGF0YnVmID0gZC0+cGFnZV9i
dWY7CglvcHMub29iYnVmID0gZC0+b29iX2J1ZjsKCWJhc2UgPSBtdGRzd2FwX2ViX29mZnNldChk
LCBlYik7CgltdGRfcGFnZXMgPSBkLT5wYWdlc19wZXJfZWJsayAqIFBBR0VfU0laRSAvIG10ZC0+
d3JpdGVzaXplOwoKCWZvciAodGVzdCA9IDA7IHRlc3QgPCAyOyB0ZXN0KyspIHsKCQlwb3MgPSBi
YXNlOwoJCWZvciAoaSA9IDA7IGkgPCBtdGRfcGFnZXM7IGkrKykgewoJCQlwYXR0ID0gbXRkc3dh
cF90ZXN0X3BhdHQodGVzdCArIGkpOwoJCQltZW1zZXQoZC0+cGFnZV9idWYsIHBhdHQsIG10ZC0+
d3JpdGVzaXplKTsKCQkJbWVtc2V0KGQtPm9vYl9idWYsIHBhdHQsIG10ZC0+b29iYXZhaWwpOwoJ
CQlyZXQgPSBtdGRfd3JpdGVfb29iKG10ZCwgcG9zLCAmb3BzKTsKCQkJaWYgKHJldCkKCQkJCWdv
dG8gZXJyb3I7CgoJCQlwb3MgKz0gbXRkLT53cml0ZXNpemU7CgkJfQoKCQlwb3MgPSBiYXNlOwoJ
CWZvciAoaSA9IDA7IGkgPCBtdGRfcGFnZXM7IGkrKykgewoJCQlyZXQgPSBtdGRfcmVhZF9vb2Io
bXRkLCBwb3MsICZvcHMpOwoJCQlpZiAocmV0KQoJCQkJZ290byBlcnJvcjsKCgkJCXBhdHQgPSBt
dGRzd2FwX3Rlc3RfcGF0dCh0ZXN0ICsgaSk7CgkJCWZvciAoaiA9IDA7IGogPCBtdGQtPndyaXRl
c2l6ZS9zaXplb2YoaW50KTsgaisrKQoJCQkJaWYgKHAxW2pdICE9IHBhdHQpCgkJCQkJZ290byBl
cnJvcjsKCgkJCWZvciAoaiA9IDA7IGogPCBtdGQtPm9vYmF2YWlsOyBqKyspCgkJCQlpZiAocDJb
al0gIT0gKHVuc2lnbmVkIGNoYXIpcGF0dCkKCQkJCQlnb3RvIGVycm9yOwoKCQkJcG9zICs9IG10
ZC0+d3JpdGVzaXplOwoJCX0KCgkJcmV0ID0gbXRkc3dhcF9lcmFzZV9ibG9jayhkLCBlYik7CgkJ
aWYgKHJldCkKCQkJZ290byBlcnJvcjsKCX0KCgllYi0+ZmxhZ3MgJj0gfkVCTE9DS19SRUFERVJS
OwoJcmV0dXJuIDE7CgplcnJvcjoKCW10ZHN3YXBfaGFuZGxlX2JhZGJsb2NrKGQsIGViKTsKCXJl
dHVybiAwOwp9CgpzdGF0aWMgaW50IG10ZHN3YXBfZ2Moc3RydWN0IG10ZHN3YXBfZGV2ICpkLCB1
bnNpZ25lZCBpbnQgYmFja2dyb3VuZCkKewoJc3RydWN0IHN3YXBfZWIgKmViOwoJaW50IHJldDsK
CglpZiAoZC0+c3BhcmVfZWJsa3MgPCBNSU5fU1BBUkVfRUJMT0NLUykKCQlyZXR1cm4gMTsKCgll
YiA9IG10ZHN3YXBfcGlja19nY19lYmxrKGQsIGJhY2tncm91bmQpOwoJaWYgKCFlYikKCQlyZXR1
cm4gMTsKCglyZXQgPSBtdGRzd2FwX2djX2VibG9jayhkLCBlYik7CglpZiAocmV0ID09IC1FTk9T
UEMpCgkJcmV0dXJuIDE7CgoJaWYgKGViLT5mbGFncyAmIEVCTE9DS19GQUlMRUQpIHsKCQltdGRz
d2FwX2hhbmRsZV9iYWRibG9jayhkLCBlYik7CgkJcmV0dXJuIDA7Cgl9CgoJZWItPmZsYWdzICY9
IH5FQkxPQ0tfQklURkxJUDsKCXJldCA9IG10ZHN3YXBfZXJhc2VfYmxvY2soZCwgZWIpOwoJaWYg
KChlYi0+ZmxhZ3MgJiBFQkxPQ0tfUkVBREVSUikgJiYKCQkocmV0IHx8ICFtdGRzd2FwX2Nhbl91
c2Vfb29iKGQtPm10ZCkgfHwgIW10ZHN3YXBfZWJsa19wYXNzZXMoZCwgZWIpKSkKCQlyZXR1cm4g
MDsKCglpZiAocmV0ID09IDApCgkJcmV0ID0gbXRkc3dhcF93cml0ZV9tYXJrZXIoZCwgZWIsIE1U
RFNXQVBfVFlQRV9DTEVBTik7CgoJaWYgKHJldCA9PSAwKQoJCW10ZHN3YXBfcmJfYWRkKGQsIGVi
LCBNVERTV0FQX0NMRUFOKTsKCWVsc2UgaWYgKHJldCAhPSAtRUlPICYmICFtdGRfaXNfZWNjZXJy
KHJldCkpCgkJbXRkc3dhcF9yYl9hZGQoZCwgZWIsIE1URFNXQVBfRElSVFkpOwoKCXJldHVybiAw
Owp9CgpzdGF0aWMgdm9pZCBtdGRzd2FwX2JhY2tncm91bmQoc3RydWN0IG10ZF9ibGt0cmFuc19k
ZXYgKmRldikKewoJc3RydWN0IG10ZHN3YXBfZGV2ICpkID0gTVREU1dBUF9NQkRfVE9fTVREU1dB
UChkZXYpOwoJaW50IHJldDsKCgl3aGlsZSAoMSkgewoJCXJldCA9IG10ZHN3YXBfZ2MoZCwgMSk7
CgkJaWYgKHJldCB8fCBtdGRfYmxrdHJhbnNfY2Vhc2VfYmFja2dyb3VuZChkZXYpKQoJCQlyZXR1
cm47Cgl9Cn0KCnN0YXRpYyB2b2lkIG10ZHN3YXBfY2xlYW51cChzdHJ1Y3QgbXRkc3dhcF9kZXYg
KmQpCnsKCXZmcmVlKGQtPmViX2RhdGEpOwoJdmZyZWUoZC0+cmV2bWFwKTsKCXZmcmVlKGQtPnBh
Z2VfZGF0YSk7CglrZnJlZShkLT5vb2JfYnVmKTsKCWtmcmVlKGQtPnBhZ2VfYnVmKTsKfQoKc3Rh
dGljIGludCBtdGRzd2FwX2ZsdXNoKHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpkZXYpCnsKCXN0
cnVjdCBtdGRzd2FwX2RldiAqZCA9IE1URFNXQVBfTUJEX1RPX01URFNXQVAoZGV2KTsKCgltdGRf
c3luYyhkLT5tdGQpOwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyB1bnNpZ25lZCBpbnQgbXRkc3dhcF9i
YWRibG9ja3Moc3RydWN0IG10ZF9pbmZvICptdGQsIHVpbnQ2NF90IHNpemUpCnsKCWxvZmZfdCBv
ZmZzZXQ7Cgl1bnNpZ25lZCBpbnQgYmFkY250OwoKCWJhZGNudCA9IDA7CgoJaWYgKG10ZF9jYW5f
aGF2ZV9iYihtdGQpKQoJCWZvciAob2Zmc2V0ID0gMDsgb2Zmc2V0IDwgc2l6ZTsgb2Zmc2V0ICs9
IG10ZC0+ZXJhc2VzaXplKQoJCQlpZiAobXRkX2Jsb2NrX2lzYmFkKG10ZCwgb2Zmc2V0KSkKCQkJ
CWJhZGNudCsrOwoKCXJldHVybiBiYWRjbnQ7Cn0KCnN0YXRpYyBpbnQgbXRkc3dhcF93cml0ZXNl
Y3Qoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldiwKCQkJdW5zaWduZWQgbG9uZyBwYWdlLCBj
aGFyICpidWYpCnsKCXN0cnVjdCBtdGRzd2FwX2RldiAqZCA9IE1URFNXQVBfTUJEX1RPX01URFNX
QVAoZGV2KTsKCXVuc2lnbmVkIGludCBuZXdibG9jaywgbWFwcGVkOwoJc3RydWN0IHN3YXBfZWIg
KmViOwoJaW50IHJldDsKCglkLT5zZWN0X3dyaXRlX2NvdW50Kys7CgoJaWYgKGQtPnNwYXJlX2Vi
bGtzIDwgTUlOX1NQQVJFX0VCTE9DS1MpCgkJcmV0dXJuIC1FTk9TUEM7CgoJaWYgKGhlYWRlcikg
ewoJCS8qIElnbm9yZSB3cml0ZXMgdG8gdGhlIGhlYWRlciBwYWdlICovCgkJaWYgKHVubGlrZWx5
KHBhZ2UgPT0gMCkpCgkJCXJldHVybiAwOwoKCQlwYWdlLS07Cgl9CgoJbWFwcGVkID0gZC0+cGFn
ZV9kYXRhW3BhZ2VdOwoJaWYgKG1hcHBlZCA8PSBCTE9DS19NQVgpIHsKCQllYiA9IGQtPmViX2Rh
dGEgKyAobWFwcGVkIC8gZC0+cGFnZXNfcGVyX2VibGspOwoJCWViLT5hY3RpdmVfY291bnQtLTsK
CQltdGRzd2FwX3N0b3JlX2ViKGQsIGViKTsKCQlkLT5wYWdlX2RhdGFbcGFnZV0gPSBCTE9DS19V
TkRFRjsKCQlkLT5yZXZtYXBbbWFwcGVkXSA9IFBBR0VfVU5ERUY7Cgl9CgoJcmV0ID0gbXRkc3dh
cF93cml0ZV9ibG9jayhkLCBidWYsIHBhZ2UsICZuZXdibG9jaywgMCk7CglkLT5tdGRfd3JpdGVf
Y291bnQrKzsKCglpZiAocmV0IDwgMCkKCQlyZXR1cm4gcmV0OwoKCWViID0gZC0+ZWJfZGF0YSAr
IChuZXdibG9jayAvIGQtPnBhZ2VzX3Blcl9lYmxrKTsKCWQtPnBhZ2VfZGF0YVtwYWdlXSA9IG5l
d2Jsb2NrOwoKCXJldHVybiAwOwp9CgovKiBQcm92aWRlIGEgZHVtbXkgc3dhcCBoZWFkZXIgZm9y
IHRoZSBrZXJuZWwgKi8Kc3RhdGljIGludCBtdGRzd2FwX2F1dG9faGVhZGVyKHN0cnVjdCBtdGRz
d2FwX2RldiAqZCwgY2hhciAqYnVmKQp7Cgl1bmlvbiBzd2FwX2hlYWRlciAqaGQgPSAodW5pb24g
c3dhcF9oZWFkZXIgKikoYnVmKTsKCgltZW1zZXQoYnVmLCAwLCBQQUdFX1NJWkUgLSAxMCk7CgoJ
aGQtPmluZm8udmVyc2lvbiA9IDE7CgloZC0+aW5mby5sYXN0X3BhZ2UgPSBkLT5tYmRfZGV2LT5z
aXplIC0gMTsKCWhkLT5pbmZvLm5yX2JhZHBhZ2VzID0gMDsKCgltZW1jcHkoYnVmICsgUEFHRV9T
SVpFIC0gMTAsICJTV0FQU1BBQ0UyIiwgMTApOwoKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50IG10
ZHN3YXBfcmVhZHNlY3Qoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldiwKCQkJdW5zaWduZWQg
bG9uZyBwYWdlLCBjaGFyICpidWYpCnsKCXN0cnVjdCBtdGRzd2FwX2RldiAqZCA9IE1URFNXQVBf
TUJEX1RPX01URFNXQVAoZGV2KTsKCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZC0+bXRkOwoJdW5z
aWduZWQgaW50IHJlYWxibG9jaywgcmV0cmllczsKCWxvZmZfdCByZWFkcG9zOwoJc3RydWN0IHN3
YXBfZWIgKmViOwoJc2l6ZV90IHJldGxlbjsKCWludCByZXQ7CgoJZC0+c2VjdF9yZWFkX2NvdW50
Kys7CgoJaWYgKGhlYWRlcikgewoJCWlmICh1bmxpa2VseShwYWdlID09IDApKQoJCQlyZXR1cm4g
bXRkc3dhcF9hdXRvX2hlYWRlcihkLCBidWYpOwoKCQlwYWdlLS07Cgl9CgoJcmVhbGJsb2NrID0g
ZC0+cGFnZV9kYXRhW3BhZ2VdOwoJaWYgKHJlYWxibG9jayA+IEJMT0NLX01BWCkgewoJCW1lbXNl
dChidWYsIDB4MCwgUEFHRV9TSVpFKTsKCQlpZiAocmVhbGJsb2NrID09IEJMT0NLX1VOREVGKQoJ
CQlyZXR1cm4gMDsKCQllbHNlCgkJCXJldHVybiAtRUlPOwoJfQoKCWViID0gZC0+ZWJfZGF0YSAr
IChyZWFsYmxvY2sgLyBkLT5wYWdlc19wZXJfZWJsayk7CglCVUdfT04oZC0+cmV2bWFwW3JlYWxi
bG9ja10gPT0gUEFHRV9VTkRFRik7CgoJcmVhZHBvcyA9IG10ZHN3YXBfYmxvY2twb3NfdG9fbXRk
cG9zKGQsIHJlYWxibG9jayk7CglyZXRyaWVzID0gMDsKCnJldHJ5OgoJcmV0ID0gbXRkX3JlYWQo
bXRkLCByZWFkcG9zLCBQQUdFX1NJWkUsICZyZXRsZW4sIGJ1Zik7CgoJZC0+bXRkX3JlYWRfY291
bnQrKzsKCWlmIChtdGRfaXNfYml0ZmxpcChyZXQpKSB7CgkJZWItPmZsYWdzIHw9IEVCTE9DS19C
SVRGTElQOwoJCW10ZHN3YXBfcmJfYWRkKGQsIGViLCBNVERTV0FQX0JJVEZMSVApOwoJCXJldCA9
IDA7Cgl9CgoJaWYgKHJldCA8IDApIHsKCQlkZXZfZXJyKGQtPmRldiwgIlJlYWQgZXJyb3IgJWRc
biIsIHJldCk7CgkJZWItPmZsYWdzIHw9IEVCTE9DS19SRUFERVJSOwoJCW10ZHN3YXBfcmJfYWRk
KGQsIGViLCBNVERTV0FQX0ZBSUxJTkcpOwoJCXJldHJpZXMrKzsKCQlpZiAocmV0cmllcyA8IE1U
RFNXQVBfSU9fUkVUUklFUykKCQkJZ290byByZXRyeTsKCgkJcmV0dXJuIHJldDsKCX0KCglpZiAo
cmV0bGVuICE9IFBBR0VfU0laRSkgewoJCWRldl9lcnIoZC0+ZGV2LCAiU2hvcnQgcmVhZCAlemRc
biIsIHJldGxlbik7CgkJcmV0dXJuIC1FSU87Cgl9CgoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQg
bXRkc3dhcF9kaXNjYXJkKHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpkZXYsIHVuc2lnbmVkIGxv
bmcgZmlyc3QsCgkJCXVuc2lnbmVkIG5yX3BhZ2VzKQp7CglzdHJ1Y3QgbXRkc3dhcF9kZXYgKmQg
PSBNVERTV0FQX01CRF9UT19NVERTV0FQKGRldik7Cgl1bnNpZ25lZCBsb25nIHBhZ2U7CglzdHJ1
Y3Qgc3dhcF9lYiAqZWI7Cgl1bnNpZ25lZCBpbnQgbWFwcGVkOwoKCWQtPmRpc2NhcmRfY291bnQr
KzsKCglmb3IgKHBhZ2UgPSBmaXJzdDsgcGFnZSA8IGZpcnN0ICsgbnJfcGFnZXM7IHBhZ2UrKykg
ewoJCW1hcHBlZCA9IGQtPnBhZ2VfZGF0YVtwYWdlXTsKCQlpZiAobWFwcGVkIDw9IEJMT0NLX01B
WCkgewoJCQllYiA9IGQtPmViX2RhdGEgKyAobWFwcGVkIC8gZC0+cGFnZXNfcGVyX2VibGspOwoJ
CQllYi0+YWN0aXZlX2NvdW50LS07CgkJCW10ZHN3YXBfc3RvcmVfZWIoZCwgZWIpOwoJCQlkLT5w
YWdlX2RhdGFbcGFnZV0gPSBCTE9DS19VTkRFRjsKCQkJZC0+cmV2bWFwW21hcHBlZF0gPSBQQUdF
X1VOREVGOwoJCQlkLT5kaXNjYXJkX3BhZ2VfY291bnQrKzsKCQl9IGVsc2UgaWYgKG1hcHBlZCA9
PSBCTE9DS19FUlJPUikgewoJCQlkLT5wYWdlX2RhdGFbcGFnZV0gPSBCTE9DS19VTkRFRjsKCQkJ
ZC0+ZGlzY2FyZF9wYWdlX2NvdW50Kys7CgkJfQoJfQoKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50
IG10ZHN3YXBfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKmRhdGEpCnsKCXN0cnVjdCBt
dGRzd2FwX2RldiAqZCA9IChzdHJ1Y3QgbXRkc3dhcF9kZXYgKikgcy0+cHJpdmF0ZTsKCXVuc2ln
bmVkIGxvbmcgc3VtOwoJdW5zaWduZWQgaW50IGNvdW50W01URFNXQVBfVFJFRV9DTlRdOwoJdW5z
aWduZWQgaW50IG1pbltNVERTV0FQX1RSRUVfQ05UXTsKCXVuc2lnbmVkIGludCBtYXhbTVREU1dB
UF9UUkVFX0NOVF07Cgl1bnNpZ25lZCBpbnQgaSwgY3cgPSAwLCBjd3AgPSAwLCBjd2Vjb3VudCA9
IDAsIGJiX2NudCwgbWFwcGVkLCBwYWdlczsKCXVpbnQ2NF90IHVzZV9zaXplOwoJc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdCBuYW1lW10gPSB7CgkJImNsZWFuIiwgInVzZWQiLCAibG93IiwgImhp
Z2giLCAiZGlydHkiLCAiYml0ZmxpcCIsICJmYWlsaW5nIgoJfTsKCgltdXRleF9sb2NrKCZkLT5t
YmRfZGV2LT5sb2NrKTsKCglmb3IgKGkgPSAwOyBpIDwgTVREU1dBUF9UUkVFX0NOVDsgaSsrKSB7
CgkJc3RydWN0IHJiX3Jvb3QgKnJvb3QgPSAmZC0+dHJlZXNbaV0ucm9vdDsKCgkJaWYgKHJvb3Qt
PnJiX25vZGUpIHsKCQkJY291bnRbaV0gPSBkLT50cmVlc1tpXS5jb3VudDsKCQkJbWluW2ldID0g
TVREU1dBUF9FQ05UX01JTihyb290KTsKCQkJbWF4W2ldID0gTVREU1dBUF9FQ05UX01BWChyb290
KTsKCQl9IGVsc2UKCQkJY291bnRbaV0gPSAwOwoJfQoKCWlmIChkLT5jdXJyX3dyaXRlKSB7CgkJ
Y3cgPSAxOwoJCWN3cCA9IGQtPmN1cnJfd3JpdGVfcG9zOwoJCWN3ZWNvdW50ID0gZC0+Y3Vycl93
cml0ZS0+ZXJhc2VfY291bnQ7Cgl9CgoJc3VtID0gMDsKCWZvciAoaSA9IDA7IGkgPCBkLT5lYmxr
czsgaSsrKQoJCXN1bSArPSBkLT5lYl9kYXRhW2ldLmVyYXNlX2NvdW50OwoKCXVzZV9zaXplID0g
KHVpbnQ2NF90KWQtPmVibGtzICogZC0+bXRkLT5lcmFzZXNpemU7CgliYl9jbnQgPSBtdGRzd2Fw
X2JhZGJsb2NrcyhkLT5tdGQsIHVzZV9zaXplKTsKCgltYXBwZWQgPSAwOwoJcGFnZXMgPSBkLT5t
YmRfZGV2LT5zaXplOwoJZm9yIChpID0gMDsgaSA8IHBhZ2VzOyBpKyspCgkJaWYgKGQtPnBhZ2Vf
ZGF0YVtpXSAhPSBCTE9DS19VTkRFRikKCQkJbWFwcGVkKys7CgoJbXV0ZXhfdW5sb2NrKCZkLT5t
YmRfZGV2LT5sb2NrKTsKCglmb3IgKGkgPSAwOyBpIDwgTVREU1dBUF9UUkVFX0NOVDsgaSsrKSB7
CgkJaWYgKCFjb3VudFtpXSkKCQkJY29udGludWU7CgoJCWlmIChtaW5baV0gIT0gbWF4W2ldKQoJ
CQlzZXFfcHJpbnRmKHMsICIlczpcdCU1ZCBlcmFzZSBibG9ja3MsIGVyYXNlZCBtaW4gJWQsICIK
CQkJCSJtYXggJWQgdGltZXNcbiIsCgkJCQluYW1lW2ldLCBjb3VudFtpXSwgbWluW2ldLCBtYXhb
aV0pOwoJCWVsc2UKCQkJc2VxX3ByaW50ZihzLCAiJXM6XHQlNWQgZXJhc2UgYmxvY2tzLCBhbGwg
ZXJhc2VkICVkICIKCQkJCSJ0aW1lc1xuIiwgbmFtZVtpXSwgY291bnRbaV0sIG1pbltpXSk7Cgl9
CgoJaWYgKGJiX2NudCkKCQlzZXFfcHJpbnRmKHMsICJiYWQ6XHQlNXUgZXJhc2UgYmxvY2tzXG4i
LCBiYl9jbnQpOwoKCWlmIChjdykKCQlzZXFfcHJpbnRmKHMsICJjdXJyZW50IGVyYXNlIGJsb2Nr
OiAldSBwYWdlcyB1c2VkLCAldSBmcmVlLCAiCgkJCSJlcmFzZWQgJXUgdGltZXNcbiIsCgkJCWN3
cCwgZC0+cGFnZXNfcGVyX2VibGsgLSBjd3AsIGN3ZWNvdW50KTsKCglzZXFfcHJpbnRmKHMsICJ0
b3RhbCBlcmFzdXJlczogJWx1XG4iLCBzdW0pOwoKCXNlcV9wdXRzKHMsICJcbiIpOwoKCXNlcV9w
cmludGYocywgIm10ZHN3YXBfcmVhZHNlY3QgY291bnQ6ICVsbHVcbiIsIGQtPnNlY3RfcmVhZF9j
b3VudCk7CglzZXFfcHJpbnRmKHMsICJtdGRzd2FwX3dyaXRlc2VjdCBjb3VudDogJWxsdVxuIiwg
ZC0+c2VjdF93cml0ZV9jb3VudCk7CglzZXFfcHJpbnRmKHMsICJtdGRzd2FwX2Rpc2NhcmQgY291
bnQ6ICVsbHVcbiIsIGQtPmRpc2NhcmRfY291bnQpOwoJc2VxX3ByaW50ZihzLCAibXRkIHJlYWQg
Y291bnQ6ICVsbHVcbiIsIGQtPm10ZF9yZWFkX2NvdW50KTsKCXNlcV9wcmludGYocywgIm10ZCB3
cml0ZSBjb3VudDogJWxsdVxuIiwgZC0+bXRkX3dyaXRlX2NvdW50KTsKCXNlcV9wcmludGYocywg
ImRpc2NhcmRlZCBwYWdlcyBjb3VudDogJWxsdVxuIiwgZC0+ZGlzY2FyZF9wYWdlX2NvdW50KTsK
CglzZXFfcHV0cyhzLCAiXG4iKTsKCXNlcV9wcmludGYocywgInRvdGFsIHBhZ2VzOiAldVxuIiwg
cGFnZXMpOwoJc2VxX3ByaW50ZihzLCAicGFnZXMgbWFwcGVkOiAldVxuIiwgbWFwcGVkKTsKCgly
ZXR1cm4gMDsKfQpERUZJTkVfU0hPV19BVFRSSUJVVEUobXRkc3dhcCk7CgpzdGF0aWMgaW50IG10
ZHN3YXBfYWRkX2RlYnVnZnMoc3RydWN0IG10ZHN3YXBfZGV2ICpkKQp7CglzdHJ1Y3QgZGVudHJ5
ICpyb290ID0gZC0+bXRkLT5kYmcuZGZzX2RpcjsKCXN0cnVjdCBkZW50cnkgKmRlbnQ7CgoJaWYg
KCFJU19FTkFCTEVEKENPTkZJR19ERUJVR19GUykpCgkJcmV0dXJuIDA7CgoJaWYgKElTX0VSUl9P
Ul9OVUxMKHJvb3QpKQoJCXJldHVybiAtMTsKCglkZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZSgi
bXRkc3dhcF9zdGF0cyIsIFNfSVJVU1IsIHJvb3QsIGQsCgkJCQkmbXRkc3dhcF9mb3BzKTsKCWlm
ICghZGVudCkgewoJCWRldl9lcnIoZC0+ZGV2LCAiZGVidWdmc19jcmVhdGVfZmlsZSBmYWlsZWRc
biIpOwoJCXJldHVybiAtMTsKCX0KCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCBtdGRzd2FwX2lu
aXQoc3RydWN0IG10ZHN3YXBfZGV2ICpkLCB1bnNpZ25lZCBpbnQgZWJsb2NrcywKCQkJdW5zaWdu
ZWQgaW50IHNwYXJlX2NudCkKewoJc3RydWN0IG10ZF9pbmZvICptdGQgPSBkLT5tYmRfZGV2LT5t
dGQ7Cgl1bnNpZ25lZCBpbnQgaSwgZWJsa19ieXRlcywgcGFnZXMsIGJsb2NrczsKCWludCByZXQg
PSAtRU5PTUVNOwoKCWQtPm10ZCA9IG10ZDsKCWQtPmVibGtzID0gZWJsb2NrczsKCWQtPnNwYXJl
X2VibGtzID0gc3BhcmVfY250OwoJZC0+cGFnZXNfcGVyX2VibGsgPSBtdGQtPmVyYXNlc2l6ZSA+
PiBQQUdFX1NISUZUOwoKCXBhZ2VzID0gZC0+bWJkX2Rldi0+c2l6ZTsKCWJsb2NrcyA9IGVibG9j
a3MgKiBkLT5wYWdlc19wZXJfZWJsazsKCglmb3IgKGkgPSAwOyBpIDwgTVREU1dBUF9UUkVFX0NO
VDsgaSsrKQoJCWQtPnRyZWVzW2ldLnJvb3QgPSBSQl9ST09UOwoKCWQtPnBhZ2VfZGF0YSA9IHZt
YWxsb2MoYXJyYXlfc2l6ZShwYWdlcywgc2l6ZW9mKGludCkpKTsKCWlmICghZC0+cGFnZV9kYXRh
KQoJCWdvdG8gcGFnZV9kYXRhX2ZhaWw7CgoJZC0+cmV2bWFwID0gdm1hbGxvYyhhcnJheV9zaXpl
KGJsb2Nrcywgc2l6ZW9mKGludCkpKTsKCWlmICghZC0+cmV2bWFwKQoJCWdvdG8gcmV2bWFwX2Zh
aWw7CgoJZWJsa19ieXRlcyA9IHNpemVvZihzdHJ1Y3Qgc3dhcF9lYikqZC0+ZWJsa3M7CglkLT5l
Yl9kYXRhID0gdnphbGxvYyhlYmxrX2J5dGVzKTsKCWlmICghZC0+ZWJfZGF0YSkKCQlnb3RvIGVi
X2RhdGFfZmFpbDsKCglmb3IgKGkgPSAwOyBpIDwgcGFnZXM7IGkrKykKCQlkLT5wYWdlX2RhdGFb
aV0gPSBCTE9DS19VTkRFRjsKCglmb3IgKGkgPSAwOyBpIDwgYmxvY2tzOyBpKyspCgkJZC0+cmV2
bWFwW2ldID0gUEFHRV9VTkRFRjsKCglkLT5wYWdlX2J1ZiA9IGttYWxsb2MoUEFHRV9TSVpFLCBH
RlBfS0VSTkVMKTsKCWlmICghZC0+cGFnZV9idWYpCgkJZ290byBwYWdlX2J1Zl9mYWlsOwoKCWlm
IChtdGRzd2FwX2Nhbl91c2Vfb29iKG10ZCkpIHsKCQlkLT5vb2JfYnVmID0ga21hbGxvY19hcnJh
eSgyLCBtdGQtPm9vYmF2YWlsLCBHRlBfS0VSTkVMKTsKCQlpZiAoIWQtPm9vYl9idWYpCgkJCWdv
dG8gb29iX2J1Zl9mYWlsOwoJfQoKCW10ZHN3YXBfc2Nhbl9lYmxrcyhkKTsKCglyZXR1cm4gMDsK
Cm9vYl9idWZfZmFpbDoKCWtmcmVlKGQtPnBhZ2VfYnVmKTsKcGFnZV9idWZfZmFpbDoKCXZmcmVl
KGQtPmViX2RhdGEpOwplYl9kYXRhX2ZhaWw6Cgl2ZnJlZShkLT5yZXZtYXApOwpyZXZtYXBfZmFp
bDoKCXZmcmVlKGQtPnBhZ2VfZGF0YSk7CnBhZ2VfZGF0YV9mYWlsOgoJcHJpbnRrKEtFUk5fRVJS
ICIlczogaW5pdCBmYWlsZWQgKCVkKVxuIiwgTVREU1dBUF9QUkVGSVgsIHJldCk7CglyZXR1cm4g
cmV0Owp9CgpzdGF0aWMgdm9pZCBtdGRzd2FwX2FkZF9tdGQoc3RydWN0IG10ZF9ibGt0cmFuc19v
cHMgKnRyLCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKewoJc3RydWN0IG10ZHN3YXBfZGV2ICpkOwoJ
c3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKm1iZF9kZXY7CgljaGFyICpwYXJ0czsKCWNoYXIgKnRo
aXNfb3B0OwoJdW5zaWduZWQgbG9uZyBwYXJ0OwoJdW5zaWduZWQgaW50IGVibG9ja3MsIGVhdmFp
bGFibGUsIGJhZF9ibG9ja3MsIHNwYXJlX2NudDsKCXVuc2lnbmVkIGludCB1c2FibGVfZWJfc2l6
ZTsKCXVpbnQ2NF90IHN3YXBfc2l6ZSwgdXNlX3NpemUsIHNpemVfbGltaXQ7CglpbnQgcmV0OwoK
CXBhcnRzID0gJnBhcnRpdGlvbnNbMF07CglpZiAoISpwYXJ0cykKCQlyZXR1cm47CgoJd2hpbGUg
KCh0aGlzX29wdCA9IHN0cnNlcCgmcGFydHMsICIsIikpICE9IE5VTEwpIHsKCQlpZiAoa3N0cnRv
dWwodGhpc19vcHQsIDAsICZwYXJ0KSA8IDApCgkJCXJldHVybjsKCgkJaWYgKG10ZC0+aW5kZXgg
PT0gcGFydCkKCQkJYnJlYWs7Cgl9CgoJaWYgKG10ZC0+aW5kZXggIT0gcGFydCkKCQlyZXR1cm47
CgoJLyppZiAobXRkLT5lcmFzZXNpemUgPCBQQUdFX1NJWkUgfHwgbXRkLT5lcmFzZXNpemUgJSBQ
QUdFX1NJWkUpIHsKCQlwcmludGsoS0VSTl9FUlIgIiVzOiBFcmFzZSBzaXplICV1IG5vdCBtdWx0
aXBsZSBvZiBQQUdFX1NJWkUgIgoJCQkiJWx1XG4iLCBNVERTV0FQX1BSRUZJWCwgbXRkLT5lcmFz
ZXNpemUsIFBBR0VfU0laRSk7CgkJcmV0dXJuOwoJfSovCgoJaWYgKFBBR0VfU0laRSAlIG10ZC0+
d3JpdGVzaXplIHx8IG10ZC0+d3JpdGVzaXplID4gUEFHRV9TSVpFKSB7CgkJcHJpbnRrKEtFUk5f
RVJSICIlczogUEFHRV9TSVpFICVsdSBub3QgbXVsdGlwbGUgb2Ygd3JpdGUgc2l6ZSIKCQkJIiAl
dVxuIiwgTVREU1dBUF9QUkVGSVgsIFBBR0VfU0laRSwgbXRkLT53cml0ZXNpemUpOwoJCXJldHVy
bjsKCX0KCgkvKmlmICghbXRkLT5vb2JzaXplIHx8IG10ZC0+b29iYXZhaWwgPCBNVERTV0FQX09P
QlNJWkUpIHsKCQlwcmludGsoS0VSTl9FUlIgIiVzOiBOb3QgZW5vdWdoIGZyZWUgYnl0ZXMgaW4g
T09CLCAiCgkJCSIlZCBhdmFpbGFibGUsICV6dSBuZWVkZWQuXG4iLAoJCQlNVERTV0FQX1BSRUZJ
WCwgbXRkLT5vb2JhdmFpbCwgTVREU1dBUF9PT0JTSVpFKTsKCQlyZXR1cm47Cgl9Ki8KCglpZiAo
c3BhcmVfZWJsb2NrcyA+IDEwMCkKCQlzcGFyZV9lYmxvY2tzID0gMTAwOwoKCXVzZV9zaXplID0g
bXRkLT5zaXplOwoJc2l6ZV9saW1pdCA9ICh1aW50NjRfdCkgQkxPQ0tfTUFYICogUEFHRV9TSVpF
OwoKCWlmIChtdGQtPnNpemUgPiBzaXplX2xpbWl0KSB7CgkJcHJpbnRrKEtFUk5fV0FSTklORyAi
JXM6IERldmljZSB0b28gbGFyZ2UuIExpbWl0aW5nIHNpemUgdG8gIgoJCQkiJWxsdSBieXRlc1xu
IiwgTVREU1dBUF9QUkVGSVgsIHNpemVfbGltaXQpOwoJCXVzZV9zaXplID0gc2l6ZV9saW1pdDsK
CX0KCgllYmxvY2tzID0gbXRkX2Rpdl9ieV9lYih1c2Vfc2l6ZSwgbXRkKTsKCXVzYWJsZV9lYl9z
aXplID0gKG10ZC0+ZXJhc2VzaXplID4+IFBBR0VfU0hJRlQpIDw8IFBBR0VfU0hJRlQ7Cgl1c2Vf
c2l6ZSA9ICh1aW50NjRfdCllYmxvY2tzICogbXRkLT5lcmFzZXNpemU7CgliYWRfYmxvY2tzID0g
bXRkc3dhcF9iYWRibG9ja3MobXRkLCB1c2Vfc2l6ZSk7CgllYXZhaWxhYmxlID0gZWJsb2NrcyAt
IGJhZF9ibG9ja3M7CgoJaWYgKGVhdmFpbGFibGUgPCBNSU5fRVJBU0VfQkxPQ0tTKSB7CgkJcHJp
bnRrKEtFUk5fRVJSICIlczogTm90IGVub3VnaCBlcmFzZSBibG9ja3MuICV1IGF2YWlsYWJsZSwg
IgoJCQkiJWQgbmVlZGVkXG4iLCBNVERTV0FQX1BSRUZJWCwgZWF2YWlsYWJsZSwKCQkJTUlOX0VS
QVNFX0JMT0NLUyk7CgkJcmV0dXJuOwoJfQoKCXNwYXJlX2NudCA9IGRpdl91NjQoKHVpbnQ2NF90
KWVhdmFpbGFibGUgKiBzcGFyZV9lYmxvY2tzLCAxMDApOwoKCWlmIChzcGFyZV9jbnQgPCBNSU5f
U1BBUkVfRUJMT0NLUykKCQlzcGFyZV9jbnQgPSBNSU5fU1BBUkVfRUJMT0NLUzsKCglpZiAoc3Bh
cmVfY250ID4gZWF2YWlsYWJsZSAtIDEpCgkJc3BhcmVfY250ID0gZWF2YWlsYWJsZSAtIDE7CgoJ
c3dhcF9zaXplID0gKHVpbnQ2NF90KShlYXZhaWxhYmxlIC0gc3BhcmVfY250KSAqIHVzYWJsZV9l
Yl9zaXplICsKCQkoaGVhZGVyID8gUEFHRV9TSVpFIDogMCk7CgoJcHJpbnRrKEtFUk5fSU5GTyAi
JXM6IEVuYWJsaW5nIE1URCBzd2FwIG9uIGRldmljZSAlbHUsIHNpemUgJWxsdSBLQiwgIgoJCSIl
dSBzcGFyZSwgJXUgYmFkIGJsb2Nrc1xuIiwKCQlNVERTV0FQX1BSRUZJWCwgcGFydCwgc3dhcF9z
aXplIC8gMTAyNCwgc3BhcmVfY250LCBiYWRfYmxvY2tzKTsKCglkID0ga3phbGxvYyhzaXplb2Yo
c3RydWN0IG10ZHN3YXBfZGV2KSwgR0ZQX0tFUk5FTCk7CglpZiAoIWQpCgkJcmV0dXJuOwoKCW1i
ZF9kZXYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgbXRkX2Jsa3RyYW5zX2RldiksIEdGUF9LRVJO
RUwpOwoJaWYgKCFtYmRfZGV2KSB7CgkJa2ZyZWUoZCk7CgkJcmV0dXJuOwoJfQoKCWQtPm1iZF9k
ZXYgPSBtYmRfZGV2OwoJbWJkX2Rldi0+cHJpdiA9IGQ7CgoJbWJkX2Rldi0+bXRkID0gbXRkOwoJ
bWJkX2Rldi0+ZGV2bnVtID0gbXRkLT5pbmRleDsKCW1iZF9kZXYtPnNpemUgPSBzd2FwX3NpemUg
Pj4gUEFHRV9TSElGVDsKCW1iZF9kZXYtPnRyID0gdHI7CgoJaWYgKCEobXRkLT5mbGFncyAmIE1U
RF9XUklURUFCTEUpKQoJCW1iZF9kZXYtPnJlYWRvbmx5ID0gMTsKCglpZiAobXRkc3dhcF9pbml0
KGQsIGVibG9ja3MsIHNwYXJlX2NudCkgPCAwKQoJCWdvdG8gaW5pdF9mYWlsZWQ7CgoJaWYgKGFk
ZF9tdGRfYmxrdHJhbnNfZGV2KG1iZF9kZXYpIDwgMCkKCQlnb3RvIGNsZWFudXA7CgoJZC0+ZGV2
ID0gZGlza190b19kZXYobWJkX2Rldi0+ZGlzayk7CgoJcmV0ID0gbXRkc3dhcF9hZGRfZGVidWdm
cyhkKTsKCWlmIChyZXQgPCAwKQoJCWdvdG8gZGVidWdmc19mYWlsZWQ7CgoJcmV0dXJuOwoKZGVi
dWdmc19mYWlsZWQ6CglkZWxfbXRkX2Jsa3RyYW5zX2RldihtYmRfZGV2KTsKCmNsZWFudXA6Cglt
dGRzd2FwX2NsZWFudXAoZCk7Cgppbml0X2ZhaWxlZDoKCWtmcmVlKG1iZF9kZXYpOwoJa2ZyZWUo
ZCk7Cn0KCnN0YXRpYyB2b2lkIG10ZHN3YXBfcmVtb3ZlX2RldihzdHJ1Y3QgbXRkX2Jsa3RyYW5z
X2RldiAqZGV2KQp7CglzdHJ1Y3QgbXRkc3dhcF9kZXYgKmQgPSBNVERTV0FQX01CRF9UT19NVERT
V0FQKGRldik7CgoJZGVsX210ZF9ibGt0cmFuc19kZXYoZGV2KTsKCW10ZHN3YXBfY2xlYW51cChk
KTsKCWtmcmVlKGQpOwp9CgpzdGF0aWMgc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgbXRkc3dhcF9v
cHMgPSB7CgkubmFtZQkJPSAibXRkc3dhcCIsCgkubWFqb3IJCT0gMCwKCS5wYXJ0X2JpdHMJPSAw
LAoJLmJsa3NpemUJPSBQQUdFX1NJWkUsCgkuZmx1c2gJCT0gbXRkc3dhcF9mbHVzaCwKCS5yZWFk
c2VjdAk9IG10ZHN3YXBfcmVhZHNlY3QsCgkud3JpdGVzZWN0CT0gbXRkc3dhcF93cml0ZXNlY3Qs
CgkuZGlzY2FyZAk9IG10ZHN3YXBfZGlzY2FyZCwKCS5iYWNrZ3JvdW5kCT0gbXRkc3dhcF9iYWNr
Z3JvdW5kLAoJLmFkZF9tdGQJPSBtdGRzd2FwX2FkZF9tdGQsCgkucmVtb3ZlX2Rldgk9IG10ZHN3
YXBfcmVtb3ZlX2RldiwKCS5vd25lcgkJPSBUSElTX01PRFVMRSwKfTsKCnN0YXRpYyBpbnQgX19p
bml0IG10ZHN3YXBfbW9kaW5pdCh2b2lkKQp7CglyZXR1cm4gcmVnaXN0ZXJfbXRkX2Jsa3RyYW5z
KCZtdGRzd2FwX29wcyk7Cn0KCnN0YXRpYyB2b2lkIF9fZXhpdCBtdGRzd2FwX21vZGV4aXQodm9p
ZCkKewoJZGVyZWdpc3Rlcl9tdGRfYmxrdHJhbnMoJm10ZHN3YXBfb3BzKTsKfQoKbW9kdWxlX2lu
aXQobXRkc3dhcF9tb2Rpbml0KTsKbW9kdWxlX2V4aXQobXRkc3dhcF9tb2RleGl0KTsKCgpNT0RV
TEVfTElDRU5TRSgiR1BMIik7Ck1PRFVMRV9BVVRIT1IoIkphcmtrbyBMYXZpbmVuIDxqYXJra28u
bGF2aW5lbkBub2tpYS5jb20+Iik7Ck1PRFVMRV9ERVNDUklQVElPTigiQmxvY2sgZGV2aWNlIGFj
Y2VzcyB0byBhbiBNVEQgc3VpdGFibGUgZm9yIHVzaW5nIGFzICIKCQkic3dhcCBzcGFjZSIpOwo=
--0000000000008a34650594f5eaa6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--0000000000008a34650594f5eaa6--

