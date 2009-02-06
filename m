Received: from mail-ew0-f20.google.com ([209.85.219.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVMpi-0001mK-4R
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 09:17:10 +0000
Received: by ewy13 with SMTP id 13so1208986ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Feb 2009 01:17:08 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Feb 2009 10:17:08 +0100
Message-ID: <87c084000902060117u5f4b4b5eg2a98a6889c61e868@mail.gmail.com>
Subject: JFFS2 error: on mounting
From: saravanan chanemouganandam <chanemouganandam@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/alternative; boundary=0015174c198235009904623c7c30
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0015174c198235009904623c7c30
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I am a newbie to JFFS2 flash file system. On my Intel IXP425 wireless board,
I am have severe issue with JFFS2. The onboard 8MB flash has
the following partitions and flashed with OpenWRT linux kernels and  jffs2
rootfs and Config data images.

root@OpenWRT:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00060000 00020000 "RedBoot"
mtd1: 00140000 00020000 "kernel1"
mtd2: 00500000 00020000 "rootfs1"
mtd3: 00140000 00020000 "kernel2"
mtd4: 00500000 00020000 "rootfs2"
mtd5: 00100000 00020000 "Config"
mtd6: 00020000 00020000 "RedBoot config"
mtd7: 00020000 00020000 "FIS directory"

root@OpenWRT:~# mount
rootfs on / type rootfs (rw)
/dev/root on / type jffs2 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev)
tmpfs on /dev type tmpfs (rw)
devpts on /dev/pts type devpts (rw,mode=600)
/dev/mtdblock5 on /mnt/rw type jffs2 (rw)
When the board is up and running for the first time, on updating the Config
(mtd5) parition  from GUI web, and on next reboot the system gets
failed to mount the Config jffs2 (mtd5) partition and throws the following
error
......
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
Searching for RedBoot partition table in IXP4XX-Flash.0 at offset 0xfe0000
8 RedBoot partitions found on MTD device IXP4XX-Flash.0
Creating 8 MTD partitions on "IXP4XX-Flash.0":
0x00000000-0x00060000 : "RedBoot"
0x00060000-0x001a0000 : "kernel1"
0x001a0000-0x006a0000 : "rootfs1"
0x006a0000-0x007e0000 : "kernel2"
0x007e0000-0x00ce0000 : "rootfs2"
*0x00ce0000-0x00de0000 : "config"*
0x00fc0000-0x00fe0000 : "RedBoot config"
0x00fe0000-0x01000000 : "FIS directory"
i2c /dev entries driver
i2c-gpio i2c-gpio.0: using pins 9 (SDA) and 10 (SCL)
IXP4xx Watchdog Timer: heartbeat 60 sec
Registered led device: pronghorn:green:status
nf_conntrack version 0.5.0 (1024 buckets, 4096 max)
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP westwood registered
NET: Registered protocol family 17
Bridge firewalling registered
802.1Q VLAN Support v1.8 Ben Greear <greearb@candelatech.com>
All bugs added by David S. Miller <davem@redhat.com>
XScale DSP coprocessor detected.
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing init memory: 100K
Please be patient, while OpenWrt loads ...
*JFFS2 error: (1863) jffs2_link_node_ref: Adding new ref c3d992f0 at
(0x00000000-0x00000030) not immediately after previo
us (0x00000000-0x00000000)
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3cf8000
*[00000000] *pgd=03e13031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.26.2 #17)
pc : [<c00c0d54>]    lr : [<c020630c>]    psr: 60000013
sp : c3df5be4  ip : c020630c  fp : c3df5c14
r10: c3df7800  r9 : 00000006  r8 : c3cfd0a8
r7 : 00000030  r6 : c3df7200  r5 : c3d992f0  r4 : c3df7800
r3 : 00000000  r2 : a0000013  r1 : 00000001  r0 : 00000096
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 000039ff  Table: 03cf8000  DAC: 00000015
Process mount (pid: 1863, stack limit = 0xc3df4260)
Stack: (0xc3df5be4 to 0xc3df6000)
5be0:          00000000 00000030 00000000 00000000 00000030 c3df7800
00000000
5c00: c3df7200 c3df7200 c3df5c38 c3df5c18 c00cd5c8 c00c0c60 c3cfd0a8
00000000
5c20: c3e18020 00000000 c3d7be00 c3df5c90 c3df5c3c c00cda1c c00cd574
c3cfd0a8
5c40: c3d7be15 c3e18038 c3e18000 00020000 00005024 00000000 c3cfd0a8
19852006
5c60: 00005024 c3df5c90 00000008 c3df7200 00005024 c3e18000 c3df7800
c3d92ff8
5c80: 00000000 c3df5d14 c3df5c94 c00c5e38 c00cd6c8 c0220ae4 000000d2
ffffffff
5ca0: 000000ef 00000000 00000000 00000000 00001000 c3d7bd40 00000000
c006e188
5cc0: c3d92000 000000d2 00000000 00000000 c3df7200 c3df72dc c3df72c4
c3df5cfc
5ce0: c3df5cec c006e3b0 c3d92000 c3df72b4 c3df72bc c3df72dc c3df72c4
c3df72cc
5d00: c3df7200 00000000 c3df5d4c c3df5d18 c00c8b4c c00c5b48 c3df5d4c
c3df5d28
5d20: 00000000 00020000 00100000 c3df7200 c3df7400 c3c59d00 c00caf10
c3c19a00
5d40: c3df5d6c c3df5d50 c00caa10 c00c89c8 c3df7200 c3df7400 00000001
c3e14000
5d60: c3df5d8c c3df5d70 c00cafac c00ca8e4 c3df7400 c3df7400 00008000
c3e14000
5d80: c3df5db4 c3df5d90 c01125cc c00caf1c c3d02000 c3e14000 c020a2d8
00008000
5da0: c020a2d8 c3e14000 c3df5de0 c3df5db8 c0112690 c0112578 c3c19a00
c00caf10
5dc0: c3c59d00 01f00005 c3d02000 c3df5df0 00008000 c3df5e6c c3df5de4
c011280c
5de0: c011263c 00000005 c00caf10 c3c59d00 c3c59d80 c38c245c c3df5e50
c3df5e08
5e00: c00e1810 00000001 00000001 00000000 00000000 c021ca58 000000d0
c3c59d00
5e20: 00008000 c3df5e48 00008000 c3df5e60 c3df5e3c c00738b4 c0073634
c3d74000
5e40: 0000000f c3c59d00 c3d02000 c020a2d8 00008000 c3e14000 c3d74000
c3e14000
5e60: c3df5e84 c3df5e70 c00cadd8 c01126ac c00caf10 c3c59d00 c3df5eac
c3df5e88
5e80: c0077dcc c00cadc0 c3c59d00 00008000 c3d02000 c3e14000 c3d74000
c020a2d8
5ea0: c3df5ed0 c3df5eb0 c0077e6c c0077d80 00008000 c3d74000 c3df5efc
00000000
5ec0: c3d02000 c3df5ef0 c3df5ed4 c008dbc0 c0077e3c 00008000 00000000
c3df5efc
5ee0: c3d91000 c3df5f74 c3df5ef4 c008dd60 c008db70 c3d02000 c3e14000
c3d66180
5f00: c38fc7c0 c0021620 c0021194 c3e14fe8 00000001 00000001 00000000
00001000
5f20: 0006a018 00000018 c3e14000 c3df5f84 c3df4000 00000000 c3df5f74
00000000
5f40: c3df5f54 00000000 c01bb46c 00000000 c3d91000 beabff9f 00008000
c0021be4
5f60: c3df4000 00000000 c3df5fa4 c3df5f78 c008de14 c008dbfc c3e14000
c3d02000
5f80: c3d74000 c3e14000 0006a018 beabfdd0 4009b608 00000015 00000000
c3df5fa8
5fa0: c0021a40 c008dd94 0006a018 beabfdd0 beabff9f beabffae beabff99
00008000
5fc0: 0006a018 beabfdd0 4009b608 0006a018 00000042 beabfee0 00000000
00000000
5fe0: 40051ed4 beabfa50 0002c15c 40051ee0 20000010 beabff9f 00000000
00000000
Backtrace:
Function entered at [<c00c0c54>] from [<c00cd5c8>]
 r8:c3df7200 r7:c3df7200 r6:00000000 r5:c3df7800 r4:00000030
Function entered at [<c00cd568>] from [<c00cda1c>]
 r7:c3d7be00 r6:00000000 r5:c3e18020 r4:00000000
Function entered at [<c00cd6bc>] from [<c00c5e38>]
Function entered at [<c00c5b3c>] from [<c00c8b4c>]
Function entered at [<c00c89bc>] from [<c00caa10>]
Function entered at [<c00ca8d8>] from [<c00cafac>]
 r7:c3e14000 r6:00000001 r5:c3df7400 r4:c3df7200
Function entered at [<c00caf10>] from [<c01125cc>]
 r7:c3e14000 r6:00008000 r5:c3df7400 r4:c3df7400
Function entered at [<c011256c>] from [<c0112690>]
Function entered at [<c0112630>] from [<c011280c>]
 r7:00008000 r6:c3df5df0 r5:c3d02000 r4:01f00005
Function entered at [<c01126a0>] from [<c00cadd8>]
Function entered at [<c00cadb4>] from [<c0077dcc>]
Function entered at [<c0077d74>] from [<c0077e6c>]
 r8:c020a2d8 r7:c3d74000 r6:c3e14000 r5:c3d02000 r4:00008000
Function entered at [<c0077e30>] from [<c008dbc0>]
 r8:c3d02000 r7:00000000 r6:c3df5efc r5:c3d74000 r4:00008000
Function entered at [<c008db64>] from [<c008dd60>]
 r7:c3d91000 r6:c3df5efc r5:00000000 r4:00008000
Function entered at [<c008dbf0>] from [<c008de14>]
Function entered at [<c008dd88>] from [<c0021a40>]
 r7:00000015 r6:4009b608 r5:beabfdd0 r4:0006a018
Code: e59f00bc e59f20bc ebfdc884 e3a03000 (e5833000)
---[ end trace eefb6b43ebe2bec4 ]---
- init -
Can anyboy tell me how the changes to the jffs2 Config (mtd5) parition
affects the bootup ?

--0015174c198235009904623c7c30
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I am a newbie to JFFS2 flash file system. On my Intel IXP425 wireless =
board, I am have severe issue with JFFS2. The onboard 8MB flash has</div>
<div>the following partitions and flashed with OpenWRT linux kernels and &n=
bsp;jffs2 rootfs and Config data images.</div>
<div>&nbsp;</div>
<div><a href=3D"mailto:root@OpenWRT">root@OpenWRT</a>:~# cat /proc/mtd<br>d=
ev:&nbsp;&nbsp;&nbsp; size&nbsp;&nbsp; erasesize&nbsp; name<br>mtd0: 000600=
00 00020000 &quot;RedBoot&quot;<br>mtd1: 00140000 00020000 &quot;kernel1&qu=
ot;<br>mtd2: 00500000 00020000 &quot;rootfs1&quot;<br>
mtd3: 00140000 00020000 &quot;kernel2&quot;<br>mtd4: 00500000 00020000 &quo=
t;rootfs2&quot;<br>mtd5: 00100000 00020000 &quot;Config&quot;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div>mtd6: 00020000 00020000 &quot;RedBoot config&quot;<br>mtd7: 00020000 0=
0020000 &quot;FIS directory&quot;</div>
<div>&nbsp;</div>
<div><a href=3D"mailto:root@OpenWRT">root@OpenWRT</a>:~# mount<br>rootfs on=
 / type rootfs (rw)<br>/dev/root on / type jffs2 (rw)<br>proc on /proc type=
 proc (rw)<br>sysfs on /sys type sysfs (rw)<br>tmpfs on /tmp type tmpfs (rw=
,nosuid,nodev)<br>
tmpfs on /dev type tmpfs (rw)<br>devpts on /dev/pts type devpts (rw,mode=3D=
600)<br>/dev/mtdblock5 on /mnt/rw type jffs2 (rw)<br></div>
<div>When the board is up and running for the first time, on updating the C=
onfig (mtd5) parition &nbsp;from GUI web,&nbsp;and on next reboot the syste=
m gets </div>
<div>failed to mount the Config jffs2 (mtd5)&nbsp;partition and throws the =
following error</div>
<div>......</div>
<div>&nbsp;Intel/Sharp Extended Query Table at 0x010A<br>Using buffer write=
 method<br>Using auto-unlock on power-up/resume<br>cfi_cmdset_0001: Erase s=
uspend on write enabled<br>Searching for RedBoot partition table in IXP4XX-=
Flash.0 at offset 0xfe0000<br>
8 RedBoot partitions found on MTD device IXP4XX-Flash.0<br>Creating 8 MTD p=
artitions on &quot;IXP4XX-Flash.0&quot;:<br>0x00000000-0x00060000 : &quot;R=
edBoot&quot;<br>0x00060000-0x001a0000 : &quot;kernel1&quot;<br>0x001a0000-0=
x006a0000 : &quot;rootfs1&quot;<br>
0x006a0000-0x007e0000 : &quot;kernel2&quot;<br>0x007e0000-0x00ce0000 : &quo=
t;rootfs2&quot;<br><strong>0x00ce0000-0x00de0000 : &quot;config&quot;</stro=
ng><br>0x00fc0000-0x00fe0000 : &quot;RedBoot config&quot;<br>0x00fe0000-0x0=
1000000 : &quot;FIS directory&quot;<br>
i2c /dev entries driver<br>i2c-gpio i2c-gpio.0: using pins 9 (SDA) and 10 (=
SCL)<br>IXP4xx Watchdog Timer: heartbeat 60 sec<br>Registered led device: p=
ronghorn:green:status<br>nf_conntrack version 0.5.0 (1024 buckets, 4096 max=
)<br>
ip_tables: (C) 2000-2006 Netfilter Core Team<br>TCP westwood registered<br>=
NET: Registered protocol family 17<br>Bridge firewalling registered<br>802.=
1Q VLAN Support v1.8 Ben Greear &lt;<a href=3D"mailto:greearb@candelatech.c=
om">greearb@candelatech.com</a>&gt;<br>
All bugs added by David S. Miller &lt;<a href=3D"mailto:davem@redhat.com">d=
avem@redhat.com</a>&gt;<br>XScale DSP coprocessor detected.<br>drivers/rtc/=
hctosys.c: unable to open rtc device (rtc0)<br>VFS: Mounted root (jffs2 fil=
esystem) readonly.<br>
Freeing init memory: 100K<br>Please be patient, while OpenWrt loads ...<br>=
<strong>JFFS2 error: (1863) jffs2_link_node_ref: Adding new ref c3d992f0 at=
 (0x00000000-0x00000030) not immediately after previo<br>us (0x00000000-0x0=
0000000)<br>
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
0<br>pgd =3D c3cf8000<br></strong>[00000000] *pgd=3D03e13031, *pte=3D000000=
00, *ppte=3D00000000<br>Internal error: Oops: 817 [#1]<br>Modules linked in=
:<br>
CPU: 0&nbsp;&nbsp;&nbsp; Not tainted&nbsp; (2.6.26.2 #17)<br>pc : [&lt;c00c=
0d54&gt;]&nbsp;&nbsp;&nbsp; lr : [&lt;c020630c&gt;]&nbsp;&nbsp;&nbsp; psr: =
60000013<br>sp : c3df5be4&nbsp; ip : c020630c&nbsp; fp : c3df5c14<br>r10: c=
3df7800&nbsp; r9 : 00000006&nbsp; r8 : c3cfd0a8<br>r7 : 00000030&nbsp; r6 :=
 c3df7200&nbsp; r5 : c3d992f0&nbsp; r4 : c3df7800<br>
r3 : 00000000&nbsp; r2 : a0000013&nbsp; r1 : 00000001&nbsp; r0 : 00000096<b=
r>Flags: nZCv&nbsp; IRQs on&nbsp; FIQs on&nbsp; Mode SVC_32&nbsp; ISA ARM&n=
bsp; Segment user<br>Control: 000039ff&nbsp; Table: 03cf8000&nbsp; DAC: 000=
00015<br>Process mount (pid: 1863, stack limit =3D 0xc3df4260)<br>
Stack: (0xc3df5be4 to 0xc3df6000)<br>5be0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 00000000 00000030 00000000 00000000 00000030 c3df7800=
 00000000 <br>5c00: c3df7200 c3df7200 c3df5c38 c3df5c18 c00cd5c8 c00c0c60 c=
3cfd0a8 00000000 <br>5c20: c3e18020 00000000 c3d7be00 c3df5c90 c3df5c3c c00=
cda1c c00cd574 c3cfd0a8 <br>
5c40: c3d7be15 c3e18038 c3e18000 00020000 00005024 00000000 c3cfd0a8 198520=
06 <br>5c60: 00005024 c3df5c90 00000008 c3df7200 00005024 c3e18000 c3df7800=
 c3d92ff8 <br>5c80: 00000000 c3df5d14 c3df5c94 c00c5e38 c00cd6c8 c0220ae4 0=
00000d2 ffffffff <br>
5ca0: 000000ef 00000000 00000000 00000000 00001000 c3d7bd40 00000000 c006e1=
88 <br>5cc0: c3d92000 000000d2 00000000 00000000 c3df7200 c3df72dc c3df72c4=
 c3df5cfc <br>5ce0: c3df5cec c006e3b0 c3d92000 c3df72b4 c3df72bc c3df72dc c=
3df72c4 c3df72cc <br>
5d00: c3df7200 00000000 c3df5d4c c3df5d18 c00c8b4c c00c5b48 c3df5d4c c3df5d=
28 <br>5d20: 00000000 00020000 00100000 c3df7200 c3df7400 c3c59d00 c00caf10=
 c3c19a00 <br>5d40: c3df5d6c c3df5d50 c00caa10 c00c89c8 c3df7200 c3df7400 0=
0000001 c3e14000 <br>
5d60: c3df5d8c c3df5d70 c00cafac c00ca8e4 c3df7400 c3df7400 00008000 c3e140=
00 <br>5d80: c3df5db4 c3df5d90 c01125cc c00caf1c c3d02000 c3e14000 c020a2d8=
 00008000 <br>5da0: c020a2d8 c3e14000 c3df5de0 c3df5db8 c0112690 c0112578 c=
3c19a00 c00caf10 <br>
5dc0: c3c59d00 01f00005 c3d02000 c3df5df0 00008000 c3df5e6c c3df5de4 c01128=
0c <br>5de0: c011263c 00000005 c00caf10 c3c59d00 c3c59d80 c38c245c c3df5e50=
 c3df5e08 <br>5e00: c00e1810 00000001 00000001 00000000 00000000 c021ca58 0=
00000d0 c3c59d00 <br>
5e20: 00008000 c3df5e48 00008000 c3df5e60 c3df5e3c c00738b4 c0073634 c3d740=
00 <br>5e40: 0000000f c3c59d00 c3d02000 c020a2d8 00008000 c3e14000 c3d74000=
 c3e14000 <br>5e60: c3df5e84 c3df5e70 c00cadd8 c01126ac c00caf10 c3c59d00 c=
3df5eac c3df5e88 <br>
5e80: c0077dcc c00cadc0 c3c59d00 00008000 c3d02000 c3e14000 c3d74000 c020a2=
d8 <br>5ea0: c3df5ed0 c3df5eb0 c0077e6c c0077d80 00008000 c3d74000 c3df5efc=
 00000000 <br>5ec0: c3d02000 c3df5ef0 c3df5ed4 c008dbc0 c0077e3c 00008000 0=
0000000 c3df5efc <br>
5ee0: c3d91000 c3df5f74 c3df5ef4 c008dd60 c008db70 c3d02000 c3e14000 c3d661=
80 <br>5f00: c38fc7c0 c0021620 c0021194 c3e14fe8 00000001 00000001 00000000=
 00001000 <br>5f20: 0006a018 00000018 c3e14000 c3df5f84 c3df4000 00000000 c=
3df5f74 00000000 <br>
5f40: c3df5f54 00000000 c01bb46c 00000000 c3d91000 beabff9f 00008000 c0021b=
e4 <br>5f60: c3df4000 00000000 c3df5fa4 c3df5f78 c008de14 c008dbfc c3e14000=
 c3d02000 <br>5f80: c3d74000 c3e14000 0006a018 beabfdd0 4009b608 00000015 0=
0000000 c3df5fa8 <br>
5fa0: c0021a40 c008dd94 0006a018 beabfdd0 beabff9f beabffae beabff99 000080=
00 <br>5fc0: 0006a018 beabfdd0 4009b608 0006a018 00000042 beabfee0 00000000=
 00000000 <br>5fe0: 40051ed4 beabfa50 0002c15c 40051ee0 20000010 beabff9f 0=
0000000 00000000 <br>
Backtrace: <br>Function entered at [&lt;c00c0c54&gt;] from [&lt;c00cd5c8&gt=
;]<br>&nbsp;r8:c3df7200 r7:c3df7200 r6:00000000 r5:c3df7800 r4:00000030<br>=
Function entered at [&lt;c00cd568&gt;] from [&lt;c00cda1c&gt;]<br>&nbsp;r7:=
c3d7be00 r6:00000000 r5:c3e18020 r4:00000000<br>
Function entered at [&lt;c00cd6bc&gt;] from [&lt;c00c5e38&gt;]<br>Function =
entered at [&lt;c00c5b3c&gt;] from [&lt;c00c8b4c&gt;]<br>Function entered a=
t [&lt;c00c89bc&gt;] from [&lt;c00caa10&gt;]<br>Function entered at [&lt;c0=
0ca8d8&gt;] from [&lt;c00cafac&gt;]<br>
&nbsp;r7:c3e14000 r6:00000001 r5:c3df7400 r4:c3df7200<br>Function entered a=
t [&lt;c00caf10&gt;] from [&lt;c01125cc&gt;]<br>&nbsp;r7:c3e14000 r6:000080=
00 r5:c3df7400 r4:c3df7400<br>Function entered at [&lt;c011256c&gt;] from [=
&lt;c0112690&gt;]<br>
Function entered at [&lt;c0112630&gt;] from [&lt;c011280c&gt;]<br>&nbsp;r7:=
00008000 r6:c3df5df0 r5:c3d02000 r4:01f00005<br>Function entered at [&lt;c0=
1126a0&gt;] from [&lt;c00cadd8&gt;]<br>Function entered at [&lt;c00cadb4&gt=
;] from [&lt;c0077dcc&gt;]<br>
Function entered at [&lt;c0077d74&gt;] from [&lt;c0077e6c&gt;]<br>&nbsp;r8:=
c020a2d8 r7:c3d74000 r6:c3e14000 r5:c3d02000 r4:00008000<br>Function entere=
d at [&lt;c0077e30&gt;] from [&lt;c008dbc0&gt;]<br>&nbsp;r8:c3d02000 r7:000=
00000 r6:c3df5efc r5:c3d74000 r4:00008000<br>
Function entered at [&lt;c008db64&gt;] from [&lt;c008dd60&gt;]<br>&nbsp;r7:=
c3d91000 r6:c3df5efc r5:00000000 r4:00008000<br>Function entered at [&lt;c0=
08dbf0&gt;] from [&lt;c008de14&gt;]<br>Function entered at [&lt;c008dd88&gt=
;] from [&lt;c0021a40&gt;]<br>
&nbsp;r7:00000015 r6:4009b608 r5:beabfdd0 r4:0006a018<br>Code: e59f00bc e59=
f20bc ebfdc884 e3a03000 (e5833000) <br>---[ end trace eefb6b43ebe2bec4 ]---=
<br>- init -<br></div>
<div>Can anyboy tell me how the changes to the jffs2 Config (mtd5) parition=
 affects the bootup ?</div>

--0015174c198235009904623c7c30--
