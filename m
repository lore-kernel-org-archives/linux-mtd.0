Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D581C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 16:50:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C256124D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 16:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6C256124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sxmA6K8o60RMOG1lwibUM4TddPGX8naMQUzsNSaNJ+I=; b=CYZHbwkIejZWEk
	ckgR+XP4XJUcSifwZmQRHUM6SYcH0G7yjlNqTBnnukTW0qZ5gNWl09ghL12TlnPB9H99IiZFV18eM
	TndefxHdJZo2OJaYIlH1DGyVbJU9GKLzPPXocqlb8nIspN9X+Jwz9Qu9dEEcnnDTo8qGV+hXzKQuM
	pL5fw4eT9ehzS2o1LG3dYTY/JIH51ryq16cw4FqGbxFyuBtFUyBbg/fHh1Oi9QAJ3tLScwcNLwgZB
	vssnl7xmQHywsqIsyrm+k3RQJPxgBeEwMj3yeq+ttKAdRgN2BJnJnSuSlN0ZrYkU/ehpYojHeZvWf
	mt9ZYH48aKvVRhRG+wwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkqmj-005qTf-JQ; Wed, 10 Nov 2021 16:49:17 +0000
Received: from mail3-166.sinamail.sina.com.cn ([202.108.3.166])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkqmg-005qSC-Ic
 for linux-mtd@lists.infradead.org; Wed, 10 Nov 2021 16:49:17 +0000
Received: from unknown (HELO [192.168.3.50])([36.36.173.151])
 by sina.com (172.16.97.23) with ESMTP
 id 618BF7FD000069E5; Wed, 11 Nov 2021 00:49:03 +0800 (CST)
