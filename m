Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FE3C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:08:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3E664EDF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3E664EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QWhJO75U+Zs0VRB2iNzBDTMDb9sizIHGBetZEpUSZNo=; b=eeeEc70FNK/WqzPFZlWoeG7Xr
	HnL0mbybY8lymJrLAXg1egXIRSsQmVLu6Joo+miqwzPsFPiM6kvCozLLzA+7fWb16QY1JMxQClh4j
	bPrlX2gl/x4BIrH6c/LX3voCdIjsTnuAulqpNeGrRIulS1rU77DkCOX3b33UMrsfD8eZE4QuMqSju
	MDnGVSUDbpLuRIxbgO4kzrNIXNRBxjv7y8kNBNOD2obDwDeEVObrrCPrv0qXHdxXyjzFpY+INaXpx
	N8U1TpLqmt1yTRXfgPugaTyArLGU0Y8D2GNxjC/0jaIs7ykfLM4Fm8S3w/THI+8fotPGWAWYauvtC
	PLdrkLKSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXlA-006Lwv-JR; Wed, 03 Mar 2021 20:06:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4p-005IWq-Am
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6gxU8470dDzAP7HfvUdBdyr9yxuJ8C0WR83TSoe4VBA=; b=pQtrIWQr0gFXe1ecZ67iqxQzpa
 VAHnlG+bfjSU6MNXnG1AEKT3IBLtjRy3rYXKZrZvIO5P5xMvfC9YvDDBNcbf394ad8XNqWzqnF9HC
 BT03dYzNhtKn0QAkQYPRNuDqnpMA2twUxjtE5k+/Jxa7vys9bOfI47B9P4NsJGdKMQN63oxcE6dbz
 vN2Xsap5rOHOvSLoK3pPq60ZPb9zNue+BBoNfPLhQ+rWVjWeLd/6xZKsB2aikNdf5avs8BPFgWqxW
 kmaWnulUrZvDp/b3+sBTlyR3ofkyKh/NXWHTdu67uLXmbqF4GXQ9TSxc8PPRXJgoYDThM6uUTpVJs
 W/GmBHzw==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOXU-00299x-Vp
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 10:15:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gxU8470dDzAP7HfvUdBdyr9yxuJ8C0WR83TSoe4VBA=;
 b=wLaCikomf2P6Oxm8LIkmjrb2bU8FHRzOEM+Zn+K7vd9QyjJUARrXvuhMFL88IItMKCOsRn
 2hDuK5Mnk3QdNZzEwWQmyf1eQYobSHwhTwd1p8dTI2391RtfI5hyCbkIPCZX7o4CBlC1Wv
 iHvrF0ClHe9/Rhh0/zWVMHgUf7+W2XRgG/P2DIoR9SQyDkKnMDVY6LcIbCcECFfvP8q5UV
 niyBrtP93QzOwVS8HadngtRCjvIq+dFJ2q96eSrl+m6K3z1O0e+Agurp7QAqz8CyL+D2De
 PAG5YaMcTmKJrQM5jUNXEMZlR04GTOga9sVvTV7Bhn34MAOmSaYLjzmWxF7FYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gxU8470dDzAP7HfvUdBdyr9yxuJ8C0WR83TSoe4VBA=;
 b=ZrmfNsNhxCMROF7acvjvPMYwc+pkJ+Mwz+JUMkCX84ooKIniSA/zPyo4modHCjo7nioLhF
 FROcGMLz0zwxUfDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH next v4 02/15] mtd: mtdoops: synchronize kmsg_dumper
Date: Wed,  3 Mar 2021 11:15:15 +0100
Message-Id: <20210303101528.29901-3-john.ogness@linutronix.de>
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_101536_201964_AC2BC533 
X-CRM114-Status: GOOD (  14.07  )
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

The kmsg_dumper can be called from any context and CPU, possibly
from multiple CPUs simultaneously. Since the writing of the buffer
can occur from a later scheduled work queue, the oops buffer must
be protected against simultaneous dumping.

Use an atomic bit to mark when the buffer is protected. Release the
protection in between setting the buffer and the actual writing in
order for a possible panic (immediate write) to be written during
the scheduling of a previous oops (delayed write).

An atomic bit (rather than a spinlock) was chosen so that no
scheduling or preemption side-effects would be introduced. The MTD
kmsg_dumper may dump directly or it may be delayed (via scheduled
work). Depending on the context, different MTD callbacks are used.
For example, mtd_write() expects to be called in a non-atomic
context and may take a mutex.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/mtd/mtdoops.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 774970bfcf85..8bbfba40a554 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -52,6 +52,7 @@ static struct mtdoops_context {
 	int nextcount;
 	unsigned long *oops_page_used;
 
+	unsigned long oops_buf_busy;
 	void *oops_buf;
 } oops_cxt;
 
@@ -180,6 +181,9 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	u32 *hdr;
 	int ret;
 
+	if (test_and_set_bit(0, &cxt->oops_buf_busy))
+		return;
+
 	/* Add mtdoops header to the buffer */
 	hdr = cxt->oops_buf;
 	hdr[0] = cxt->nextcount;
@@ -190,7 +194,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 				      record_size, &retlen, cxt->oops_buf);
 		if (ret == -EOPNOTSUPP) {
 			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
-			return;
+			goto out;
 		}
 	} else
 		ret = mtd_write(mtd, cxt->nextpage * record_size,
@@ -203,6 +207,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	memset(cxt->oops_buf, 0xff, record_size);
 
 	mtdoops_inc_counter(cxt);
+out:
+	clear_bit(0, &cxt->oops_buf_busy);
 }
 
 static void mtdoops_workfunc_write(struct work_struct *work)
@@ -276,8 +282,11 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 	if (reason == KMSG_DUMP_OOPS && !dump_oops)
 		return;
 
+	if (test_and_set_bit(0, &cxt->oops_buf_busy))
+		return;
 	kmsg_dump_get_buffer(dumper, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
 			     record_size - MTDOOPS_HEADER_SIZE, NULL);
+	clear_bit(0, &cxt->oops_buf_busy);
 
 	if (reason != KMSG_DUMP_OOPS) {
 		/* Panics must be written immediately */
@@ -394,6 +403,7 @@ static int __init mtdoops_init(void)
 		return -ENOMEM;
 	}
 	memset(cxt->oops_buf, 0xff, record_size);
+	cxt->oops_buf_busy = 0;
 
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
