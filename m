Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64851CC6B24
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 05:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1+9efMsH11lq0Ip2NSfKb6N0/suwQAy5hXShflL8Mk=; b=q6zN+UU3w30fdZ
	dxTxebpXBGjfr6AAmrvt1GUjb+4535EuPylEdbIJdmrmql8PG4T0eubX4Isgu5rKIJmadCQnIHuvO
	s3hffAfIHHfOrL360YoInE6qwWW/uAZqQ8zWM0tAO4ghIJBPxrYLqNkknsDgTP97IGT0cD7Ty5u8b
	SS6OkvyMXia3otkgcNh7nK96xuFl3QBFGur2QczrWaTqTy8QLMZe9x4Uk+sjWoBL67HvPiwkYK0wx
	6tvIBHd1Vxo1fA58J1DzaXfOz2d4fEUUhF/Lf6vE6DN2fPI3mIZT6KjzqqP25OPCicrlFOg5UkuKN
	WNxGFMTnPmt18PDAWV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrfY-0000000EYVk-0Hqr;
	Wed, 14 Oct 2026 05:36:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrfU-0000000EYVR-16aN
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 05:36:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D84B407C1;
	Wed, 14 Oct 2026 05:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60E01F000FF;
	Wed, 14 Oct 2026 05:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791956207;
	bh=20IeJwlfbHOwAOqBybbPglj4DioVDbfCTggyOUmG6AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qh2L+lns+TC45tZ3ta2Bf3sHpQuD7ArGYrxTnkjJVsISJDd215cAUFX7buojC10XX
	 PxZbUFGpn526urHl9iW1zA+jq+Q49VIAoWCaSVIjSYQA+Pdp0aIxZO/l3JMBTZ5a0o
	 W38eNJtQMa+oY0XJ4+Fg38TXLC108OEL5jmzsnVI=
Date: Wed, 14 Oct 2026 07:36:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Rogers <irogers@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
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
Message-ID: <2026101425-why-boring-4f2d@gregkh>
References: <20261013223946.1836757-1-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
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

On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> Clang supports the 'require_explicit_initialization' attribute on struct
> fields to enforce that the field is explicitly initialized when an
> aggregate object is constructed, emitting -Wuninitialized-explicit-init
> (enabled by default) if the field is omitted.
> 
> Following discussion at the Linux Plumbers Conference [1], this series
> introduces __require_explicit_initialization in
> include/linux/compiler_attributes.h and applies it to
> struct kobj_type::release.

Cool, sorry I missed that talk.

> As Documentation/core-api/kobject.rst notes:
>   "One important point cannot be overstated: every kobject must have a
>   release() method, and the kobject must persist (in a consistent state)
>   until that method is called. If these constraints are not met, the code
>   is flawed."
> 
> Annotating struct kobj_type::release caught 30 struct kobj_type
> definitions across the tree that omitted .release:
> - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
>   allocated kobjects, ksets, or enclosing structures were either leaked on
>   kobject_put() or freed prematurely before kobject release (risking a
>   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y).
> - Patch 11 annotates struct kobj_type::release with
>   __require_explicit_initialization and explicitly sets .release = NULL
>   (with explanatory comments) on the remaining legacy struct kobj_type
>   definitions whose kobjects are static, per-CPU, or embedded in devm- or
>   parent-managed structures.

Sounds great, but let's fix up the users before adding the attribute.
Looks like some of these need another version so it might take a bit of
time to get them all merged.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
