Received: from nproxy.gmail.com ([64.233.182.195])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHpnz-0006sf-EV
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 17:37:43 -0400
Received: by nproxy.gmail.com with SMTP id x4so170357nfb
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 14:37:31 -0700 (PDT)
Message-ID: <196b7d310509201437bd93c27@mail.gmail.com>
Date: Tue, 20 Sep 2005 23:37:31 +0200
From: Lior Balkohen <balkohen@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: kernel panic with block2mtd
Reply-To: balkohen@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi list,

after patching my kernel with today's mtd cvs,

diaspora lior # modprobe block2mtd

diaspora lior # modprobe jffs2

diaspora lior # mknod /dev/mtdblock0 b 31 0

diaspora lior # echo "/dev/hdb2,8192" >
/sys/module/block2mtd/parameters/block2mtd

diaspora lior # dmesg|tail
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode
agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode
block2mtd: version $Revision: 1.28 $
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
block2mtd: mtd0: [d: /dev/hdb2] erase_size =3D 8KiB [8192]

diaspora lior # mkfs.jffs2 --pad -d cdkflash -e 8192 -l -o /dev/hdb2

cdkflash is about 3 Mb and the hdb2 partition is 40 Mb

diaspora lior # mount -t jffs2 /dev/mtdblock0 jffs2

filesystem is mounted:

diaspora lior # mount
/dev/hda2 on / type reiserfs (rw,noatime,notail)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
udev on /dev type tmpfs (rw,nosuid)
devpts on /dev/pts type devpts (rw)
shm on /dev/shm type tmpfs (rw,noexec,nosuid,nodev)
usbfs on /proc/bus/usb type usbfs (rw,devmode=3D0664,devgid=3D85)
/dev/mtdblock0 on /home/lior/jffs2 type jffs2 (rw)

but i have a kernel panic:

divide error: 0000 [#1]
PREEMPT
Modules linked in: jffs2 zlib_deflate block2mtd mtdcore snd_pcm_oss
snd_mixer_oss snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq
snd_via82xx snd_ac97_codec snd_pcm snd_timer snd_page_alloc
snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore nvidia
CPU:    0
EIP:    0060:[<e0bdacf8>]    Tainted: P      VLI
EFLAGS: 00010206   (2.6.13-gentoo-r2)
EIP is at check_node_data+0x48/0x370 [jffs2]
eax: 000002b0   ebx: 0000000c   ecx: 0000026c   edx: 00000000
esi: d5237200   edi: 000002b0   ebp: d5237200   esp: d109dd84
ds: 007b   es: 007b   ss: 0068
Process jffs2_gcd_mtd0 (pid: 6877, threadinfo=3Dd109c000 task=3Dd143ca80)
Stack: e0bdd427 d523760c 00000294 00000000 00000000 00000296 00000282 00000=
000
       00000044 00000000 00000000 d3ef520c e0bdd733 d77d01e0 d159430c d5237=
200
       00000000 00000000 e0bdb3c5 d5237200 d159430c 000001f8 d109c000 d77d0=
1e0
Call Trace:
 [<e0bdd427>] read_more+0x97/0x160 [jffs2]
 [<e0bdd733>] jffs2_get_inode_nodes+0x243/0xb40 [jffs2]
 [<e0bdb3c5>] jffs2_add_older_frag_to_fragtree+0x225/0x5c0 [jffs2]
 [<e0bde2aa>] jffs2_do_read_inode_internal+0x27a/0x870 [jffs2]
 [<e0bdeb75>] jffs2_do_crccheck_inode+0x75/0xc0 [jffs2]
 [<e0be19be>] jffs2_garbage_collect_pass+0x1ae/0x670 [jffs2]
 [<c03168b5>] preempt_schedule+0x45/0x70
 [<c0112c57>] set_user_nice+0xb7/0xd0
 [<e0be4d12>] jffs2_garbage_collect_thread+0xc2/0x1c0 [jffs2]
 [<c0102d82>] ret_from_fork+0x6/0x14
 [<e0be4c50>] jffs2_garbage_collect_thread+0x0/0x1c0 [jffs2]
 [<e0be4c50>] jffs2_garbage_collect_thread+0x0/0x1c0 [jffs2]
 [<c0100fa5>] kernel_thread_helper+0x5/0x10
Code: 44 24 2c 8b 5a 20 85 db 0f 84 36 03 00 00 8b 44 24 2c 8b 95 10
01 00 00 8b 48 08 89 54 24 1c 31 d2 89 c8 83 e0 fc 8d 78 44 89 f8 <f7>
74 24 1c 29 54 24 1c 89 d6 85 d2 0f 45 74 24 1c 39 f3 0f 86


my first attempt to umount:

diaspora lior # umount jffs2

my second is succesful, but:

diaspora lior # dmesg|tail
 [<e0be4c3c>] jffs2_stop_garbage_collect_thread+0x7c/0x90 [jffs2]
 [<e0be6849>] jffs2_kill_sb+0x49/0x6f [jffs2]
 [<c015cbda>] deactivate_super+0x5a/0x90
 [<c0174f3f>] sys_umount+0x3f/0x90
 [<c0149cbf>] do_munmap+0x11f/0x180
 [<c0149d64>] sys_munmap+0x44/0x70
 [<c0174fa7>] sys_oldumount+0x17/0x20
 [<c0102e4b>] sysenter_past_esp+0x54/0x75
Code: 89 1c 24 8b 74 24 10 f6 42 10 01 75 2c 8d 5e ff 0f a3 9a 64 04
00 00 19 c0 85 c0 75 1c 8d 04 b6 c1 e0 02 03 82 60 04 00 00 31 d2 <8b>
40 f0 83 f8 01 74 25 85 c0 74 0f 89 d1 8b 1c 24 8b 74 24 04
 <6>note: umount[6883] exited with preempt_count 3


what's going on?
