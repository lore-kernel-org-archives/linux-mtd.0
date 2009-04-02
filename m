Received: from ti-out-0910.google.com ([209.85.142.191])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpNSN-0002Ru-28
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 14:00:01 +0000
Received: by ti-out-0910.google.com with SMTP id a20so508908tia.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Apr 2009 06:59:42 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2009 19:29:42 +0530
Message-ID: <5730fc040904020659w360c53c6u6cdc513d5c3055d9@mail.gmail.com>
Subject: Kernel OOPS - JFFS2 file system on NOR flash
From: hari prasath <gehariprasath@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/alternative; boundary=0016e6513cb008b03d046692d89d
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e6513cb008b03d046692d89d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear all,

I have a embedded device with 32MB NOR flash. I am mounting a part of this
as a MTD device.

Now i have a script which echo's a string to a file in the flash. At certain
stage, the 'echo' process becomes a Demon. 'dmesg' shows that 'Kernel unable
to handle page request is generated"

The output of 'dmesg' is given below for reference.

I am using linux kernel 2.6.22 and my NOR flash is a Intel P30 device.

argh. node added in wrong place
Unable to handle kernel paging request at virtual address ffffffee
pgd = c3df8000
[ffffffee] *pgd=a0002021, *pte=00000000, *ppte=00000000
Internal error: Oops: f3 [#1]
Modules linked in: modem_driver Gpio_ctrl
CPU: 0    Not tainted  (2.6.22 #1)
PC is at jffs2_add_full_dnode_to_inode+0xb8/0x408
LR is at jffs2_add_full_dnode_to_inode+0x60/0x408
pc : [<c00e4ddc>]    lr : [<c00e4d84>]    psr: a0000013
sp : c3db9c50  ip : c3846fb0  fp : c3db9c74
r10: c2894200  r9 : 000015bc  r8 : c3be4cf8
r7 : c2d941ac  r6 : c3846aa0  r5 : c3846fb0  r4 : c2d94198
r3 : c3be4cf8  r2 : ffffffea  r1 : 000015bc  r0 : 000015bc
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 0000397f  Table: a3df8000  DAC: 00000015
Process echo (pid: 4474, stack limit = 0xc3db8260)
Stack: (0xc3db9c50 to 0xc3dba000)
9c40:                                     c3be4cf8 c2d8af98 c2d94198
c2894200
9c60: 00000000 00000000 c3db9ccc c3db9c78 c00e986c c00e4d30 00000022
00000003
9c80: 00000000 00000000 c38085bc 00000022 00000022 c38085bc 00008cb0
2bdf0c0b
9ca0: 2bdf0c0b c2d94198 000005bc c2894200 c2d8af98 c2d941c4 000005bc
c036d100
9cc0: c3db9d18 c3db9cd0 c00e481c c00e9618 000015bc 00000022 c3db9ce4
00000000
9ce0: 000005de 00000000 49d2e5da 49d2e5da 00000022 c3db8000 00000000
00000022
9d00: c036d100 40000000 000005bc c3db9db4 c3db9d1c c005db24 c00e46f4
c004f91c
9d20: 000005de c2d941c4 c023b510 c2d94258 c1b3e720 00000001 c3db9e9c
00000000
9d40: 00000000 c3db9e94 50d941c4 00000000 00000000 c3db9de4 c2894400
c3db9d94
9d60: c3db9d6c c00945f8 c00eefe0 c3db9d94 c3db9d7c c2d941c4 c3db9d98
00000001
9d80: c3db9de4 000015bc c3db9db8 000015bc 00000000 c3db9de8 c3db9de4
000015bc
9da0: 00000000 00000000 c3db9e48 c3db9dbc c005e4c4 c005d718 000015bc
00000000
9dc0: c3db9ee4 00000022 00000000 00000000 c2d94258 c1b3e720 c3db9ee4
c3db9e94
9de0: c3db9e9c 00000022 000015bc 00000000 00000022 00000001 00000044
000200d2
9e00: c02cf2b0 00000000 000200d2 c02cf2ac 00000000 c3d23d60 c1b39d00
c3db9e68
9e20: c3db9e9c c2d941c4 00000000 00000000 c3db9ee4 00000001 c2d9422c
c3db9e88
9e40: c3db9e4c c005e578 c005dfd4 c3d8a800 c3db9e78 c2d94258 c1b3e720
c3db9e94
9e60: 00000000 00000000 c3db9e9c c3db9ee4 c1b3e720 c3db9e94 c3db9f78
c3db9f4c
9e80: c3db9e90 c0077940 c005e504 00000000 00000000 40000000 00000022
00069000
9ea0: c3db9ebc 00000000 00000001 ffffffff c1b3e720 00000000 00000000
00000000
9ec0: 00000000 c1b39d00 00000000 00000000 c281e4a8 c1b39d00 c004c740
c3db9edc
9ee0: c3db9edc 00000000 00000000 c3db8000 00069000 c3db9f4c c3db9f04
c0069da8
9f00: 00000022 c0029834 00000000 00000000 00000000 00000000 c3df8000
00000000
9f20: 00000002 c1b3e720 40000000 c0077880 00000022 c3db9f78 c3db8000
00000002
9f40: c3db9f74 c3db9f50 c0077a5c c007788c c0027254 c1b3e740 c1b3e720
c3db9f78
9f60: 00000000 00000000 c3db9fa4 c3db9f78 c0077ba0 c007799c 00000000
00000000
9f80: 00000000 40000000 00000022 0017ba08 00000004 c0023f84 00000000
c3db9fa8
9fa0: c0023de0 c0077b60 40000000 00000022 00000001 40000000 00000022
40000000
9fc0: 40000000 00000022 0017ba08 00000022 00000022 00192304 00000002
000082d0
9fe0: 00000000 be85fc14 000b9804 000e1704 60000010 00000001 00000000
00000000
Backtrace:
[<c00e4d24>] (jffs2_add_full_dnode_to_inode+0x0/0x408) from [<c00e986c>]
(jffs2_write_inode_range+0x260/0x36c)
[<c00e960c>] (jffs2_write_inode_range+0x0/0x36c) from [<c00e481c>]
(jffs2_commit_write+0x134/0x270)
[<c00e46e8>] (jffs2_commit_write+0x0/0x270) from [<c005db24>]
(generic_file_buffered_write+0x41c/0x610)
[<c005d70c>] (generic_file_buffered_write+0x4/0x610) from [<c005e4c4>]
(__generic_file_aio_write_nolock+0x4fc/0x52c)
[<c005dfc8>] (__generic_file_aio_write_nolock+0x0/0x52c) from [<c005e578>]
(generic_file_aio_write+0x84/0x100)
[<c005e4f8>] (generic_file_aio_write+0x4/0x100) from [<c0077940>]
(do_sync_write+0xc0/0x110)
[<c0077880>] (do_sync_write+0x0/0x110) from [<c0077a5c>]
(vfs_write+0xcc/0x150)
[<c0077990>] (vfs_write+0x0/0x150) from [<c0077ba0>] (sys_write+0x4c/0x74)
 r8:00000000 r7:00000000 r6:c3db9f78 r5:c1b3e720 r4:c1b3e740
[<c0077b54>] (sys_write+0x0/0x74) from [<c0023de0>]
(ret_fast_syscall+0x0/0x2c)
 r8:c0023f84 r7:00000004 r6:0017ba08 r5:00000022 r4:40000000
Code: 13833003 15823004 e596300c e5932000 (e5923004)
Node totlen on flash (0x00000046) != totlen from node ref (0x00000058)
Node totlen on flash (0x00000000) != totlen from node ref (0x0000005c)


-- 
Best Regards,
G.E.Hari Prasath

--0016e6513cb008b03d046692d89d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear all,<br><br>I have a embedded device with 32MB NOR flash. I am mountin=
g a part of this as a MTD device.<br><br>Now i have a script which echo&#39=
;s a string to a file in the flash. At certain stage, the &#39;echo&#39; pr=
ocess becomes a Demon. &#39;dmesg&#39; shows that &#39;Kernel unable to han=
dle page request is generated&quot;<br>
<br>The output of &#39;dmesg&#39; is given below for reference.<br><br>I am=
 using linux kernel 2.6.22 and my NOR flash is a Intel P30 device.<br><br>a=
rgh. node added in wrong place<br>Unable to handle kernel paging request at=
 virtual address ffffffee<br>
pgd =3D c3df8000<br>[ffffffee] *pgd=3Da0002021, *pte=3D00000000, *ppte=3D00=
000000<br>Internal error: Oops: f3 [#1]<br>Modules linked in: modem_driver =
Gpio_ctrl<br>CPU: 0=C2=A0=C2=A0=C2=A0 Not tainted=C2=A0 (2.6.22 #1)<br>PC i=
s at jffs2_add_full_dnode_to_inode+0xb8/0x408<br>
LR is at jffs2_add_full_dnode_to_inode+0x60/0x408<br>pc : [&lt;c00e4ddc&gt;=
]=C2=A0=C2=A0=C2=A0 lr : [&lt;c00e4d84&gt;]=C2=A0=C2=A0=C2=A0 psr: a0000013=
<br>sp : c3db9c50=C2=A0 ip : c3846fb0=C2=A0 fp : c3db9c74<br>r10: c2894200=
=C2=A0 r9 : 000015bc=C2=A0 r8 : c3be4cf8<br>r7 : c2d941ac=C2=A0 r6 : c3846a=
a0=C2=A0 r5 : c3846fb0=C2=A0 r4 : c2d94198<br>
r3 : c3be4cf8=C2=A0 r2 : ffffffea=C2=A0 r1 : 000015bc=C2=A0 r0 : 000015bc<b=
r>Flags: NzCv=C2=A0 IRQs on=C2=A0 FIQs on=C2=A0 Mode SVC_32=C2=A0 Segment u=
ser<br>Control: 0000397f=C2=A0 Table: a3df8000=C2=A0 DAC: 00000015<br>Proce=
ss echo (pid: 4474, stack limit =3D 0xc3db8260)<br>
Stack: (0xc3db9c50 to 0xc3dba000)<br>9c40:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c3be4cf8 c2d8af98 c2d94198 c2894200 <br>9=
c60: 00000000 00000000 c3db9ccc c3db9c78 c00e986c c00e4d30 00000022 0000000=
3 <br>9c80: 00000000 00000000 c38085bc 00000022 00000022 c38085bc 00008cb0 =
2bdf0c0b <br>
9ca0: 2bdf0c0b c2d94198 000005bc c2894200 c2d8af98 c2d941c4 000005bc c036d1=
00 <br>9cc0: c3db9d18 c3db9cd0 c00e481c c00e9618 000015bc 00000022 c3db9ce4=
 00000000 <br>9ce0: 000005de 00000000 49d2e5da 49d2e5da 00000022 c3db8000 0=
0000000 00000022 <br>
9d00: c036d100 40000000 000005bc c3db9db4 c3db9d1c c005db24 c00e46f4 c004f9=
1c <br>9d20: 000005de c2d941c4 c023b510 c2d94258 c1b3e720 00000001 c3db9e9c=
 00000000 <br>9d40: 00000000 c3db9e94 50d941c4 00000000 00000000 c3db9de4 c=
2894400 c3db9d94 <br>
9d60: c3db9d6c c00945f8 c00eefe0 c3db9d94 c3db9d7c c2d941c4 c3db9d98 000000=
01 <br>9d80: c3db9de4 000015bc c3db9db8 000015bc 00000000 c3db9de8 c3db9de4=
 000015bc <br>9da0: 00000000 00000000 c3db9e48 c3db9dbc c005e4c4 c005d718 0=
00015bc 00000000 <br>
9dc0: c3db9ee4 00000022 00000000 00000000 c2d94258 c1b3e720 c3db9ee4 c3db9e=
94 <br>9de0: c3db9e9c 00000022 000015bc 00000000 00000022 00000001 00000044=
 000200d2 <br>9e00: c02cf2b0 00000000 000200d2 c02cf2ac 00000000 c3d23d60 c=
1b39d00 c3db9e68 <br>
9e20: c3db9e9c c2d941c4 00000000 00000000 c3db9ee4 00000001 c2d9422c c3db9e=
88 <br>9e40: c3db9e4c c005e578 c005dfd4 c3d8a800 c3db9e78 c2d94258 c1b3e720=
 c3db9e94 <br>9e60: 00000000 00000000 c3db9e9c c3db9ee4 c1b3e720 c3db9e94 c=
3db9f78 c3db9f4c <br>
9e80: c3db9e90 c0077940 c005e504 00000000 00000000 40000000 00000022 000690=
00 <br>9ea0: c3db9ebc 00000000 00000001 ffffffff c1b3e720 00000000 00000000=
 00000000 <br>9ec0: 00000000 c1b39d00 00000000 00000000 c281e4a8 c1b39d00 c=
004c740 c3db9edc <br>
9ee0: c3db9edc 00000000 00000000 c3db8000 00069000 c3db9f4c c3db9f04 c0069d=
a8 <br>9f00: 00000022 c0029834 00000000 00000000 00000000 00000000 c3df8000=
 00000000 <br>9f20: 00000002 c1b3e720 40000000 c0077880 00000022 c3db9f78 c=
3db8000 00000002 <br>
9f40: c3db9f74 c3db9f50 c0077a5c c007788c c0027254 c1b3e740 c1b3e720 c3db9f=
78 <br>9f60: 00000000 00000000 c3db9fa4 c3db9f78 c0077ba0 c007799c 00000000=
 00000000 <br>9f80: 00000000 40000000 00000022 0017ba08 00000004 c0023f84 0=
0000000 c3db9fa8 <br>
9fa0: c0023de0 c0077b60 40000000 00000022 00000001 40000000 00000022 400000=
00 <br>9fc0: 40000000 00000022 0017ba08 00000022 00000022 00192304 00000002=
 000082d0 <br>9fe0: 00000000 be85fc14 000b9804 000e1704 60000010 00000001 0=
0000000 00000000 <br>
Backtrace: <br>[&lt;c00e4d24&gt;] (jffs2_add_full_dnode_to_inode+0x0/0x408)=
 from [&lt;c00e986c&gt;] (jffs2_write_inode_range+0x260/0x36c)<br>[&lt;c00e=
960c&gt;] (jffs2_write_inode_range+0x0/0x36c) from [&lt;c00e481c&gt;] (jffs=
2_commit_write+0x134/0x270)<br>
[&lt;c00e46e8&gt;] (jffs2_commit_write+0x0/0x270) from [&lt;c005db24&gt;] (=
generic_file_buffered_write+0x41c/0x610)<br>[&lt;c005d70c&gt;] (generic_fil=
e_buffered_write+0x4/0x610) from [&lt;c005e4c4&gt;] (__generic_file_aio_wri=
te_nolock+0x4fc/0x52c)<br>
[&lt;c005dfc8&gt;] (__generic_file_aio_write_nolock+0x0/0x52c) from [&lt;c0=
05e578&gt;] (generic_file_aio_write+0x84/0x100)<br>[&lt;c005e4f8&gt;] (gene=
ric_file_aio_write+0x4/0x100) from [&lt;c0077940&gt;] (do_sync_write+0xc0/0=
x110)<br>
[&lt;c0077880&gt;] (do_sync_write+0x0/0x110) from [&lt;c0077a5c&gt;] (vfs_w=
rite+0xcc/0x150)<br>[&lt;c0077990&gt;] (vfs_write+0x0/0x150) from [&lt;c007=
7ba0&gt;] (sys_write+0x4c/0x74)<br>=C2=A0r8:00000000 r7:00000000 r6:c3db9f7=
8 r5:c1b3e720 r4:c1b3e740<br>
[&lt;c0077b54&gt;] (sys_write+0x0/0x74) from [&lt;c0023de0&gt;] (ret_fast_s=
yscall+0x0/0x2c)<br>=C2=A0r8:c0023f84 r7:00000004 r6:0017ba08 r5:00000022 r=
4:40000000<br>Code: 13833003 15823004 e596300c e5932000 (e5923004) <br>Node=
 totlen on flash (0x00000046) !=3D totlen from node ref (0x00000058)<br>
Node totlen on flash (0x00000000) !=3D totlen from node ref (0x0000005c)<br=
><br clear=3D"all"><br>-- <br>Best Regards, =C2=A0<br>G.E.Hari Prasath <br>=
<br><br><br><br>

--0016e6513cb008b03d046692d89d--
