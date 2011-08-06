Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QphZV-0000K0-DF
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2011 14:09:51 +0000
Received: by wwf10 with SMTP id 10so1258817wwf.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 06 Aug 2011 07:09:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110805160325.GM26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
Date: Sat, 6 Aug 2011 19:39:42 +0530
Message-ID: <CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


> In principle that works. =A0But it means that any private pages that
> shouldn't be private will also be silently cleared. =A0So effectively
> your patch has removed an assertion that may still become useful. =A0A
> different patch can be found here:
> http://git.kernel.org/?p=3Dlinux/kernel/git/joern/logfs.git;a=3Dcommitdif=
f;h=3Dcc417cd06e2f496d64ac46041bd08287c677ad3d
>
> The tree also contains two other patches that fix clear bugs in logfs.
> Does that work for you?

Thanks. I tested your patch with nandsim and i was able to unmount
without any problems.
I did some more tests on  logfs with nandsim. I ran into some crashes
when i used bonnie and tiobench.
 Following are the steps i followed with bonnie. Also kernel messages
are below that.

 1. sudo modprobe mtdblock
 2. sudo modprobe nandsim
 3. sudo modprobe zlib_deflate
 4. sudo insmod logfs/logfs.ko
 5. sudo flash_eraseall /dev/mtd0
 6. sudo logfsprogs/mklogfs /dev/mtdblock0
 7. sudo mount -t logfs /dev/mtdblock0 /mnt/flash_drive/
 8. sudo chown srimugunthan /mnt/flash_drive/
 9. bonnie -d /mnt/flash_drive/ -s 100 -r 50

 kernel oops with bonnie
 ( A different kind of crash happened with tiobench  command
./tiobench.pl --dir /mnt/flash_drive/ --size 25 --threads 4)
 =3D=3D=3D
 Aug  6 19:26:26 mll kernel: [  293.230748] nand_sync: called
