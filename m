Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAU6k-0006Xx-Ok
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 20:57:31 +0000
Received: by wyf22 with SMTP id 22so3900175wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 13:57:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikd9uTV+8bRhjKt8P0vXC6p0FUbWd=bb6k2FGKi@mail.gmail.com>
References: <201010211643.33332.manningc2@actrix.gen.nz>
	<1288033416.1865.2.camel@brekeke>
	<AANLkTikd9uTV+8bRhjKt8P0vXC6p0FUbWd=bb6k2FGKi@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 25 Oct 2010 16:57:04 -0400
Message-ID: <AANLkTinDuG62AapBDGvcjjJFUDxQDxcik3zEs2Gkm_st@mail.gmail.com>
Subject: Re: Issues with ubi utils Makefile
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 25, 2010 at 16:45, Mike Frysinger wrote:
> On Mon, Oct 25, 2010 at 15:03, Artem Bityutskiy wrote:
>> Commit 96a4f76f2e9dad7fdbd6fd7740de44bc90d5769e broke 'make install'.
>> Before that commit, $DESTDIR was undefined, so =C2=A0${DESTDIR}/${SBINDI=
R}
>> was /usr/sbin, and after the commit $DESTDIR became /usr/local, so
>> ${DESTDIR}/${SBINDIR} became /usr/local//usr/sbin, which is wrong.
>
> that isnt really true. =C2=A0DESTDIR had value in makefiles before my cha=
nges.
>
>> Fix this by making $DESTDIR become the distination directory of installi=
ng,
>> i.e. 'DESTDIR ?=3D /usr' and making SBINDIR become just 'sbin'.
>
> i'd rather we change DESTDIR to match the standard -- it's a "root"
> prefix only. =C2=A0so the default should be:
> DESTDIR ?=3D

i guess this is also why i never noticed before.  i never do plain
`make install` since i'm not root and i dont want it clobbering
things.  i always do `make install DESTDIR=3D$PWD/foo` when testing and
in that regard, it works fine.  so i guess we want this simple change:
--- a/common.mk
+++ b/common.mk
@@ -20,7 +20,7 @@ ifneq ($(WITHOUT_LARGEFILE), 1)
   CPPFLAGS +=3D -D_FILE_OFFSET_BITS=3D64
 endif

-DESTDIR ?=3D /usr/local
+DESTDIR?=3D
 PREFIX=3D/usr
 EXEC_PREFIX=3D$(PREFIX)
 SBINDIR=3D$(EXEC_PREFIX)/sbin
-mike
