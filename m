Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2QjD-0004qZ-TH
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 14:07:14 +0000
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905080658n140ca7a6l2c818aea5b6a93d8@mail.gmail.com>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
	<71cd59b00905080658n140ca7a6l2c818aea5b6a93d8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 May 2009 17:06:35 +0300
Message-Id: <1241791595.27996.98.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-08 at 15:58 +0200, Corentin Chary wrote:
> On Fri, May 8, 2009 at 2:20 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> > On Fri, 2009-05-08 at 14:07 +0200, Corentin Chary wrote:
> >> No, not really, libubiio provide what you can find in ubi.h, nothing
> >> more (open/close/read/write/change/erase/map/unmap).
> >> There some code in common to read sysfs properties, it's all.
> >> There is libubiio_int.h with some duplicate code from
> >> ubi-utils/src/common.h which could be removed.
> >> libubi on the other hand provide functions to manipulate volume and
> >> devices (rename, create, etc..).
> >
> > Still, what's the reason to have a separate library?
> > Why not to add your stuff to existing  one? If there
> > are some issues in libubi, they could be fixed. I just
> > see a lot of common code.
> 
> When we made libubiio we wanted something close to the kernel API,
> libubi is not.

But it should not be difficult to change this. You may amend
the API to serve better your purposes.

> To make mkfs.ubifs works with smaller changes, I can add the
> "is_mapped" and "erase" functions to libubi, forgetting the original
> UBI API.
> Does that seems better to you ? If it's ok then I'll do that.

As you wish. I just think we should try not to copy code, but
integrate to the existing code base. If the existing one is
not suitable - fix it.

> >> But the current tree/build system make it hard to share code between
> >> ubi-utils/mtd-utils/mkfs. It what
> >> If you check, there is also three crc32.c/h in mtd-utils ...
> >> (See http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=tree;hb=HEAD
> >> to check what a clean tree could be)
> >
> > But surely you may try to re-arrange the tree, make it saner?
> It's what I did on my git tree.. but it only works with CMake.
> I don't know how to fix the current mess with simples Makefiles.
> Maybe someone with better Make skills could help us here ?

You want to move headers from ubi-utils/include to include ?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
