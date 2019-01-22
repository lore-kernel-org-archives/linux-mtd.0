Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E48C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 12:32:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FA020870
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 12:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aB5GcFJh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MckHuuIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FA020870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHU1mvlROus4B871wuWVs3kxJlmoHxhRKnXtcQSgyhw=; b=aB5GcFJhKThEF/
	/xpfo1Ad4CaUxPnXq8b5Q5iRntQ+JjgwLMU9I7q0tKQ3mo3MXnOAx4e0BvAhjFznNMYgzyaHqJNfi
	frHFC61QzeEOpgrIGhPst93Iqee+o9vEmxa0krpzBmje4Zxb+yVJ14a1AmjjQkdGlxDOroKob8N4v
	9wUdN/8Uc5sPuEBT/QKYJWXJZSfaISniY8bnAkd2myS7ByI8hqI/Kk7hWmxu44gszqe+b7Bdr8SSk
	9fkIwSrF3UoBWYKHe2iY7iMSdeV5tT7vA+YsjWSev1QNiM2TkzYPDzhW5Zis1QJXcS4Zm7Q1XAqf4
	KnK7x/QHYPZa3Hk3lsyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glvDx-0004iz-C3; Tue, 22 Jan 2019 12:32:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glvDt-0004iS-Sh
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 12:32:11 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC19A20870;
 Tue, 22 Jan 2019 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548160329;
 bh=x7QdB7um1arDwKFTRfX0lZfXuh1Bq/ojuSvVdjQdzC8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MckHuuIapuYKq6yx0RrVhxVXqZ/ITmG57WB4QP5MUytXP+Lc9FKKw2GwWBrLAQ++/
 O4UuR+XDegdH/R2kCGJa0q4Yi8e5F7uUi4cqtZnw2PbI8RiBgghwlE2WP+nwHVPmE0
 yPScMJGTYjQcJ2AnNvC3IgZjWCPQd3yIlrv9QV7Y=
Date: Tue, 22 Jan 2019 13:31:59 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
Message-ID: <20190122133159.2033844c@bbrezillon>
In-Reply-To: <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_043209_962641_4F42062B 
X-CRM114-Status: GOOD (  27.28  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 12:21:11 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Wed, Jan 2, 2019 at 3:37 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > add_mtd_device() can fail. We should always check its return value
> > and gracefully handle the failure case. Fix the call sites where this
> > not done (in mtdpart.c) and add a __must_check attribute to the
> > prototype to avoid this kind of mistakes.
> >
> > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> > ---
> > No Fixes or Cc-stable tag here, as this seems to have worked just fine
> > without checking add_mtd_device() ret code until we started to expose
> > MTD devices as NVMEM providers (queued for 4.21).  
> 
> Oh yes ;-)
> 
> https://lore.kernel.org/lkml/87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com/t/
> 
> Your patch is very similar to mine, so the crash is gone.

Oops, sorry about that. I completely forgot about this patch. It seems
the discussion led to a different conclusion though (patch
allocate_partitions() to reject wrong parts early) and the v2 was never
sent (or I missed it). Anyway, I guess we should have done both (check
add_mtd_device() ret code everywhere and patch allocate_partitions() to
reject bad parts early).

> However, the warning is still there:
> 
>     m25p80 spi0.0: s25sl032p (4096 Kbytes)
>     3 fixed-partitions partitions found on MTD device spi0.0
>     Creating 3 MTD partitions on "spi0.0":
>     0x000000000000-0x000000080000 : "loader"
>     0x000000080000-0x000000600000 : "user"
>     mtd: partition "user" extends beyond the end of device "spi0.0" --
> size truncated to 0x380000
>     0x000000600000-0x000004000000 : "flash"
>     mtd: partition "flash" is out of reach -- disabled
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:571
> add_mtd_device+0x90/0x3b0
> 
> Interestingly, only one partition is created, covering the full size of the
> device:
> 
>     # cat /proc/partitions
>     major minor  #blocks  name
> 
>       31        0       4096 mtdblock0
> 
> While I would expect two partitions, "loader" and truncated "user":
> 
>       31        0        512 mtdblock0
>       31        1       3584 mtdblock1

Yes, makes sense, I guess your patch was better than mine :-/. Can you
try with the following diff applied and let me know if it solves the
problem?

--->8---
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 60104e1079c5..aefd3344991f 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -724,16 +724,14 @@ int add_mtd_partitions(struct mtd_info *master,
 {
        struct mtd_part *slave;
        uint64_t cur_offset = 0;
-       int i, ret;
+       int i, ret, actual_nbparts = 0;
 
        printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
        for (i = 0; i < nbparts; i++) {
                slave = allocate_partition(master, parts + i, i, cur_offset);
-               if (IS_ERR(slave)) {
-                       ret = PTR_ERR(slave);
-                       goto err_del_partitions;
-               }
+               if (IS_ERR(slave))
+                       continue;
 
                mutex_lock(&mtd_partitions_mutex);
                list_add(&slave->list, &mtd_partitions);
@@ -746,7 +744,7 @@ int add_mtd_partitions(struct mtd_info *master,
                        mutex_unlock(&mtd_partitions_mutex);
 
                        free_partition(slave);
-                       goto err_del_partitions;
+                       continue;
                }
 
                mtd_add_partition_attrs(slave);
@@ -754,14 +752,10 @@ int add_mtd_partitions(struct mtd_info *master,
                parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
 
                cur_offset = slave->offset + slave->mtd.size;
+               actual_nbparts++;
        }
 
-       return 0;
-
-err_del_partitions:
-       del_mtd_partitions(master);
-
-       return ret;
+       return actual_nbparts;
 }
 
 static DEFINE_SPINLOCK(part_parser_lock);
@@ -1003,10 +997,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
                }
                /* Found partitions! */
                if (ret > 0) {
-                       err = add_mtd_partitions(master, pparts.parts,
+                       ret = add_mtd_partitions(master, pparts.parts,
                                                 pparts.nr_parts);
                        mtd_part_parser_cleanup(&pparts);
-                       return err ? err : pparts.nr_parts;
+                       return ret;
                }
                /*
                 * Stash the first error we see; only report it if no parser

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
