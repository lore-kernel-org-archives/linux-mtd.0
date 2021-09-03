Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC75C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EA460F92
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66EA460F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tt9i9arD0TFPv4GE5sBDdAE6q3Fc59fHTftMuQyo45k=; b=OYJxCOaw5Sngv9
	qK3rXOqm2fbXkWAi55fM64LQz9XQIZYrwRWULD0ecqSxLgE2s2WPNahyq6ikfmDjM9VkIEPZaSTNq
	ngqTGIfD05tfCupgrQqbP65H5NVQI074bofOcF99wedl2iBZVB6VieIDiSfUwl65LFvusVoUQxeUy
	7aRM2Q+k7qq7ohDFLM4l1Ugl9wD3w4HDEOO3cBdBfMJkZVK6r82F7v+KmZX+wDH+EILm4xy81u2F2
	0OAYG+Oi2ZLfStXaktnL9qdOS19xneMB20DaiNB7yLd0pCIvOTErCoaT3/SZnKm/K7IVGzPdAb5S/
	XEQNZ+qOp+vy7gAawThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4Oh-00BEoh-8b; Fri, 03 Sep 2021 08:18:03 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4Oe-00BEnd-8v
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 08:18:01 +0000
Received: from skn-laptop (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id BB3D2440FA9;
 Fri,  3 Sep 2021 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1630657072; bh=YAAirGmlsOW0wiWdoathwqmAEWUQMpo7sW6Iif354yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=SyOPOvfoa5pBOBA5e3O6DVmobu0uxgrr9IoH4E9OsOQNrUaK+5hMeVgit4U5VJlWd
 lGjDbnjSIaTLvcueAe2dWbQCaO6n1LHV0gxTTWXMFV++dqIyVyAWut1f3o/LJh+zFL
 3SwXSVROG8vxu9Z+iuItHLzIEBxyv8xbxZ3RauP0qhGIoR9wURX9rqW+NrSiNNYgF2
 kthDlQIJmp49FVLKAI80USo6TSeDsaMA1hFg0m8LP7GvqHTkYHmdfjaK4sR4maMcOv
 28hHTYgsMeH/MwKn7AyRZ4NzEFTEnrrdKaxVoGOg/vgq4ka0UFAekKVVgEsral6FNg
 BYwmsLTH8cAfg==
Date: Fri, 3 Sep 2021 10:17:51 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] PM / suspend: move userspace freeze before disk sync
Message-ID: <20210903081751.3qq36nrksucqthss@skn-laptop>
References: <20210901083442.210230-1-sean@geanix.com>
 <CAJZ5v0j5dMDSDjhuXaZd=_J5JOP4Z09WUXfjWX_iCcT4RDisCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j5dMDSDjhuXaZd=_J5JOP4Z09WUXfjWX_iCcT4RDisCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_011800_511725_EF20B4BD 
X-CRM114-Status: GOOD (  20.99  )
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

On Thu, Sep 02, 2021 at 06:28:14PM +0200, Rafael J. Wysocki wrote:
> On Wed, Sep 1, 2021 at 10:35 AM Sean Nyekjaer <sean@geanix.com> wrote:
> >
> > This fixes an issue where data remains unwritten before suspend.
> 
> Well, it doesn't make the issue go away, it just hides it for you and
> it may very well expose it for someone else.

OK

> 
> In particular, note that you can compile the kernel with
> CONFIG_SUSPEND_SKIP_SYNC set which makes it not sync at all during
> system-wide suspend and this is a valid case expected to work.  It
> looks like this case doesn't work for you.
> 
> > UBI tried to write data, before the mtd device had been unsuspended.
> 
> Well, that's the real problem and it can happen regardless of whether
> or not this patch is there.

How to fix it then?
We can't live with devices that bricks on unsuspend :/

/Sean

> 
> > Seen on an iMX6ULL board fitted with rawnand flash.
> >
> > Before:
> > PM: suspend entry (deep)
> > Filesystems sync: 0.088 seconds
> > Freezing user space processes ... (elapsed 0.000 seconds) done.
> > OOM killer disabled.
> > Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > printk: Suspending console(s) (use no_console_suspend to debug)
> > PM: suspend devices took 0.030 seconds
> > Disabling non-boot CPUs ...
> > ubi0 error: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
> >
> > After:
> > PM: suspend entry (deep)
> > Freezing user space processes ... (elapsed 0.001 seconds) done.
> > OOM killer disabled.
> > Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > Filesystems sync: 0.060 seconds
> > printk: Suspending console(s) (use no_console_suspend to debug)
> > PM: suspend devices took 0.040 seconds
> > Disabling non-boot CPUs ...
> > PM: resume devices took 0.100 seconds
> >
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