Aug  6 19:26:26 mll kernel: [  293.289827] ------------[ cut here ]--------=
----
Aug  6 19:26:26 mll kernel: [  293.289844] kernel BUG at
/home/srimugunthan/Documents/logfs/file.c:172!
Aug  6 19:26:26 mll kernel: [  293.289851] invalid opcode: 0000 [#2] SMP
Aug  6 19:26:26 mll kernel: [  293.290148] CPU 2
Aug  6 19:26:26 mll kernel: [  293.290152] Modules linked in: mtdchar
logfs zlib_deflate nandsim nand nand_ids nand_ecc mtdblock mtd_blkdevs
binfmt_misc ppdev nfs nfsd lockd nfs_acl auth_rpcgss sunrpc kvm_intel
kvm exportfs adt7475 hwmon_vid snd_hda_codec_realtek nouveau bridge
snd_hda_intel stp snd_hda_codec snd_hwdep fbcon snd_pcm_oss
snd_mixer_oss tileblit font bitblit snd_pcm ttm softcursor
snd_seq_dummy drm_kms_helper snd_seq_oss drm psmouse snd_seq_midi
i2c_algo_bit mxm_wmi lp serio_raw video snd_rawmidi snd_seq_midi_event
snd_seq hp_wmi snd_timer snd_seq_device parport sparse_keymap snd
intel_agp intel_gtt soundcore snd_page_alloc usbhid hid ahci libahci
e1000e
Aug  6 19:26:26 mll kernel: [  293.292973]
Aug  6 19:26:26 mll kernel: [  293.293514] Pid: 1887, comm: bonnie
Tainted: G      D W   3.0.0+ #3 Hewlett-Packard HP Z200
Workstation/0B40h
Aug  6 19:26:26 mll kernel: [  293.294051] RIP:
0010:[<ffffffffa04b398b>]  [<ffffffffa04b398b>]
logfs_invalidatepage+0x7b/0x80 [logfs]
Aug  6 19:26:26 mll kernel: [  293.294588] RSP: 0018:ffff8800bfd6bb98
EFLAGS: 00010202
Aug  6 19:26:26 mll kernel: [  293.295125] RAX: 0000000000000140 RBX:
ffffea0002a95040 RCX: 0000000000000040
Aug  6 19:26:26 mll kernel: [  293.295652] RDX: ffff8800bf97f938 RSI:
0000000000000200 RDI: 6b6b6b6b6b6b6b6b
Aug  6 19:26:26 mll kernel: [  293.296177] RBP: ffff8800bfd6bba8 R08:
0000000000000140 R09: 0000000000000008
Aug  6 19:26:26 mll kernel: [  293.296701] R10: 0000000000000008 R11:
00000000000000c8 R12: ffff8800bf97f8e0
Aug  6 19:26:26 mll kernel: [  293.297224] R13: ffff8800c0c36f20 R14:
ffff8800bfd6bc18 R15: 0000000000000000
Aug  6 19:26:26 mll kernel: [  293.297749] FS:  00007f0247798700(0000)
GS:ffff880112c00000(0000) knlGS:0000000000000000
Aug  6 19:26:26 mll kernel: [  293.298275] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Aug  6 19:26:26 mll kernel: [  293.298802] CR2: 00007f02480cc760 CR3:
000000010e204000 CR4: 00000000000006e0
Aug  6 19:26:26 mll kernel: [  293.299334] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Aug  6 19:26:26 mll kernel: [  293.299870] DR3: 0000000000000000 DR6:
00000000ffff0ff0 DR7: 0000000000000400
Aug  6 19:26:26 mll kernel: [  293.300395] Process bonnie (pid: 1887,
threadinfo ffff8800bfd6a000, task ffff8800d50b8000)
Aug  6 19:26:26 mll kernel: [  293.300925] Stack:
Aug  6 19:26:26 mll kernel: [  293.301455]  ffffea0002a95040
ffff8800c0c36f20 ffff8800bfd6bbb8 ffffffff81119378
Aug  6 19:26:26 mll kernel: [  293.301991]  ffff8800bfd6bbd8
ffffffff81119692 000000000000604f ffffffffffffffff
Aug  6 19:26:26 mll kernel: [  293.302523]  ffff8800bfd6bcc8
ffffffff81119a47 ffffea0002a95040 ffffffff00000001
Aug  6 19:26:26 mll kernel: [  293.303052] Call Trace:
Aug  6 19:26:26 mll kernel: [  293.303576]  [<ffffffff81119378>]
do_invalidatepage+0x28/0x30
Aug  6 19:26:26 mll kernel: [  293.304104]  [<ffffffff81119692>]
truncate_inode_page+0x92/0xb0
Aug  6 19:26:26 mll kernel: [  293.304629]  [<ffffffff81119a47>]
truncate_inode_pages_range+0x177/0x4f0
Aug  6 19:26:26 mll kernel: [  293.305154]  [<ffffffff81119dd5>]
truncate_inode_pages+0x15/0x20
Aug  6 19:26:26 mll kernel: [  293.305673]  [<ffffffff81119e2f>]
truncate_pagecache+0x4f/0x70
Aug  6 19:26:26 mll kernel: [  293.306195]  [<ffffffff81119e6f>]
truncate_setsize+0x1f/0x30
Aug  6 19:26:26 mll kernel: [  293.306720]  [<ffffffff81119ebe>]
vmtruncate+0x3e/0x60
Aug  6 19:26:26 mll kernel: [  293.307242]  [<ffffffffa04ba1d3>]
logfs_truncate+0x263/0x2a0 [logfs]
Aug  6 19:26:26 mll kernel: [  293.307770]  [<ffffffffa04ba48c>]
logfs_evict_inode+0xdc/0x1d0 [logfs]
Aug  6 19:26:26 mll kernel: [  293.308301]  [<ffffffff812e325e>] ?
do_raw_spin_unlock+0x5e/0xb0
Aug  6 19:26:26 mll kernel: [  293.308825]  [<ffffffff81180d49>]
evict+0xa9/0x1a0
Aug  6 19:26:26 mll kernel: [  293.309349]  [<ffffffff81180f3d>] iput+0xfd/=
0x200
Aug  6 19:26:26 mll kernel: [  293.309875]  [<ffffffff8117dce8>]
dentry_iput+0x98/0xe0
Aug  6 19:26:26 mll kernel: [  293.310396]  [<ffffffff8117eafe>]
dput+0x19e/0x2a0
Aug  6 19:26:26 mll kernel: [  293.310919]  [<ffffffff811682d2>]
fput+0x182/0x230
Aug  6 19:26:26 mll kernel: [  293.311441]  [<ffffffff81164096>]
filp_close+0x66/0xa0
Aug  6 19:26:26 mll kernel: [  293.311962]  [<ffffffff81164189>]
sys_close+0xb9/0x120
Aug  6 19:26:26 mll kernel: [  293.312484]  [<ffffffff815c44c2>]
system_call_fastpath+0x16/0x1b
Aug  6 19:26:26 mll kernel: [  293.313001] Code: 00 00 e8 79 fd e1 e0
85 c0 75 20 48 8b 03 f6 c4 08 75 14 48 83 7b 30 00 75 0d 5b 41 5c c9
c3 90 e8 3b 7d 00 00 eb e4 0f 0b eb fe <0f> 0b eb fe 90 55 48 89 e5 48
83 ec 30 48 89 5d e8 4c 89 65 f0
Aug  6 19:26:26 mll kernel: [  293.314156] RIP  [<ffffffffa04b398b>]
logfs_invalidatepage+0x7b/0x80 [logfs]
Aug  6 19:26:26 mll kernel: [  293.314723]  RSP <ffff8800bfd6bb98>
Aug  6 19:26:26 mll kernel: [  293.315361] ---[ end trace fb2f20c89bd624f1 =
]---

Please let me know if i am missing something.
thanks,
mugunthan
