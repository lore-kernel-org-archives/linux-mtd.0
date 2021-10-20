Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCB7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D035D61074
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D035D61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csVFEskqSTWslDRwMXvr25cAIoQT1JGlOY4e7AHUXns=; b=0KA42f3waiOp4H
	ownhzTm9+LxCBIafO4AaFK3fXS4/qMFyQSIRodobmQT0NhczlZiGv5PEfNp4E4amosalxbhFSN7Lu
	remWhO1OlwJeOJCOvWi0SpQblLb7/36E2vX1pak4/krcEQY3rnXF3Er/YcQtNLehEtMyB8fLM5j5m
	Emo7ZsVi4KBzehzZUgZmfymkcviIX6EiiiYUGINw7J9Q1ZR3iH1a9T3sOvkScypJXbiF70AyKtuEC
	MU0myzg+nSW7NnjSRCtBYe/E+uJbjrsis56JhNTOMtceN7kto42eG0ifOgcrnA052KHgQFHq333np
	kirmqe5vEs70GjYkZJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7fY-003xEx-CL; Wed, 20 Oct 2021 09:13:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7fV-003xE6-RE
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 09:13:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 498E71F43FBF;
 Wed, 20 Oct 2021 10:13:52 +0100 (BST)
Date: Wed, 20 Oct 2021 11:13:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211020111347.627159a2@collabora.com>
In-Reply-To: <20211020084534.2472305-3-sean@geanix.com>
References: <20211020084534.2472305-1-sean@geanix.com>
 <20211020084534.2472305-3-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_021354_048118_5BAD6DF6 
X-CRM114-Status: GOOD (  19.26  )
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

On Wed, 20 Oct 2021 10:45:32 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

>  static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
> @@ -1257,6 +1259,8 @@ int mtd_erase(struct mtd_info *mtd, sruct erase_info *instr)
>  
>  	ledtrig_mtd_activity();
>  
> +	mtd_start_access(master);
> +
>  	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION) {
>  		adjinstr.addr = (loff_t)mtd_div_by_eb(instr->addr, mtd) *
>  				master->erasesize;
> @@ -1278,6 +1282,8 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		}
>  	}
>  
> +	mtd_end_access(master);
> +

The section covered in mtd_erase() is too broad. Put the start/end
calls around the ->_erase() call.

>  	return ret;
>  }



> @@ -1576,7 +1604,6 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
>  		ret_code = mtd_read_oob_std(mtd, from, ops);
>  
>  	mtd_update_ecc_stats(mtd, master, &old_stats);
> -

Unrelated line removal. Please drop this change.

>  	/*
>  	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
>  	 * similar to mtd->_read(), returning a non-negative integer
> @@ -1615,7 +1642,9 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
>  	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
>  		return mtd_io_emulated_slc(mtd, to, false, ops);
>  
> -	return mtd_write_oob_std(mtd, to, ops);
> +	ret = mtd_write_oob_std(mtd, to, ops);
> +
> +	return ret;

Ditto, you can keep the 'return mtd_write_oob_std(mtd, to, ops);' here.

>  }
>  EXPORT_SYMBOL_GPL(mtd_write_oob);


> +static inline void mtd_start_access(struct mtd_info *master)
> +{
> +	WARN_ON_ONCE(master != mtd_get_master(master));
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

Please keep the tests consistent:

		wait_event(master->master.resume_wq, !master->master.suspended);

> +	}
> +}
> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
