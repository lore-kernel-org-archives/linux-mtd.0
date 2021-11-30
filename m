Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EB7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SbqwL2PCTcqfzQh1Pi5jdkBCr4Frp6cZT6pq71LS7WY=; b=4Ik+9kaZfFoVS9
	qB4q6gjhPmg5dDzqsHqvoZlDBpp/OlIgqyEdwK0aBwnI546UBDkatgMM7ZpB58KM9f/4kyPxXTXMi
	HEqgoLOUZAz+UbnR7PBvQAxIjzxTXlenIKKVWPcy+JUlmRO5lzNj8C6vnO3tmEz40yvQUehbjHJpU
	JpacRdufHCZ3AgU+tZ7nzBxwRKd0lD31eDj8I6myWBLjN+EBd9KtaPz/uoaL9aQsvvPcz0+BgH24N
	FUKOTNYnv5QekxzKtiSSPLC4UWpTjj2jO5NggtMadFSJLtQNG0lJrbsPgmuFBBH7Jo9EDI8ajUHua
	F5C1MKdpq1V07ttNAM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6W3-006FCe-Ru; Tue, 30 Nov 2021 17:02:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6Vp-006F9O-Oa
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 17:01:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id o20so89030813eds.10
 for <linux-mtd@lists.infradead.org>; Tue, 30 Nov 2021 09:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ItLJRdVR7LAsef3Zc3otAshgjCo8JOyf9CQ33YfhusM=;
 b=e2/2Rs08W60dK2anpjCuxzd2Ji9xC/KJD8tL7+nmu7Nrg+u8reOFQF69YJMuMh2Cyl
 hh5lkztbszvt5VQeeS8koZQQMDDbxnVCmOrzCUzJqaoC6nd7wGyL9aAkELRhtpcBXdCb
 k8zdHJ8+evS23Ut1/fZnJlAiUf7YmCWT7cs1091wdolaF21GHNJhAywGtyBXv2hVPjb4
 tl6Xjv/MaiFsyxqKvItvtfsWyztzyTs06+MCTY1iRZAUDsymKFFkGEbfxS+CkRunO0RP
 +plc4YjxnCoO+EJHX1xVmRXoQ/nfiaPocVdKIWhzJE8MN6r16pE5FKPFXF+clT5KncKO
 pR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ItLJRdVR7LAsef3Zc3otAshgjCo8JOyf9CQ33YfhusM=;
 b=KrBVMXeTuG58BeAzYH9GHkF1qHWx0FeL6Pj05Kmybi3cSJyR2vrMti3BdUMTjQxG2G
 ZrRW7mdr4TStrVEH44m5+klnYdk2TbVlUzAUoKg7TXajvYrOhkxZgwnZ/hXaKbMdOZiC
 JVY103XMGItaCAy++gh0QH4l/olqyw0NUxoltIZ/G2S5TF/FWUACsLtBV5YkBc5ti53C
 C/+WERmhn8x0remAboRm53hj9Bcgmv5w9NY72STxtTPIdXWz7IqKzP8TTeB2ndb6QHpb
 wjnInfGPpqq0vA7neabxXsC0AmgOVc75XHkE7EFjf4k9iDwr8reGZInKQxJP+avj0AeG
 fZiA==
X-Gm-Message-State: AOAM531wQsPdYE5ZijNWFJyfpSP0CDndUicLFgiU4RvwfTCt7pjSL56G
 Gvp9fhzvnsTNZdnb1AG1648hyk0eNtsTKB+b2HHkiQ==
X-Google-Smtp-Source: ABdhPJyICl7DQ/wtzllvI1IlerKslx88Nfr8uD+p+yzEUSG+QBFFPANlAcSVMe92eAl2jCy8s3ugts6aEb0b58z0yNs=
X-Received: by 2002:a05:6402:845:: with SMTP id
 b5mr260543edz.392.1638291706707; 
 Tue, 30 Nov 2021 09:01:46 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 30 Nov 2021 22:31:34 +0530
Message-ID: <CA+G9fYuupqqemLbgoVL2kYL4d2AtZLBo1xcshWWae7gX5Ln-iA@mail.gmail.com>
Subject: [next] WARNING: CPU: 2 PID: 66 at kernel/locking/rwsem.c:1298
 __up_read
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Nyekjaer <sean@geanix.com>, Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_090149_816810_0D78D7A3 
X-CRM114-Status: UNSURE (   7.74  )
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

