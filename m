Received: from mail-pz0-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnHTS-0001Ct-B9
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2010 20:16:51 +0000
Received: by pzk3 with SMTP id 3so20118pzk.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Mar 2010 12:16:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
References: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
Date: Thu, 4 Mar 2010 21:16:43 +0100
Message-ID: <62cbdcd91003041216n5f977b7n36458504ca7af0a3@mail.gmail.com>
Subject: Re: JFFS2 errors on ppc-4xx with CFI NOR flash
From: massimo cirillo <maxcir@gmail.com>
To: Ryan Thompson <i@ry.ca>
Content-Type: text/plain; charset=ISO-8859-1
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

Hi,
Sorry my earlier message was rejected because
of suspicious header.

Ryan,
Please specify the complete part number of the
flash device and I'll try to help you. As first
attempt try to disable erase suspend feature in
the flash driver.

2010/3/4 Ryan Thompson <i@ry.ca>
>
> Hi,
>
> We've been seeing errors on our ~32MiB jffs2 filesystem on a custom
> ppc-4xx board with a Numonyx 128MiB CFI NOR flash (128KiB erase
> blocks).
>
> The filesystem is mounted from /dev/mtd/modules, which is a symlink to
> /dev/mtdblock16, defined in the FDT as follows:
>
> =A0 =A0 =A0 =A0 =A0 =A0/* Modules (32128 KiB) */
> =A0 =A0 =A0 =A0 =A0 =A0partition@2e80000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x2E80000 0x1F60000>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label =3D "modules";
> =A0 =A0 =A0 =A0 =A0 =A0};
>
> When a significant amount of data (i.e., a few files over a few megs
> each) is written to the filesystem, we start seeing erase block
> errors, checksum failures, and garbage collection errors. However,
> these same filesystems have been in steady R&D use on this hardware
> and same 2.6.28 kernel for ~6 months without issue. Until recently our
> use case has only involved writing a small number of tiny files. We
> only started seeing errors when we began to write larger files.
>
> (Console output is at the end of this message.)
>
> I have been able to reproduce this problem on multiple systems with
> the following script (/mnt is defined in fstab(5) as jffs2 with
> noatime,noauto,rw):
>
> --------------------------
>
> #!/bin/sh
>
> umount /mnt && mount /mnt
> cd /mnt
> df /mnt
> while dd if=3D/dev/urandom of=3D`mktemp` count=3D512 2>/dev/null; do
> =A0 =A0sync
> =A0 =A0df /mnt | tail -1
> done
> echo "Filesystem full?"
> sync; sync
> df /mnt
> rm *.tmp
> sync; sync; sync
> df /mnt | tail -1
>
> --------------------------
>
> The errors tend to occur just after df shows approximately 52-55%
> (perhaps garbage collection starts around this time?)
>
> This occurs on at least 2.6.31. After the errors occur, the filesystem
> is unusable until I reboot the system (the errors just keep repeating,
> all reads and writes fail). However when the system is rebooted the
> filesystem seems to (silently) recover and be completely intact.
>
> We saw essentially the same errors on 2.6.28, but the kernel would
> panic. With 2.6.31, there is no panic, but a reboot is still necessary
> to restore operation.
>
> We use other partitions of the flash in block mode through mtdblockXX.
> As a test, I also formatted mtdblock16 (the jffs2 partition) as vfat.
> (Yes, I know how horrible this is!) With vfat, the above script filled
> the filesystem 10 times without issue (except for significantly
> reducing the lifespan of my flash part, I'm sure!) I additionally used
> a more complex version of the above script in some of my trials to
> store and verify the md5 sums of the random files written after the
> vfat filesystem was full; all files verified successfully.
>
> Here's the console output from one such incident:
>
> ----------- Console output --------------
> Newly-erased block contained word 0x19850003 at offset 0x01f20000
> Jan =A01 00:06:15 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01f20000
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 16916 =A0 =A0 15212 =A053%=
 /mnt
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000044)
> Jan =A01 00:06:16 rjt Node totlen on flash (0xffffffff) !=3D totlen from
> node ref (0x00000044)
> kernel: Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00=
000044)
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000244)
> Jan =A01 Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x0=
0000244)
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000244)
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000244)
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000244)
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000244)
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000244)
> 00:06:16 TerraceNode CRC ffffffff !=3D calculated CRC f09e7845 for node
> at 01e162f0
> Q kernel: Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x=
00000044)
> Jan =A01 00:06:16 rjtNewly-erased block contained word 0x19850003 at
> offset 0x01d20000
> =A0kerneNewly-erased block contained word 0x19850003 at offset 0x01d00000
> l: Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x0000024=
4)
> Filesystem full?
> Jan =A01 00:06:16 rjt last message 'kernel: Node totlen on flash
> (0xffffffff) !=3D totlen from node ref
> Jan =A01 00:06:16 rjt kernel: Node CRC ffffffff !=3D calculated CRC
> f09e7845 for node at 01e162f0
> Jan =A01 00:06:16 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01d20000
> Jan =A01 00:06:16 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01d00000
> Filesystem =A0 =A0 =A0 =A0 =A0 1K-blocks =A0 =A0 =A0Used Available Use% M=
ounted on
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 17172 =A0 =A0 14956 =A053%=
 /mnt
