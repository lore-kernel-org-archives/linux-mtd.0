Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139CDC4332E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:28:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A3D364EF4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A3D364EF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nc1xrXj/ry4sGlfOZbPF1eWt2G7+EXj3rOmvDiV4RGM=; b=pe3hZ2Rz9vRaakKrQrnxQAr1n2
	QcNAHZCj6Tyl+yW73T9BeR/DQyzm4CG+nJLqqYBR1S4uhLCscIGd/Y6mlzLpq4d0m9m1xf+UTWm2c
	hf0KhtRnaw75roPcd2oHSxInpE3S7IuFDHZMMzs6u5pEAwNVj2T65Jse5m9r/mzPn7mfglPWzDwZr
	4pOMAlEW/uMXJIi84glzmX4DwciflrWQhCna2eEc0nZYcrCa0zdDm6TsGIUR+//oseSDlSaTGAV3i
	WuZ6Rsjfq2Yw5ne6qCml0bvYILSMwTJ4JSSIin89dC7dhOrQzmx1QwoOjACYxB303o48Db5AMbW2S
	rCiMk8rQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHX9t-006DLQ-0e; Wed, 03 Mar 2021 19:27:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT3O-005I2P-No; Wed, 03 Mar 2021 15:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=; b=oLP4vTGx2LheF4ikW05fFJUdXI
 A3U4dJidEN6UVpD70lX43nP16LP5K6j4I7GSe3bgDkvf0KfeTJwXziZAInEfC0MsLnF66/UPsPYSB
 909511nolGkdNQgwXZ3yonoYd8KY/L9WEJyYxehxcXfk1XbTi/G6aosTxPLJ74jIco0rKwUE4pDSM
 zLht3F7+oGNVxXcfB2R81QL5yfg0rdCrVGhHWeSevLVApGK9418MjlLq0RAn2/erfdMD//sXno1iK
 0QxvJP7jJ4VV0XFZS7VXbpz0MjUE3z14WxuoB3pL+33VGTCAGkTXf4Bze/pclD8+BxqRLlWQYr4rD
 Jv/CBQYA==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOXU-00299v-4R; Wed, 03 Mar 2021 10:15:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=;
 b=PqRXCroIP1umtmHt8c1ZfO2I6XBiNXbdZol38HcPrbsLXce6jhNCPzL73X+NxuMXd9VicB
 2GT3tLSfL/RPGsg1xcWreJMLgg7ctu4acVEggflP6m0fWffYMd9g5MMJYZbQSUhV7/BhCl
 kObz+ZwiKqb9Arvy5udqLHUz3XGQeyi3ynwoKTYlr/mBTmlLtXFKolBpnxCqntVZOwFOhw
 jtZVyEPv9Z+rfaHWSPfE1AJbPHUkZwnEIzm3d+WghCeafjzT1gbK+JpBQah2oWq42SpmX6
 1EVYua2XPXwecaqR+MUsx3IazCaXKtWyRAm/rrlJNOayG6J8ZhCn5m4arNTfaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=;
 b=QohrIokyE6gvAlbHH+2ScIj3BnDnIlGTQqJn9ICwNv8CCj3w8J2dv2/UuBk4gUkvEzJngE
 +7ihcslvjpCg8LCQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Meyer <thomas@m3y3r.de>, linux-um@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Wei Li <liwei391@huawei.com>,
 Davidlohr Bueso <dave@stgolabs.net>, linuxppc-dev@lists.ozlabs.org,
 kgdb-bugreport@lists.sourceforge.net,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Kelley <mikelley@microsoft.com>, linux-hyperv@vger.kernel.org,
 Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH next v4 00/15] printk: remove logbuf_lock
Date: Wed,  3 Mar 2021 11:15:13 +0100
Message-Id: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_101536_203001_6E8F0467 
X-CRM114-Status: UNSURE (   8.80  )
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

Hello,

Here is v4 of a series to remove @logbuf_lock, exposing the
ringbuffer locklessly to both readers and writers. v3 is
here [0].

Since @logbuf_lock was protecting much more than just the
ringbuffer, this series clarifies and cleans up the various
protections using comments, lockless accessors, atomic types,
and a new finer-grained @syslog_lock.

Removing @logbuf_lock required changing the semantics of the
kmsg_dumper callback in order to work locklessly. This series
adjusts all kmsg_dumpers and users of the kmsg_dump_get_*()
functions for the new semantics.

This series is based on next-20210303.

Changes since v3:

- disable interrupts in the arch/um kmsg_dumper

- reduce CONSOLE_LOG_MAX value from 4096 back to 1024 to revert
  the increasd 3KiB static memory footprint

- change the kmsg_dumper() callback prototype back to how it
  was because some dumpers need the registered object for
  container_of() usage

- for kmsg_dump_get_line()/kmsg_dump_get_buffer() restrict the
  minimal allowed sequence number to the cleared sequence number

John Ogness

[0] https://lore.kernel.org/lkml/20210225202438.28985-1-john.ogness@linutronix.de/

John Ogness (15):
  um: synchronize kmsg_dumper
  mtd: mtdoops: synchronize kmsg_dumper
  printk: limit second loop of syslog_print_all
  printk: kmsg_dump: remove unused fields
  printk: refactor kmsg_dump_get_buffer()
  printk: consolidate kmsg_dump_get_buffer/syslog_print_all code
  printk: introduce CONSOLE_LOG_MAX
  printk: use seqcount_latch for clear_seq
  printk: use atomic64_t for devkmsg_user.seq
  printk: add syslog_lock
  printk: kmsg_dumper: remove @active field
  printk: introduce a kmsg_dump iterator
  printk: remove logbuf_lock
  printk: kmsg_dump: remove _nolock() variants
  printk: console: remove unnecessary safe buffer usage

 arch/powerpc/kernel/nvram_64.c |   8 +-
 arch/powerpc/xmon/xmon.c       |   6 +-
 arch/um/kernel/kmsg_dump.c     |  13 +-
 drivers/hv/vmbus_drv.c         |   4 +-
 drivers/mtd/mtdoops.c          |  17 +-
 fs/pstore/platform.c           |   5 +-
 include/linux/kmsg_dump.h      |  47 ++--
 kernel/debug/kdb/kdb_main.c    |  10 +-
 kernel/printk/internal.h       |   4 +-
 kernel/printk/printk.c         | 464 +++++++++++++++++----------------
 kernel/printk/printk_safe.c    |  27 +-
 11 files changed, 310 insertions(+), 295 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
