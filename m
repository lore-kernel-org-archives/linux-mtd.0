Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F367C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKOBxgEwAEVgxUr1dfeJhdrP86woIu+a4/4H4Y7fRNg=; b=HPuMnbQUSx/CQ/
	xfXKHDbDXuL86Hv+nW6vYyoDbONnnxfNDJ5PKvGhONwB9qeXXMXmCpC1Ow4MsRnVHRFqYexzlv9VG
	Rab2Nu/y8wepAawziC9wouNAwWxRhY/mOlvMC4UJgP9IOaV67AT0UPMDYN7jkCEsWiEcvRLIj5xxE
	dGLJXkahwfOEEg5kX25bfaFltKaD113cJmdrWujKWwbHDVv060eDgLKaHpg6TM9KLTLjrG9nACfhq
	q1UQT/5RJFZJVwPJoqGSDhdbPmcOc8Q1fBmJo7YOTeEk+zz2US2C6rJPNK3vlelhaIcQa5Vn0iz7O
	ibmp7nNLavjWApsBWpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2p6-0000000Ar3L-2mLV;
	Wed, 03 Jul 2024 16:27:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2p3-0000000Ar2S-1MqC
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 16:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6510ECE2D2B;
	Wed,  3 Jul 2024 16:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC89C2BD10;
	Wed,  3 Jul 2024 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024025;
	bh=iqYxlC1bhe/7ALpkNeE5phKu3N9aTBnG3R0HukiaLws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rwd9e7kliYyzi9FQPgDbHOkyrNE+y0jJRVWnOdmXhAkVOD1ALZD0O10DjNWFdt3yC
	 ofb8OUs3AK4tJ1ETzauW/+3t+eb/4uqnz3ZVD6XWlRjMjQGvlP8UR9uBfs+9//130N
	 CeN/pC1bgOCnO1VB1B+hlwcVy289AeM/esB0ht8j55bH9Y8nSprZ7wpAtbvdTbz9AL
	 iL/UQJKak4mdUS3H81Mn47L1q38rjm7FaAXhIo9ngCEgZjFb3ikj1ZDBhqbVK8SiJr
	 HZg0QGdZ9zMNJD8lbhhVjPqYxuorXhgrPYWZkHunA9J73aHALa3eQQyUQIz2HvRh3j
	 HNWAuSbLQR1RA==
Date: Wed, 3 Jul 2024 09:27:04 -0700
From: Kees Cook <kees@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <202407030926.D5DA9B901D@keescook>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
 <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_092709_739408_488A002D 
X-CRM114-Status: GOOD (  37.18  )
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

On Wed, Jul 03, 2024 at 10:22:11AM +0200, Petr Mladek wrote:
> On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
> > 
> > 
> > On 02/07/2024 22:29, Kees Cook wrote:
> > > On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> > > > kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> > > > callback.
> > > > This patch adds a new struct kmsg_dump_detail, that will hold the
> > > > reason and description, and pass it to the dump() callback.
> > > 
> > > Thanks! I like this much better. :)
> > > 
> > > > 
> > > > To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> > > > function and a macro for backward compatibility.
> > > > 
> > > > I've written this for drm_panic, but it can be useful for other
> > > > kmsg_dumper.
> > > > It allows to see the panic reason, like "sysrq triggered crash"
> > > > or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> > > > 
> > > > v2:
> > > >   * Use a struct kmsg_dump_detail to hold the reason and description
> > > >     pointer, for more flexibility if we want to add other parameters.
> > > >     (Kees Cook)
> > > >   * Fix powerpc/nvram_64 build, as I didn't update the forward
> > > >     declaration of oops_to_nvram()
> > > 
> > > The versioning history commonly goes after the "---".
> > 
> > ok, I was not aware of this.
> > > 
> > > > [...]
> > > > diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> > > > index 906521c2329c..65f5a47727bc 100644
> > > > --- a/include/linux/kmsg_dump.h
> > > > +++ b/include/linux/kmsg_dump.h
> > > > @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
> > > >   	u64	next_seq;
> > > >   };
> > > > +/**
> > > > + *struct kmsg_dump_detail - kernel crash detail
> > > 
> > > Is kern-doc happy with this? I think there is supposed to be a space
> > > between the "*" and the first word:
> > > 
> > >   /**
> > >    * struct kmsg...
> > > 
> > > 
> > Good catch, yes there is a space missing.
> > 
> > I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
> > is not indexed for kernel documentation.
> > And you can't find the definition of struct kmsg_dumper in the online doc.
> > https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
> > 
> > > Otherwise looks good to me!
> > > 
> > 
> > Thanks.
> > 
> > As this patch touches different subsystems, do you know on which tree it
> > should land ?
> 
> Andrew usually takes patches against kernel/panic.c.
> 
> Or you could take it via the DRM tree, especially if you already have the code
> using the string.
> 
> Also I could take it via the printk tree. The only complication is
> that I am going to be away the following two weeks and would come
> back in the middle of the merge window. I do not expect much problems
> with this change but...

If DRM doesn't want to carry it, I can put it in through the pstore
tree. Let me know! :)

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
