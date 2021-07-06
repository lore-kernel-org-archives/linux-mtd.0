Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B599DC07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 09:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2941B61993
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 09:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2941B61993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpPDN97w/0fYWlaF+FO9fqFuhuWmwvQMGPOJL3t3cMo=; b=T6L7KwK8gkyFqI
	w8Rs3DR1S5gjUtyeNpRpDdIQdBwKC937X2gtMvMG/ND5vBQ8sH/K5TZ91MDDimdt8aNYwNqVOznlb
	9QVsdrXKDq4kgnymOvsD78mNNR5PpsNZpd6n0LW9q+uHQQcmvk2hWDTvtN4BfKaAu2iY8NO1/VQVu
	BNwwdmx/iBo9kJxhdlVoFmVkFF1AwTC0OCKpX+BjsjgtaQbIoMXH09sCUCd5jQnRztHJ1a968XBbk
	YbOqYL8Rh4+OBCO4aQzREejVDSHk6D6NbGTPo7SaeVGIuKDN67MvJ0jBP7LOocLzqqnIoKN6BHeWb
	D94Ibxirz20meA8QzOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hUb-00Au26-LB; Tue, 06 Jul 2021 09:35:49 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hUY-00Au1W-6m
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 09:35:48 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 565D04C5704;
 Tue,  6 Jul 2021 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1625564143; bh=d/k8860e8AFp6tYBkjh53bVB2t0WYaWnLcXmdEFyTFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=NIeERh8FH0EypgDkT5dX93Za4SZ7gO2QpeD4YUHwRTe46f7tUcsV/PPJcCYfzBxMh
 G5WG+A5oKnl8zDKLJtGOWsHJRhD6vdNJ0r4GMLAJisijCv19dwYrAadxOGns4vfVgH
 ECB5IiYcdAeH9krU+wNkpV6Ga4PlPDkGwfRTx/rgPVmCTli8VJ/slJ+LYpuWaNnkYJ
 C63QPbg7MOKVvm3jKffqz19ZyNNV6wiNwP9pNFwIWLwFfA11EH7wTQXCn4NE7gsycY
 +1+yQYTHIqCE265OcrYtQvAtKruDBd9sJh7Wao3VpBq4glu2NXr4Zi2v6lTEhRLi9o
 HpDOMoH/sd1eg==
Date: Tue, 6 Jul 2021 11:35:41 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: s.hauer@pengutronix.de, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-pm@vger.kernel.org, han.xu@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [BUG RESEND] unsuspend failure under load
Message-ID: <20210706093541.f4kjxqrkft7fqbcx@skn-laptop>
References: <20210705065833.2ezlhaspkkju4bh7@skn-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210705065833.2ezlhaspkkju4bh7@skn-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_023546_608487_D69680BE 
X-CRM114-Status: GOOD (  27.32  )
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

On Mon, Jul 05, 2021 at 08:58:38AM +0200, Sean Nyekjaer wrote:
> Hi Miquel and Sascha,
+ Richard + linux-pm
> 
> We are having some trouble when our i.MX6 unsuspends while writes to
> ubifs is in progess. In the log it looks like it syncing the filesystem
> before suspend.
> 
> The SoC a i.MX6ul/ull, the issue is (lucky for us) quite easy to reproduce.
> The reproduce script: [0]
> Kernel log when it happens: [1]
> 
> I have bisected the bug to: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> 
> Any idea to where I should start looking? or to what happens?
> 
> Esben have posted to patches that relates to suspend/unsuspend but it
> doesn't seem to releated to this issue.
> 5bc6bb603b4d ("mtd: rawnand: gpmi: Fix suspend/resume problem")
> d70486668cdf ("mtd: rawnand: gpmi: Restore nfc timing setup after suspend/resume")
> 
> /Sean

nand_resume() is called some time after ubi_io_write tries to write. Thats why
mtd_write() is returning -EBUSY.

I have tried patch [3], and it seems to fix it.
I think it would be okay to add the retry option, but the mdelay is not
obviously a nogo.

