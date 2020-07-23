Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2DEC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 03:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9585B20781
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 03:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZ6Ta1nO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9585B20781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=adxvouznJb7pHmoXFNIz/ON9s59XBp67ofmvZ5roLaA=; b=mZ6Ta1nObj+7pJC1LK9OPuYkn
	CaHSX//euwXPn1xuBrHSGs7WjjW6fZ0g5l74M8MGMAqZRt7I9r8DZ140hANe1GNummLwjq3MaTXaY
	AlvL8P8Oz0eguwuHgvJNL6ZyHuhsSiSlbuBCMyw74h6VE+BmT2J102Cyti/T8pfIzop2VtgBfAEdE
	K+vVTiD85RHPAJzwTyiEdcykpQqsER4kWoW50qcXd34eC4SKVmo51DPTLLlq4yIGJwi9UQh8x5MVp
	BchhfRxHZjU+PMajDf+QZUCMGFGtaodGELZw1PHAl3NTm9GtNCzOlmaKCZ1PUE4gMNnGQ4rNeMsNl
	ylfFxDXAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRqj-0000LT-Fs; Thu, 23 Jul 2020 03:24:49 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRjm-0005My-Mo
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 03:17:40 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 22A981FEE23B5CF0C187;
 Thu, 23 Jul 2020 11:17:19 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.20) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Jul 2020 11:17:10 +0800
From: Jubin Zhong <zhongjubin@huawei.com>
To: <yi.zhang@huawei.com>
Subject: Re: [PATCH] jffs2: move jffs2_init_inode_info() just after allocating
 inode
Date: Thu, 23 Jul 2020 11:17:08 +0800
Message-ID: <1595474228-20495-1-git-send-email-zhongjubin@huawei.com>
X-Mailer: git-send-email 1.8.5.6
In-Reply-To: <1559fa23-525b-5dad-220e-2ab2821d33eb@huawei.com>
References: <1559fa23-525b-5dad-220e-2ab2821d33eb@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.189.20]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231739_026719_E09F67DF 
X-CRM114-Status: UNSURE (   7.07  )
X-CRM114-Notice: Please train this message.
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
Cc: zhongguohua1@huawei.com, daniel@iogearbox.net, linux-kernel@vger.kernel.org,
 ast@kernel.org, linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 wangfangpeng1@huawei.com, linux-fsdevel@vger.kernel.org, chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/1/6 16:04, zhangyi (F) wrote:
> After commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
> traversal"), it expose a freeing uninitialized memory problem due to
> this commit move the operaion of freeing f->target to
> jffs2_i_callback(), which may not be initialized in some error path of
> allocating jffs2 inode (eg: jffs2_iget()->iget_locked()->
> destroy_inode()->..->jffs2_i_callback()->kfree(f->target)).
> 
> Fix this by initialize the jffs2_inode_info just after allocating it.

We are having the same problem. After commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
> traversal"), f->target is freed before it is initialized in the iget_locked() path. This is dangerous and may trigger slub BUG_ON:

kernel BUG at mm/slub.c:3824!
Internal error: Oops - BUG: 0 [#1] SMP ARM
CPU: 2 PID: 9 Comm: rcuos/0 Tainted: P           O    4.4.185 #1
task: cf4a3f68 task.stack: cf4ca000
PC is at kfree+0xfc/0x264
LR is at jffs2_i_callback+0x10/0x28 [jffs2]
pc : [<c032a4f0>]    lr : [<bf0ab188>]    psr: 400e0213
sp : cf4cbec8  ip : 00000000  fp : c0273df8
r10: ceb12848  r9 : 0000000c  r8 : cdd52000
r7 : bf0ab188  r6 : 0000000c  r5 : e7fddef0  r4 : c1121ba0
r3 : 00000100  r2 : c0ac4010  r1 : 00000002  r0 : e7fddef0
Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 32c5387d  Table: 0e315940  DAC: 55555555
Process rcuos/0 (pid: 9, stack limit = 0xcf4ca190)
Stack: (0xcf4cbec8 to 0xcf4cc000)
bec0:                   c086efa8 c032a3a8 00000001 c0273e9c c0a29214 c3931db8
bee0: 00000000 0000000c ffffe000 cdd52000 0000000c ceb12848 c0273df8 bf0ab188
bf00: c0adf980 c0273e9c c0adf980 00000001 00000000 ffffff7c 00000000 cf4a3f68
bf20: c025bc18 cf4cbf24 cf4cbf24 c0a22448 c0adf980 cf4ca000 cf485ac0 00000000
bf40: c0adf980 c02739b0 00000000 00000000 00000000 c02380bc 00000000 c0adf380
bf60: c0adf980 00000000 00000000 00000000 00008001 cf4cbf74 cf4cbf74 00000000
bf80: 00000000 00000000 00008001 cf4cbf8c cf4cbf8c c0a22448 cf485ac0 c0237fb8
bfa0: 00000000 00000000 00000000 c0202db4 00000000 00000000 00000000 00000000
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
bfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[<c032a4f0>] (kfree) from [<bf0ab188>] (jffs2_i_callback+0x10/0x28 [jffs2])
[<bf0ab188>] (jffs2_i_callback [jffs2]) from [<c0273e9c>] (rcu_nocb_kthread+0x4ec/0x504)
[<c0273e9c>] (rcu_nocb_kthread) from [<c02380bc>] (kthread+0x104/0x118)
[<c02380bc>] (kthread) from [<c0202db4>] (ret_from_fork+0x14/0x20)
Code: 0300001a 143094e5 010013e3 0000001a (f201f0e7)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
