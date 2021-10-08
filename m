Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36079C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 15:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A3860F6F
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 15:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0A3860F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqWpIznpxfMLb8knnDAjE+978o0pqGAcoN8DmZRwaGU=; b=RUuMqYcnkHiZnc
	h7m1fbx0s2gT3gtBMAD1xWgrypTKCSd05St0sKU8389+F1frIN0HkOkuKrgdqQd1kdI95xwCvbEkW
	iv7SjReVfKcvot1A7aBpLWS+vsoS8a+nwajO3q70DSzgbWEhb908U9+hfBCb1NstirqUDIJtOUycN
	rk2xtoR7McedlDc25a09d0sv7CQEeqrkY9LTNQ/v27SCCTLqh9oboOFceRpnIuyDetIPvTCYJlx9P
	OTYiPhFKeKRbjLM/im4fZ748RoTBeSEn56gIt8aq+CmfMhr6tu6v7RLFSzzRxcyWBOoq+v1NApJ3C
	DutsOH/1dQKobVO6yjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYrpq-003ELS-PF; Fri, 08 Oct 2021 15:30:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYrpn-003EKR-JR
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 15:30:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 879331F45B04;
 Fri,  8 Oct 2021 16:30:52 +0100 (BST)
Date: Fri, 8 Oct 2021 17:30:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: core: protect access to mtd devices while
 in suspend
Message-ID: <20211008173043.6263ba80@collabora.com>
In-Reply-To: <20211008143825.3717116-1-sean@geanix.com>
References: <20211008141524.20ca8219@collabora.com>
 <20211008143825.3717116-1-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_083055_830709_787548E9 
X-CRM114-Status: GOOD (  30.67  )
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

Hi Sean,

Can you please submit that as a separate thread, ideally with an
incremented version number, a changelog and a reference to all your
previous attempts.

On Fri,  8 Oct 2021 16:38:24 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> This will prevent reading/writing/erasing to a suspended mtd device.
> It will force mtd_write()/mtd_read()/mtd_erase() to wait for
> mtd_resume() to unlock access to mtd devices.

I think this has to be done for all the hooks except ->_reboot(),
->_get_device() and ->_put_device().

> 
> Exec_op[0] speed things up, so we see this race when rawnand devices going

Mention the commit directly:

Commit ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op") speed
things up, so we see this race when rawnand devices going ...

> into suspend. But it's actually "mtd: rawnand: Simplify the locking" that

But it's actually commit 013e6292aaf5 ("mtd: rawnand: Simplify the
locking") that ...

> allows it to return errors rather than locking, before that commit it would
> have waited for the rawnand device to resume.
> 
> Tested on a iMX6ULL.
> 
> [0]:
> ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

You flagged yourself as the author even though you didn't really write
that code. I guess I'm fine with that, but I'd appreciate a

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>

here, at least.

> ---
> 
> Hope I got it all :)
> 
>  drivers/mtd/mtdcore.c   | 57 ++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/mtd.h | 36 ++++++++++++++++++--------
>  2 files changed, 81 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c8fd7f758938..3c93202e6cbb 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -36,6 +36,44 @@
>  
>  struct backing_dev_info *mtd_bdi;
>  
> +static void mtd_start_access(struct mtd_info *mtd)
> +{
> +	struct mtd_info *master = mtd_get_master(mtd);
> +
> +	/*
> +	 * Don't take the suspend_lock on devices that don't
> +	 * implement the suspend hook. Otherwise, lockdep will
> +	 * complain about nested locks when trying to suspend MTD
> +	 * partitions or MTD devices created by gluebi which are
> +	 * backed by real devices.
> +	 */
> +	if (!master->_suspend)
> +		return;
> +

You need to remove the ->_suspend()/->_resume() implementation in
mtd_concat.c, otherwise you'll hit the case described in the comment.

BTW, did you test this series with lockdep enabled to make sure we
don't introduce a deadlock?

> +	/*
> +	 * Wait until the device is resumed. Should we have a
> +	 * non-blocking mode here?
> +	 */
> +	while (1) {
> +		down_read(&master->master.suspend_lock);
> +		if (!master->master.suspended)
> +			return;
> +
> +		up_read(&master->master.suspend_lock);
> +		wait_event(master->master.resume_wq, master->master.suspended == 0);
> +	}
> +}
> +
> +static void mtd_end_access(struct mtd_info *mtd)
> +{
> +	struct mtd_info *master = mtd_get_master(mtd);
> +
> +	if (!master->_suspend)
> +		return;
> +
> +	up_read(&master->master.suspend_lock);
> +}
> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
