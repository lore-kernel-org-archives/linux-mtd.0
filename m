Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F4C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:09:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C3B206D7
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fLgcx3pj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1C3B206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5jXdJT6PR5CgUw9DFNYVeeVcAmaD6YdcI+hMPgeFOc=; b=fLgcx3pjp4zepm
	Gnhl11t8VvcBfNxz6jWB21AgMkXg9YEgIt5KzoK5svqQ+qqqCjAW7nNRb2KcqCagnGFb63Pk0NfZj
	2iK5F5mi6dUC3mgO8Fl4HrS3RwOKtcj2XuFo8hDwh6sAv4ywWFknXPiU2aeuCzF0MhEg3X0fTcsM2
	knn3vb/iZbnJ4xhY3A5OcjfXStQNSDUEoa5s0k5YDs44gng2a9z+A7VvcAgSYbGh5BIc+AwENbB5/
	NP9uklUy1VbJccCs0TcshocT44GIrMV2X80Uym9bgpfpe3YclkOkMj15S5BYhHurKWZ+qs/RcIvaP
	z9rfid7A1P27V9WJnpXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJQX-0003Va-5H; Tue, 28 Apr 2020 06:09:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJQU-0003U6-Tg
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:09:04 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AC79A2A0B89;
 Tue, 28 Apr 2020 07:09:01 +0100 (BST)
Date: Tue, 28 Apr 2020 08:08:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 11/17] mtd: rawnand: cafe: Don't leave ECC enabled in
 the write path
Message-ID: <20200428080858.4914306f@collabora.com>
In-Reply-To: <20200427215132.1331d4f5@xps13>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-12-boris.brezillon@collabora.com>
 <20200427215132.1331d4f5@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_230903_088818_6C16BB9D 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 21:51:32 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 27 Apr
> 2020 10:20:21 +0200:
> 
> > cafe_nand_write_page_lowlevel() sets the ECC auto-generation flag but  
> 
> IIRC you renamed this function in patch 1 so now it is named
> "_write_page()".
> 
> > never clears it, thus forcing the cafe_nand_cmdfunc() to clear it
> > in certain circumstances. Let's just clear this flag in
> > cafe_nand_write_page_lowlevel() instead.  
> 
> Same here              ^
> 

Right. That's what happens when you re-order commits without paying
attention to the commit message.


> > -	return nand_prog_page_end_op(chip);
> > +	ret = nand_prog_page_end_op(chip);
> > +
> > +	/*
> > +	 * And clear it before returning so that following write operations
> > +	 * that do not involve ECC don't generate ECC bytes.
> > +	 */
> > +	cafe->ctl2 &= ~CAFE_NAND_CTRL2_AUTO_WRITE_ECC;  
> 
> I like spaces before returning, but again it's really a nitpick, you
> can ignore that :)
>

Will add a blank line here as well.
 
> > +	return ret;
> >  }
> >  
> >  /* F_2[X]/(X**6+X+1)  */  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
