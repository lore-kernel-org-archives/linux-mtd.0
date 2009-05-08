Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2Ord-0003JU-I3
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 12:07:50 +0000
Received: by wf-out-1314.google.com with SMTP id 23so1135478wfg.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 May 2009 05:07:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241772563.27996.81.camel@localhost.localdomain>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
Date: Fri, 8 May 2009 14:07:38 +0200
Message-ID: <71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
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

On Fri, May 8, 2009 at 10:49 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> Hi,
>
> thanks for patches. Could you please avoid synchronizing
> include/mtd/ubi-user.h for now? There is nothing new there
> except of this insane s/int32_t/__s32/ type change, right?

Ho, I believed that new ioctl weren't in ubi-user.h .. So it's ok to
keep the old one.

> On Thu, 2009-05-07 at 12:21 +0200, Corentin Chary wrote:
>> =A0include/mtd/ubi-user.h =A0 =A0| =A0 72 ++--
>> =A0include/ubi.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0192 +++++++++
>> =A0mkfs.ubifs/libubiio.c =A0 =A0 | =A0936 ++++++++++++++++++++++++++++++=
+++++++++++++++
>> =A0mkfs.ubifs/libubiio.h =A0 =A0 | =A0 47 +++
>> =A0mkfs.ubifs/libubiio_int.h | =A0187 +++++++++
>> =A05 files changed, 1399 insertions(+), 35 deletions(-)
>> =A0create mode 100644 include/ubi.h
>> =A0create mode 100644 mkfs.ubifs/libubiio.c
>> =A0create mode 100644 mkfs.ubifs/libubiio.h
>> =A0create mode 100644 mkfs.ubifs/libubiio_int.h
>
> What is the point of making a second copy of libubi?
> AFAICS, libubio is libubi + other stuff, right?
> Why not to just improve libubi instead of having yet
> another copy? How much sense does it make?

No, not really, libubiio provide what you can find in ubi.h, nothing
more (open/close/read/write/change/erase/map/unmap).
There some code in common to read sysfs properties, it's all.
There is libubiio_int.h with some duplicate code from
ubi-utils/src/common.h which could be removed.
libubi on the other hand provide functions to manipulate volume and
devices (rename, create, etc..).

Another way to teach ubifs to write on UBI volume could be libubi +
direct pread/pwrite/ioctl but it seems a lot less clean
to me. libubiio could be used later for fsck.ubifs or tuneubifs programs =
=3D).

But the current tree/build system make it hard to share code between
ubi-utils/mtd-utils/mkfs. It what
If you check, there is also three crc32.c/h in mtd-utils ...
(See http://git.iksaif.net/?p=3Dusers/iksaif/mtd-utils.git;a=3Dtree;hb=3DHE=
AD
to check what a clean tree could be)

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