[Please ignore this email if it is already reported]

Regression found on qemu_arm64.
Following kernel warnings reported on Linux next-20211130 while booting.


metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git commit: 34f255a1e91ab44ff8926cf8294ff9144e62e861
  git describe: next-20211130
  make_kernelversion: 5.16.0-rc3
  kernel-config: https://builds.tuxbuild.com/21dB06iPvDP58giSGHdE5W3Qc68/config
  kernel-Image: https://builds.tuxbuild.com/21dB06iPvDP58giSGHdE5W3Qc68/Image.gz
  build location: https://builds.tuxbuild.com/21dB06iPvDP58giSGHdE5W3Qc68/

kernel warning:
--------------
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
[    0.000000] Linux version 5.16.0-rc3-next-20211130
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 11.2.0-9) 11.2.0, GNU
ld (GNU Binutils for Debian) 2.37) #1 SMP PREEMPT @1638261010
[    0.000000] Machine model: linux,dummy-virt
<trim>
[   69.203007] INFO: trying to register non-static key.
[   69.203752] The code is fine but needs lockdep annotation, or maybe
[   69.204508] you didn't initialize this object before use?
[   69.205174] turning off the locking correctness validator.
[   69.206024] CPU: 2 PID: 66 Comm: kworker/2:1H Not tainted
5.16.0-rc3-next-20211130 #1
[   69.207053] Hardware name: linux,dummy-virt (DT)
[   69.208000] Workqueue: kblockd blk_mq_run_work_fn
[   69.209944] Call trace:
[   69.210435]  dump_backtrace+0x0/0x1dc
[   69.211123]  show_stack+0x24/0x30
[   69.211698]  dump_stack_lvl+0x8c/0xb8
[   69.212296]  dump_stack+0x18/0x34
[   69.212911]  register_lock_class+0x4c8/0x4ec
[   69.213544]  __lock_acquire+0x78/0x20cc
[   69.214122]  lock_acquire.part.0+0xe0/0x230
[   69.214737]  lock_acquire+0x68/0x84
[   69.215303]  down_read+0x78/0x94
[   69.215863]  mtd_read_oob_std+0xb0/0x184
[   69.216464]  mtd_read_oob+0x8c/0x150
[   69.217043]  mtd_read+0x70/0xb0
[   69.217595]  concat_read+0xe0/0x1b4
[   69.218151]  mtd_read_oob_std+0x174/0x184
[   69.218759]  mtd_read_oob+0x8c/0x150
[   69.219336]  mtd_read+0x70/0xb0
[   69.219872]  mtdblock_readsect+0x80/0x19c
[   69.220457]  mtd_queue_rq+0x4d4/0x650
[   69.221020]  blk_mq_dispatch_rq_list+0x1b8/0x8b4
[   69.221654]  __blk_mq_do_dispatch_sched+0x270/0x300
[   69.222327]  __blk_mq_sched_dispatch_requests+0x11c/0x17c
[   69.223014]  blk_mq_sched_dispatch_requests+0x44/0x80
[   69.223684]  __blk_mq_run_hw_queue+0x70/0xcc
[   69.224309]  blk_mq_run_work_fn+0x2c/0x40
[   69.224916]  process_one_work+0x280/0x700
[   69.225522]  worker_thread+0x80/0x454
[   69.226105]  kthread+0x17c/0x190
[   69.226667]  ret_from_fork+0x10/0x20
[   69.229322] ------------[ cut here ]------------
[   69.230151] DEBUG_RWSEMS_WARN_ON(sem->magic != sem): count = 0x100,
magic = 0x0, owner = 0xffff0000c0e6e601, curr 0xffff0000c0e6e600, list
not empty
[   69.232197] WARNING: CPU: 2 PID: 66 at kernel/locking/rwsem.c:1298
__up_read+0x1e8/0x270
[   69.233176] Modules linked in:
[   69.233944] CPU: 2 PID: 66 Comm: kworker/2:1H Not tainted
5.16.0-rc3-next-20211130 #1
[   69.234814] Hardware name: linux,dummy-virt (DT)
[   69.235441] Workqueue: kblockd blk_mq_run_work_fn
[   69.236290] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   69.237159] pc : __up_read+0x1e8/0x270
[   69.237792] lr : __up_read+0x1e8/0x270
[   69.238398] sp : ffff8000084436f0
[   69.238917] x29: ffff8000084436f0 x28: ffff0000c2c44408 x27: 0000000000040000
[   69.240164] x26: ffff8000084439f8 x25: 0000000000000000 x24: 0000000000000000
[   69.241315] x23: 0000000000000000 x22: 0000000000000000 x21: ffff800008443838
[   69.242441] x20: ffffa75da2ec4000 x19: ffff0000c2ac28b0 x18: ffffffffffffffff
[   69.243563] x17: 30322d7478656e2d x16: 3363722d302e3631 x15: ffff800088443407
[   69.244683] x14: 000000000000000f x13: 656e776f202c3078 x12: 30203d2063696761
[   69.245802] x11: ffffa75da2f49b48 x10: 00000000fffff000 x9 : ffffa75da0540b84
[   69.246974] x8 : 00000000ffffefff x7 : ffffa75da2f49b48 x6 : 0000000000000001
[   69.248078] x5 : ffffa75da2ec1000 x4 : ffffa75da2ec1440 x3 : 0000000000000000
[   69.249181] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c0e6e600
[   69.250363] Call trace:
[   69.250847]  __up_read+0x1e8/0x270
[   69.251419]  up_read+0x4c/0x80
[   69.251950]  mtd_read_oob_std+0xe8/0x184
[   69.252536]  mtd_read_oob+0x8c/0x150
[   69.253099]  mtd_read+0x70/0xb0
[   69.253630]  concat_read+0xe0/0x1b4
[   69.254183]  mtd_read_oob_std+0x174/0x184
[   69.254786]  mtd_read_oob+0x8c/0x150
[   69.255350]  mtd_read+0x70/0xb0
[   69.255890]  mtdblock_readsect+0x80/0x19c
[   69.256477]  mtd_queue_rq+0x4d4/0x650
[   69.257044]  blk_mq_dispatch_rq_list+0x1b8/0x8b4
[   69.257677]  __blk_mq_do_dispatch_sched+0x270/0x300
[   69.258337]  __blk_mq_sched_dispatch_requests+0x11c/0x17c
[   69.258983]  blk_mq_sched_dispatch_requests+0x44/0x80
[   69.259634]  __blk_mq_run_hw_queue+0x70/0xcc
[   69.260254]  blk_mq_run_work_fn+0x2c/0x40
[   69.260848]  process_one_work+0x280/0x700
[   69.261447]  worker_thread+0x80/0x454
[   69.262022]  kthread+0x17c/0x190
[   69.262569]  ret_from_fork+0x10/0x20
[   69.263285] irq event stamp: 41
[   69.263815] hardirqs last  enabled at (41): [<ffffa75da18e8884>]
exit_to_kernel_mode+0x34/0x170
[   69.264778] hardirqs last disabled at (39): [<ffffa75da0410de4>]
__do_softirq+0x564/0x5f8
[   69.265691] softirqs last  enabled at (40): [<ffffa75da0410d00>]
__do_softirq+0x480/0x5f8
[   69.266539] softirqs last disabled at (35): [<ffffa75da04a6f7c>]
__irq_exit_rcu+0x17c/0x1b0
[   69.267544] ---[ end trace dce9abbec763b35e ]---


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

link:
-----------
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20211130/testrun/6599984/suite/linux-log-parser/test/check-kernel-warning-4048437/log

step to reproduce:
------------------
/usr/bin/qemu-system-aarch64 -cpu max -machine virt-2.10 -nographic \
 -net nic,model=virtio,macaddr=BA:DD:AD:FC:09:08 -net tap -m 4096 \
 -monitor none -kernel kernel/Image.gz \
 --append "console=ttyAMA0 root=/dev/vda rw" \
 -hda rootfs/rpb-console-image-lkft-juno-20211006155038.rootfs.ext4 \
 -m 4096 -smp 4 -nographic


--
Linaro LKFT
https://lkft.linaro.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
