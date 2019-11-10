Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A772C43331
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 12:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8BD2080F
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 12:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZKi2Jd3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8BD2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ShH0zU/CbZD+ELbHmrFDJiSFd4d5vl0eu4xarusLiQ=; b=EZKi2Jd36sPRTn
	MusIPuJSyQO2kXvkFWnqUUy88Ytw7iBh2h9BaGKHaERO50jIiEsboEpkypCagII3sBw2B8Bcvo/wH
	ocsGZgHpZZHupUCU9ssvI+p7BlekZ19O5pqG3ix8UciMmfMxDogbETjA9QKOCV7UmeAu1HNPyOzdQ
	1GoJFQX6cxBXAz13oM4Mh9wTel50p+F6lb0HjrzjGbOQq7FdEUW68ntHgCJb5ueVBNNNvm9WciIa1
	YA2bJgTDvoKEpvAgPZB9Xp2Dl+FpbiKKqJN2CCLgaX3J6SLxeISxCCBhLTj0/MC7IMx1AeJzN+eRf
	bnMVGJ2NE9QqGP04RW0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTmEq-00037X-UL; Sun, 10 Nov 2019 12:22:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTmEn-00035W-1I; Sun, 10 Nov 2019 12:22:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AF26428A46F;
 Sun, 10 Nov 2019 12:22:34 +0000 (GMT)
Date: Sun, 10 Nov 2019 13:22:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: rawnand: driver for Mediatek MT7621 SoC NAND flash
 controller
Message-ID: <20191110132232.3815f1af@collabora.com>
In-Reply-To: <20191110123919.5c998839@collabora.com>
References: <20191107073521.11413-1-gerg@kernel.org>
 <20191107084007.GA1203521@kroah.com>
 <20191110123919.5c998839@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_042237_210538_9E1CE966 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gerg@kernel.org,
 linux-mtd@lists.infradead.org, neil@brown.name,
 linux-mediatek@lists.infradead.org, blogic@openwrt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 10 Nov 2019 12:39:19 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 7 Nov 2019 09:40:07 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Thu, Nov 07, 2019 at 05:35:21PM +1000, gerg@kernel.org wrote:  
> > > From: Greg Ungerer <gerg@kernel.org>
> > > 
> > > Add a driver to support the NAND flash controller of the MediaTek MT7621
> > > System-on-Chip device. (This one is the MIPS based parts from Mediatek).
> > > 
> > > This code is a re-working of the earlier patches for this hardware that
> > > have been floating around the internet for years:
> > > 
> > > https://github.com/ReclaimYourPrivacy/cloak/blob/master/target/linux/ramips/patches-3.18/0045-mtd-add-mt7621-nand-support.patch
> > > 
> > > This is a much cleaned up version, put in staging to start with.
> > > It does still have some problems, mainly that it still uses a lot of the
> > > mtd raw nand legacy support.    
> > 
> > Is that an issue?  
> 
> Well, yes that's an issue since we decided that all new drivers should
> implement ->exec_op() instead of the legacy hooks. But that would be an
> issue even if we were merging the driver in staging.
> 
> > Why not just put it in the "real" part of the kernel
> > then, if those apis are still in use?
> >   
> > > The driver not only compiles, but it works well on the small range of
> > > hardware platforms that it has been used on so far. I have been using
> > > for quite a while now, cleaning up as I get time.
> > > 
> > > So... I am looking for comments on the best approach forward with this.
> > > At least in staging it can get some more eyeballs going over it.    
> > 
> > staging will just nit-pick it to death for coding style issues, it's not
> > going to be get any major api changes/cleanups there usually.  I'd
> > recommend just merging this to the "real" part of the kernel now if it's
> > working for you.  
> 
> I agree on that point: we should merge this driver directly in the NAND
> framework after it's been reworked to implement ->exec_op() instead of

  s/framework/subsystem/

> the legacy hooks.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