Any idea to how we could wait here for the nand_resume() to be called?

@linux-pm:
I have noticed "Filsystems sync" happens before "Freezing user space
processes".
If I apply patch [4] (without [3]), it would also fix our issue. But I
don't have en insight in to what impact the change might have.

/Sean

> 
> [0]
> #!/bin/sh
> dd if=/dev/urandom of=/tmp/test50M bs=1M count=50
> cp /tmp/test50M /data/ &
> echo mem > /sys/power/state
> 
> [1]
> root@iwg26-v2:/data/root# ./ubicrash.sh
> 50+0 records in
> 50+0 records out
> PM: suspend entry (deep)
> Filesystems sync: 33.642 seconds
> Freezing user space processes ... (elapsed 0.004 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.003 seconds) done.
> printk: Suspending console(s) (use no_console_suspend to debug)
> <SUSPEND/WAKE>
> PM: suspend devices took 0.040 seconds
> Disabling non-boot CPUs ...
> ubi0 error: ubi_io_write: error -16 while writing 4096 bytes to PEB 544:53248, written 0 bytes
> CPU: 0 PID: 69 Comm: kworker/u2:2 Not tainted 5.13.0 #3
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> Workqueue: writeback wb_workfn (flush-ubifs_0_8)
> [<c010d9b0>] (unwind_backtrace) from [<c010a28c>] (show_stack+0x10/0x14)
> [<c010a28c>] (show_stack) from [<c0970798>] (dump_stack+0xc0/0xdc)
> [<c0970798>] (dump_stack) from [<c05dfe10>] (ubi_io_write+0x510/0x6b0)
> [<c05dfe10>] (ubi_io_write) from [<c05dcd90>] (ubi_eba_write_leb+0x388/0x910)
> [<c05dcd90>] (ubi_eba_write_leb) from [<c05daf34>] (ubi_leb_write+0xd0/0xe8)
> [<c05daf34>] (ubi_leb_write) from [<c03cfeb4>] (ubifs_leb_write+0x68/0x104)

[ ... ]

> UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
> UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 10962 of inode 821, error -30
> UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
> UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 10963 of inode 821, error -30
> UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 696 bytes in jhead 2, error -30
> UBIFS error (ubi0:8 pid 157): do_writepage: cannot write page 0 of inode 819, error -30
> UBIFS error (ubi0:8 pid 157): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30

[3]:
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 14d890b00d2c..b24c571fa022 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -268,8 +269,18 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	}

 	addr = (loff_t)pnum * ubi->peb_size + offset;
+retry:
 	err = mtd_write(ubi->mtd, addr, len, &written, buf);
 	if (err) {
+		if (retries++ < UBI_IO_RETRIES) {
+			ubi_warn(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
+				 err, len, pnum, offset, written);
+			mdelay(25); yield();
+			goto retry;
+		}
+
 		ubi_err(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
 			err, len, pnum, offset, written);
 		dump_stack();

[4]:
diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 32391acc806b..61a213ad5a13 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -563,18 +563,18 @@ static int enter_state(suspend_state_t state)
 	if (state == PM_SUSPEND_TO_IDLE)
 		s2idle_begin();
 
-	if (sync_on_suspend_enabled) {
-		trace_suspend_resume(TPS("sync_filesystems"), 0, true);
-		ksys_sync_helper();
-		trace_suspend_resume(TPS("sync_filesystems"), 0, false);
-	}
-
 	pm_pr_dbg("Preparing system for sleep (%s)\n", mem_sleep_labels[state]);
 	pm_suspend_clear_flags();
 	error = suspend_prepare(state);
 	if (error)
 		goto Unlock;
 
+	if (sync_on_suspend_enabled) {
+		trace_suspend_resume(TPS("sync_filesystems"), 0, true);
+		ksys_sync_helper();
+		trace_suspend_resume(TPS("sync_filesystems"), 0, false);
+	}
+
 	if (suspend_test(TEST_FREEZER))
 		goto Finish;
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
