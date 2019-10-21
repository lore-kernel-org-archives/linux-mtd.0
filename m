Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C550DCA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 08:56:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE9B206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 08:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jB9/UYl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE9B206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqtEQgfLEyL3DDp6UPxuBk7Dg25BSCxhM2mcfHDGrOc=; b=jB9/UYl/ucRZQQ
	dxIZHE2TtrfaGJXsqRyFhFpCZJN9FjnvGhgYaWL4kFSzS69aIW4gsUrwsXNVW3n0m5f8fKb1oQjua
	16eYirCclGBvtzWBecfWmaO6Limrv7f/tPgvVW8RS3kczeEEeirIHW0zx7tvoZmxEP+0N0Ixjx3K8
	FwDUqCQGs569eM2fqrivj9BP/ECUROKEWVskWsxJWeNoq1xMogjpFcW5Ia4m3KytStbi9rztB3uGZ
	XhOI8bCamqdY5CXUCjEvQxDPxFBzDFDvc7oKUYAmI7SW/tfghGSMU520aQAw98jPBoueS2xCDNLJn
	gfYYbkjqlEL56Zhfbo/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTUW-0002Cd-Dq; Mon, 21 Oct 2019 08:56:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTUT-0002C5-9v
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 08:56:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5AEE828A1AA;
 Mon, 21 Oct 2019 09:56:35 +0100 (BST)
Date: Mon, 21 Oct 2019 10:56:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
Message-ID: <20191021105632.3fa7b3ce@collabora.com>
In-Reply-To: <OF94EDFFB1.AFAD9C25-ON4825849A.002E2815-4825849A.002FB1CE@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
 <20191007104511.5aa7b8f2@xps13> <20191007112442.783e4fbe@xps13>
 <OFEDE76FEE.8BC48D9E-ON4825848D.000BCC94-4825848D.000E0643@mxic.com.tw>
 <20191008170249.06bd45ce@xps13>
 <OFB4F10613.467EB346-ON48258494.0020403E-48258494.002550A2@LocalDomain>
 <OF894937F3.4B6774EB-ON4825849A.0027B2DF-4825849A.0028A53F@mxic.com.tw>
 <20191021094435.78f4b16e@collabora.com>
 <OF94EDFFB1.AFAD9C25-ON4825849A.002E2815-4825849A.002FB1CE@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_015637_608573_13592013 
X-CRM114-Status: GOOD (  24.43  )
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
Cc: richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 tglx@linutronix.de, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 21 Oct 2019 16:40:57 +0800
masonccyang@mxic.com.tw wrote:

> Hi Boris,
> 
>  
> > > > > > > Then fill-in these two hooks from the manufacturer code,   
> without 
> > > the  
> > > > > > > postponed init.
> > > > > > >   
> > > > > > 
> > > > > > But in the final of nand_scan_tail(), mtd->_lock/_unlock will be
> > > > > > filled by NULL, right ?   
> > > > > 
> > > > > The NAND core should set mtd->_lock/_unlock() to NAND specific   
> hooks 
> > > so  
> > > > > that the MTD layer is abstracted and and drivers do not see it.   
> Then,
> > > > > in the NAND helper, either there is no specific hook defined by a
> > > > > manufacturer driver and you return -ENOTSUPP, or you execute the
> > > > > defined hook.   
> > > > 
> > > > okay, patch specific manufacturer _lock/_unlock driver
> > > > in nand_manufacturer_init();
> > > > 
> > > > and in the final of nand_scan_tail()
> > > > if (!mtd->_lock)
> > > >  mtd->_lock = NULL;
> > > > if (!mtd->_unlock)
> > > >  mtd->_unlock = NULL;   
> > > 
> > > 
> > > I'm still considering of post_init() in nand_scan_tail() for
> > > MTD layer default call-back function replacement because
> > > there would be more call-back functions need it.
> > > i.e., 
> > > MTD->_lock/_unlokc
> > > MTD->_suspend/_resume  
> > 
> > Again, that's something that needs to be abstracted so that both the
> > NAND manufacturer driver and the NAND controller driver can take
> > appropriate actions on suspend/resume operations.
> >   
> > > NTD->_point/_unpoint  
> >   
> > ->_point/_unpoint() are irrelevant for a NAND chip.  
> >   
> > > ...
> > > 
> > > 
> > > actually, my patch series are including MTD->_locl/_unlock and 
> > > MTD->_suspend/_resume. how do you think ?  
> > 
> > Miquel was suggesting to add nand_chip->{lock,unlock,is_locked}()
> > methods that would be implemented by the NAND manufacturer drivers, and
> > have generic wrappers implemented in nand_base.c:
> > 
> > static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> > {
> >    struct nand_chip *chip = mtd_to_nand(mtd);
> > 
> >    if (!chip->lock)
> >       return -ENOTSUPP;
> > 
> >    return chip->lock(chip, ofs, len);
> > }
> > 
> > ...
> > 
> > If you do that, you won't need this post_init() hook.  
> 
> got it, but ... 
> user space program flash_lock/flash_unlock are calling 
> mtd_lock() & mtd_unlock().
> i.e.,
> int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> {
>          if (!mtd->_lock)
>                  return -EOPNOTSUPP;
>          if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
>                  return -EINVAL;
>          if (!len)
>                  return 0;
>          return mtd->_lock(mtd, ofs, len);
> }
> 

Assign mtd lock/unlock/is_locked hooks to the generic wrappers in
nand_scan_tail():

	mtd->_lock = nand_lock;
	mtd->_unlock = nand_unlock;
	mtd->_is_locked = nand_is_locked;

Seriously, we've almost implemented the thing for you with all the
details we've given. At some point you have to look more closely at how
things are done/designed in the NAND framework if you want to
contribute core changes. I'm fine giving hints but we're far beyond
that point here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