> rm: cannot remove '*.tmp': No such file or directory
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 17172 =A0 =A0 14956 =A053%=
 /mnt
> # Newly-erased block contained word 0x19850003 at offset 0x01ce0000
> Jan =A01Newly-erased block contained word 0x19850003 at offset 0x01ca0000
> =A000:06Newly-erased block contained word 0x19850003 at offset 0x01cc0000
> :20 Newly-erased block contained word 0x19850003 at offset 0x01c80000
> rjt kernel: Newly-erased block contained word 0x19850003 at offset 0x01ce=
0000
> Jan =A01 00:06:20 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01ca0000
> Jan =A01 00:06:20 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01cc0000
> Jan =A01 00:06:20 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01c80000
> Newly-erased block contained word 0x19850003 at offset 0x01c60000
> Jan =A01Newly-erased block contained word 0x19850003 at offset 0x01c40000
> =A000:06Newly-erased block contained word 0x19850003 at offset 0x01c20000
> :25 rjNewly-erased block contained word 0x19850003 at offset 0x01c00000
> t Newly-erased block contained word 0x19850003 at offset 0x01be0000
> kernel:Newly-erased block contained word 0x19850003 at offset 0x01bc0000
> =A0Newly-erased block contained word 0x19850003 at offset 0x01c60000
> Jan =A01 00:06:25 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01c40000
> Jan =A01 00:06:25 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01c20000
> Jan =A01 00:06:25 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01c00000
> Jan =A01 00:06:25 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01be0000
> Jan =A01 00:06:25 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01bc0000
> Newly-erased block contained word 0x19850003 at offset 0x01ba0000
> Jan =A01 Newly-erased block contained word 0x19850003 at offset 0x01b8000=
0
> 00:06:Argh. No free space left for GC. nr_erasing_blocks is 0.
> nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes,
> erasependingempty: yes)
> 26 rjtjffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode faile=
d: -28
> =A0Error garbage collecting node at 01b6db84!
> kerneNo space for garbage collection. Aborting GC thread
> l: Newly-erased block contained word 0x19850003 at offset 0x01ba0000
> Jan =A01 00:06:26 rjt kernel: Newly-erased block contained word
> 0x19850003 at offset 0x01b80000
> Jan =A01 00:06:26 rjt kernel: Argh. No free space left for GC.
> nr_erasing_blocks is 0. nr_free_blocks is 0. (erasableempty: yes,
> erasingempty: yes, erasependingempty: yes)
> Jan =A01 00:06:26 rjt kernel: jffs2_reserve_space_gc of 196 bytes for
> garbage_collect_dnode failed: -28
> Jan =A01 00:06:26 rjt kernel: Error garbage collecting node at 01b6db84!
> Jan =A01 00:06:26 rjt kernel: No space for garbage collection. Aborting G=
C thread
>
> I'd of course welcome any advice or further debugging suggestions.
>
> Thanks,
> - R
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
