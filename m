Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g36JI-00083B-JC
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 21:16:30 +0000
Received: by mail-pg1-x543.google.com with SMTP id z3-v6so34041pgv.8
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2018 14:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvt7MU-ip9k1Vj9371P0G=1Nnw4zZ4Rs0SdGVMDzEfZKg@mail.gmail.com>
 <14d9642f-3106-39d7-2980-6307e1124236@sigma-star.at>
In-Reply-To: <14d9642f-3106-39d7-2980-6307e1124236@sigma-star.at>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 20 Sep 2018 23:16:05 +0200
Message-ID: <CAAQYJAt8zM88c=wDZJCvpNrb27r9dGVQ3srG+k1n1jhuY2sWDA@mail.gmail.com>
Subject: Re: [ubi-utils] - fixes for ubi-utils-klibc 2.0.2
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 19, 2018 at 11:50 AM David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
>
> Hi,
>
> first of all, sorry for the delay. I was quite busy recently and wanted to catch up
> with mtd-utils related stuff last week, but unexpectedly ended up without any internet
> connection at the ALPSS conference.
>
> Regarding the meta-initramfs patch set for mtd-utils:
>
>  - The first patch should actually not be necessary. It adds a __KLIBC__ guard around the existing
>    HAVE_EXECINFO_H guard to prevent inclusion of execinfo.h. If the header doesn't exist, autoconf
>    should catch that and not define HAVE_EXECINFO_H in the first place. So this is more of a
>    workaround for a bug in the build system that should be addressed.

David,
the patch is not necessary when building with musl toolchain but only
with glibc.
The first version of the patch was for klibc 1.5.2 and explicited:

++#if defined(__GLIBC__) || defined(__UCLIBC__)
+ #include <features.h>
++#endif

And in fact, googling a bit,
"Please notice that the <features.h> header file does not exist on all
platforms,..."
https://sourceforge.net/p/predef/wiki/Libraries/?version=11

Anyway, I'll check again with our tc guru to rule off autotools and glibc bugs

>  - The patch number 2 regarding the PRI*off_t macros is marked as "Upstream-Status: Submitted",
>    but I somehow can't find it on the mailing list. If it was submitted and nobody had a problem
>    with that, I would happily merge it, since those magic macros have been a constant source of
>    problems so far.

Ouch, back in February when I received the patch I was sure it was
sent to th elist as well.
I have asked the author about the signature and he said 'just send it'
;) I'll do.

>  - Regarding patch number 4 that adds a guard around features.h: That should IMO be done using
>    a check in the configure script. Assuming that works (see comment for patch #1).
Ditto. I'll check this as well.

>  - I have submitted a patch for the prompt() function that should make patch number 5 obsolete.
>    See http://lists.infradead.org/pipermail/linux-mtd/2018-September/084087.html
I'll test this later on.

Many thanks
Andrea
>
> Thanks,
>
> David
