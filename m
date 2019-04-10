Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C730AC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 07:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924592070D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 07:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fH+yEX31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924592070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FA00i2g8elRQnJ/svNl4I3Rgvg4lZou3YFbyqQ/5so=; b=fH+yEX31Yp7Gwb
	0WY0QZfe9Bm86JEsSa1Z4wMty2kDqD7u+Nq2VuwvNeAmk0DPw7MiT8Lmc9YwD4Haj/JiJvdYC9ip0
	Ts2kdscq5kWhogUfm/KIhiWJ/PbXvNtV8Pu62zqIJ+wHoTjJ4irh+97ofZ5KbmlpImPuXbvdPB203
	7p3tLmgB9IijRXSPISU3hPBy8aKVJrvCr3nJhzsDEpc66lff0vmcckNcxS/PFofADICN7dzjtz1g1
	JTHWtRcvfpNFGm7zUQBlpZOr87B/cLc5gzfaMLYe1ws+22E6DnWZDzlAqse6wuglImqfavaeC2cvP
	sZYJk/qOWq4epwY3GToA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE7ZZ-0006HS-7t; Wed, 10 Apr 2019 07:23:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE7ZW-0006GQ-Ol
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 07:23:04 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3CA8B281461;
 Wed, 10 Apr 2019 08:23:01 +0100 (BST)
Date: Wed, 10 Apr 2019 09:22:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add Macronix NAND read retry and
 randomizer support
Message-ID: <20190410092258.332ef399@collabora.com>
In-Reply-To: <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
References: <1554780172-23111-1-git-send-email-masonccyang@mxic.com.tw>
 <20190409090427.22de9917@collabora.com>
 <OF6C97E4DE.45261545-ON482583D7.00340468-482583D7.0034B3FE@mxic.com.tw>
 <20190409114701.744c2c8c@collabora.com>
 <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_002302_949447_D66CAB63 
X-CRM114-Status: GOOD (  21.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 10 Apr 2019 09:14:14 +0800
masonccyang@mxic.com.tw wrote:

> Hi Boris,
> 
> > 
> > Subject
> > 
> > Re: [PATCH] mtd: rawnand: Add Macronix NAND read retry and randomizer   
> support
> > 
> > On Tue, 9 Apr 2019 17:35:39 +0800
> > masonccyang@mxic.com.tw wrote:
> >   
> > > > > +
> > > > > +static const struct kobj_attribute sysfs_mxic_nand =
> > > > > +   __ATTR(nand_random, S_IRUGO | S_IWUSR,
> > > > > +          mxic_nand_rand_type_show,
> > > > > +          mxic_nand_rand_type_store);   
> > > > 
> > > > No, we don't want to expose that through a sysfs file, especially   
> since
> > > > changing the randomizer config means making the NAND unreadable for
> > > > those that have used it before the change.
> > > >   
> > > 
> > > Our on-die randomizer is still readable from user after the function 
> > > is enabled.  
> > 
> > You mean the memory is still readable no matter the randomizer state.
> > Not sure how that's possible, but okay.
> >   
> > > This randomizer is just like a internal memory cell 
> > > reliability enhanced.  
> > 
> > Why don't you enable it by default then?  
> 
> The penalty of randomizer is read/write performance down.
> i.e,. tPROG 300 us to 340 us (randomizer enable)
> therefore, disable it by default.

I'm a bit puzzled. On the NAND I've seen that required data
randomization it's not something you'd want to disable as this implied
poor data retention. What's the use case here? Are we talking about SLC
or MLC NANDs? Should we enable this feature once we start seeing that
the NAND starts being less reliable (basically when read-retry happens
more often)? I really think this is something you should decide kernel
side, because users have no clue when it's appropriate to switch this
feature on/off.

> 
> >   
> > > It could be enable at any time with OTP bit function and that's why
> > > we patch it by sys-fs.  
> > 
> > Sorry, but that's not a good reason to expose that through sysfs.  
> 
> Any good way to expose randomizer function for user ?

Don't expose it :P.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
