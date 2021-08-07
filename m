Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEDBC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F103611C6
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F103611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3Hize1eJvuiuTbl2DvYYrv4u1jIQkLtgXgMWr3zYT0=; b=yscsDj7ma6fTmp
	L+BEZ/P+cbuQclAfzhWU3albtSAu0bBtDmh6FxVAwpD+MTCJE+Dv5A2KfR5l3YsLVsam4Mrcxp29a
	VWprJyoCZvExxiEwY9/2RJyOKw59lbGFcKv/gNTHC3OnHnPX0giaYIHUuas28oppmFG4wvq6MY/qh
	cDJD1OWTynM6iVyxzam3UpEz2YfiTN6zLYtjHmQro156aTMDlYzSeKwg8HZYdC6UfKeH68Ihm23mI
	6s2TQWjCdFaFq95ypdJuPbmQgYmV6hQwagB+bMnE/uB/a5bHkf9C+bWcPSZBHetb2ViioCi8F/N3M
	w0QbfafuCz33CPzI6y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCTwo-00FASF-I9; Sat, 07 Aug 2021 21:33:38 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCTwj-00FARv-5d
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:33:34 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 19816C63FB; Sat,  7 Aug 2021 22:33:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372009; bh=2SQDmpLiPluy5M6CllfeaD39p6KlGC6jbGWTLbj0wcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9hbIdutPgyXxIo0XC9VZZXD69C0slqWXjkznFG48Kp1DMdnz3BLCWMCB3ISiQmaL
 C5dAH915+4pMi8wVq1eW0ciBiJbB0QPG9XFh1pAWPkv5gjh009UXPGV4i4trpEsZR5
 4CV+X1y/lcTYvuICV10uuk6D9me0DUEH9a7ami2z4FRyI2DulBv052aZFt6Tt3BJ/+
 2zJDyIiJpIsA3VYdcCazvXUVYqW49NtCQHHKI0tiYQZwj5+fccAQCgKSsYbyXqWrue
 HX3U9trhjkfMFehf/HkOgh0bfkoESMW3W/uuHoXb030Gk+7Rl0LF75Loe/4ZA6YcsS
 kMfyWkkxLbpWQ==
Date: Sat, 7 Aug 2021 22:33:28 +0100
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/4] mtd: rfd_ftl: fix use-after-free
Message-ID: <20210807213328.GA4125@gofer.mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <29e817be984471dc2438a9414a9a7e1768d62950.1626169090.git.sean@mess.org>
 <20210806202158.5aa6ee26@xps13>
 <20210807075735.GB2522@gofer.mess.org>
 <20210807123409.5dbceaa6@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807123409.5dbceaa6@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_143333_548377_93742AAA 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Miquel,

On Sat, Aug 07, 2021 at 12:34:09PM +0200, Miquel Raynal wrote:
> Hi Sean,
> 
> Sean Young <sean@mess.org> wrote on Sat, 7 Aug 2021 08:57:35 +0100:
> 
> > On Fri, Aug 06, 2021 at 08:21:58PM +0200, Miquel Raynal wrote:
> > > Hi Sean,
> > > 
> > > Sean Young <sean@mess.org> wrote on Tue, 13 Jul 2021 10:44:03 +0100:
> > >   
> > > > del_mtd_blktrans_dev() will kfree part, so this is a use-after-free. Use
> > > > container_of() to make it clearer what the cast is doing.
> > > > 
> > > > Signed-off-by: Sean Young <sean@mess.org>
> > > > ---
> > > >  drivers/mtd/rfd_ftl.c | 14 +++++++-------
> > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
> > > > index 7f5f6d247cae..af20a0a71108 100644
> > > > --- a/drivers/mtd/rfd_ftl.c
> > > > +++ b/drivers/mtd/rfd_ftl.c  
> > > 
> > > [...]
> > >   
> > > > @@ -800,10 +800,10 @@ static void rfd_ftl_remove_dev(struct  
> > > mtd_blktrans_dev *dev)  
> > > >  			part->mbd.mtd->name, i, part->blocks[i].erases);
> > > >  	}
> > > >  
> > > > -	del_mtd_blktrans_dev(dev);
> > > >  	vfree(part->sector_map);
> > > >  	kfree(part->header_cache);
> > > >  	kfree(part->blocks);
> > > > +	del_mtd_blktrans_dev(&part->mbd);  
> > > 
> > > I am not sure moving this call at the bottom of ftl_remove_dev makes
> > > sense, can we keep it where it was and just do the s/dev/part->mbd/ ?  
> > 
> > The reason for this patch is that del_mtd_blktrans_dev() kfrees its argument,
> > so both part and dev point to freed memory. This means it's a use after free.
> 
> Ok, please split this into two patches and we'll be good.

Good point.

Thank you for the review.

I'll send out v2 shortly.

Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
