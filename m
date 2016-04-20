Received: from mailbackend.panix.com ([166.84.1.89])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asqcE-0004Cl-AL
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2016 11:48:18 +0000
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 by mailbackend.panix.com (Postfix) with ESMTPSA id DD432166B4
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2016 07:47:55 -0400 (EDT)
Received: by mail-wm0-f47.google.com with SMTP id u206so76924105wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2016 04:47:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5717687D.2060300@gmail.com>
References: <20160418164908.GR5369@vapier.lan>
 <1461045163-21248-1-git-send-email-vapier@gentoo.org>
 <5717687D.2060300@gmail.com>
Date: Wed, 20 Apr 2016 07:47:54 -0400
Message-ID: <CAKCAbMiMNtMmCP4EPZnZ5DpSNaNc=SDbbdKKZmoRybmWHyOoTg@mail.gmail.com>
Subject: Re: [PATCH] makedev(3): point people at sys/sysmacros.h
From: Zack Weinberg <zackw@panix.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org,
 GNU C Library <libc-alpha@sourceware.org>,
 linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 20, 2016 at 7:31 AM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> On 04/19/2016 06:52 AM, Mike Frysinger wrote:
>> Defining these functions via sys/types.h violates POSIX namespace
>> requirements,
>
> What do the previous lines mean? Violate namespace requirements how?

I think it's technically not true that they violate POSIX namespace
requirements, since they're only defined in the non-conforming modes.

The reason I originally proposed the change is that libstdc++
force-enables _GNU_SOURCE, which means people writing in C++ _can't_
avoid these nonstandard macros by using a strict conformance mode.

zw
