Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226B6C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 20:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B414264F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 20:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B414264F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aep8bhTohTRxd2vAGE7yx8UClB7xuu2NBF46nmz8NU=; b=VL1n4htVnCFvKFUfU+ar2hAk7R
	e+Kpthgtuw0oOCRErx9MIPsME3kiG7OtRdefnroYJwIe++vbmqOyUGrML3kHUaOhqyF4nCGtx6mZL
	BAvpLpWObNdxCG0ZA2Z39J/TVVAPfspXRZBT9WZ7bVNwcdrbCcisF89v/VqEqabgNNhZeEZQXEpnO
	kDwiJyhxzeuQCwLozE2nju3AE5QSLn8jUrXykaMA8LqUijwVuGyR8EXeP4IeUmXty4P9cevtfwDul
	iLo/kiasn8MMjY/oNlcq+by5AxCwPzsRov3WsovC3w/RufrW1XaYydpqZiQNClBkCueeQgi4p8//N
	XWqDgPPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFNBq-0008Pe-A9; Thu, 25 Feb 2021 20:24:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFNBj-0008Nw-4m; Thu, 25 Feb 2021 20:24:46 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614284679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=;
 b=Itg1HgnAQey3puEfZXpKRRf1RkHbrPWXsodppd3f9/agHLs59mQxmZvHrDVfXhn7TF2e+X
 YgctQb8llo4ek4IXOH40pHKrSlSJUv+qmqSuRbNPlwERu5vmF3/VXIexN4FpY+8WHM5d4n
 3zHVITkWvbjhosz0zzfOytwQyTccmRTsG9uKDQ/PoVKslKdevkHeAS8FY/vBbTk7ZYAmwx
 j9C6lcv4wUAstQLOYdbQOINDWx2UjXbjMRmTNEt/9KnzbRIvSmj2EXQuCLrXAd5jyQHGnB
 6degQSHuHB1F0v3eFX0HxngBtbRJympKrqQjrUQzvVBIk1MNI805LQYIDMpUAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614284679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=;
 b=R+fgiTn80NtyboUkoI+34S01BUhJK8k4MSy2VNzuYCNOKjN83g0YvSMQCLvesqnrTwxeYZ
 t+PogSzB5duz2fCg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v3 00/15] printk: remove logbuf_lock
Date: Thu, 25 Feb 2021 21:24:23 +0100
Message-Id: <20210225202438.28985-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_152444_187301_BC5A0164 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Douglas Anderson <dianders@chromium.org>, linux-mtd@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Kees Cook <keescook@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Sumit Garg <sumit.garg@linaro.org>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

Here is v3 of a series to remove @logbuf_lock, exposing the
ringbuffer locklessly to both readers and writers. v2 is here [0].

Since @logbuf_lock was protecting much more than just the
ringbuffer, this series clarifies and cleans up the various
protections using comments, lockless accessors, atomic types, and a
new finer-grained @syslog_lock.

Removing @logbuf_lock required changing the semantics of the
kmsg_dumper callback in order to work locklessly. Since this
involved touching all the kmsg_dump users, we also decided [1] to
use this opportunity to clean up and clarify the kmsg_dump semantics
in general.

This series is based on next-20210225.

Changes since v2:

- use get_maintainer.pl to get the full list of developers that
  should at least see the changes in their respective areas

- do not disable interrupts in arch/um kmsg_dumper (because there is
  no need to)

- protect the mtd/mtdoops kmsg_dumper buffer against concurrent
  dumps

- update kerneldoc for kmsg_dump_get_line() (@len_out)

- remove ksmg_dump's @active flag

- change kmsg_dumper callback to:
  void (*dump)(enum kmsg_dump_reason reason);

- rename kmsg_dumper_iter to kmsg_dump_iter

- update kmsg_dumpers to use their own kmsg_dump_iter (and
  initialize it with kmsg_dump_rewind() if necessary)

John Ogness

[0] https://lkml.kernel.org/r/20210218081817.28849-1-john.ogness@linutronix.de
[1] https://lkml.kernel.org/r/YDeZAA08NKCHa4s%2F@alley

John Ogness (15):
  um: synchronize kmsg_dumper
  mtd: mtdoops: synchronize kmsg_dumper
  printk: limit second loop of syslog_print_all
  printk: kmsg_dump: remove unused fields
  printk: refactor kmsg_dump_get_buffer()
  printk: consolidate kmsg_dump_get_buffer/syslog_print_all code
  printk: introduce CONSOLE_LOG_MAX for improved multi-line support
  printk: use seqcount_latch for clear_seq
  printk: use atomic64_t for devkmsg_user.seq
  printk: add syslog_lock
  printk: kmsg_dumper: remove @active field
  printk: introduce a kmsg_dump iterator
  printk: remove logbuf_lock
  printk: kmsg_dump: remove _nolock() variants
  printk: console: remove unnecessary safe buffer usage

 arch/powerpc/kernel/nvram_64.c             |  14 +-
 arch/powerpc/platforms/powernv/opal-kmsg.c |   3 +-
 arch/powerpc/xmon/xmon.c                   |   6 +-
 arch/um/kernel/kmsg_dump.c                 |  15 +-
 drivers/hv/vmbus_drv.c                     |   7 +-
 drivers/mtd/mtdoops.c                      |  20 +-
 fs/pstore/platform.c                       |   8 +-
 include/linux/kmsg_dump.h                  |  49 +--
 kernel/debug/kdb/kdb_main.c                |  10 +-
 kernel/printk/internal.h                   |   4 +-
 kernel/printk/printk.c                     | 456 ++++++++++-----------
 kernel/printk/printk_safe.c                |  27 +-
 12 files changed, 309 insertions(+), 310 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
