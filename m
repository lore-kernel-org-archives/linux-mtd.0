Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2Qb0-0007X9-Uu
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 13:58:45 +0000
Received: by rv-out-0708.google.com with SMTP id c5so1219575rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 May 2009 06:58:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241785222.27996.85.camel@localhost.localdomain>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
Date: Fri, 8 May 2009 15:58:36 +0200
Message-ID: <71cd59b00905080658n140ca7a6l2c818aea5b6a93d8@mail.gmail.com>
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 8, 2009 at 2:20 PM, Artem Bityutskiy <dedekind@infradead.org> w=
rote:
> On Fri, 2009-05-08 at 14:07 +0200, Corentin Chary wrote:
>> No, not really, libubiio provide what you can find in ubi.h, nothing
>> more (open/close/read/write/change/erase/map/unmap).
>> There some code in common to read sysfs properties, it's all.
>> There is libubiio_int.h with some duplicate code from
>> ubi-utils/src/common.h which could be removed.
>> libubi on the other hand provide functions to manipulate volume and
>> devices (rename, create, etc..).
>
> Still, what's the reason to have a separate library?
> Why not to add your stuff to existing =A0one? If there
> are some issues in libubi, they could be fixed. I just
> see a lot of common code.

When we made libubiio we wanted something close to the kernel API,
libubi is not.
To make mkfs.ubifs works with smaller changes, I can add the
"is_mapped" and "erase" functions to libubi, forgetting the original
UBI API.
Does that seems better to you ? If it's ok then I'll do that.

>> But the current tree/build system make it hard to share code between
>> ubi-utils/mtd-utils/mkfs. It what
>> If you check, there is also three crc32.c/h in mtd-utils ...
>> (See http://git.iksaif.net/?p=3Dusers/iksaif/mtd-utils.git;a=3Dtree;hb=
=3DHEAD
>> to check what a clean tree could be)
>
> But surely you may try to re-arrange the tree, make it saner?
It's what I did on my git tree.. but it only works with CMake.
I don't know how to fix the current mess with simples Makefiles.
Maybe someone with better Make skills could help us here ?

Thanks
--=20
Corentin Chary
http://xf.iksaif.net
