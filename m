Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asrPQ-00040Q-NF
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2016 12:39:09 +0000
Received: by mail-wm0-x230.google.com with SMTP id v188so201715545wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2016 05:38:47 -0700 (PDT)
Subject: Re: [PATCH] makedev(3): point people at sys/sysmacros.h
To: Zack Weinberg <zackw@panix.com>
References: <20160418164908.GR5369@vapier.lan>
 <1461045163-21248-1-git-send-email-vapier@gentoo.org>
 <5717687D.2060300@gmail.com>
 <CAKCAbMiMNtMmCP4EPZnZ5DpSNaNc=SDbbdKKZmoRybmWHyOoTg@mail.gmail.com>
Cc: mtk.manpages@gmail.com, Mike Frysinger <vapier@gentoo.org>,
 linux-mtd@lists.infradead.org, GNU C Library <libc-alpha@sourceware.org>,
 linux-man <linux-man@vger.kernel.org>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <57177853.8020006@gmail.com>
Date: Wed, 20 Apr 2016 14:38:43 +0200
MIME-Version: 1.0
In-Reply-To: <CAKCAbMiMNtMmCP4EPZnZ5DpSNaNc=SDbbdKKZmoRybmWHyOoTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/20/2016 01:47 PM, Zack Weinberg wrote:
> On Wed, Apr 20, 2016 at 7:31 AM, Michael Kerrisk (man-pages)
> <mtk.manpages@gmail.com> wrote:
>> On 04/19/2016 06:52 AM, Mike Frysinger wrote:
>>> Defining these functions via sys/types.h violates POSIX namespace
>>> requirements,
>>
>> What do the previous lines mean? Violate namespace requirements how?
> 
> I think it's technically not true that they violate POSIX namespace
> requirements, since they're only defined in the non-conforming modes.
> 
> The reason I originally proposed the change is that libstdc++
> force-enables _GNU_SOURCE, which means people writing in C++ _can't_
> avoid these nonstandard macros by using a strict conformance mode.

Thanks for the explanation, Zack. I applied Mike's patch.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
