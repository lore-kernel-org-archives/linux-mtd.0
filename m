Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E6CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiIBoLV7a5UV5bgZOVX2B/Waaw/gVOMtN2MUqO7cuxY=; b=j/RudHcdhRoEPQ
	Ya/8nfmz0SrsYO1qVnwFSRiwW7ahFbWQioBiXM/5q8w5MGF2IuI4M6fiAA2mGsJdelEnQiaw+osHi
	SSNhCObhzdLl/5heFySP31A7HlQsUa5XHrnwUZVWz5M5hvfRBN4MTT2fjduDWPM7QXRNZ0pa8jtko
	6/ty1/vme1Qmgw+EGyCQDT7a7E9K8Ovazeq0qdBfwzPX8F+XbR6ErU0BB4VYt8cLxrRWkt2f8VDAD
	2WlrydOTfO6ZUvke2PAgT3xeuxNfLWVDmPJc2heuRFlYnrU63UWoTs0LTblhniRfVoJjsqi0CVeBF
	/PTZ7Lax7+aTLgtFjzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1yc-0000000G0aD-251Q;
	Wed, 14 Oct 2026 16:37:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1ya-0000000G0Zt-2Vz9
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:37:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A7DB4138B;
	Wed, 14 Oct 2026 16:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258481F000C4;
	Wed, 14 Oct 2026 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995832;
	bh=D0qFplMD3JegnW7i3iVJkwgfMDmyoOPsyHFrtj+nxBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n9IplbiX+93nceH23XmnKeZ5oYecY++a3sP1FSp8/eoJQHlwosXybufpa8S8KQDs4
	 JSOYDlE3dW0Tstqig9001fDQnyF55nygDlSOHNkJdYmGR6xIoM+nl1dQhuyjrtkVwj
	 EuXqe73P+3VZ6BDKW7wiUBDkX32NJU8qFo902yMRcaug/7BAm5oKbDw4gxCh7LxUqC
	 Y7NxYDYR/y/z28DqpEx8zGTH0dUYz2jKMESyevlBsADLYmloXFD5sbjroBfTPOb1YO
	 EAaIr8VM2TPJc/hDXYqOW71XwpeyatwvwVWF6WB1T2qG0eJVVmvgIrJgOh3HFB8l/2
	 2qpSERGwTKhRA==
Date: Wed, 14 Oct 2026 09:37:11 -0700
From: Kees Cook <kees@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Nayna Jain <nayna@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	David Teigland <teigland@redhat.com>,
	Alexander Aring <aahringo@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	gfs2@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct
 kobj_type::release
Message-ID: <202610140932.5F9CFCE5@keescook>
References: <20261013223946.1836757-1-irogers@google.com>
 <2026101425-why-boring-4f2d@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2026101425-why-boring-4f2d@gregkh>
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

On Wed, Oct 14, 2026 at 07:36:41AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> > Clang supports the 'require_explicit_initialization' attribute on struct
> > fields to enforce that the field is explicitly initialized when an
> > aggregate object is constructed, emitting -Wuninitialized-explicit-init
> > (enabled by default) if the field is omitted.
> > 
> > Following discussion at the Linux Plumbers Conference [1], this series
> > introduces __require_explicit_initialization in
> > include/linux/compiler_attributes.h and applies it to
> > struct kobj_type::release.
> 
> Cool, sorry I missed that talk.

Yeah, I'm really liking these compile-time checks. :)

> 
> > As Documentation/core-api/kobject.rst notes:
> >   "One important point cannot be overstated: every kobject must have a
> >   release() method, and the kobject must persist (in a consistent state)
> >   until that method is called. If these constraints are not met, the code
> >   is flawed."
> > 
> > Annotating struct kobj_type::release caught 30 struct kobj_type
> > definitions across the tree that omitted .release:
> > - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
> >   allocated kobjects, ksets, or enclosing structures were either leaked on
> >   kobject_put() or freed prematurely before kobject release (risking a
> >   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y).
> > - Patch 11 annotates struct kobj_type::release with
> >   __require_explicit_initialization and explicitly sets .release = NULL
> >   (with explanatory comments) on the remaining legacy struct kobj_type
> >   definitions whose kobjects are static, per-CPU, or embedded in devm- or
> >   parent-managed structures.
> 
> Sounds great, but let's fix up the users before adding the attribute.
> Looks like some of these need another version so it might take a bit of
> time to get them all merged.

I'd really like to have the attribute available, and I've got at least
one user I can apply today that don't require fix-ups (seq_file), so
if Miguel is okay with it, I'd like to snag patch 1 and send it with
my seq_file "first user" for this coming merge window so it's available
starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
other subsystems to be able to use it. And the kobj fixups can continue
in parallel. Does that sounds okay?

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
