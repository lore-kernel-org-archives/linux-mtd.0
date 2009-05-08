Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2Qqc-0006ms-O5
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 14:14:56 +0000
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <1241785222.27996.85.camel@localhost.localdomain>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 May 2009 17:14:39 +0300
Message-Id: <1241792079.27996.107.camel@localhost.localdomain>
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

On Fri, 2009-05-08 at 15:20 +0300, Artem Bityutskiy wrote:
> On Fri, 2009-05-08 at 14:07 +0200, Corentin Chary wrote:
> > No, not really, libubiio provide what you can find in ubi.h, nothing
> > more (open/close/read/write/change/erase/map/unmap).
> > There some code in common to read sysfs properties, it's all.
> > There is libubiio_int.h with some duplicate code from
> > ubi-utils/src/common.h which could be removed.
> > libubi on the other hand provide functions to manipulate volume and
> > devices (rename, create, etc..).
> 
> Still, what's the reason to have a separate library?
> Why not to add your stuff to existing  one? If there
> are some issues in libubi, they could be fixed. I just
> see a lot of common code.
> 
> > But the current tree/build system make it hard to share code between
> > ubi-utils/mtd-utils/mkfs. It what
> > If you check, there is also three crc32.c/h in mtd-utils ...
> > (See http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=tree;hb=HEAD
> > to check what a clean tree could be)
> 
> But surely you may try to re-arrange the tree, make it saner?

In fact, I already have simple implementation of setprop/unmap
functions which I use in the ubi tests.

I've just pushed them. There are some other patches as well.
But the main change - mtd sysfs support is not pushed - but
I'll do it very soon. After this the change rate will become
low again.

Some of my changes are not very good, in a sense that they do
not fix one small thing, but contain several things. But this
is mostly because I was accustomed to be the only ubi-utils
developer. If you are going to work with the code base, I
will be more careful.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
