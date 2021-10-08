Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26871C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 17:32:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E317A60F93
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 17:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E317A60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCTvhlKX4GvnKCQoDOLdkusQb7aNu3bugIAKPQ/oemo=; b=Q5l/9i5s5tAuiZ
	aFhtUfXCBO8hBPyTjJqSYfNoGi6BSuq9gCTd5X8yqoqHkLKKGfRNNB+5C4KGpXC1G11PDmmmIc6A0
	yBmIZaHRMxoTeVaEFgrXBksIP7HWMJ5Qp4uzuXiyYGnBnvt/EPzCNnZXFDs5TOAkZpqUqd3fYn7/w
	uW2MSh+fpoVbDe86dN4mm90lbkZjCzF5BLN+YRclM89fun4/vrI8tDTvZZDZMJoqK4fjPJRHtWCFE
	Z1zTBXrWrNBH3QgsghBG/SV1TDbQ/4u6QI2YizMdYqt1MasZhyxY3qLhN2h4yaKkl6k6esr4O6jXO
	51o38KmGBwbz5dBbEQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYtiN-003iLr-6P; Fri, 08 Oct 2021 17:31:23 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYtiJ-003iKB-0L
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 17:31:21 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 1487FC3B66;
 Fri,  8 Oct 2021 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633714276; bh=JWfS19275allVPCWaX4T20Mtdi7r0TA98mw4cxYeGko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=PWcMunuVSeH7rAPyXy1fFh23IUGE+SJoEHu/9fWi1I/uAyrgs8vjzkiOgF78NZe7Z
 7ygVRXI/3qy6bS0gfft4O2h0u0pA4VBc1XtKYww7bwp7taAkUxuFwYNBt+c9ekozkd
 NKhpy4lMcxI2NMH3+dh9/wiVrgSapHF1xX1VlD3jocqLlRSBcPIwddW5pwB7tnMEeq
 fUG9VvVA2lNx+zQsP7YOUnurhRR9EttRhmYPGoVi0IyFyKZIcRMZSyDmCgv/R3KTtb
 4EAM0zWdj8WVlGg0faGaJpWhADELcMr95JtBGKT8vIRileOBSlzRS8DLHy0EKlXaEb
 +SH4uk2HB+qrw==
Date: Fri, 8 Oct 2021 19:31:14 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: core: protect access to mtd devices while
 in suspend
Message-ID: <20211008173114.fmwbs3j3ufjvpcqd@skn-laptop>
References: <20211008141524.20ca8219@collabora.com>
 <20211008143825.3717116-1-sean@geanix.com>
 <20211008173043.6263ba80@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211008173043.6263ba80@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_103119_388924_9FD06E36 
X-CRM114-Status: GOOD (  40.24  )
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

On Fri, Oct 08, 2021 at 05:30:43PM +0200, Boris Brezillon wrote:
> Hi Sean,
> 
> Can you please submit that as a separate thread, ideally with an
> incremented version number, a changelog and a reference to all your
> previous attempts.

Yes, I'll do that with the next one.

> 
> On Fri,  8 Oct 2021 16:38:24 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > This will prevent reading/writing/erasing to a suspended mtd device.
> > It will force mtd_write()/mtd_read()/mtd_erase() to wait for
> > mtd_resume() to unlock access to mtd devices.
> 
> I think this has to be done for all the hooks except ->_reboot(),
> ->_get_device() and ->_put_device().
> 
> > 
> > Exec_op[0] speed things up, so we see this race when rawnand devices going
> 
> Mention the commit directly:
> 
> Commit ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op") speed
> things up, so we see this race when rawnand devices going ...
> 
> > into suspend. But it's actually "mtd: rawnand: Simplify the locking" that
> 
> But it's actually commit 013e6292aaf5 ("mtd: rawnand: Simplify the
> locking") that ...
> 
> > allows it to return errors rather than locking, before that commit it would
> > have waited for the rawnand device to resume.
> > 
> > Tested on a iMX6ULL.
> > 
> > [0]:
> > ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> 
> You flagged yourself as the author even though you didn't really write
> that code. I guess I'm fine with that, but I'd appreciate a
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> here, at least.
> 

Of course, of course I forgot it... Still an RFC after all :)

> > ---
> > 
> > Hope I got it all :)
> > 
> >  drivers/mtd/mtdcore.c   | 57 ++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/mtd/mtd.h | 36 ++++++++++++++++++--------
> >  2 files changed, 81 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index c8fd7f758938..3c93202e6cbb 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -36,6 +36,44 @@
> >  
> >  struct backing_dev_info *mtd_bdi;
> >  
> > +static void mtd_start_access(struct mtd_info *mtd)
> > +{
> > +	struct mtd_info *master = mtd_get_master(mtd);
> > +
> > +	/*
> > +	 * Don't take the suspend_lock on devices that don't
> > +	 * implement the suspend hook. Otherwise, lockdep will
> > +	 * complain about nested locks when trying to suspend MTD
> > +	 * partitions or MTD devices created by gluebi which are
> > +	 * backed by real devices.
> > +	 */
> > +	if (!master->_suspend)
> > +		return;
> > +
> 
> You need to remove the ->_suspend()/->_resume() implementation in
> mtd_concat.c, otherwise you'll hit the case described in the comment.

Do you mean to remove concat_suspend() and concat_resume() together
with the references to them?

> 
> BTW, did you test this series with lockdep enabled to make sure we
> don't introduce a deadlock?
> 

Good you mentioned it... I thought the kernel had LOCKDEP enabled, but I
guess it at some point got removed.

It reveals that mtd_read_oob() -> mtd_start_access() is using the suspend_lock
rw_semaphore before it's initialized...
But it's not complaining when going suspend and resuming, will continue
to test with LOCKDEP enabled.

/Sean

> > +	/*
> > +	 * Wait until the device is resumed. Should we have a
> > +	 * non-blocking mode here?
> > +	 */
> > +	while (1) {
> > +		down_read(&master->master.suspend_lock);
> > +		if (!master->master.suspended)
> > +			return;
> > +
> > +		up_read(&master->master.suspend_lock);
> > +		wait_event(master->master.resume_wq, master->master.suspended == 0);
> > +	}
> > +}
> > +
> > +static void mtd_end_access(struct mtd_info *mtd)
> > +{
> > +	struct mtd_info *master = mtd_get_master(mtd);
> > +
> > +	if (!master->_suspend)
> > +		return;
> > +
> > +	up_read(&master->master.suspend_lock);
> > +}
> > +


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
