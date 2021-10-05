Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E3BC433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 08:59:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471476120F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 08:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 471476120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eRESI3W6th6A4+IFx7A6Mih0ornIjV/XBIVOc+Eong=; b=YM9tSukE50+A2r
	8nrW1zvRFcAyh46iv0LVirDUfbx54CsxKn8l1AbC9t6IiemoOKlyJORmWXMOvmjB5Dppelv70wiN4
	WrpDvkPegJM+NGZJ7PPDTK7dbwOTdOCd8r60hp2yI95ymZMvTCE3ttRsj3gaVI1yTvdCoRS8QEXRI
	r1L48u3zB1tWsQDIySloQp/4+EWRMSxPbgEFugGDXwOJFT5dYV9xOE7gf/jM0RiAW6ctUv2IosOFi
	6oilH3p2s7SFmsHzW6fm1FkbDXyLZLq8CmO4TpdubjgTs5o1CGGBEDjb97e+NsFHe/fD42FU8KFbL
	pGfuL2XtRvdzaJ4Zz26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgHc-009cND-SX; Tue, 05 Oct 2021 08:58:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgHa-009cKV-Cu
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 08:58:44 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3410D1F4385F;
 Tue,  5 Oct 2021 09:58:39 +0100 (BST)
Date: Tue, 5 Oct 2021 10:58:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211005105836.6c300f25@collabora.com>
In-Reply-To: <20211005084938.jcbw24umhehoiirs@skn-laptop>
References: <20211004065608.3190348-1-sean@geanix.com>
 <20211004104147.579f3b01@collabora.com>
 <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
 <20211004115817.18739936@collabora.com>
 <20211004101246.kagtezizympxupat@skn-laptop>
 <20211004134700.26327f6f@collabora.com>
 <20211005070930.epgxb5qzumk4awxq@skn-laptop>
 <20211005102300.5da6d480@collabora.com>
 <20211005084938.jcbw24umhehoiirs@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_015842_604673_DCB1EB53 
X-CRM114-Status: GOOD (  35.18  )
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

On Tue, 5 Oct 2021 10:49:38 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On Tue, Oct 05, 2021 at 10:23:00AM +0200, Boris Brezillon wrote:
> > On Tue, 5 Oct 2021 09:09:30 +0200
> > Sean Nyekjaer <sean@geanix.com> wrote:  
> 
> [ ... ]
> 
> > > 
> > > Have you seen the reproducer script?  
> > 
> > How would I know about this script or your previous attempt (mentioned
> > at the end of this email) given I was not Cc-ed on the previous
> > discussion, and nothing mentions it in this RFC...
> >   
> 
> That's why I shared it here ;)
> Initially I thought this was a bug introduced by exec_op.
> 
> > > ---
> > > root@iwg26-v1:/data/root# cat /data/crash.sh
> > > #!/bin/sh -x
> > > 
> > > echo enabled > /sys/devices/platform/soc/2100000.bus/21f4000.serial/tty/ttymxc4/power/wakeup
> > > 
> > > rm /data/test50M
> > > dd if=/dev/urandom of=/tmp/test50M bs=1M count=50
> > > cp /tmp/test50M /data/ &
> > > sleep 1
> > > echo mem > /sys/power/state
> > > ---
> > > 
> > > As seen in the log above disk is synced before suspend.
> > > cp is continuing to copy data to ubifs.
> > > And then user space processes are frozen.
> > > At this point the kernel thread would have unwritten data.
> > > 
> > > We tried to solve this with:
> > > https://lkml.org/lkml/2021/9/1/280  
> > 
> > I see. It's still unclear to me when the write happens. Is it in the
> > suspend path (before the system is actually suspended), or in the
> > resume path (when the system is being resumed).
> > 
> > Anyway, let's admit writing to a storage device while it's suspended is
> > a valid use case and requires the storage layer to put this request on
> > old. This wait should not, IMHO, be handled at the NAND level, but at
> > the MTD level (using a waitqueue, and an atomic to make
> > suspended/resumed transitions safe). And abusing a mutex to implement
> > that is certainly not a good idea.  
> 
> I did't say this was the right solution ;) I actually asked in the RFC:
> "Should we introduce a new mutex? Or maybe a spin_lock?"
> 
> What are you proposing, a waitqueue in mtd_info? That gets checked in
> mtd_write()/mtd_read()?

Yes, and replacing the suspended state by an atomic, and providing a
helper to wait on the device readiness. Helper you will call in every
path involving a communication with the HW, not just mtd_read/write()
(you're missing erase at least, and I fear there are other hooks that
might lead to commands being issued to the device). But before we get
there, I think it's important to understand what the kernel expects.
IOW, if and when threads can do a request on a suspended device, and
when it's acceptable to wait (vs returning -EBUSY), otherwise I fear
we'll end up with deadlocks in the suspend/resume path.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
