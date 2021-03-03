Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F475C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:30:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9983664EDF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9983664EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dsHNAURJ0OzuxDeS+FKmJuryjWMsPvqV2JT4xKoYXUY=; b=acXhtkdP/D1iAFgTWaVvUTTVx
	c/vsjeyKZG5KfaQnk7ZIwrntCI0TRZOmbjKVX1vsXMj0JTyIUdDxtmJSPUnw/v5k5OfgbbK7TH0oo
	4mcl5QZ/ONjnIRown+GpHnBQAcUY5Rxfbusn5sUH2WgBI861Bi+X6ECVTaFUS8ri+pevbPvbTzp2c
	y577rjh/R6757xYKFgGhgOz7yzVGI/8AkC8UL/Ji54dLS8KgYyGA0+8enn7TLK10y6TzjIgdCRdp9
	n5ZeRzZUESB0Cirr2W+cQmindcHoccYPGftQGvpP+s919Emasc27eECiClOKbV2djuSvzxBoXAVvs
	tUsLzK1sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHRzN-0051dv-Kj; Wed, 03 Mar 2021 13:56:33 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHRrq-0051S6-UA; Wed, 03 Mar 2021 13:49:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614779319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pu/3seYMql33mUGXHcZj1oG0qaMLQn8mcgtStwoiQOY=;
 b=qi4UC6hUpKVqsIab1ecHkri1SQfudluavf0CINthr1FLnsNtM5q8rG05RSaCJn+Um9pgwR
 JfB+Vj2/CNZ02GVC22inMEzATHJ+8kPxSW7/R6gewxBgKHq1cQaLnv6iq+ws7baN5OJd9I
 zx5+UaQymkuoSD+q1Ar5CPG7aqqg87o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9E98AC24;
 Wed,  3 Mar 2021 13:48:38 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:48:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Thomas Meyer <thomas@m3y3r.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Oleg Nesterov <oleg@redhat.com>, Wei Li <liwei391@huawei.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Michael Kelley <mikelley@microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH next v4 12/15] printk: introduce a kmsg_dump iterator
Message-ID: <YD+TsR+yiM2RB9Hh@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <20210303101528.29901-13-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303101528.29901-13-john.ogness@linutronix.de>
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

On Wed 2021-03-03 11:15:25, John Ogness wrote:
> Rather than storing the iterator information in the registered
> kmsg_dumper structure, create a separate iterator structure. The
> kmsg_dump_iter structure can reside on the stack of the caller, thus
> allowing lockless use of the kmsg_dump functions.
> 
> Update code that accesses the kernel logs using the kmsg_dumper
> structure to use the new kmsg_dump_iter structure. For kmsg_dumpers,
> this also means adding a call to kmsg_dump_rewind() to initialize
> the iterator.
> 
> All this is in preparation for removal of @logbuf_lock.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Kees Cook <keescook@chromium.org> # pstore

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
