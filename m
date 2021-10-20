Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077CFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B683360FD8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B683360FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjoV2KJmtJBywLiJUaivYGcnWtDgHAcolQP9I+k2Ats=; b=vCAYBF832gbVUn
	e5X8uOutgGET27k8WYk8sTuSRUTxkzKo3fnYIzRPWG/Rx9bywec3lAqPVM840Svxjl+61p8rijmKv
	trG6O4/IheBim8pjtW8a9M3jznNonN4NbVVSlOToEj6OOK+D0ZI0m8cV2AFKqGJGZOF/yGnyvpaRy
	/laOjVL3f3Wzw9D9dou3IRBopspYs3jROUZLDfZzEUQPB1xaVsU7bJAqKzsLlTidSh7ftphwNzVqH
	Dqii0Z3G5HMH19aRS99TBtwth+d3eIwDprcLsONraGxugKaMmDlYTM4wMvR8WieBbjk3JXQxslQZP
	umprwsUT6jiWCjUpEq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7du-003x0B-3r; Wed, 20 Oct 2021 09:12:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7dr-003wzT-7n
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 09:12:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F3789C0018;
 Wed, 20 Oct 2021 09:12:06 +0000 (UTC)
Date: Wed, 20 Oct 2021 11:12:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: nand_bbt: hide suspend/resume
 hooks while scanning bbt
Message-ID: <20211020111206.342bd9d5@xps13>
In-Reply-To: <20211020110303.6f21c057@collabora.com>
References: <20211020084534.2472305-1-sean@geanix.com>
 <20211020084534.2472305-2-sean@geanix.com>
 <20211020105326.0dca864a@collabora.com>
 <20211020090132.zuxojg6cnwsm4dwg@skn-laptop>
 <20211020110303.6f21c057@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_021211_450714_F3DCBF27 
X-CRM114-Status: GOOD (  15.84  )
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

Hi Boris,

boris.brezillon@collabora.com wrote on Wed, 20 Oct 2021 11:03:03 +0200:

> On Wed, 20 Oct 2021 11:01:32 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > On Wed, Oct 20, 2021 at 10:53:26AM +0200, Boris Brezillon wrote:  
> > > On Wed, 20 Oct 2021 10:45:31 +0200
> > > Sean Nyekjaer <sean@geanix.com> wrote:
> > >     
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > 
> > > > The BBT scan logic use the MTD helpers before the MTD layer had a
> > > > chance to initialize the device, and that leads to issues when
> > > > accessing the uninitialized suspend lock. Let's temporarily set the
> > > > suspend/resume hooks to NULL to skip the lock acquire/release step.
> > > > 
> > > > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > > > Tested-by: Sean Nyekjaer <sean@geanix.com>    
> > > 
> > > It's missing our Signed-off-by tags.
> > >     
> > 
> > Patch is from you ;)
> > If you are okay with it, I will add your Signed-off-by tag.  
> 
> You should add both (mine and yours).

And put the one matching the author (Boris') before the other (yours).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
