Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FB1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 10:05:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE94E60F5B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 10:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE94E60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsCdU48BzAxmUeyQx8+diotCf3IsPkqPSLokTOlqHs0=; b=S4gMCGI7zkeFv3
	kBaGM/pAgWdHFFVpGgDA5sTV0w96EZ/PgA6+puL5KUbyrIUHrZoNLhuxcwQyT0n/h3UYKQckUewoV
	thR6omQZu6P5Fb457AQ+mhFs+xVCkQsN2WFzXn/MK9WGx0x5xfgdcaTIAZh3sveyIaNIx96tE7GaK
	aTX+Yo0zKOCM1EUReVwPUKsZwfcuGJBw5q4fxL3A0y7Qn8vWrEfmj2v2Stj+lgqRahKWegXaiyCp8
	6ammSqgWjukrBUett8L+X0t/PpgTUP/NDYRyD5ZatB4xzgDvaXOqtXbGXT644KY9UOFfSyyPK8DnJ
	fjTTBmvIKMPrfo4qTqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYmjz-002K84-QQ; Fri, 08 Oct 2021 10:04:35 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYmjw-002K6k-46
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 10:04:34 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id CFB13C3B02;
 Fri,  8 Oct 2021 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633687467; bh=t790EvsXc4ZoZ8yOdtaYuNWz3V452fkzKiJzSLy8OPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MK/kBQmKD5UuS+JEqqB8wJT+zDf5JDNfPkysg6ZTi3WIH1zfchoAHZnjc3/euVdyL
 x8EbPu4tsc98+6HOG6eD+BrD+D/8H/Pl250UofhpHZJYnEB/UWbTJ/TDjBjsdubrgd
 2KtDPUDUq6ZlEd+HotNU5hX7x7zN2L92TcfT51yMzVGCHD3kmHgnz1JKZfLJevfvU4
 7clsycAUcBMM/eOTIaakYW4yC5LB50mnvrdqIS88Z9YtgmICCx+pQz5oHl+IUTusyc
 8QCbKAGJxKlXb5fzoyVryjWFFOEGkyGwmoYmhxVmaEvRV040WYsoU5VvQpnvp/X5qk
 MKHvg4oiu4TLQ==
Date: Fri, 8 Oct 2021 12:04:25 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211008100425.uudzlda2n5ojqjzc@skn-laptop>
References: <20211004101246.kagtezizympxupat@skn-laptop>
 <20211004134700.26327f6f@collabora.com>
 <20211005070930.epgxb5qzumk4awxq@skn-laptop>
 <20211005102300.5da6d480@collabora.com>
 <20211005084938.jcbw24umhehoiirs@skn-laptop>
 <20211005105836.6c300f25@collabora.com>
 <20211007114351.3nafhtpefezxhanc@skn-laptop>
 <20211007141858.314533f2@collabora.com>
 <20211007123916.w4oaooxfbawe6yw3@skn-laptop>
 <20211007151426.54db0764@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007151426.54db0764@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_030432_947414_6BE330A0 
X-CRM114-Status: GOOD (  36.47  )
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

On Thu, Oct 07, 2021 at 03:14:26PM +0200, Boris Brezillon wrote:
> On Thu, 7 Oct 2021 14:39:16 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > > 
> > > wait_queue doesn't really describe what this waitqueue is used for
> > > (maybe resume_wq), and the suspended state should be here as well
> > > (actually, there's one already).  
> > 
> > I'll rename to something meaningful.
> > > 
> > > Actually, what we need is a way to prevent the device from being
> > > suspended while accesses are still in progress, and new accesses from
> > > being queued if a suspend is pending. So, I think you need a readwrite
> > > lock here:
> > > 
> > > * take the lock in read mode for all IO accesses, check the
> > >   mtd->suspended value
> > >   - if true, release the lock, and wait (retry on wakeup)
> > >   - if false, just do the IO
> > > 
> > > * take the lock in write mode when you want to suspend/resume the
> > >   device and update the suspended field. Call wake_up_all() in the
> > >   resume path  
> > 
> > Could we use the chip->lock mutex for this? It's does kinda what you
> > described above?
> 
> No you can't. Remember I suggested to move all of that logic to
> mtdcore.c, which doesn't know about the nand_chip struct.
> 
> > If we introduce a new lock, do we really need to have the suspended as
> > an atomic?
> 
> Nope, I thought we could do without a lock, but we actually need to
> track active IO requests, not just the suspended state.

I have only added wait_queue to read and write operations.
I'll have a look into where we should add further checks.

> 
> > 
> > I will test with some wait and retry added to nand_get_device().
> 
> Again, I think there's a misunderstanding here: if you move it to the
> mtd layer, it can't be done in nand_get_device(). But once you've
> implemented it in mtdcore.c, you should be able to get rid of the
> nand_chip->suspended field.

I have moved the suspended atomic and wake_queue to mtdcore.c. And kept
the suspended variable in nand_base as is fine for chip level suspend
status.

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c8fd7f758938..6492071eb4da 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -42,15 +42,24 @@ static int mtd_cls_suspend(struct device *dev)
 {
        struct mtd_info *mtd = dev_get_drvdata(dev);

-       return mtd ? mtd_suspend(mtd) : 0;
+       if (mtd) {
+               atomic_inc(&mtd->suspended);
+               return mtd_suspend(mtd);
+       }
+                                                                                                                                                                                                                                                                                                                                                                                             +       return 0;
 }

 static int mtd_cls_resume(struct device *dev)
 {
        struct mtd_info *mtd = dev_get_drvdata(dev);

-       if (mtd)
+       if (mtd) {
                mtd_resume(mtd);
+               atomic_dec(&mtd->suspended);
+               wake_up_all(&mtd->resume_wq);
+       }
+
        return 0;
 }
@@ -678,6 +687,10 @@ int add_mtd_device(struct mtd_info *mtd)
        if (error)
                goto fail_nvmem_add;

+       init_waitqueue_head(&mtd->resume_wq);
+
+       atomic_set(&mtd->suspended, 0);
+
        mtd_debugfs_populate(mtd);

        device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
@@ -1558,6 +1571,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
        struct mtd_ecc_stats old_stats = master->ecc_stats;
        int ret_code;

+       wait_event(mtd->resume_wq, atomic_read(&mtd->suspended) == 0);
+
        ops->retlen = ops->oobretlen = 0;

        ret_code = mtd_check_oob_ops(mtd, from, ops);
@@ -1597,6 +1612,8 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
        struct mtd_info *master = mtd_get_master(mtd);
        int ret;

+       wait_event(mtd->resume_wq, atomic_read(&mtd->suspended) == 0);
+
        ops->retlen = ops->oobretlen = 0;

        if (!(mtd->flags & MTD_WRITEABLE))
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 88227044fc86..70ede36092a9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -360,6 +360,9 @@ struct mtd_info {
        int (*_get_device) (struct mtd_info *mtd);
        void (*_put_device) (struct mtd_info *mtd);

+       atomic_t suspended;
+       wait_queue_head_t resume_wq;
+
        /*
         * flag indicates a panic write, low level drivers can take appropriate
         * action if required to ensure writes go through

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
