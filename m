Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3aiw-0003kx-Gs
 for linux-mtd@lists.infradead.org; Sun, 06 Jul 2014 00:54:35 +0000
Received: by mail-lb0-f174.google.com with SMTP id u10so1938823lbd.19
 for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2014 17:54:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87egy189tw.fsf@nbsps.com>
References: <CAAQYJAs6ky1CvZWoh9NjPLYbUVcjQCh7SW3NrFUzLcXvcHLZRw@mail.gmail.com>
 <87egy189tw.fsf@nbsps.com>
Date: Sun, 6 Jul 2014 02:54:10 +0200
Message-ID: <CAAQYJAuEV=d=6QnEvua4nFuuy9BHQuuTgSQmqWtLFxaGFRLXfQ@mail.gmail.com>
Subject: Re: [RFC] ubi-utils: improve compatibility with klibc
From: Andrea Adami <andrea.adami@gmail.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 4, 2014 at 4:42 PM, Bill Pringlemeir <bpringlemeir@nbsps.com> wrote:
> On  3 Jul 2014, andrea.adami at gmail.com wrote:
>
>> I have put together a patchset allowing to compile the ubi utils
>> statically against klibc.
>
>> The patches are based on today's mtd-utils master, please have a
>> preview here:
>
>> https://github.com/andrea-adami/meta-openembedded/tree/master/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc
>
>> Please let me know if there is something to change before sending them
>> to the mailing list.
>
> I am no authority, but I appreciate your work.  I have tried to get the
> ubi tools working with klibc and I think these patches have been around
> for some time; I seem to remember seeing them.
>
Bill,
thanks for your review.
Yes, it's me again insisting to pack a small ubiattach in a little cpio...

> I would suggest to modify '0001-Makefile-only-build-ubi-utils.patch' to
> use the over-ride.  So we could have,
>
>   UBI_ONLY ?= 0
>
> And then modify the make rules on this conditional.  That way, people
> using a default commandline/environment will get the full tools suite as
> per normal.  It may even be best to split the functionality.  There is
> 'ftl', 'nand', 'jffs2' and 'ubi' and maybe the 'otp'.  So, someway to
> pass a make variable through the environment or command line to change
> what is built is probably better? (lacking 'configure' or 'menuconfig').
>
This is an interesting approach.
Anyhway, patch 0001 is not meant for upstream, I've marked its
Upstream-Status: Inappropriate

> For '0003-libubi.c-add-klibc-specific-fixes.patch', why can't 'klibc'
> fix the 'ioctl' definition?  I think that updating 'common.h' to handle
> the peculiarities of 'klibc' and redefine the 'ioctl()' would be better,
> if 'klibc' can't change.
>
Yes, definitely.
I'm in contact with couple of klibc developers (got patch 4 from one
of them) and will bother them...
So I'll add to patch 0003: Upstream-Status: Inappropriate

> I don't see issues with the other patches.
>
> Fwiw,
> Bill Pringlemeir.

Thanks.
I was thinking about maybe splitting patch 0005 in two parts, one for
getline() and another for rpmatch().
Or on the opposite squash 0004 and 0005 together. It's little stuff anyway.
Opinions?

Regards
Andrea
