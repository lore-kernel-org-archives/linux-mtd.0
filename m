Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2P45-0005Mk-4h
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 12:20:44 +0000
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 May 2009 15:20:22 +0300
Message-Id: <1241785222.27996.85.camel@localhost.localdomain>
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

On Fri, 2009-05-08 at 14:07 +0200, Corentin Chary wrote:
> No, not really, libubiio provide what you can find in ubi.h, nothing
> more (open/close/read/write/change/erase/map/unmap).
> There some code in common to read sysfs properties, it's all.
> There is libubiio_int.h with some duplicate code from
> ubi-utils/src/common.h which could be removed.
> libubi on the other hand provide functions to manipulate volume and
> devices (rename, create, etc..).

Still, what's the reason to have a separate library?
Why not to add your stuff to existing  one? If there
are some issues in libubi, they could be fixed. I just
see a lot of common code.

> But the current tree/build system make it hard to share code between
> ubi-utils/mtd-utils/mkfs. It what
> If you check, there is also three crc32.c/h in mtd-utils ...
> (See http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=tree;hb=HEAD
> to check what a clean tree could be)

But surely you may try to re-arrange the tree, make it saner?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
