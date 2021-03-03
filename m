Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D411C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:58:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D070064EF3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D070064EF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xcIHU1TbqijIjcbQeGjdxoceSczNTGdmyT2OzOfKaZI=; b=iekpzUC0ID2EyRIGzwBJXcOJP
	rWiV1ng88c+hyIbIPETWtqXRKT552jhmbjMvXXSPKU91qG/pq1U9Up+JH9oXWb0iL/tWTyw9ca8Ju
	KYcc1IwXrxHFcAqUiYxZBTthf0tiagDWfpjxqZlzjOAZcMl1fG4reNL7QNTj0siOh+/zFPi5JRyz0
	16TUbBzUHz9bKq5BofsPP0f2zNseqOVT2WpFu5+BW0z/+5Pd4wgqIxADTZ8VtUhBL2RdRj+Upj3J9
	GB7DEqrEsJ+e8MFefeQMVg/S7jzQgL9z3bYoaahlsh1WJ1po8uqCpqqu9Ee03gmEAPDY7gjGeIV0W
	QK3MJ45+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHaPu-006pn1-Au; Wed, 03 Mar 2021 22:56:30 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTW1-005PDE-EI; Wed, 03 Mar 2021 15:34:23 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614785659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l6vUEHEmOuwjOvJINqvANTs3pqAUVxWFEfsNxLOcO0g=;
 b=ba9WkkdYwntSk2Jk4/7eOyr/mGac1IGxTizYSuaSkMmIyBWh/+Whf+/fBKRTHbqnYqcObq
 YMo4v76fMNV3+mbDXS8sQOyDuKevTNHD3YjQOxhQhxDyZYp4/Or6lavqaScPzfGWDLfof4
 Bvu2S5SwUiCNZAvZwFiKSeBZbG2HpOM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E4AAAC24;
 Wed,  3 Mar 2021 15:34:19 +0000 (UTC)
Date: Wed, 3 Mar 2021 16:34:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Meyer <thomas@m3y3r.de>, linux-um@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Wei Li <liwei391@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
 linuxppc-dev@lists.ozlabs.org, kgdb-bugreport@lists.sourceforge.net,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Kelley <mikelley@microsoft.com>,
 linux-hyperv@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH next v4 00/15] printk: remove logbuf_lock
Message-ID: <YD+seF3dQUoPcZP7@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
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

On Wed 2021-03-03 11:15:13, John Ogness wrote:
> Hello,
> 
> Here is v4 of a series to remove @logbuf_lock, exposing the
> ringbuffer locklessly to both readers and writers. v3 is
> here [0].

The series look ready. I am going to push it into printk/linux.git
the following week unless anyone speaks against it in the meantime.

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
