Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLC7z-0007OA-VM
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2010 09:59:05 +0000
Received: by ewy20 with SMTP id 20so2257769ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2010 01:59:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
	<AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
	<AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
	<AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
Date: Wed, 24 Nov 2010 10:59:01 +0100
Message-ID: <AANLkTinzqwsEFoG+Z0S0ep7JN3p4jHugkHhN-J19Y3cn@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 24, 2010 at 8:50 AM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> On Thu, Nov 18, 2010 at 06:13, Ketil Froyn wrote:
>
> so you'll want to dive into the ioctls to see what isnt working right.
> =A0strace is your friend.

Thanks for the kick. I had tried that, but for some reason strace was
dying with the error "syscall: unknown syscall trap 0xe8bd8008". A
little more searching now led me to this patch, which fixed it for me:

http://www.fluff.org/ben/patches/strace/strace-fix-arm-bad-syscall.patch

Anyway, here's the full output:

execve("/system/nanddump", ["/system/nanddump", "-f", "/sdcard/dump",
"/dev/mtd/mtd5"], [/* 6 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"localhost", ...}) =3D 0
brk(0)                                  =3D 0x94000
brk(0x94d00)                            =3D 0x94d00
syscall_983045(0x944c0, 0x917d0, 0xffffffe0, 0x10, 0x92048, 0x8, 0x10,
0xf0005, 0x9185c, 0x4, 0x28, 0x944c0, 0, 0xbeccad00, 0xe474, 0xe484,
0x40000010, 0x944c0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) =3D 0
brk(0xb5d00)                            =3D 0xb5d00
brk(0xb6000)                            =3D 0xb6000
open("/sys/class/mtd", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY|0x80000)=
 =3D 3
fcntl64(3, F_GETFD)                     =3D 0x1 (flags FD_CLOEXEC)
pivot_root(0x3, "")                     =3D 384
close(3)                                =3D 0
open("/sys/class/mtd/mtd0/name", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No
such file or directory)
open("/dev/mtd/mtd5", O_RDONLY|O_LARGEFILE) =3D 3
stat64("/dev/mtd/mtd5", {st_mode=3DS_IFCHR|0600, st_rdev=3Dmakedev(90,
10), ...}) =3D 0
open("/dev/mtd/mtd5", O_RDWR|O_LARGEFILE) =3D 4
ioctl(4, 0x80204d01, 0xbecca978)        =3D 0
ioctl(4, 0x40084d0b, 0xbecca998)        =3D 0
close(4)                                =3D 0
open("/proc/mtd", O_RDONLY|O_LARGEFILE) =3D 4
read(4, "dev:    size   erasesize  name\nmtd0: 00040000 00020000
\"misc\"\nmtd1: 00500000 00020000 \"recovery\"\nmtd2: 00280000
00020000 \"boot\"\nmtd3: 0aa00000 00020000 \"system\"\nmtd4: 08200000
00020000 \"cache\"\nmtd5: 0a5c0000 00020000 \"userdata\"\n", 4096) =3D
228
close(4)                                =3D 0
ioctl(3, 0x80104d12, 0xbeccacfc)        =3D 0
write(2, "ECC failed: 0\n", 14)         =3D 14
write(2, "ECC corrected: 0\n", 17)      =3D 17
write(2, "Number of bad blocks: 0\n", 24) =3D 24
write(2, "Number of bbt blocks: 0\n", 24) =3D 24
open("/sdcard/dump", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0644) =3D 4
ioctl(4, TCGETS or SNDCTL_TMR_TIMEBASE, 0xbecca9ec) =3D -1 ENOTTY (Not a
typewriter)
write(2, "Block size 131072, page size 2048, OOB size 0\n", 46) =3D 46
write(2, "Dumping data starting at 0x00000000 and ending at
0x0a5c0000...\n", 64) =3D 64
ioctl(3, 0x40084d0b, 0xbeccaa48)        =3D 0
_llseek(3, 0, [0], SEEK_SET)            =3D 0
read(3, "[snip]"..., 2048) =3D 2048
ioctl(3, 0x80104d12, 0xbeccacec)        =3D 0
write(4, "[snip]"..., 2048) =3D 2048
ioctl(3, 0xc0184d16, 0xbecca9e8)        =3D -1 ENOTTY (Not a typewriter)
ioctl(3, 0xc00c4d04 <unfinished ...>
+++ killed by SIGSEGV +++

The old version of nanddump (with my patches) works fine on the same
system. It looks like this:

execve("/system/nanddump-old", ["/system/nanddump-old", "-f",
"/sdcard/old-dump", "/dev/mtd/mtd5"], [/* 6 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"localhost", ...}) =3D 0
brk(0)                                  =3D 0x96000
brk(0x96d00)                            =3D 0x96d00
syscall_983045(0x964c0, 0x92010, 0xffffffe0, 0x10, 0x939a0, 0x8, 0x10,
0xf0005, 0x920c8, 0x4, 0x28, 0x964c0, 0, 0xbeeb6cf0, 0xb0b4, 0xb0c4,
0x40000010, 0x964c0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) =3D 0
brk(0xb7d00)                            =3D 0xb7d00
brk(0xb8000)                            =3D 0xb8000
open("/dev/mtd/mtd5", O_RDONLY|O_LARGEFILE) =3D 3
ioctl(3, 0x80204d01, 0xbeeb6ca4)        =3D 0
ioctl(3, 0x80104d12, 0xbeeb6cd4)        =3D 0
write(2, "ECC failed: 0\n", 14)         =3D 14
write(2, "ECC corrected: 0\n", 17)      =3D 17
write(2, "Number of bad blocks: 0\n", 24) =3D 24
write(2, "Number of bbt blocks: 0\n", 24) =3D 24
open("/sdcard/old-dump", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0644) =3D 4
ioctl(4, TCGETS or SNDCTL_TMR_TIMEBASE, 0xbeeb6aec) =3D -1 ENOTTY (Not a
typewriter)
write(2, "Block size 131072, page size 2048, OOB size 56\n", 47) =3D 47
write(2, "Dumping data starting at 0x00000000 and ending at
0x0a5c0000...\n", 64) =3D 64
ioctl(3, 0x40084d0b, 0xbeeb6cf0)        =3D 0
read(3, "[snip]"..., 2048) =3D 2048
ioctl(3, 0x80104d12, 0xbeeb6cc4)        =3D 0
write(4, "[snip]"..., 2048) =3D 2048
ioctl(3, 0xc00c4d04, 0xbeeb6ce4)        =3D 0
write(4, "[snip]", 56) =3D 56
read(3, "[snip]"..., 2048) =3D 2048
ioctl(3, 0x80104d12, 0xbeeb6cc4)        =3D 0
write(4, "[snip]"..., 2048) =3D 2048
ioctl(3, 0xc00c4d04, 0xbeeb6ce4)        =3D 0
write(4, "[snip]", 56) =3D 56
etc...

>> This particular system appears to use MTD partitioning, maybe
>> redboot(?) or something like that. I haven't had the opportunity to
>> delve into how that works yet - could it be that the partitioning
>> takes 8 bytes of the OOB?
>
> no

Thanks for the clarification. I guess those are the actual physical
parameters, then.

Cheers, Ketil
