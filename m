Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWabb-0005LR-Ty
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 18:44:00 +0000
Received: by gxk19 with SMTP id 19so3008272gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 11:43:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200907302036.24243.marek.vasut@gmail.com>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
Date: Thu, 30 Jul 2009 13:43:53 -0500
Message-ID: <3972542e0907301143y2060e17et81785efb2f9ec2f@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 1:36 PM, Marek Vasut<marek.vasut@gmail.com> wrote:
> Dne =C8t 30. =E8ervence 2009 20:24:16 E Robertson napsal(a):
>> Hi All,
>> The Oops below occurs when writing to a flash file system, particularly
>> nand. I'm using jffs2 which after formatting and mounted I copy any file=
 to
>> it. Apparently this copying always
>> seem to cause an oops. I haven't been able to determine if this is
>> entirely a filesystem issue and not
>> a driver issue (althought I did not find an issue with the driver). Than=
ks.
> Hi!
>
> would you mind testing if this oops happens even on .31-rc (the current g=
it
> version) ?
>
> Also, maybe you'd like to CC linux MTD mailing list.
>
> Thanks!

I wouldn't mind except that it would take some time since I have to
carry over patches which may or may not work.
Has this changed in .31?

>>
>> # flash_eraseall -j /dev/mtd0
>> Erasing 128 Kibyte @ 4000000 -- 100 % complete.Cleanmarker written at
>> 3fe0000. # flash_eraseall -j /dev/mtd2
>> Erasing 128 Kibyte @ 4420000 -- 42 % complete. Cleanmarker written at
>> 4420000. Skipping bad block at 0x04440000
>> Erasing 128 Kibyte @ a000000 -- 100 % complete.Cleanmarker written at
>> 9fe0000. # mount -t jffs2 /dev/mtdblock0 /mnt/home
>> # mount -t jffs2 /dev/mtdblock2 /mnt/root
>> # cp /bin/ts_calibrate /mnt/home
>> Data CRC 73ec70d8 !=3D calculated CRC af36398e for node at 02ec0078
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 00000000 pgd =3D c1d60000
>> [00000000] *pgd=3D21ca9031, *pte=3D00000000, *ppte=3D00000000
>> Internal error: Oops: 817 [#1]
>> CPU: 0 =A0 =A0Not tainted =A0(2.6.28.4 #454)
>> PC is at jffs2_write_end+0x60/0x290
>> LR is at generic_file_buffered_write+0x188/0x2d0
>> pc : [<c0122e70>] =A0 =A0lr : [<c00b64fc>] =A0 =A0psr: 60000013
>> sp : c1c3fce4 =A0ip : c1c3fd3c =A0fp : c1c3fd38
>> r10: c02fd500 =A0r9 : 00000000 =A0r8 : c1815d6c
>> r7 : 00001000 =A0r6 : c1815d44 =A0r5 : 00000000 =A0r4 : c1ca8e00
>> r3 : 00000000 =A0r2 : c1ca8c00 =A0r1 : 00001000 =A0r0 : c1c3fcf8
>> Flags: nZCv =A0IRQs on =A0FIQs on =A0Mode SVC_32 =A0ISA ARM =A0Segment u=
ser
>> Control: 0005317f =A0Table: 21d60000 =A0DAC: 00000015
>> Process cp (pid: 1107, stack limit =3D 0xc1c3e260)
>> Stack: (0xc1c3fce4 to 0xc1c40000)
>> fce0: =A0 =A0 =A0 =A0 =A000000000 00000000 c1c3fd04 c1815dac 00000000 00=
001000
>> 00001000 fd00: 00000000 00000000 00001000 c1c3e000 00001000 00001000
>> 00000000 00001000 fd20: c1c3e000 00000000 00000000 c1c3fdb4 c1c3fd3c
>> c00b64fc c0122e20 00001000 fd40: 00001000 c02fd500 00000099 00001000
>> 00000000 00000000 c024498c c1815e04 fd60: c1815d6c c024498c c1815e04
>> c1c2b6a0 c1c3fea8 00000099 c02fd500 c1c3fea0 fd80: 00000001 00000000
>> 00001000 00001000 00000000 00002000 00000000 00000000 fda0: c1c3fdf4
>> c1c3fea0 c1c3fe54 c1c3fdbc c00b6b48 c00b6388 00001000 00000000 fdc0:
>> c1c3fef0 00001000 00000000 00002000 00000000 00001000 00000000 00000000
>> fde0: c1815e04 c1c2b6a0 c1c3fef0 c1c3fea8 00001000 00001000 00000000
>> 00001000 fe00: 00000001 c1c3fe10 c00e6828 c00e8890 00000099 3b4e48ae
>> 00000000 00001000 fe20: c1c3fe94 c1c3fe30 c00d03f0 c1815dd8 c1c3fea8
>> c1c3fef0 c1815d6c 00001000 fe40: 00000000 c1c3fea0 c1c3fe94 c1c3fe58
>> c00b6cb8 c00b6654 00000001 00001000 fe60: c1815e04 c1c2b6a0 00000001
>> c1c3fea8 c1c3fef0 c1c2b6a0 c1c3ff78 c1c3fea0 fe80: 00000000 00000003
>> c1c3ff50 c1c3fe9c c00d5638 c00b6c48 00001000 00000000 fea0: bef40bcc
>> 00001000 c1c5acc0 c1c3fec8 00000000 00000001 ffffffff c1c2b6a0 fec0:
>> 00000000 00000000 00000000 00000000 c1c5acc0 00000000 00000000 ffffffff
>> fee0: c1c5acc0 c00a4fd8 c1c3fee8 c1c3fee8 00001000 00000000 c1c3ffac
>> c1c3ff08 ff00: c007b220 c0080d04 00001000 c00c52a0 0000003b 00000000
>> 00000000 00000000 ff20: 00000000 00000001 00000001 c1c2b6a0 bef40bcc
>> c1c3ff78 00001000 00000000 ff40: c1c3e000 c1c3ff74 c1c3ff54 c00d574c
>> c00d5588 00000000 c1c2b6c0 c1c2b6a0 ff60: c1c3ff78 00001000 c1c3ffa4
>> c1c3ff78 c00d5890 c00d5698 00001000 00000000 ff80: 00000000 00001000
>> bef40bcc 00000004 00000004 c007bf44 00000000 c1c3ffa8 ffa0: c007bda0
>> c00d5854 00001000 bef40bcc 00000004 bef40bcc 00001000 000000c1 ffc0:
>> 00001000 bef40bcc 00000004 00000004 00000004 00000003 00000003 00000000
>> ffe0: 000065fd bef40ba0 00024b0c 0001c8b4 20000010 00000004 c7a3270e
>> 3d29b12b Backtrace:
>> [<c0122e10>] (jffs2_write_end+0x0/0x290) from [<c00b64fc>]
>> (generic_file_buffered_write+0x188/0x2d0
>> )
>> [<c00b6378>] (generic_file_buffered_write+0x4/0x2d0) from [<c00b6b48>]
>> (__generic_file_aio_write_no
>> lock+0x504/0x534)
>> [<c00b6644>] (__generic_file_aio_write_nolock+0x0/0x534) from
>> [<c00b6cb8>] (generic_file_aio_write+
>> 0x84/0xf8)
>> [<c00b6c38>] (generic_file_aio_write+0x4/0xf8) from [<c00d5638>]
>> (do_sync_write+0xc0/0x110)
>> [<c00d5578>] (do_sync_write+0x0/0x110) from [<c00d574c>]
>> (vfs_write+0xc4/0x148) r9:c1c3e000 r8:00000000 r7:00001000 r6:c1c3ff78
>> r5:bef40bcc
>> r4:c1c2b6a0
>> [<c00d5688>] (vfs_write+0x0/0x148) from [<c00d5890>] (sys_write+0x4c/0x7=
4)
>> =A0r7:00001000 r6:c1c3ff78 r5:c1c2b6a0 r4:c1c2b6c0
>> [<c00d5844>] (sys_write+0x0/0x74) from [<c007bda0>]
>> (ret_fast_syscall+0x0/0x2c) r8:c007bf44 r7:00000004 r6:00000004 r5:bef40=
bcc
>> r4:00001000
>> Code: e2486028 e3c95003 1a000002 e3a03000 (e5833000)
>> ---[ end trace 09f754d14d7cdfe1 ]---
>> Segmentation fault
>>
>> -------------------------------------------------------------------
>> List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-ker=
nel
>> FAQ: =A0 =A0 =A0 =A0http://www.arm.linux.org.uk/mailinglists/faq.php
>> Etiquette: =A0http://www.arm.linux.org.uk/mailinglists/etiquette.php
>
>
