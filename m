Received: from mail-vc0-f178.google.com ([209.85.220.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WenwC-0004gR-W2
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 15:57:55 +0000
Received: by mail-vc0-f178.google.com with SMTP id hu19so8660660vcb.9
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 08:57:26 -0700 (PDT)
Message-ID: <535E7A58.8090102@monstr.eu>
Date: Mon, 28 Apr 2014 17:57:12 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Li Zefan <lizefan@huawei.com>, Wang Guoli <andy.wangguoli@huawei.com>,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>
Subject: JFFS2 locking issue on 3.14 + patches
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="W7pHiUXTmH0HqW42ugD0PuaXwm6ECcLct"
Reply-To: monstr@monstr.eu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W7pHiUXTmH0HqW42ugD0PuaXwm6ECcLct
Content-Type: multipart/mixed;
 boundary="------------060503070405040205050007"

This is a multi-part message in MIME format.
--------------060503070405040205050007
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

we are having this problem with JFFS2 rootfs. It is v3.14 kernel
with these 5 patches which cherry-picked from 3.15.

41bf1a2 jffs2: Fix crash due to truncation of csize
3367da5 jffs2: Fix segmentation fault found in stress test
01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
3ead957 jffs2: remove from wait queue after schedule()

There were some discussions on mtd mailing list about these locking
issues which are probably not resolved yet.

Here is the full branch I do use if someone is interested.
http://git.monstr.eu/?p=3Dlinux-2.6-microblaze.git;a=3Dshortlog;h=3Drefs/=
heads/xilinx/master-next
I have also attached .config file for reference.

I have tested jffs2 rootfs on previous kernel versions and it was working=

fine that's why I think there is no problem with jffs2 rootfs itself.

on unicpu system is less amount of CRC faults.

Thanks,
Michal


[    2.014531] mmcblk0: mmc0:1234 SA08G 7.28 GiB
[    2.026707]  mmcblk0: p1
[    2.165744] VFS: Mounted root (jffs2 filesystem) on device 31:3.
[    2.177355] devtmpfs: mounted
[    2.180701] Freeing unused kernel memory: 200K (c067f000 - c06b1000)
[    2.289970] random: nonblocking pool is initialized
INIT: version 2.88 booting
[    4.621159]
[    4.622574] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    4.628736] [ INFO: possible circular locking dependency detected ]
[    4.634990] 3.14.0-xilinx-03711-g5287151-dirty #40 Not tainted
[    4.640801] -------------------------------------------------------
[    4.647052] rc/612 is trying to acquire lock:
[    4.651391]  (&mm->mmap_sem){++++++}, at: [<c00bab0c>] might_fault+0x4=
c/0xa4
[    4.658421]
[    4.658421] but task is already holding lock:
[    4.664236]  (&f->sem){+.+.+.}, at: [<c01c6834>] jffs2_readdir+0x1b0/0=
x1d4
[    4.671094]
[    4.671094] which lock already depends on the new lock.
[    4.671094]
[    4.679253]
[    4.679253] the existing dependency chain (in reverse order) is:
[    4.686718]
-> #1 (&f->sem){+.+.+.}:
[    4.690450]        [<c006183c>] lock_acquire+0x60/0x74
[    4.695571]        [<c049f618>] mutex_lock_nested+0x60/0x430
[    4.701213]        [<c01c6f38>] jffs2_readpage+0x20/0x44
[    4.706508]        [<c00a9ba0>] __do_page_cache_readahead+0x2c0/0x330
[    4.712931]        [<c00a9e24>] ra_submit+0x20/0x24
[    4.717792]        [<c00a0ef0>] filemap_fault+0x1dc/0x4ac
[    4.723173]        [<c00bac60>] __do_fault+0xa4/0x44c
[    4.728208]        [<c00be048>] handle_mm_fault+0x37c/0x800
[    4.733763]        [<c001a770>] do_page_fault+0x120/0x380
[    4.739144]        [<c00083f0>] do_DataAbort+0x34/0x98
[    4.744266]        [<c001275c>] __dabt_svc+0x3c/0x60
[    4.749213]        [<c01fe448>] __clear_user_std+0x34/0x64
[    4.754683]
-> #0 (&mm->mmap_sem){++++++}:
[    4.758935]        [<c0060bc0>] __lock_acquire+0x11bc/0x198c
[    4.764577]        [<c006183c>] lock_acquire+0x60/0x74
[    4.769698]        [<c00bab30>] might_fault+0x70/0xa4
[    4.774732]        [<c00e64d0>] filldir+0x84/0x178
[    4.779506]        [<c01c67e4>] jffs2_readdir+0x160/0x1d4
[    4.784888]        [<c00e6628>] iterate_dir+0x64/0xa0
[    4.789922]        [<c00e66dc>] SyS_getdents+0x78/0xf0
[    4.795043]        [<c000e960>] ret_fast_syscall+0x0/0x48
[    4.800427]
[    4.800427] other info that might help us debug this:
[    4.800427]
[    4.808412]  Possible unsafe locking scenario:
[    4.808412]
[    4.814314]        CPU0                    CPU1
[    4.818828]        ----                    ----
[    4.823340]   lock(&f->sem);
[    4.826205]                                lock(&mm->mmap_sem);
[    4.832108]                                lock(&f->sem);
[    4.837489]   lock(&mm->mmap_sem);
[    4.840874]
[    4.840874]  *** DEADLOCK ***
[    4.840874]
[    4.846780] 2 locks held by rc/612:
[    4.850249]  #0:  (&type->i_mutex_dir_key){+.+.+.}, at: [<c00e65f4>] i=
terate_dir+0x30/0xa0
[    4.858495]  #1:  (&f->sem){+.+.+.}, at: [<c01c6834>] jffs2_readdir+0x=
1b0/0x1d4
[    4.865787]
[    4.865787] stack backtrace:
[    4.870134] CPU: 1 PID: 612 Comm: rc Not tainted 3.14.0-xilinx-03711-g=
5287151-dirty #40
[    4.878131] [<c0015a24>] (unwind_backtrace) from [<c0011cf8>] (show_st=
ack+0x10/0x14)
[    4.885850] [<c0011cf8>] (show_stack) from [<c049c3e8>] (dump_stack+0x=
7c/0xc8)
[    4.893052] [<c049c3e8>] (dump_stack) from [<c049a844>] (print_circula=
r_bug+0x284/0x2d8)
[    4.901126] [<c049a844>] (print_circular_bug) from [<c0060bc0>] (__loc=
k_acquire+0x11bc/0x198c)
[    4.909718] [<c0060bc0>] (__lock_acquire) from [<c006183c>] (lock_acqu=
ire+0x60/0x74)
[    4.917444] [<c006183c>] (lock_acquire) from [<c00bab30>] (might_fault=
+0x70/0xa4)
[    4.924909] [<c00bab30>] (might_fault) from [<c00e64d0>] (filldir+0x84=
/0x178)
[    4.932027] [<c00e64d0>] (filldir) from [<c01c67e4>] (jffs2_readdir+0x=
160/0x1d4)
[    4.939405] [<c01c67e4>] (jffs2_readdir) from [<c00e6628>] (iterate_di=
r+0x64/0xa0)
[    4.946956] [<c00e6628>] (iterate_dir) from [<c00e66dc>] (SyS_getdents=
+0x78/0xf0)
[    4.954421] [<c00e66dc>] (SyS_getdents) from [<c000e960>] (ret_fast_sy=
scall+0x0/0x48)
[    5.070787] jffs2: Data CRC 3a7826ef !=3D calculated CRC 7b71feb7 for =
node at 00298210
[    5.079401] jffs2: notice: (610) check_node_data: wrong data CRC in da=
ta node at 0x0003b480: read 0x2829e8c2, calculated 0xb786d61d.
[    5.093016] jffs2: Data CRC 2ddbd926 !=3D calculated CRC 4a4834ae for =
node at 0029a1f4
[    5.106442] jffs2: notice: (610) check_node_data: wrong data CRC in da=
ta node at 0x0002c260: read 0x6ca8f7c3, calculated 0x6160a7eb.
[    5.121557] jffs2: Data CRC e6d9446c !=3D calculated CRC 17f0586f for =
node at 002a12c8
[    5.131474] jffs2: notice: (610) check_node_data: wrong data CRC in da=
ta node at 0x0001ee9c: read 0x5122751b, calculated 0x14ef8ea4.
[    5.152438] jffs2: notice: (626) check_node_data: wrong data CRC in da=
ta node at 0x0033cf48: read 0x2ee28606, calculated 0xdab3743.
[    5.165630] jffs2: notice: (610) check_node_data: wrong data CRC in da=
ta node at 0x0000ba74: read 0x8ad9ba1a, calculated 0xc2abdc3f.
[    5.188524] jffs2: notice: (610) check_node_data: wrong data CRC in da=
ta node at 0x0000965c: read 0x419fd23, calculated 0x5b4db9ce.
[    5.203432] jffs2: notice: (610) check_node_data: wrong data CRC in da=
ta node at 0x00007e04: read 0xfb78909a, calculated 0xf0a34fbb.
Segmentation fault
Starting Bootlog daemon: [    5.639542] jffs2: notice: (640) check_node_d=
ata: wrong data CRC in data node at 0x003675c0: read 0x5b16f5db, calculat=
ed 0xd5961584.
Segmentation fault
bootlogd.
Creating /dev/flash/* device nodes
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/run/lock-.
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/var/volatile/log-.
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/var/volatile/tmp-.
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/var/lock/subsys-.
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/var/log/wtmp-.
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/var/run/utmp-.
chown: unknown user/group root:root
Segmentation fault
Failed to set owner -root- for -/var/run/resolv.conf-.
starting Busybox inet Daemon: inetd... done.
Starting uWeb server:
INIT: Entering runlevel: 5
[    6.120207] jffs2: Data CRC defbf7d4 !=3D calculated CRC a0c7e674 for =
node at 003443d0
Configuring network interfaces... [    6.175668] jffs2: notice: (710) che=
ck_node_data: wrong data CRC in data node at 0x00136298: read 0xec01dca2,=
 calculated 0x25229358.
[    6.193361] jffs2: notice: (710) check_node_data: wrong data CRC in da=
ta node at 0x00133aac: read 0x79fd9bb7, calculated 0x156767f1.
[    6.212887] jffs2: notice: (710) check_node_data: wrong data CRC in da=
ta node at 0x0013000c: read 0x772420c3, calculated 0x2db90266.
[    6.256293] jffs2: Data CRC c2bd7f5b !=3D calculated CRC 05c8b09e for =
node at 00146920
[    6.274253] jffs2: Data CRC 342a25a0 !=3D calculated CRC 30f103b5 for =
node at 00147dc8
[    6.283752] jffs2: Data CRC 1bb7bf36 !=3D calculated CRC db74bd14 for =
node at 00148bf8
[    6.309219] jffs2: Data CRC cfef8282 !=3D calculated CRC c43c7d8e for =
node at 001259ec
[    6.356267] jffs2: Data CRC 94933bc7 !=3D calculated CRC 0c411b7b for =
node at 0013cc88
[    7.048058] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00089abc: read 0xcba9fc1b, calculated 0x82d75978.
[    7.061526] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00087cdc: read 0x8216dcfe, calculated 0x9df8b806.
[    7.073703] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00087734: read 0xf9ba5921, calculated 0xd00608b1.
[    7.086797] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x000860ac: read 0x52a267d2, calculated 0x853bd107.
[    7.100188] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0008426c: read 0x41c7f9e9, calculated 0xc869d597.
[    7.113967] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00081c8c: read 0x2829e8c2, calculated 0xb786d61d.
[    7.127977] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0007e4f8: read 0xad39034f, calculated 0x3a40fea1.
[    7.141052] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0007ce64: read 0x2d75f0d1, calculated 0xc67bc6ee.
[    7.153543] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0007c1b8: read 0x16a02dde, calculated 0xd37dcb2a.
[    7.167325] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00079bb8: read 0x647fecc6, calculated 0x4627a51f.
[    7.179505] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00079614: read 0xe8e5cb2c, calculated 0xbde0ed03.
[    7.191680] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00078fd8: read 0x8f92f4f2, calculated 0x46a8d73e.
[    7.206545] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00075a4c: read 0xedcbda0a, calculated 0xea797efc.
[    7.219958] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00073d9c: read 0x46b084f2, calculated 0x30c3cf79.
[    7.232770] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00072a7c: read 0x6ca8f7c3, calculated 0x6160a7eb.
[    7.245573] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00071830: read 0x339e893e, calculated 0xc2b8fe3.
[    7.257663] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00071200: read 0xb23cf578, calculated 0xaa8bb20f.
[    7.269837] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00070bd0: read 0x88094127, calculated 0xfd63e2bb.
[    7.282011] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0007062c: read 0xb3ced71, calculated 0x8847fdd3.
[    7.294710] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006e978: read 0x96bf1699, calculated 0x7a11054.
[    7.307430] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006d728: read 0xf6c864bd, calculated 0x4cc05f93.
[    7.319920] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006cb40: read 0xbf63b3d3, calculated 0x977e3089.
[    7.332734] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006b9e0: read 0xbdda75c, calculated 0x3272bb2c.
[    7.345145] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006adb0: read 0x5389279d, calculated 0x9bc0d20d.
[    7.357622] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006a314: read 0x724ee318, calculated 0xae98eed7.
[    7.372888] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00065ecc: read 0x1403abc1, calculated 0x132f6ba2.
[    7.385966] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00064b84: read 0x63a56469, calculated 0x753012f3.
[    7.398448] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00063fb8: read 0x35f463dc, calculated 0x14fae992.
[    7.410642] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0006388c: read 0x5f9b80b1, calculated 0xb38cc345.
[    7.423790] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00061f90: read 0xdc06a6be, calculated 0xca6a69fb.
[    7.442344] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0005eddc: read 0xd05df8be, calculated 0xeabffe6d.
udhcpc (v1.22.1) started
[    7.460101] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0005c3e4: read 0x782275e6, calculated 0x63dd0486.
[    7.477078] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00056da0: read 0x9cf5988c, calculated 0xf7e3cee6.
[    7.495991] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00050c7c: read 0x419fd23, calculated 0xd6913432.
[    7.513511] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0004e054: read 0xfb78909a, calculated 0xc36a7008.
[    7.526967] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0004daac: read 0x218ae83a, calculated 0x3d79230f.
[    7.546240] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0004a760: read 0x3cd7ed8e, calculated 0x790e1ac5.
Sending discover...
[    8.413910] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x000fc4ec: read 0x1b49109e, calculated 0xc542abf1.
[    8.426966] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x000fa3e0: read 0x6ba863bd, calculated 0xf1873206.
[   10.423729] xemacps e000b000.ps7-ethernet: Set clk to 24999999 Hz
[   10.429755] xemacps e000b000.ps7-ethernet: link up (100/FULL)
Sending discover...
Sending select for 192.168.0.105...
Lease of 192.168.0.105 obtained, lease time 7200
/etc/udhcpc.d/50default: Adding DNS 10.255.255.10
/etc/udhcpc.d/50default: Adding DNS 10.255.255.20
done.
Stopping Bootlog daemon: bootlogd.

Built with PetaLinux v2014.05 (Yocto 1.6) Xilinx-ZC702-2014_2 /dev/ttyPS0=

Xilinx-ZC702-2014_2 login: [   13.483691] jffs2: notice: (637) check_node=
_data: wrong data CRC in data node at 0x00109388: read 0xcad6654, calcula=
ted 0x3f9fa291.
[   13.495473] jffs2: warning: (637) jffs2_do_read_inode_internal: no dat=
a nodes found for ino #221
[   13.504228] jffs2: Returned error for crccheck of ino #221. Expect bad=
ness...
[   18.471121] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00153bdc: read 0x1bd92a07, calculated 0xbeb4cbfd.
[   18.538585] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0015d004: read 0x1cb4ddf4, calculated 0x3a6ded58.
[   18.551388] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0015af88: read 0xb5c736ab, calculated 0xda26f18f.
[   18.770960] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00181050: read 0xbd521ad1, calculated 0xa3314eed.
[   18.786851] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x001770ec: read 0x11b72eb7, calculated 0x5f56785d.
[   18.799614] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0017529c: read 0x1154be4b, calculated 0x947ff91c.
[   18.910113] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0018ccf4: read 0x3e00aacf, calculated 0x3d290f2d.
[   18.922934] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0018ac80: read 0x2ddb39b7, calculated 0x4319db5.
[   19.141088] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0019d754: read 0x820ffdfc, calculated 0xff308529.
[   19.378138] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x001c3fcc: read 0x32a9b816, calculated 0x36d95df8.
[   19.392136] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x001c000c: read 0xb139d48, calculated 0x5e1ccb3.
[   19.508619] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x001d000c: read 0xd797cc0e, calculated 0xe40851c3.
[   19.521384] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x001ccc4c: read 0xf8a1e666, calculated 0x55f200f9.
[   20.786326] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x001fdd58: read 0x74510257, calculated 0xe5f05bfd.
[   21.061353] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00314848: read 0x12c7620d, calculated 0x98cab68c.
[   21.073692] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00313b04: read 0xd4c00292, calculated 0x9658f5d5.
[   21.087363] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0031000c: read 0xf7f69365, calculated 0x21d336cc.
[   21.106227] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00300f24: read 0x3b46aab5, calculated 0x5d138dc3.
[   21.120248] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002fadf8: read 0x62ca10e5, calculated 0xf982e8dc.
[   21.137591] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002f1ee0: read 0x77ce36d3, calculated 0xf202e98f.
[   21.151452] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002ed894: read 0x5f4e8332, calculated 0x944aed1d.
[   21.164112] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002ec2c8: read 0xe2ff63e2, calculated 0xdaf17785.
[   21.176371] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002eb804: read 0x7448159d, calculated 0x6aa94362.
[   21.188634] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002ead4c: read 0xc995f542, calculated 0xa957c902.
[   21.205040] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002e408c: read 0x6ac55d98, calculated 0xe519c471.
[   21.217685] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002e2b50: read 0x13803ee7, calculated 0x623e5493.
[   21.229939] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002e2024: read 0x9b11308a, calculated 0xe4ab0337.
[   21.244223] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002dd10c: read 0x3e9d18ee, calculated 0xf21055e.
[   21.257875] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002da488: read 0xf368bb97, calculated 0x57b8645e.
[   21.270931] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002d842c: read 0x7b3f28f9, calculated 0xe9efa882.
[   21.283509] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x002d7690: read 0xc294dcbb, calculated 0x914a99a.
[   21.505815] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00353228: read 0x581f1316, calculated 0xa178d893.
[   21.636763] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0035c174: read 0x3405d006, calculated 0xedd38ada.
[   21.651405] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0035777c: read 0xbdb3fe0, calculated 0x849586f7.
[   21.664305] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00355d08: read 0xbbc8b4e5, calculated 0x786dffaa.
[   23.935625] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00372134: read 0xc78d53d5, calculated 0xd703ce27.
[   23.949021] jffs2: warning: (637) jffs2_do_read_inode_internal: Trunca=
ting ino #507 to 14574 bytes failed because it only had 12288 bytes to st=
art with!
[   24.008990] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00375398: read 0x697fd9d5, calculated 0xb3b748e7.
[   25.055794] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003d222c: read 0xb58dafaf, calculated 0x85f9b71b.
[   25.068992] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003d0b4c: read 0xe9c15dda, calculated 0xa447735a.
[   25.093811] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003c18b0: read 0x3faacd8, calculated 0xff81e14e.
[   25.111234] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003baa18: read 0x6a84b0fb, calculated 0x62068edd.
[   25.123468] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003ba0dc: read 0xef2ba91e, calculated 0x16f387cd.
[   25.138607] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003b576c: read 0x9d7707bf, calculated 0xbd5c382a.
[   25.150822] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003b4fa8: read 0x312a7669, calculated 0x2b8413c6.
[   25.163050] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003b46ec: read 0xd878a2b0, calculated 0x8ee96485.
[   25.177144] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003b1350: read 0xf1769547, calculated 0xc09b94e2.
[   25.194404] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003a7c30: read 0x8cd9c0dc, calculated 0x62f2a5a7.
[   25.206655] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003a7274: read 0xd4a9d80c, calculated 0x36ab722e.
[   25.221663] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003a25ac: read 0x23863155, calculated 0x69599414.
[   25.234281] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003a13a4: read 0x187dccf4, calculated 0x5131c7c7.
[   25.300082] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003d8720: read 0x1d64de3f, calculated 0xb6ba40a1.
[   25.516354] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003dcc84: read 0x2ac7d21b, calculated 0x94df57cc.
[   26.274687] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003e3584: read 0xb360b63b, calculated 0x6ccd8efe.
[   26.287564] jffs2: warning: (637) jffs2_do_read_inode_internal: Trunca=
ting ino #549 to 11608 bytes failed because it only had 8192 bytes to sta=
rt with!
[   26.725910] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00442b14: read 0x5a4555d, calculated 0x73b631d8.
[   26.740796] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0043db6c: read 0x80ab1011, calculated 0x9463b283.
[   26.753476] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0043c560: read 0x13597169, calculated 0xc9e33968.
[   26.768924] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00436248: read 0x23026584, calculated 0x7ab15893.
[   26.781185] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00435718: read 0xb48f30a6, calculated 0x79b042c8.
[   26.793435] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00434dd8: read 0x6a0976c6, calculated 0xcb37260e.
[   26.806868] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004325d0: read 0x6a1643ce, calculated 0xcbce62dd.
[   26.823139] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0042a8f8: read 0x65bdaca7, calculated 0x10d70f3b.
[   26.837004] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0042727c: read 0x72a75390, calculated 0x3a27bdb7.
[   26.869032] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004051d0: read 0xb2e4c6cc, calculated 0x44a5fc12.
[   26.888565] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003f7b50: read 0x5b44bf7e, calculated 0xe364865.
[   26.903451] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003f2b64: read 0x4352578a, calculated 0xee150ef.
[   26.916010] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003f1598: read 0x4f45269d, calculated 0xc82aaec4.
[   26.928677] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003f000c: read 0xe70ef90a, calculated 0xd64e7e6e.
[   26.940972] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x003ed904: read 0x743dd9e9, calculated 0xcf5b8885.
[   28.006364] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0044c5d4: read 0x6c8c951d, calculated 0xe834685c.
[   28.018944] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0044b4e0: read 0x15cd3713, calculated 0x36083994.
[   28.652483] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0046ed7c: read 0x298e153c, calculated 0x64345603.
[   28.664713] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0046e5b8: read 0x6a02584b, calculated 0x1cc213ff.
[   28.677937] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0046cb90: read 0xd67b1bae, calculated 0x7a320ebf.
[   28.690740] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0046be78: read 0xfa0dd631, calculated 0x6c5aa046.
[   28.705043] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00468ae4: read 0x1d0fcba4, calculated 0xb7cd50aa.
[   28.718736] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0046588c: read 0xe0626073, calculated 0x4d013313.
[   28.731367] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004644f8: read 0xb9762695, calculated 0x602b59b9.
[   28.745807] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004608ec: read 0xf100578c, calculated 0xd5ab2ea9.
[   28.759584] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0045ca5c: read 0x8901f5c, calculated 0x968256be.
[   28.778295] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0045195c: read 0xbceb0839, calculated 0x1c0befd2.
[   29.084489] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004729ec: read 0x5fbf3f86, calculated 0xf18e8025.
[   29.295352] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0047446c: read 0xfecfa21, calculated 0xa8e9537d.
[   39.248693] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x00482eb4: read 0xdba1b7d9, calculated 0x377c4eef.
[   39.262088] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004808f0: read 0x97729b4b, calculated 0x4af661ef.
[   39.829847] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x0049520c: read 0x2dd18ec2, calculated 0xdde2dbe.
[   39.842026] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004948c8: read 0xafeb9710, calculated 0x8490633b.
[   40.894974] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004a20f4: read 0xb705cc8a, calculated 0xf0b00a95.
[   40.954981] jffs2: notice: (637) check_node_data: wrong data CRC in da=
ta node at 0x004a2fac: read 0xb705cc8a, calculated 0x1ee32bc9.

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform


--------------060503070405040205050007
Content-Type: text/plain; charset=UTF-8;
 name=".config"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=".config"

#
# Automatically generated file; DO NOT EDIT.
# Linux/arm 3.14.0 Kernel Configuration
#
CONFIG_ARM=3Dy
CONFIG_MIGHT_HAVE_PCI=3Dy
CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
CONFIG_HAVE_PROC_CPU=3Dy
CONFIG_NO_IOPORT=3Dy
CONFIG_STACKTRACE_SUPPORT=3Dy
CONFIG_LOCKDEP_SUPPORT=3Dy
CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
CONFIG_ARCH_HAS_CPUFREQ=3Dy
CONFIG_GENERIC_HWEIGHT=3Dy
CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
CONFIG_NEED_DMA_MAP_STATE=3Dy
CONFIG_VECTORS_BASE=3D0xffff0000
CONFIG_ARM_PATCH_PHYS_VIRT=3Dy
CONFIG_GENERIC_BUG=3Dy
CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
CONFIG_IRQ_WORK=3Dy
CONFIG_BUILDTIME_EXTABLE_SORT=3Dy

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=3D32
CONFIG_CROSS_COMPILE=3D""
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=3D"-xilinx"
CONFIG_LOCALVERSION_AUTO=3Dy
CONFIG_HAVE_KERNEL_GZIP=3Dy
CONFIG_HAVE_KERNEL_LZMA=3Dy
CONFIG_HAVE_KERNEL_XZ=3Dy
CONFIG_HAVE_KERNEL_LZO=3Dy
CONFIG_HAVE_KERNEL_LZ4=3Dy
CONFIG_KERNEL_GZIP=3Dy
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME=3D"(none)"
CONFIG_SWAP=3Dy
CONFIG_SYSVIPC=3Dy
CONFIG_SYSVIPC_SYSCTL=3Dy
# CONFIG_POSIX_MQUEUE is not set
CONFIG_FHANDLE=3Dy
# CONFIG_AUDIT is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=3Dy
CONFIG_GENERIC_IRQ_SHOW=3Dy
CONFIG_HARDIRQS_SW_RESEND=3Dy
CONFIG_GENERIC_IRQ_CHIP=3Dy
CONFIG_IRQ_DOMAIN=3Dy
CONFIG_IRQ_DOMAIN_DEBUG=3Dy
CONFIG_IRQ_FORCED_THREADING=3Dy
CONFIG_SPARSE_IRQ=3Dy
CONFIG_KTIME_SCALAR=3Dy
CONFIG_GENERIC_CLOCKEVENTS=3Dy
CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
CONFIG_ARCH_HAS_TICK_BROADCAST=3Dy
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=3Dy
# CONFIG_NO_HZ_FULL is not set
CONFIG_NO_HZ=3Dy
CONFIG_HIGH_RES_TIMERS=3Dy

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=3Dy
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_TREE_PREEMPT_RCU=3Dy
CONFIG_PREEMPT_RCU=3Dy
CONFIG_RCU_STALL_COMMON=3Dy
# CONFIG_RCU_USER_QS is not set
CONFIG_RCU_FANOUT=3D32
CONFIG_RCU_FANOUT_LEAF=3D16
# CONFIG_RCU_FANOUT_EXACT is not set
# CONFIG_RCU_FAST_NO_HZ is not set
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_RCU_BOOST is not set
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_IKCONFIG=3Dy
CONFIG_IKCONFIG_PROC=3Dy
CONFIG_LOG_BUF_SHIFT=3D14
CONFIG_GENERIC_SCHED_CLOCK=3Dy
CONFIG_CGROUPS=3Dy
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_RESOURCE_COUNTERS is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_SCHED is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_NAMESPACES is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=3Dy
CONFIG_INITRAMFS_SOURCE=3D""
CONFIG_RD_GZIP=3Dy
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
CONFIG_SYSCTL=3Dy
CONFIG_ANON_INODES=3Dy
CONFIG_HAVE_UID16=3Dy
CONFIG_EXPERT=3Dy
CONFIG_UID16=3Dy
CONFIG_SYSCTL_SYSCALL=3Dy
CONFIG_KALLSYMS=3Dy
CONFIG_KALLSYMS_ALL=3Dy
CONFIG_PRINTK=3Dy
CONFIG_BUG=3Dy
CONFIG_ELF_CORE=3Dy
CONFIG_BASE_FULL=3Dy
CONFIG_FUTEX=3Dy
CONFIG_EPOLL=3Dy
CONFIG_SIGNALFD=3Dy
CONFIG_TIMERFD=3Dy
CONFIG_EVENTFD=3Dy
CONFIG_SHMEM=3Dy
CONFIG_AIO=3Dy
CONFIG_PCI_QUIRKS=3Dy
CONFIG_EMBEDDED=3Dy
CONFIG_HAVE_PERF_EVENTS=3Dy
CONFIG_PERF_USE_VMALLOC=3Dy

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=3Dy
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_VM_EVENT_COUNTERS=3Dy
CONFIG_COMPAT_BRK=3Dy
CONFIG_SLAB=3Dy
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_PROFILING is not set
CONFIG_HAVE_OPROFILE=3Dy
# CONFIG_KPROBES is not set
# CONFIG_JUMP_LABEL is not set
# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
CONFIG_HAVE_KPROBES=3Dy
CONFIG_HAVE_KRETPROBES=3Dy
CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
CONFIG_HAVE_DMA_ATTRS=3Dy
CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
CONFIG_GENERIC_IDLE_POLL_SETUP=3Dy
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
CONFIG_HAVE_CLK=3Dy
CONFIG_HAVE_DMA_API_DEBUG=3Dy
CONFIG_HAVE_HW_BREAKPOINT=3Dy
CONFIG_HAVE_PERF_REGS=3Dy
CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
# CONFIG_CC_STACKPROTECTOR is not set
CONFIG_CC_STACKPROTECTOR_NONE=3Dy
# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
# CONFIG_CC_STACKPROTECTOR_STRONG is not set
CONFIG_HAVE_CONTEXT_TRACKING=3Dy
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
CONFIG_MODULES_USE_ELF_REL=3Dy
CONFIG_CLONE_BACKWARDS=3Dy
CONFIG_OLD_SIGSUSPEND3=3Dy
CONFIG_OLD_SIGACTION=3Dy

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
CONFIG_SLABINFO=3Dy
CONFIG_RT_MUTEXES=3Dy
CONFIG_BASE_SMALL=3D0
CONFIG_MODULES=3Dy
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=3Dy
CONFIG_MODULE_FORCE_UNLOAD=3Dy
CONFIG_MODVERSIONS=3Dy
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_STOP_MACHINE=3Dy
CONFIG_BLOCK=3Dy
CONFIG_LBDAF=3Dy
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_CMDLINE_PARSER is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=3Dy
CONFIG_EFI_PARTITION=3Dy

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=3Dy
CONFIG_IOSCHED_DEADLINE=3Dy
CONFIG_IOSCHED_CFQ=3Dy
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=3Dy
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED=3D"cfq"
CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
CONFIG_FREEZER=3Dy

#
# System Type
#
CONFIG_MMU=3Dy
CONFIG_ARCH_MULTIPLATFORM=3Dy
# CONFIG_ARCH_INTEGRATOR is not set
# CONFIG_ARCH_REALVIEW is not set
# CONFIG_ARCH_VERSATILE is not set
# CONFIG_ARCH_AT91 is not set
# CONFIG_ARCH_CLPS711X is not set
# CONFIG_ARCH_GEMINI is not set
# CONFIG_ARCH_EBSA110 is not set
# CONFIG_ARCH_EP93XX is not set
# CONFIG_ARCH_FOOTBRIDGE is not set
# CONFIG_ARCH_NETX is not set
# CONFIG_ARCH_IOP13XX is not set
# CONFIG_ARCH_IOP32X is not set
# CONFIG_ARCH_IOP33X is not set
# CONFIG_ARCH_IXP4XX is not set
# CONFIG_ARCH_DOVE is not set
# CONFIG_ARCH_KIRKWOOD is not set
# CONFIG_ARCH_MV78XX0 is not set
# CONFIG_ARCH_ORION5X is not set
# CONFIG_ARCH_MMP is not set
# CONFIG_ARCH_KS8695 is not set
# CONFIG_ARCH_W90X900 is not set
# CONFIG_ARCH_LPC32XX is not set
# CONFIG_ARCH_PXA is not set
# CONFIG_ARCH_MSM_NODT is not set
# CONFIG_ARCH_SHMOBILE_LEGACY is not set
# CONFIG_ARCH_RPC is not set
# CONFIG_ARCH_SA1100 is not set
# CONFIG_ARCH_S3C24XX is not set
# CONFIG_ARCH_S3C64XX is not set
# CONFIG_ARCH_S5P64X0 is not set
# CONFIG_ARCH_S5PC100 is not set
# CONFIG_ARCH_S5PV210 is not set
# CONFIG_ARCH_EXYNOS is not set
# CONFIG_ARCH_DAVINCI is not set
# CONFIG_ARCH_OMAP1 is not set

#
# Multiple platform selection
#

#
# CPU Core family selection
#
# CONFIG_ARCH_MULTI_V6 is not set
CONFIG_ARCH_MULTI_V7=3Dy
CONFIG_ARCH_MULTI_V6_V7=3Dy
# CONFIG_ARCH_MULTI_CPU_AUTO is not set
# CONFIG_ARCH_MVEBU is not set
# CONFIG_ARCH_BCM is not set
# CONFIG_ARCH_BERLIN is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_ARCH_HIGHBANK is not set
# CONFIG_ARCH_HI3xxx is not set
# CONFIG_ARCH_KEYSTONE is not set
# CONFIG_ARCH_MSM_DT is not set
# CONFIG_ARCH_MXC is not set
# CONFIG_ARCH_OMAP3 is not set
# CONFIG_ARCH_OMAP4 is not set
# CONFIG_SOC_OMAP5 is not set
# CONFIG_SOC_AM33XX is not set
# CONFIG_SOC_AM43XX is not set
# CONFIG_SOC_DRA7XX is not set
# CONFIG_ARCH_ROCKCHIP is not set
# CONFIG_ARCH_SOCFPGA is not set
# CONFIG_PLAT_SPEAR is not set
# CONFIG_ARCH_STI is not set
# CONFIG_ARCH_SHMOBILE_MULTI is not set
# CONFIG_ARCH_SUNXI is not set
# CONFIG_ARCH_SIRF is not set
# CONFIG_ARCH_TEGRA is not set
# CONFIG_ARCH_U8500 is not set
CONFIG_ARCH_VEXPRESS=3Dy

#
# Versatile Express platform type
#
CONFIG_ARCH_VEXPRESS_CORTEX_A5_A9_ERRATA=3Dy
# CONFIG_ARCH_VEXPRESS_CA9X4 is not set
# CONFIG_ARCH_VEXPRESS_SPC is not set
CONFIG_PLAT_VERSATILE_CLCD=3Dy
CONFIG_PLAT_VERSATILE_SCHED_CLOCK=3Dy
# CONFIG_ARCH_VIRT is not set
# CONFIG_ARCH_WM8850 is not set
CONFIG_ARCH_ZYNQ=3Dy

#
# Xilinx Specific Options
#
CONFIG_XILINX_L1_PREFETCH=3Dy
CONFIG_XILINX_L2_PREFETCH=3Dy
CONFIG_XILINX_AXIPCIE=3Dy
CONFIG_PLAT_VERSATILE=3Dy
CONFIG_ARM_TIMER_SP804=3Dy

#
# Processor Type
#
CONFIG_CPU_V7=3Dy
CONFIG_CPU_32v6K=3Dy
CONFIG_CPU_32v7=3Dy
CONFIG_CPU_ABRT_EV7=3Dy
CONFIG_CPU_PABRT_V7=3Dy
CONFIG_CPU_CACHE_V7=3Dy
CONFIG_CPU_CACHE_VIPT=3Dy
CONFIG_CPU_COPY_V6=3Dy
CONFIG_CPU_TLB_V7=3Dy
CONFIG_CPU_HAS_ASID=3Dy
CONFIG_CPU_CP15=3Dy
CONFIG_CPU_CP15_MMU=3Dy

#
# Processor Features
#
# CONFIG_ARM_LPAE is not set
# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
CONFIG_ARM_THUMB=3Dy
# CONFIG_ARM_THUMBEE is not set
CONFIG_ARM_VIRT_EXT=3Dy
CONFIG_SWP_EMULATE=3Dy
# CONFIG_CPU_BIG_ENDIAN is not set
# CONFIG_CPU_ICACHE_DISABLE is not set
# CONFIG_CPU_DCACHE_DISABLE is not set
# CONFIG_CPU_BPREDICT_DISABLE is not set
CONFIG_KUSER_HELPERS=3Dy
CONFIG_OUTER_CACHE=3Dy
CONFIG_OUTER_CACHE_SYNC=3Dy
CONFIG_MIGHT_HAVE_CACHE_L2X0=3Dy
CONFIG_CACHE_L2X0=3Dy
CONFIG_CACHE_PL310=3Dy
CONFIG_ARM_L1_CACHE_SHIFT_6=3Dy
CONFIG_ARM_L1_CACHE_SHIFT=3D6
CONFIG_ARM_DMA_MEM_BUFFERABLE=3Dy
CONFIG_ARCH_SUPPORTS_BIG_ENDIAN=3Dy
CONFIG_ARM_NR_BANKS=3D8
CONFIG_MULTI_IRQ_HANDLER=3Dy
# CONFIG_ARM_ERRATA_430973 is not set
CONFIG_PL310_ERRATA_588369=3Dy
# CONFIG_ARM_ERRATA_643719 is not set
CONFIG_ARM_ERRATA_720789=3Dy
CONFIG_PL310_ERRATA_727915=3Dy
CONFIG_PL310_ERRATA_753970=3Dy
CONFIG_ARM_ERRATA_754322=3Dy
CONFIG_ARM_ERRATA_754327=3Dy
CONFIG_ARM_ERRATA_764369=3Dy
CONFIG_PL310_ERRATA_769419=3Dy
CONFIG_ARM_ERRATA_775420=3Dy
# CONFIG_ARM_ERRATA_798181 is not set
# CONFIG_ARM_ERRATA_773022 is not set
CONFIG_ICST=3Dy

#
# Bus support
#
CONFIG_ARM_AMBA=3Dy
CONFIG_PCI=3Dy
CONFIG_PCI_SYSCALL=3Dy
CONFIG_PCI_MSI=3Dy
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set

#
# PCI host controller drivers
#
# CONFIG_PCIEPORTBUS is not set
# CONFIG_PCCARD is not set

#
# Kernel Features
#
CONFIG_HAVE_SMP=3Dy
CONFIG_SMP=3Dy
CONFIG_SMP_ON_UP=3Dy
CONFIG_ARM_CPU_TOPOLOGY=3Dy
CONFIG_SCHED_MC=3Dy
CONFIG_SCHED_SMT=3Dy
CONFIG_HAVE_ARM_SCU=3Dy
# CONFIG_HAVE_ARM_ARCH_TIMER is not set
CONFIG_HAVE_ARM_TWD=3Dy
# CONFIG_MCPM is not set
# CONFIG_BIG_LITTLE is not set
CONFIG_VMSPLIT_3G=3Dy
# CONFIG_VMSPLIT_2G is not set
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=3D0xC0000000
CONFIG_NR_CPUS=3D4
CONFIG_HOTPLUG_CPU=3Dy
# CONFIG_ARM_PSCI is not set
CONFIG_ARCH_NR_GPIO=3D1024
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=3Dy
CONFIG_PREEMPT_COUNT=3Dy
CONFIG_HZ_FIXED=3D0
CONFIG_HZ_100=3Dy
# CONFIG_HZ_200 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_500 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=3D100
CONFIG_SCHED_HRTICK=3Dy
# CONFIG_THUMB2_KERNEL is not set
CONFIG_AEABI=3Dy
# CONFIG_OABI_COMPAT is not set
# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
CONFIG_HAVE_ARCH_PFN_VALID=3Dy
CONFIG_HIGHMEM=3Dy
# CONFIG_HIGHPTE is not set
CONFIG_HW_PERF_EVENTS=3Dy
CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
CONFIG_FLATMEM=3Dy
CONFIG_FLAT_NODE_MEM_MAP=3Dy
CONFIG_HAVE_MEMBLOCK=3Dy
CONFIG_NO_BOOTMEM=3Dy
CONFIG_MEMORY_ISOLATION=3Dy
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_PAGEFLAGS_EXTENDED=3Dy
CONFIG_SPLIT_PTLOCK_CPUS=3D4
# CONFIG_COMPACTION is not set
CONFIG_MIGRATION=3Dy
# CONFIG_PHYS_ADDR_T_64BIT is not set
CONFIG_ZONE_DMA_FLAG=3D0
CONFIG_BOUNCE=3Dy
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
CONFIG_CROSS_MEMORY_ATTACH=3Dy
# CONFIG_CLEANCACHE is not set
# CONFIG_FRONTSWAP is not set
CONFIG_CMA=3Dy
# CONFIG_CMA_DEBUG is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
CONFIG_FORCE_MAX_ZONEORDER=3D11
CONFIG_ALIGNMENT_TRAP=3Dy
# CONFIG_UACCESS_WITH_MEMCPY is not set
# CONFIG_SECCOMP is not set
CONFIG_SWIOTLB=3Dy
CONFIG_IOMMU_HELPER=3Dy
# CONFIG_XEN is not set

#
# Boot options
#
CONFIG_USE_OF=3Dy
CONFIG_ATAGS=3Dy
# CONFIG_DEPRECATED_PARAM_STRUCT is not set
CONFIG_ZBOOT_ROM_TEXT=3D0x0
CONFIG_ZBOOT_ROM_BSS=3D0x0
# CONFIG_ARM_APPENDED_DTB is not set
CONFIG_CMDLINE=3D"console=3DttyPS0,115200n8 root=3D/dev/ram rw initrd=3D0=
x00800000,16M earlyprintk mtdparts=3Dphysmap-flash.0:512K(nor-fsbl),512K(=
nor-u-boot),5M(nor-linux),9M(nor-user),1M(nor-scratch),-(nor-rootfs)"
CONFIG_CMDLINE_FROM_BOOTLOADER=3Dy
# CONFIG_CMDLINE_EXTEND is not set
# CONFIG_CMDLINE_FORCE is not set
# CONFIG_KEXEC is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_AUTO_ZRELADDR=3Dy

#
# CPU Power Management
#

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
CONFIG_CPU_FREQ_GOV_COMMON=3Dy
CONFIG_CPU_FREQ_STAT=3Dy
CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
CONFIG_GENERIC_CPUFREQ_CPU0=3Dy

#
# ARM CPU frequency scaling drivers
#
# CONFIG_ARM_KIRKWOOD_CPUFREQ is not set

#
# CPU Idle
#
CONFIG_CPU_IDLE=3Dy
# CONFIG_CPU_IDLE_MULTIPLE_DRIVERS is not set
CONFIG_CPU_IDLE_GOV_LADDER=3Dy
CONFIG_CPU_IDLE_GOV_MENU=3Dy

#
# ARM CPU Idle Drivers
#
CONFIG_ARM_ZYNQ_CPUIDLE=3Dy
# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
CONFIG_VFP=3Dy
CONFIG_VFPv3=3Dy
CONFIG_NEON=3Dy
# CONFIG_KERNEL_MODE_NEON is not set

#
# Userspace binary formats
#
CONFIG_BINFMT_ELF=3Dy
CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=3Dy
# CONFIG_HAVE_AOUT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=3Dy

#
# Power management options
#
CONFIG_SUSPEND=3Dy
CONFIG_SUSPEND_FREEZER=3Dy
CONFIG_PM_SLEEP=3Dy
CONFIG_PM_SLEEP_SMP=3Dy
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM_RUNTIME=3Dy
CONFIG_PM=3Dy
# CONFIG_PM_DEBUG is not set
# CONFIG_APM_EMULATION is not set
CONFIG_ARCH_HAS_OPP=3Dy
CONFIG_PM_OPP=3Dy
CONFIG_PM_CLK=3Dy
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_CPU_PM=3Dy
CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
CONFIG_ARM_CPU_SUSPEND=3Dy
CONFIG_NET=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=3Dy
# CONFIG_UNIX_DIAG is not set
CONFIG_XFRM=3Dy
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_SUB_POLICY is not set
# CONFIG_XFRM_MIGRATE is not set
# CONFIG_XFRM_STATISTICS is not set
# CONFIG_NET_KEY is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=3Dy
CONFIG_IP_PNP_DHCP=3Dy
CONFIG_IP_PNP_BOOTP=3Dy
CONFIG_IP_PNP_RARP=3Dy
CONFIG_NET_IPIP=3Dm
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=3Dm
# CONFIG_IP_MROUTE is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_XFRM_TUNNEL is not set
CONFIG_INET_TUNNEL=3Dm
CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
CONFIG_INET_XFRM_MODE_BEET=3Dy
CONFIG_INET_LRO=3Dy
CONFIG_INET_DIAG=3Dy
CONFIG_INET_TCP_DIAG=3Dy
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=3Dy
CONFIG_DEFAULT_TCP_CONG=3D"cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=3Dm
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_INET6_XFRM_TUNNEL is not set
# CONFIG_INET6_TUNNEL is not set
CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
CONFIG_INET6_XFRM_MODE_BEET=3Dm
# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=3Dm
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=3Dy
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_GRE is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
CONFIG_HAVE_NET_DSA=3Dy
CONFIG_VLAN_8021Q=3Dm
# CONFIG_VLAN_8021Q_GVRP is not set
# CONFIG_VLAN_8021Q_MVRP is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_MMAP is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_NET_MPLS_GSO is not set
# CONFIG_HSR is not set
CONFIG_RPS=3Dy
CONFIG_RFS_ACCEL=3Dy
CONFIG_XPS=3Dy
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=3Dy
CONFIG_BQL=3Dy
# CONFIG_BPF_JIT is not set
CONFIG_NET_FLOW_LIMIT=3Dy

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
CONFIG_WIRELESS=3Dy
# CONFIG_CFG80211 is not set
# CONFIG_LIB80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_RFKILL_REGULATOR is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
CONFIG_HAVE_BPF_JIT=3Dy

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
CONFIG_DEVTMPFS=3Dy
CONFIG_DEVTMPFS_MOUNT=3Dy
CONFIG_STANDALONE=3Dy
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
CONFIG_FW_LOADER=3Dy
CONFIG_FIRMWARE_IN_KERNEL=3Dy
CONFIG_EXTRA_FIRMWARE=3D""
CONFIG_FW_LOADER_USER_HELPER=3Dy
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_REGMAP=3Dy
CONFIG_REGMAP_I2C=3Dy
CONFIG_REGMAP_MMIO=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
# CONFIG_DMA_CMA is not set

#
# Bus devices
#
# CONFIG_ARM_CCI is not set
CONFIG_CONNECTOR=3Dy
CONFIG_PROC_EVENTS=3Dy
CONFIG_MTD=3Dy
# CONFIG_MTD_TESTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=3Dy
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_OF_PARTS=3Dy
# CONFIG_MTD_AR7_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_BLOCK=3Dy
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_SWAP is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=3Dy
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=3Dy
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=3Dy
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=3Dy
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=3Dy
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_OF=3Dy
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_DATAFLASH is not set
CONFIG_MTD_M25P80=3Dy
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
CONFIG_MTD_NAND_ECC=3Dy
# CONFIG_MTD_NAND_ECC_SMC is not set
CONFIG_MTD_NAND=3Dy
# CONFIG_MTD_NAND_ECC_BCH is not set
# CONFIG_MTD_SM_COMMON is not set
# CONFIG_MTD_NAND_DENALI is not set
# CONFIG_MTD_NAND_GPIO is not set
CONFIG_MTD_NAND_IDS=3Dy
# CONFIG_MTD_NAND_RICOH is not set
# CONFIG_MTD_NAND_DISKONCHIP is not set
# CONFIG_MTD_NAND_DOCG4 is not set
# CONFIG_MTD_NAND_CAFE is not set
# CONFIG_MTD_NAND_NANDSIM is not set
# CONFIG_MTD_NAND_PLATFORM is not set
CONFIG_MTD_NAND_PL353=3Dy
# CONFIG_MTD_ONENAND is not set

#
# LPDDR flash memory drivers
#
# CONFIG_MTD_LPDDR is not set
# CONFIG_MTD_UBI is not set
CONFIG_DTC=3Dy
CONFIG_OF=3Dy

#
# Device Tree and Open Firmware support
#
CONFIG_PROC_DEVICETREE=3Dy
# CONFIG_OF_SELFTEST is not set
CONFIG_OF_FLATTREE=3Dy
CONFIG_OF_EARLY_FLATTREE=3Dy
CONFIG_OF_ADDRESS=3Dy
CONFIG_OF_IRQ=3Dy
CONFIG_OF_NET=3Dy
CONFIG_OF_MDIO=3Dy
CONFIG_OF_PCI=3Dy
CONFIG_OF_PCI_IRQ=3Dy
CONFIG_OF_MTD=3Dy
# CONFIG_PARPORT is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
CONFIG_BLK_DEV=3Dy
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=3Dy
CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=3Dy
CONFIG_BLK_DEV_RAM_COUNT=3D16
CONFIG_BLK_DEV_RAM_SIZE=3D16384
# CONFIG_BLK_DEV_XIP is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_MG_DISK is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
# CONFIG_AD525X_DPOT is not set
# CONFIG_ATMEL_PWM is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_PHANTOM is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ATMEL_SSC is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1780 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_TI_DAC7512 is not set
# CONFIG_ARM_CHARLCD is not set
# CONFIG_BMP085_I2C is not set
# CONFIG_BMP085_SPI is not set
# CONFIG_PCH_PHUB is not set
# CONFIG_USB_SWITCH_FSA9480 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=3Dy
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=3Dy
CONFIG_EEPROM_AT25=3Dy
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# CONFIG_SENSORS_LIS3_SPI is not set
# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module
#
# CONFIG_ALTERA_STAPL is not set

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#
CONFIG_HAVE_IDE=3Dy
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=3Dy
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=3Dy
CONFIG_SCSI_DMA=3Dy
# CONFIG_SCSI_TGT is not set
# CONFIG_SCSI_NETLINK is not set
CONFIG_SCSI_PROC_FS=3Dy

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=3Dy
# CONFIG_CHR_DEV_ST is not set
# CONFIG_CHR_DEV_OSST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=3Dy
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_MULTI_LUN=3Dy
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
CONFIG_SCSI_LOWLEVEL=3Dy
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_SCSI_BNX2X_FCOE is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_LIBFC is not set
# CONFIG_LIBFCOE is not set
# CONFIG_FCOE is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_NSP32 is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_SRP is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
# CONFIG_SCSI_DH is not set
# CONFIG_SCSI_OSD_INITIATOR is not set
CONFIG_HAVE_PATA_PLATFORM=3Dy
# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# CONFIG_I2O is not set
CONFIG_NETDEVICES=3Dy
CONFIG_MII=3Dy
CONFIG_NET_CORE=3Dy
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set
# CONFIG_TUN is not set
# CONFIG_VETH is not set
# CONFIG_VIRTIO_NET is not set
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
# CONFIG_NET_DSA_MV88E6XXX is not set
# CONFIG_NET_DSA_MV88E6060 is not set
# CONFIG_NET_DSA_MV88E6XXX_NEED_PPU is not set
# CONFIG_NET_DSA_MV88E6131 is not set
# CONFIG_NET_DSA_MV88E6123_61_65 is not set
CONFIG_ETHERNET=3Dy
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_ARC=3Dy
# CONFIG_ARC_EMAC is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
CONFIG_NET_CADENCE=3Dy
# CONFIG_ARM_AT91_ETHER is not set
CONFIG_MACB=3Dy
CONFIG_NET_VENDOR_BROADCOM=3Dy
# CONFIG_B44 is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
CONFIG_TIGON3=3Dy
# CONFIG_BNX2X is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_CALXEDA_XGMAC is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CIRRUS is not set
# CONFIG_NET_VENDOR_CISCO is not set
# CONFIG_DM9000 is not set
# CONFIG_DNET is not set
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_EXAR is not set
# CONFIG_NET_VENDOR_FARADAY is not set
# CONFIG_NET_VENDOR_HP is not set
CONFIG_NET_VENDOR_INTEL=3Dy
# CONFIG_E100 is not set
# CONFIG_E1000 is not set
CONFIG_E1000E=3Dy
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_IXGBEVF is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
CONFIG_NET_VENDOR_I825XX=3Dy
# CONFIG_IP1000 is not set
# CONFIG_JME is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
# CONFIG_NET_VENDOR_MYRI is not set
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
# CONFIG_NET_VENDOR_OKI is not set
# CONFIG_ETHOC is not set
# CONFIG_NET_PACKET_ENGINE is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
CONFIG_NET_VENDOR_REALTEK=3Dy
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=3Dy
# CONFIG_SH_ETH is not set
# CONFIG_NET_VENDOR_RDC is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_SFC is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XILINX=3Dy
CONFIG_XILINX_EMACLITE=3Dy
CONFIG_XILINX_AXI_EMAC=3Dy
CONFIG_XILINX_PS_EMAC=3Dy
# CONFIG_XILINX_PS_EMAC_HWTSTAMP is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_PHYLIB=3Dy

#
# MII PHY device drivers
#
# CONFIG_AT803X_PHY is not set
# CONFIG_AMD_PHY is not set
CONFIG_MARVELL_PHY=3Dy
# CONFIG_DAVICOM_PHY is not set
# CONFIG_QSEMI_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_CICADA_PHY is not set
CONFIG_VITESSE_PHY=3Dy
# CONFIG_SMSC_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_REALTEK_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_FIXED_PHY is not set
CONFIG_MDIO_BITBANG=3Dy
# CONFIG_MDIO_GPIO is not set
# CONFIG_MDIO_BUS_MUX_GPIO is not set
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# USB Network Adapters
#
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
CONFIG_WLAN=3Dy
# CONFIG_ATMEL is not set
# CONFIG_PRISM54 is not set
# CONFIG_USB_ZD1201 is not set
# CONFIG_HOSTAP is not set
# CONFIG_WL_TI is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_VMXNET3 is not set
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=3Dy
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set
CONFIG_INPUT_SPARSEKMAP=3Dy
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=3Dy
CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=3Dy
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=3Dy
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=3Dy
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=3Dy
CONFIG_MOUSE_PS2=3Dy
CONFIG_MOUSE_PS2_ALPS=3Dy
CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
CONFIG_MOUSE_PS2_CYPRESS=3Dy
CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=3Dy
CONFIG_SERIO_SERPORT=3Dy
# CONFIG_SERIO_AMBAKMI is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=3Dy
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_TTY=3Dy
CONFIG_VT=3Dy
CONFIG_CONSOLE_TRANSLATIONS=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_VT_CONSOLE_SLEEP=3Dy
CONFIG_HW_CONSOLE=3Dy
CONFIG_VT_HW_CONSOLE_BINDING=3Dy
CONFIG_UNIX98_PTYS=3Dy
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_AMBA_PL011 is not set
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_MFD_HSU is not set
# CONFIG_SERIAL_UARTLITE is not set
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_CORE=3Dy
CONFIG_SERIAL_CORE_CONSOLE=3Dy
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
# CONFIG_SERIAL_PCH_UART is not set
CONFIG_SERIAL_XILINX_PS_UART=3Dy
CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_ST_ASC is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_HVC_DCC is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
CONFIG_XILINX_DEVCFG=3Dy
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_TCG_TPM is not set
CONFIG_DEVPORT=3Dy
CONFIG_I2C=3Dy
CONFIG_I2C_BOARDINFO=3Dy
CONFIG_I2C_COMPAT=3Dy
CONFIG_I2C_CHARDEV=3Dy
CONFIG_I2C_MUX=3Dy

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=3Dy
CONFIG_I2C_HELPER_AUTO=3Dy

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CADENCE=3Dy
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_NOMADIK is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA_PCI is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_STUB is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
CONFIG_SPI=3Dy
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=3Dy

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
CONFIG_SPI_BITBANG=3Dy
CONFIG_SPI_CADENCE=3Dy
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_FSL_SPI is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PL022 is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_PXA2XX_PCI is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_TOPCLIFF_PCH is not set
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=3Dy
CONFIG_SPI_ZYNQ_QSPI=3Dy
# CONFIG_SPI_ZYNQ_QSPI_DUAL_STACKED is not set
# CONFIG_SPI_DESIGNWARE is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_HSI is not set

#
# PPS support
#
CONFIG_PPS=3Dy
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=3Dy

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks=
=2E
#
CONFIG_ARCH_REQUIRE_GPIOLIB=3Dy
CONFIG_GPIOLIB=3Dy
CONFIG_GPIO_DEVRES=3Dy
CONFIG_OF_GPIO=3Dy
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=3Dy

#
# Memory mapped GPIO drivers:
#
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_EM is not set
# CONFIG_GPIO_PL061 is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_TS5500 is not set
CONFIG_GPIO_XILINX=3Dy
CONFIG_GPIO_ZYNQ=3Dy
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_GRGPIO is not set

#
# I2C GPIO expanders:
#
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_SX150X is not set
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_ADNP is not set

#
# PCI GPIO expanders:
#
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_RDC321X is not set

#
# SPI GPIO expanders:
#
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MCP23S08 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_74X164 is not set

#
# AC97 GPIO expanders:
#

#
# LPC GPIO expanders:
#

#
# MODULbus GPIO expanders:
#
# CONFIG_GPIO_BCM_KONA is not set

#
# USB GPIO expanders:
#
# CONFIG_W1 is not set
CONFIG_POWER_SUPPLY=3Dy
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_BATTERY_BQ27x00 is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_ISP1704 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_POWER_RESET=3Dy
# CONFIG_POWER_RESET_GPIO is not set
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_VEXPRESS=3Dy
# CONFIG_POWER_AVS is not set
CONFIG_HWMON=3Dy
# CONFIG_HWMON_VID is not set
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_AD7314 is not set
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADCXX is not set
# CONFIG_SENSORS_ADM1021 is not set
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM9240 is not set
# CONFIG_SENSORS_ADT7310 is not set
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_G760A is not set
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_GL518SM is not set
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_GPIO_FAN is not set
# CONFIG_SENSORS_HIH6130 is not set
# CONFIG_SENSORS_HTU21 is not set
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM70 is not set
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4245 is not set
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX16065 is not set
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=3Dy
CONFIG_SENSORS_PMBUS=3Dy
# CONFIG_SENSORS_ADM1275 is not set
# CONFIG_SENSORS_LM25066 is not set
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_MAX16064 is not set
# CONFIG_SENSORS_MAX34440 is not set
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_UCD9000=3Dy
CONFIG_SENSORS_UCD9200=3Dy
# CONFIG_SENSORS_ZL6100 is not set
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_DME1737 is not set
# CONFIG_SENSORS_EMC1403 is not set
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC6W201 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH56XX_COMMON is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_ADS1015 is not set
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_ADS7871 is not set
# CONFIG_SENSORS_AMC6821 is not set
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_THMC50 is not set
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_VEXPRESS is not set
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
# CONFIG_SENSORS_W83795 is not set
# CONFIG_SENSORS_W83L785TS is not set
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set
CONFIG_THERMAL=3Dy
CONFIG_THERMAL_HWMON=3Dy
CONFIG_THERMAL_OF=3Dy
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=3Dy
# CONFIG_THERMAL_GOV_USER_SPACE is not set
CONFIG_CPU_THERMAL=3Dy
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_IMX_THERMAL is not set

#
# Texas Instruments thermal drivers
#
CONFIG_WATCHDOG=3Dy
CONFIG_WATCHDOG_CORE=3Dy
# CONFIG_WATCHDOG_NOWAYOUT is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_GPIO_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=3Dy
# CONFIG_ARM_SP805_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=3Dy
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_I6300ESB_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=3Dy

#
# Sonics Silicon Backplane
#
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=3Dy

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_CORE is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_CROS_EC is not set
# CONFIG_MFD_ASIC3 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_HTC_EGPIO is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RTSX_PCI is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=3Dy
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TIMBERDALE is not set
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_TMIO is not set
# CONFIG_MFD_T7L66XB is not set
# CONFIG_MFD_TC6387XB is not set
# CONFIG_MFD_TC6393XB is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
CONFIG_VEXPRESS_CONFIG=3Dy
CONFIG_REGULATOR=3Dy
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_ACT8865 is not set
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ANATOP is not set
# CONFIG_REGULATOR_DA9210 is not set
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_ISL6271A is not set
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
# CONFIG_REGULATOR_LP8755 is not set
# CONFIG_REGULATOR_MAX1586 is not set
# CONFIG_REGULATOR_MAX8649 is not set
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8973 is not set
# CONFIG_REGULATOR_PFUZE100 is not set
# CONFIG_REGULATOR_TPS51632 is not set
# CONFIG_REGULATOR_TPS62360 is not set
# CONFIG_REGULATOR_TPS65023 is not set
# CONFIG_REGULATOR_TPS6507X is not set
# CONFIG_REGULATOR_TPS6524X is not set
# CONFIG_REGULATOR_VEXPRESS is not set
CONFIG_MEDIA_SUPPORT=3Dy

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_RC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=3Dy
CONFIG_VIDEO_DEV=3Dy
CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
CONFIG_VIDEO_V4L2=3Dy
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEOBUF2_CORE=3Dy
CONFIG_VIDEOBUF2_MEMOPS=3Dy
CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
# CONFIG_TTPCI_EEPROM is not set

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_V4L_PLATFORM_DRIVERS=3Dy
# CONFIG_VIDEO_CAFE_CCIC is not set
# CONFIG_VIDEO_TIMBERDALE is not set
# CONFIG_SOC_CAMERA is not set
CONFIG_VIDEO_XILINX=3Dy
CONFIG_VIDEO_XILINX_CFA=3Dy
CONFIG_VIDEO_XILINX_CRESAMPLE=3Dy
CONFIG_VIDEO_XILINX_REMAPPER=3Dy
CONFIG_VIDEO_XILINX_RGB2YUV=3Dy
CONFIG_VIDEO_XILINX_SCALER=3Dy
CONFIG_VIDEO_XILINX_SWITCH=3Dy
CONFIG_VIDEO_XILINX_TPG=3Dy
CONFIG_VIDEO_XILINX_VTC=3Dy
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
# CONFIG_CYPRESS_FIRMWARE is not set

#
# Media ancillary drivers (tuners, sensors, i2c, frontends)
#
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
# CONFIG_VIDEO_MSP3400 is not set
# CONFIG_VIDEO_CS5345 is not set
# CONFIG_VIDEO_CS53L32A is not set
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
# CONFIG_VIDEO_WM8775 is not set
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
# CONFIG_VIDEO_ADV7183 is not set
CONFIG_VIDEO_ADV7604=3Dy
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
# CONFIG_VIDEO_SAA7191 is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
# CONFIG_VIDEO_CX25840 is not set

#
# Video encoders
#
# CONFIG_VIDEO_SAA7127 is not set
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_ADV7511=3Dy
# CONFIG_VIDEO_AD9389B is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M032 is not set
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_M5MOLS is not set
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_S5K4ECGX is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_SMIAPP is not set
# CONFIG_VIDEO_S5C73M3 is not set

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_AS3645A is not set
# CONFIG_VIDEO_LM3560 is not set

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
# CONFIG_VIDEO_UPD64083 is not set

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set

#
# Sensors used on soc_camera driver
#

#
# Customise DVB Frontends
#
CONFIG_DVB_AU8522=3Dm
CONFIG_DVB_AU8522_V4L=3Dm
# CONFIG_DVB_TUNER_DIB0070 is not set
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set

#
# Graphics support
#
CONFIG_VGA_ARB=3Dy
CONFIG_VGA_ARB_MAX_GPUS=3D16
# CONFIG_DRM is not set
# CONFIG_VGASTATE is not set
# CONFIG_VIDEO_OUTPUT_CONTROL is not set
CONFIG_FB=3Dy
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_FB_DDC is not set
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
# CONFIG_FB_CFB_FILLRECT is not set
# CONFIG_FB_CFB_COPYAREA is not set
# CONFIG_FB_CFB_IMAGEBLIT is not set
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
# CONFIG_FB_SYS_FILLRECT is not set
# CONFIG_FB_SYS_COPYAREA is not set
# CONFIG_FB_SYS_IMAGEBLIT is not set
# CONFIG_FB_FOREIGN_ENDIAN is not set
# CONFIG_FB_SYS_FOPS is not set
# CONFIG_FB_SVGALIB is not set
# CONFIG_FB_MACMODES is not set
# CONFIG_FB_BACKLIGHT is not set
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_ARMCLCD is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_UVESA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_XILINX is not set
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_AUO_K190X is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_EXYNOS_VIDEO is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=3Dy
CONFIG_FRAMEBUFFER_CONSOLE=3Dy
# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_LOGO is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=3Dy
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=3Dy

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_HUION is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LENOVO_TPKBD is not set
# CONFIG_HID_LOGITECH is not set
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MICROSOFT=3Dy
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set

#
# USB HID support
#
CONFIG_USB_HID=3Dy
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
CONFIG_USB_SUPPORT=3Dy
CONFIG_USB_COMMON=3Dy
CONFIG_USB_ARCH_HAS_HCD=3Dy
CONFIG_USB=3Dy
# CONFIG_USB_DEBUG is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=3Dy
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG=3Dy
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
# CONFIG_USB_MON is not set
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=3Dy
CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
CONFIG_USB_EHCI_PCI=3Dy
CONFIG_USB_ZYNQ_DR_OF=3Dy
CONFIG_USB_EHCI_ZYNQ=3Dy
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_ISP1760_HCD is not set
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FUSBH200_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
# CONFIG_USB_UHCI_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set
# CONFIG_USB_RENESAS_USBHS is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=3Dy
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_RIO500 is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_LED is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HSIC_USB3503 is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=3Dy
# CONFIG_USB_OTG_FSM is not set
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_AM335X_PHY_USB is not set
# CONFIG_SAMSUNG_USB2PHY is not set
# CONFIG_SAMSUNG_USB3PHY is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# CONFIG_USB_RCAR_PHY is not set
CONFIG_USB_ULPI=3Dy
CONFIG_USB_ULPI_VIEWPORT=3Dy
# CONFIG_USB_ZYNQ_PHY is not set
CONFIG_USB_GADGET=3Dy
# CONFIG_USB_GADGET_DEBUG is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=3D2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2

#
# USB Peripheral Controller
#
CONFIG_USB_ZYNQ=3Dy
CONFIG_USB_ZYNQ_ERRATA_DT654401=3Dy
# CONFIG_USB_FUSB300 is not set
# CONFIG_USB_FOTG210_UDC is not set
# CONFIG_USB_GR_UDC is not set
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_GADGET_XILINX=3Dy
# CONFIG_USB_PXA27X is not set
# CONFIG_USB_S3C_HSOTG is not set
# CONFIG_USB_MV_UDC is not set
# CONFIG_USB_MV_U3D is not set
# CONFIG_USB_M66592 is not set
# CONFIG_USB_AMD5536UDC is not set
# CONFIG_USB_NET2272 is not set
# CONFIG_USB_NET2280 is not set
# CONFIG_USB_GOKU is not set
# CONFIG_USB_EG20T is not set
# CONFIG_USB_DUMMY_HCD is not set
CONFIG_USB_LIBCOMPOSITE=3Dm
CONFIG_USB_F_SS_LB=3Dm
# CONFIG_USB_CONFIGFS is not set
CONFIG_USB_ZERO=3Dm
# CONFIG_USB_ZERO_HNPTEST is not set
# CONFIG_USB_ETH is not set
# CONFIG_USB_G_NCM is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
# CONFIG_USB_MASS_STORAGE is not set
# CONFIG_USB_G_SERIAL is not set
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
# CONFIG_USB_G_ACM_MS is not set
# CONFIG_USB_G_MULTI is not set
# CONFIG_USB_G_HID is not set
# CONFIG_USB_G_DBGP is not set
# CONFIG_USB_G_WEBCAM is not set
# CONFIG_UWB is not set
CONFIG_MMC=3Dy
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_UNSAFE_RESUME is not set
# CONFIG_MMC_CLKGATE is not set

#
# MMC/SD/SDIO Card Drivers
#
CONFIG_MMC_BLOCK=3Dy
CONFIG_MMC_BLOCK_MINORS=3D8
CONFIG_MMC_BLOCK_BOUNCE=3Dy
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_ARMMMCI is not set
CONFIG_MMC_SDHCI=3Dy
# CONFIG_MMC_SDHCI_PCI is not set
CONFIG_MMC_SDHCI_PLTFM=3Dy
CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
# CONFIG_MMC_SDHCI_PXAV3 is not set
# CONFIG_MMC_SDHCI_PXAV2 is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_DW is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC=3Dy
CONFIG_EDAC_LEGACY_SYSFS=3Dy
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_MM_EDAC=3Dy
# CONFIG_EDAC_PL310_L2 is not set
CONFIG_EDAC_ZYNQ=3Dy
CONFIG_RTC_LIB=3Dy
CONFIG_RTC_CLASS=3Dy
CONFIG_RTC_HCTOSYS=3Dy
CONFIG_RTC_SYSTOHC=3Dy
CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
# CONFIG_RTC_DEBUG is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=3Dy
CONFIG_RTC_INTF_PROC=3Dy
CONFIG_RTC_INTF_DEV=3Dy
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_DS1307 is not set
# CONFIG_RTC_DRV_DS1374 is not set
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_HYM8563 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_RS5C372 is not set
# CONFIG_RTC_DRV_ISL1208 is not set
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_ISL12057 is not set
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
CONFIG_RTC_DRV_PCF8563=3Dy
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
# CONFIG_RTC_DRV_BQ32K is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_R9701 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_DS3234 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_RX4581 is not set

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_DS2404 is not set

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_PL030 is not set
# CONFIG_RTC_DRV_PL031 is not set
# CONFIG_RTC_DRV_SNVS is not set
# CONFIG_RTC_DRV_MOXART is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
CONFIG_DMADEVICES=3Dy
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_XILINX_DMA_ENGINES=3Dy
CONFIG_XILINX_AXIDMA=3Dy
# CONFIG_XILINX_DMATEST is not set
CONFIG_XILINX_AXIVDMA=3Dy
# CONFIG_XILINX_VDMATEST is not set
CONFIG_XILINX_AXICDMA=3Dy
# CONFIG_XILINX_CDMATEST is not set
# CONFIG_AMBA_PL08X is not set
# CONFIG_DW_DMAC_CORE is not set
# CONFIG_DW_DMAC is not set
# CONFIG_DW_DMAC_PCI is not set
# CONFIG_TIMB_DMA is not set
CONFIG_PL330_DMA=3Dy
CONFIG_DMA_ENGINE=3Dy
CONFIG_DMA_OF=3Dy

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
# CONFIG_DMATEST is not set
# CONFIG_AUXDISPLAY is not set
CONFIG_UIO=3Dy
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=3Dy
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_XILINX_APM=3Dy
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=3Dm

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_STAGING is not set
CONFIG_CLKDEV_LOOKUP=3Dy
CONFIG_HAVE_CLK_PREPARE=3Dy
CONFIG_COMMON_CLK=3Dy

#
# Common Clock Framework
#
CONFIG_COMMON_CLK_VERSATILE=3Dy
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI570=3Dy
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_COMMON_CLK_QCOM is not set

#
# Hardware Spinlock drivers
#
CONFIG_CLKSRC_OF=3Dy
CONFIG_CLKSRC_MMIO=3Dy
CONFIG_CADENCE_TTC_TIMER=3Dy
CONFIG_ARM_GLOBAL_TIMER=3Dy
CONFIG_CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK=3Dy
# CONFIG_MAILBOX is not set
CONFIG_IOMMU_SUPPORT=3Dy
CONFIG_OF_IOMMU=3Dy

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=3Dm
# CONFIG_STE_MODEM_RPROC is not set
CONFIG_ZYNQ_REMOTEPROC=3Dm
CONFIG_MB_REMOTEPROC=3Dm

#
# Rpmsg drivers
#
CONFIG_RPMSG=3Dm
# CONFIG_RPMSG_SERVER_SAMPLE is not set
# CONFIG_RPMSG_OMX is not set
# CONFIG_RPMSG_FREERTOS_STAT is not set
# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
CONFIG_MEMORY=3Dy
CONFIG_PL353_SMC=3Dy
# CONFIG_IIO is not set
# CONFIG_VME_BUS is not set
# CONFIG_PWM is not set
CONFIG_IRQCHIP=3Dy
CONFIG_ARM_GIC=3Dy
# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_POWERCAP is not set

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=3Dy
CONFIG_EXT2_FS=3Dy
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT2_FS_XIP is not set
CONFIG_EXT3_FS=3Dy
# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
CONFIG_EXT3_FS_XATTR=3Dy
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=3Dy
# CONFIG_EXT4_FS_POSIX_ACL is not set
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD=3Dy
# CONFIG_JBD_DEBUG is not set
CONFIG_JBD2=3Dy
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=3Dy
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_FS_POSIX_ACL is not set
CONFIG_EXPORTFS=3Dy
CONFIG_FILE_LOCKING=3Dy
CONFIG_FSNOTIFY=3Dy
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=3Dy
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=3Dy
CONFIG_MSDOS_FS=3Dy
CONFIG_VFAT_FS=3Dy
CONFIG_FAT_DEFAULT_CODEPAGE=3D437
CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
CONFIG_PROC_SYSCTL=3Dy
CONFIG_PROC_PAGE_MONITOR=3Dy
CONFIG_SYSFS=3Dy
CONFIG_TMPFS=3Dy
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_CONFIGFS_FS=3Dm
CONFIG_MISC_FILESYSTEMS=3Dy
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D0
CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
CONFIG_JFFS2_SUMMARY=3Dy
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=3Dy
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=3Dy
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_LOGFS is not set
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=3Dy
CONFIG_NFS_FS=3Dy
CONFIG_NFS_V2=3Dy
CONFIG_NFS_V3=3Dy
# CONFIG_NFS_V3_ACL is not set
# CONFIG_NFS_V4 is not set
# CONFIG_NFS_SWAP is not set
CONFIG_ROOT_NFS=3Dy
# CONFIG_NFSD is not set
CONFIG_LOCKD=3Dy
CONFIG_LOCKD_V4=3Dy
CONFIG_NFS_COMMON=3Dy
CONFIG_SUNRPC=3Dy
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
# CONFIG_CIFS is not set
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"iso8859-1"
CONFIG_NLS_CODEPAGE_437=3Dy
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=3Dy
CONFIG_NLS_ISO8859_1=3Dy
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=3Dy
CONFIG_DEFAULT_MESSAGE_LOGLEVEL=3D4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=3Dy

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
CONFIG_ENABLE_WARN_DEPRECATED=3Dy
CONFIG_ENABLE_MUST_CHECK=3Dy
CONFIG_FRAME_WARN=3D1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
CONFIG_DEBUG_FS=3Dy
# CONFIG_HEADERS_CHECK is not set
# CONFIG_DEBUG_SECTION_MISMATCH is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_KERNEL=3Dy

#
# Memory Debugging
#
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_DEBUG_SLAB is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
# CONFIG_DEBUG_HIGHMEM is not set
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=3Dy
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
CONFIG_DETECT_HUNG_TASK=3Dy
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=3D0
CONFIG_PANIC_TIMEOUT=3D0
# CONFIG_SCHED_DEBUG is not set
# CONFIG_SCHEDSTATS is not set
CONFIG_TIMER_STATS=3Dy
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=3Dy
CONFIG_DEBUG_PI_LIST=3Dy
# CONFIG_RT_MUTEX_TESTER is not set
CONFIG_DEBUG_SPINLOCK=3Dy
CONFIG_DEBUG_MUTEXES=3Dy
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
CONFIG_DEBUG_LOCK_ALLOC=3Dy
CONFIG_PROVE_LOCKING=3Dy
CONFIG_LOCKDEP=3Dy
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_TRACE_IRQFLAGS=3Dy
CONFIG_STACKTRACE=3Dy
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=3Dy
# CONFIG_DEBUG_WRITECOUNT is not set
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=3Dy
# CONFIG_PROVE_RCU_REPEATEDLY is not set
# CONFIG_PROVE_RCU_DELAY is not set
# CONFIG_SPARSE_RCU_POINTER is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
# CONFIG_RCU_CPU_STALL_VERBOSE is not set
# CONFIG_RCU_CPU_STALL_INFO is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_HAVE_FUNCTION_TRACER=3Dy
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
CONFIG_HAVE_C_RECORDMCOUNT=3Dy
CONFIG_TRACING_SUPPORT=3Dy
# CONFIG_FTRACE is not set

#
# Runtime Testing
#
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_DMA_API_DEBUG=3Dy
# CONFIG_TEST_MODULE is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=3Dy
# CONFIG_KGDB is not set
# CONFIG_ARM_PTDUMP is not set
# CONFIG_STRICT_DEVMEM is not set
CONFIG_ARM_UNWIND=3Dy
# CONFIG_DEBUG_USER is not set
CONFIG_DEBUG_LL=3Dy
# CONFIG_DEBUG_ZYNQ_UART0 is not set
CONFIG_DEBUG_ZYNQ_UART1=3Dy
# CONFIG_DEBUG_VEXPRESS_UART0_DETECT is not set
# CONFIG_DEBUG_VEXPRESS_UART0_CA9 is not set
# CONFIG_DEBUG_VEXPRESS_UART0_RS1 is not set
# CONFIG_DEBUG_ICEDCC is not set
# CONFIG_DEBUG_SEMIHOSTING is not set
# CONFIG_DEBUG_LL_UART_8250 is not set
# CONFIG_DEBUG_LL_UART_PL01X is not set
CONFIG_DEBUG_LL_INCLUDE=3D"debug/zynq.S"
# CONFIG_DEBUG_UART_PL01X is not set
# CONFIG_DEBUG_UART_8250 is not set
CONFIG_DEBUG_UNCOMPRESS=3Dy
CONFIG_UNCOMPRESS_INCLUDE=3D"debug/uncompress.h"
CONFIG_EARLY_PRINTK=3Dy
# CONFIG_OC_ETM is not set
# CONFIG_PID_IN_CONTEXTIDR is not set
# CONFIG_DEBUG_SET_MODULE_RONX is not set

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=3Dy
CONFIG_DEFAULT_SECURITY=3D""
CONFIG_CRYPTO=3Dy

#
# Crypto core or helper
#
# CONFIG_CRYPTO_FIPS is not set
CONFIG_CRYPTO_ALGAPI=3Dy
CONFIG_CRYPTO_ALGAPI2=3Dy
CONFIG_CRYPTO_HASH=3Dy
CONFIG_CRYPTO_HASH2=3Dy
CONFIG_CRYPTO_RNG=3Dm
CONFIG_CRYPTO_RNG2=3Dm
# CONFIG_CRYPTO_MANAGER is not set
# CONFIG_CRYPTO_MANAGER2 is not set
# CONFIG_CRYPTO_USER is not set
# CONFIG_CRYPTO_GF128MUL is not set
# CONFIG_CRYPTO_NULL is not set
# CONFIG_CRYPTO_PCRYPT is not set
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_AUTHENC is not set
# CONFIG_CRYPTO_TEST is not set

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_SEQIV is not set

#
# Block modes
#
# CONFIG_CRYPTO_CBC is not set
# CONFIG_CRYPTO_CTR is not set
# CONFIG_CRYPTO_CTS is not set
# CONFIG_CRYPTO_ECB is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
# CONFIG_CRYPTO_HMAC is not set
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=3Dy
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_CRCT10DIF is not set
# CONFIG_CRYPTO_GHASH is not set
# CONFIG_CRYPTO_MD4 is not set
# CONFIG_CRYPTO_MD5 is not set
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
# CONFIG_CRYPTO_SHA1 is not set
# CONFIG_CRYPTO_SHA1_ARM is not set
# CONFIG_CRYPTO_SHA256 is not set
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=3Dy
# CONFIG_CRYPTO_AES_ARM is not set
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_ZLIB is not set
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=3Dm
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_HW=3Dy
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
CONFIG_BITREVERSE=3Dy
CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
CONFIG_GENERIC_STRNLEN_USER=3Dy
CONFIG_GENERIC_NET_UTILS=3Dy
CONFIG_GENERIC_PCI_IOMAP=3Dy
CONFIG_GENERIC_IO=3Dy
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=3Dy
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=3Dy
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=3Dy
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=3Dy
CONFIG_ZLIB_DEFLATE=3Dy
CONFIG_LZO_COMPRESS=3Dy
CONFIG_LZO_DECOMPRESS=3Dy
# CONFIG_XZ_DEC is not set
# CONFIG_XZ_DEC_BCJ is not set
CONFIG_DECOMPRESS_GZIP=3Dy
CONFIG_GENERIC_ALLOCATOR=3Dy
CONFIG_HAS_IOMEM=3Dy
CONFIG_HAS_DMA=3Dy
CONFIG_CPU_RMAP=3Dy
CONFIG_DQL=3Dy
CONFIG_NLATTR=3Dy
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
# CONFIG_AVERAGE is not set
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set
CONFIG_FONT_SUPPORT=3Dy
CONFIG_FONTS=3Dy
CONFIG_FONT_8x8=3Dy
CONFIG_FONT_8x16=3Dy
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_FONT_10x18 is not set
CONFIG_VIRTUALIZATION=3Dy

--------------060503070405040205050007--

--W7pHiUXTmH0HqW42ugD0PuaXwm6ECcLct
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNeelkACgkQykllyylKDCEilwCgjqJeK6injgm3/sZhpI+9ONtg
+/AAnjamV4FRVwy6QQElLNq+EZ0BgQTz
=BhZa
-----END PGP SIGNATURE-----

--W7pHiUXTmH0HqW42ugD0PuaXwm6ECcLct--
