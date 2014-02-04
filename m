Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAkCl-0002Xy-DV
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2014 17:54:40 +0000
From: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 4 Feb 2014 18:52:09 +0100
Subject: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474B@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>,
 <52EF9FFE.4020405@nod.at>,
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Ehmm, OK, OK, even with the changes in kernel, ubi_assert() in leb_write_un=
lock() wouldn't have triggered ...

Thorsten

________________________________________
Von: linux-mtd [linux-mtd-bounces@lists.infradead.org] im Auftrag von Wiede=
mer, Thorsten (Lawo AG) [Thorsten.Wiedemer@lawo.com]
Gesendet: Dienstag, 4. Februar 2014 18:01
An: Richard Weinberger
Cc: linux-mtd@lists.infradead.org
Betreff: AW: UBI leb_write_unlock NULL pointer Oops (continuation)

Hi,

I made a "hardcore test" with:
$ while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.1>; syn=
c; done &
$ while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.2>; syn=
c; done &
$ while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.3>; syn=
c; done &

It took about 2-3 hours until I had an error (two times):

First time:
Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in:
CPU: 0    Tainted: G           O  (3.6.11 #1)
PC is at __up_read+0x50/0xdc
LR is at __up_read+0x1c/0xdc
pc : [<c0229358>]    lr : [<c0229324>]    psr: 00000093
sp : c7363c70  ip : 00100100  fp : c7344c00
r10: 00000000  r9 : 000001e5  r8 : 0000046d
r7 : c79b4800  r6 : 0000046d  r5 : 60000013  r4 : c72fe138
r3 : 00000000  r2 : ffffffff  r1 : 00000001  r0 : 00200200
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 8736c000  DAC: 00000015
Process cp (pid: 6608, stack limit =3D 0xc7362270)
...
Code: e3e02000 e5842000 e59fc084 e59f0084 (e8930006)
---[ end trace 25fc3fca34038efb ]---
note: cp[6608] exited with preempt_count 2

The stack dump was cut in my serial terminal window, so it's not complete. =
I removed it here.


Second time:

Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in:
CPU: 0    Tainted: G           O  (3.6.11 #1)
PC is at __up_read+0x50/0xdc
LR is at __up_read+0x1c/0xdc
pc : [<c0229358>]    lr : [<c0229324>]    psr: 00000093
sp : c7bffc70  ip : 00100100  fp : c7268440
r10: 00000000  r9 : 00000999  r8 : 00000480
r7 : c79b4800  r6 : 00000480  r5 : 60000013  r4 : c7137178
r3 : 00000000  r2 : ffffffff  r1 : 00000001  r0 : 00200200
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 87168000  DAC: 00000015
Process cp (pid: 1276, stack limit =3D 0xc7bfe270)
Stack: (0xc7bffc70 to 0xc7c00000)
fc60:                                     c7bffc80 c7137160 c7bfe000 c02d07=
28
fc80: 00000000 c79fba00 c79b4800 00000000 00000001 c02d0a98 0000004c 000000=
10
fca0: 00000007 00000006 c7bfe000 00000000 00000000 c79fba00 00000001 000006=
5a
fcc0: 0001781c c7268440 00000002 00000001 c754d9b4 c02cfaa8 000177d0 000000=
4c
fce0: 00000000 c7ae7000 000177d0 0000004c 000177d0 00000480 0000004c c01da8=
8c
fd00: 0000004c 00000000 c7ae7000 c710aca8 00000480 000177d0 c7268440 c7ae70=
00
fd20: 00000480 c01dc4d4 0000004c 00000000 c7266420 c7268440 c7ae7000 000000=
02
fd40: c7ae7000 c7571260 00000001 c01f9c48 00000480 000177d0 00000000 c7bffe=
18
fd60: c7266680 c01f35e4 00000030 00000000 a0000093 c7800180 0000004c c00c13=
04
fd80: 00000058 c01dec14 00000000 c7266420 c754d9b4 c7268440 c7266420 c754d9=
b4
fda0: c754d9b8 c01ddd48 c754d9b8 c7ae7000 c7bffe14 c7bffe18 c7bffe88 c754d9=
b8
fdc0: c7571260 c01dddd4 34613139 00000029 00000190 c022d138 c0538880 c7bffd=
ec
fde0: 0000ffff c7ae7000 00000001 c7bffe88 c7ae71a8 c754d9b0 c7571260 000000=
01
fe00: 00000190 c01e0898 c754d9b0 20000013 00000001 00000002 c72663c0 2c3836=
33
fe20: 72696420 72746e65 30202c79 65366178 34613139 c7580029 c0656f20 c71f98=
00
fe40: c71f9800 c00c1ca4 c71f9800 c7ae7000 c754d9b0 c7abd490 c758b240 c01ce8=
c4
fe60: c7bffe84 00000000 c71f9850 00000000 00000050 000000a0 0000004c 000000=
a0
fe80: 00000480 00018800 00075088 4a6e91a4 00000000 c7ae718c 00000000 c75712=
60
fea0: c758b240 c754d998 c7ae7000 00000158 00000001 c758b380 c75713a0 c01d30=
70
fec0: 00000001 00000000 00000050 00000000 c05659a8 00000001 c7570c40 000000=
00
fee0: c7bfe000 00200020 00000000 00000000 00000000 00000278 00000007 c754d9=
98
ff00: c758b240 c7571260 0000000a c0012f48 c7bfe000 00000000 00000002 c00d2a=
a4
ff20: b6fc24d0 000e0cb8 00000000 00000000 c754d998 c00d2c44 00000004 c716c0=
00
ff40: c7818b30 c7570c40 aa6e91a4 00000013 c716c004 c004a008 00000000 c716c0=
00
ff60: c758b240 00000000 00000002 00000000 00000000 00000000 000200c1 000081=
ed
ff80: 00000022 00000700 00003164 be913eee 000081ed 00000003 be913eee b6fc24=
d0
ffa0: 00000011 c0012dc0 be913eee b6fc24d0 be913eee 00000002 00000011 000f5c=
20
ffc0: be913eee b6fc24d0 00000011 0000000a be913eee 00000002 be913edb 000000=
02
ffe0: b6f276d0 be913a24 000b96ac b6f276dc 60000010 be913eee 00000000 000000=
00
[<c0229358>] (__up_read+0x50/0xdc) from [<c02d0728>] (leb_read_unlock+0x74/=
0xec)
[<c02d0728>] (leb_read_unlock+0x74/0xec) from [<c02d0a98>] (ubi_eba_read_le=
b+0x218/0x41c)
[<c02d0a98>] (ubi_eba_read_leb+0x218/0x41c) from [<c02cfaa8>] (ubi_leb_read=
+0xa4/0x12c)
[<c02cfaa8>] (ubi_leb_read+0xa4/0x12c) from [<c01da88c>] (ubifs_leb_read+0x=
24/0x88)
[<c01da88c>] (ubifs_leb_read+0x24/0x88) from [<c01dc4d4>] (ubifs_read_node+=
0x98/0x2a4)
[<c01dc4d4>] (ubifs_read_node+0x98/0x2a4) from [<c01f9c48>] (ubifs_tnc_read=
_node+0x4c/0x140)
[<c01f9c48>] (ubifs_tnc_read_node+0x4c/0x140) from [<c01ddd48>] (matches_na=
me.isra.23+0x94/0xd8)
[<c01ddd48>] (matches_name.isra.23+0x94/0xd8) from [<c01dddd4>] (resolve_co=
llision+0x48/0x334)
[<c01dddd4>] (resolve_collision+0x48/0x334) from [<c01e0898>] (ubifs_tnc_re=
move_nm+0x78/0x128)
[<c01e0898>] (ubifs_tnc_remove_nm+0x78/0x128) from [<c01ce8c4>] (ubifs_jnl_=
update+0x2cc/0x608)
[<c01ce8c4>] (ubifs_jnl_update+0x2cc/0x608) from [<c01d3070>] (ubifs_unlink=
+0x14c/0x268)
[<c01d3070>] (ubifs_unlink+0x14c/0x268) from [<c00d2aa4>] (vfs_unlink+0x78/=
0x104)
[<c00d2aa4>] (vfs_unlink+0x78/0x104) from [<c00d2c44>] (do_unlinkat+0x114/0=
x168)
[<c00d2c44>] (do_unlinkat+0x114/0x168) from [<c0012dc0>] (ret_fast_syscall+=
0x0/0x2c)
Code: e3e02000 e5842000 e59fc084 e59f0084 (e8930006)
---[ end trace 786c7bb100a792ee ]---
note: cp[1276] exited with preempt_count 2

Unfortunately not yet with the "ubi_assert()" in the kernel.

Not the same error as before, but perhaps the same reason ?

Regards,
Thorsten
________________________________________
Von: Richard Weinberger [richard@nod.at]
Gesendet: Montag, 3. Februar 2014 14:56
An: Wiedemer, Thorsten (Lawo AG)
Cc: linux-mtd@lists.infradead.org
Betreff: Re: UBI leb_write_unlock NULL pointer Oops (continuation)

Am 03.02.2014 13:51, schrieb Wiedemer, Thorsten (Lawo AG):
> Hi,
>
> I can reproduce it fairly regularly, but not really "quickly". At the mom=
ent, I can use a setup of about identical 70 devices.
> A test over the last weekend resultet In 6 devices showing the bug.
> What we have are multiple processes which write in different intervals so=
me data on the device and sync it, because this data should be available af=
ter a power cut.
> Perhaps I can force the error more often in writing test processes with s=
horter write/sync intervals.
>
> If I have further access to the "big" setup for some days, I will try to =
make a test without preemption.

Hmm, ok.
Please also apply this patch, just in case...

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0e11671d..48fd2aa 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -301,6 +301,7 @@ static void leb_write_unlock(struct ubi_device *ubi, in=
t vol_id, int lnum)

        spin_lock(&ubi->ltree_lock);
        le =3D ltree_lookup(ubi, vol_id, lnum);
+       ubi_assert(le);
        le->users -=3D 1;
        ubi_assert(le->users >=3D 0);
        up_write(&le->mutex);

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
