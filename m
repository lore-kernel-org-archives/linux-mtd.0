Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6C2C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:40:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A33764ED4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A33764ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oU55t87Ckfqw6kM9ZKqMPDK5sF5YUgEmX2QdsAJMKKs=; b=Nq/7zSA4KHIADufijKp4NjCM9
	tiBvK8QcnUTB9Gf1auc9NFrxs+/QuN8HXa6TDtTfYXktUcueH50OPGNZ9bjhHq7sYNZLB8ebBGq3h
	xUP5Le4pMfCjVNRbtMNU1ZKTMJ1OCvUxe+wqQZqholoYhMdmOufyulS16/ELnAVwoRhGScAIJlgF2
	1bNdORDW9NMIr73gk6cfxaaj4fQfjeoPIEpzURQ9PV6jldubX8K2w2adXcqu8N/BHSrAVqyfBcnJC
	CFmmNVGXGvVPtIi5sH2Df5ChPEvL2BFDjC9sJ/p4HjdiAH81poc2Y1Va73LOkxA8l0nPAlE979NcO
	ZGfpkbqng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTbH-005QXC-0Z; Wed, 03 Mar 2021 15:39:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSa7-0059lg-8i; Wed, 03 Mar 2021 14:34:33 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C337464EE4;
 Wed,  3 Mar 2021 14:34:22 +0000 (UTC)
Date: Wed, 3 Mar 2021 09:34:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Sergey Senozhatsky
 <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky
 <sergey.senozhatsky@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Thomas Meyer <thomas@m3y3r.de>,
 linux-um@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Kees
 Cook <keescook@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Jordan Niethe
 <jniethe5@gmail.com>, Alistair Popple <alistair@popple.id.au>, Ravi
 Bangoria <ravi.bangoria@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mike
 Rapoport <rppt@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Wei Li
 <liwei391@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
 linuxppc-dev@lists.ozlabs.org, kgdb-bugreport@lists.sourceforge.net, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony
 Luck <tony.luck@intel.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Kelley <mikelley@microsoft.com>, linux-hyperv@vger.kernel.org,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: lkml delivery: was: Re: [PATCH next v4 00/15] printk: remove
 logbuf_lock
Message-ID: <20210303093421.2b9c936a@gandalf.local.home>
In-Reply-To: <YD+MpccJp4gX6bOP@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <YD+MpccJp4gX6bOP@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 3 Mar 2021 14:18:29 +0100
Petr Mladek <pmladek@suse.com> wrote:

> Hi John,
> 
> On Wed 2021-03-03 11:15:13, John Ogness wrote:
> > Hello,
> > 
> > Here is v4 of a series to remove @logbuf_lock, exposing the
> > ringbuffer locklessly to both readers and writers. v3 is
> > here [0].  
> 
> Have you got some reply from lkml that it has not delivered there,
> please?

vger has been having some issues as of late, and emails have been coming in
slowly. I just received emails I sent more than 24 hours a head of time.
Those in charge are trying to work things out.

-- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
