Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBKcu-0004IW-VV
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 07:11:17 +0000
Received: by lbbgf7 with SMTP id gf7so161575lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2012 00:11:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN0F+aWT+sdk2MpnpQVNXa8MrZVZWJ=bkti4bsFZPdJ_SZqdNg@mail.gmail.com>
References: <CAN0F+aWY_3GC4Arj+Zj97RJhy-7C7TT0dP2gERw=-WD3vhd6Sg@mail.gmail.com>
 <CACQ1gAgqBS-v5hSD5Lt7wWVzSC9BEiAfUU83uviBta63yWoAVQ@mail.gmail.com>
 <CAN0F+aUuBUWN0_VMZ3rzPc5VNNDSLKivnFkW=32Cbi8eCf2QHA@mail.gmail.com>
 <CACQ1gAg_s8S8V5AWN4pR9XKqctyeYZpW_mtD3XczDde5Y+9Y4A@mail.gmail.com>
 <CAN0F+aWT+sdk2MpnpQVNXa8MrZVZWJ=bkti4bsFZPdJ_SZqdNg@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 11 Sep 2012 09:10:53 +0200
Message-ID: <CACQ1gAjab=A7dr61Qrs2x66B3G6UjRizB2U9UTh+BQOcMj2mOA@mail.gmail.com>
Subject: Re: lseek32 and lseek64
To: Cheney Chen <cheneychencl2012@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/11 Cheney Chen <cheneychencl2012@gmail.com>:
> I add the case _FILE_OFFSET_BITS=3D64 into the file Android.mk, compile t=
hem
> and try it again. it dose not work.
>
> + LOCAL_CFLAGS =3D -O2 -Wall -D_FILE_OFFSET_BITS=3D64
>
> Why not use uint64_t?
It seems that there's a problem somewhere in the android makefiles,
because you don't need to define _FILE_OFFSET_BITS yourself, it should
be enabled by common.mk (in mtd-utils), unless WITHOUT_LARGEFILE=3D1 is
set.
maybe try to grep WITHOUT_LARGEFILE in your project, and make the
mtd_utils with V=3D1.
you should see -D_FILE_OFFSET_BITS=3D64 in the compilation log. If not,
something in your project had disabled it.
(maybe you're using =C2=B5Clibc without large file support, or buildroot
which disables it for mtd-utils or...)

It's better to use off_t because the prototype of lseek is:
off_t lseek(int fd, off_t offset, int whence);
cf man lseek64:
lseek(2) uses the type off_t.  This is a 32-bit signed type on 32-bit
architectures, unless one compiles with
           #define _FILE_OFFSET_BITS 64
       in which case it is a 64-bit signed type.
(and off_t is signed, not unsigned)


--=20
for me, ck means con kolivas and not calvin klein... does it mean I'm a gee=
k ?
