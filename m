Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C5BC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 15:10:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 806A0651D1
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 15:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 806A0651D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iqaAFHsGPxGX9SsUvJLCicooQH7q8+MvQc7WxJFWCEM=; b=oYX9U/4hi/2wUy0etTB6ZhEQ6
	SVvVyIzAuhEkOzvSPOrttT+tulHNVIeVQZdDfztIir6mNqsiwdpq9MORKAnDY/fTI+oB6mytlv2ue
	80JFfDpPndlU4U6JVusbfboJn0eI3g+1wWhOPrzdpimcky3QKqGhe90dEeLn3wvQUw8jzXkx9fSry
	76S8G8k8CbQsL1mNQPydTcmvdS9uj7s45WH9Unbos5C20SDeNgh+RxgQnsS8qP8Y0hIgY+/DJCNvb
	Cv7JPTygC5ub4P/A254SecdIaCtORwh3JxlF0nYMWGK4k2ypV1DItHv8c9lE65NfBSEtF/Us5Y6CB
	V+NknvUyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJHVn-000RN9-58; Mon, 08 Mar 2021 15:09:35 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJHVi-000RKp-0H; Mon, 08 Mar 2021 15:09:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1615216168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHCVpD0EOCWBr4CM42VDdFRC20Sv2OvcSQKI4oBR4WQ=;
 b=SaBGiuJH7cduvyTTcI+RG2JjQktgD14lFw9EnpYlsPN2C7K+17NrvYz5FyASkVVnIgOUYN
 +kK0dQIfGNaN4EONLEjJGI5netP1nGsyeOX6ULd53kyHRvCliMWlQbMithU17Uqe3j5h0p
 +r0W3a8FhYIp0uDbypux7b88gkU35xY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45672AE15;
 Mon,  8 Mar 2021 15:09:28 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:09:24 +0100
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
Message-ID: <YEY+JBoW6TByix30@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <YD+seF3dQUoPcZP7@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD+seF3dQUoPcZP7@alley>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_150930_448931_257206E3 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Wed 2021-03-03 16:34:19, Petr Mladek wrote:
> On Wed 2021-03-03 11:15:13, John Ogness wrote:
> > Hello,
> > 
> > Here is v4 of a series to remove @logbuf_lock, exposing the
> > ringbuffer locklessly to both readers and writers. v3 is
> > here [0].
> 
> The series look ready. I am going to push it into printk/linux.git
> the following week unless anyone speaks against it in the meantime.

The series is committed in printk/linux.git, branch printk-rework.

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