X-Sender: chenshumin86@sina.com
X-Auth-ID: chenshumin86@sina.com
X-SMAIL-MID: 8395254919383
To: linux-mtd@lists.infradead.org
From: "chenshumin86@sina.com" <chenshumin86@sina.com>
Subject: about ubifs error: ubifs_get_pnode.part.4: error -22
Message-ID: <420ddfd9-b65a-f689-cd10-47c0056e2d21@sina.com>
Date: Thu, 11 Nov 2021 00:49:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_084914_888489_33B3AB86 
X-CRM114-Status: UNSURE (   5.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dear ubifs supporters,

We have met one ubifs error and this error finally switch the partition 
to read-only mode.
Could you advise some tips for me to dig out the root cause for this issue?

Kernel version: V4.19
Crash log as below:

Oct 23 19:07:37 err kernel: [172988.260988] UBIFS error (ubi2:0 pid 
14311): ubifs_get_pnode.part.4: error -22 reading pnode at 8:17037
Oct 23 19:07:37 err kernel: [172988.269012] (pid 14311) dumping pnode:
Oct 23 19:07:37 err kernel: [172988.272814]       address cafe9f80 
parent cafe9c80 cnext 0
Oct 23 19:07:37 err kernel: [172988.278006]       flags 0 iip 3 level 0 
num 0
Oct 23 19:07:37 err kernel: [172988.281947]       0: free 0 dirty 3360 
flags 1 lnum 0
Oct 23 19:07:37 err kernel: [172988.286609]       1: free 2048 dirty 
3976 flags 1 lnum 0
Oct 23 19:07:37 err kernel: [172988.291597]       2: free 0 dirty 128000 
flags 1 lnum 0
Oct 23 19:07:37 err kernel: [172988.296425]       3: free 0 dirty 124448 
flags 1 lnum 0
Oct 23 19:07:37 warn kernel: [172988.301266] CPU: 1 PID: 14311 Comm: 
kworker/u4:0 Not tainted 4.19.90 #1
Oct 23 19:07:37 warn kernel: [172988.307893] Hardware name: STM32 
(Device Tree Support)
Oct 23 19:07:37 warn kernel: [172988.313119] Workqueue: writeback 
wb_workfn (flush-ubifs_2_0)
Oct 23 19:07:37 warn kernel: [172988.318888] [<c01110d4>] 
(unwind_backtrace) from [<c010cbb4>] (show_stack+0x10/0x14)
Oct 23 19:07:37 warn kernel: [172988.326658] [<c010cbb4>] (show_stack) 
from [<c0703084>] (dump_stack+0x8c/0xa0)
Oct 23 19:07:37 warn kernel: [172988.333953] [<c0703084>] (dump_stack) 
from [<c0367260>] (ubifs_get_pnode.part.4+0x21c/0x294)
Oct 23 19:07:37 warn kernel: [172988.342494] [<c0367260>] 
(ubifs_get_pnode.part.4) from [<c0368cc8>] 
(ubifs_lpt_lookup_dirty+0x204/0x27c)
Oct 23 19:07:37 warn kernel: [172988.352043] [<c0368cc8>] 
(ubifs_lpt_lookup_dirty) from [<c036bcc8>] (ubifs_update_one_lp+0x34/0x128)
Oct 23 19:07:37 warn kernel: [172988.361240] [<c036bcc8>] 
(ubifs_update_one_lp) from [<c035a69c>] (ubifs_tnc_add+0xcc/0x13c)
Oct 23 19:07:37 warn kernel: [172988.369664] [<c035a69c>] 
(ubifs_tnc_add) from [<c0349b50>] (ubifs_jnl_write_inode+0x158/0x234)
Oct 23 19:07:37 warn kernel: [172988.378340] [<c0349b50>] 
(ubifs_jnl_write_inode) from [<c035136c>] (ubifs_write_inode+0x90/0xfc)
Oct 23 19:07:37 warn kernel: [172988.387160] [<c035136c>] 
(ubifs_write_inode) from [<c02d5b3c>] (__writeback_single_inode+0x1e0/0x44c)
Oct 23 19:07:37 warn kernel: [172988.396483] [<c02d5b3c>] 
(__writeback_single_inode) from [<c02d627c>] 
(writeback_sb_inodes+0x1f4/0x4c4)
Oct 23 19:07:37 warn kernel: [172988.405905] [<c02d627c>] 
(writeback_sb_inodes) from [<c02d65a4>] (__writeback_inodes_wb+0x58/0x9c)
Oct 23 19:07:37 warn kernel: [172988.414932] [<c02d65a4>] 
(__writeback_inodes_wb) from [<c02d6894>] (wb_writeback+0x2ac/0x390)
Oct 23 19:07:37 warn kernel: [172988.423523] [<c02d6894>] (wb_writeback) 
from [<c02d723c>] (wb_workfn+0x30c/0x500)
Oct 23 19:07:37 warn kernel: [172988.431075] [<c02d723c>] (wb_workfn) 
from [<c014012c>] (process_one_work+0x218/0x504)
Oct 23 19:07:37 warn kernel: [172988.438971] [<c014012c>] 
(process_one_work) from [<c0140fb8>] (worker_thread+0x44/0x5bc)
Oct 23 19:07:37 warn kernel: [172988.447131] [<c0140fb8>] 
(worker_thread) from [<c0145ff8>] (kthread+0x14c/0x154)
Oct 23 19:07:37 warn kernel: [172988.454597] [<c0145ff8>] (kthread) from 
[<c01010e8>] (ret_from_fork+0x14/0x2c)
Oct 23 19:07:37 warn kernel: [172988.461877] Exception stack(0xcaed5fb0 
to 0xcaed5ff8)
Oct 23 19:07:37 warn kernel: [172988.466999] 5fa0: 
               00000000 00000000 00000000 00000000
Oct 23 19:07:37 warn kernel: [172988.475247] 5fc0: 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000
Oct 23 19:07:37 warn kernel: [172988.483491] 5fe0: 00000000 00000000 
00000000 00000000 00000013 00000000
Oct 23 19:07:37 err kernel: [172988.490279] UBIFS error (ubi2:0 pid 
14311): ubifs_get_pnode.part.4: calc num: 43
Oct 23 19:07:37 err kernel: [172988.497695] UBIFS error (ubi2:0 pid 
14311): ubifs_update_one_lp: cannot update properties of LEB 186, error -22
Oct 23 19:07:37 warn kernel: [172988.507884] UBIFS warning (ubi2:0 pid 
14311): ubifs_ro_mode.part.0: switched to read-only mode, error -22

Regards,
Shumin CHEN

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
