Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlWoi-0005fM-4O
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 02:24:33 +0000
Received: by iakl21 with SMTP id l21so4062138iak.36
 for <linux-mtd@lists.infradead.org>; Thu, 12 Jan 2012 18:24:30 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 12 Jan 2012 21:24:30 -0500
Message-ID: <CALuiOdd6vgDogxf9+RFWhb-uUoDLji2CawB3Gvisg2iW4C7PiA@mail.gmail.com>
Subject: ubifs mount fails due to corrupt empty space
From: Gabriel Matni <gabriel.matni@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=90e6ba61384691694c04b65f90ae
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--90e6ba61384691694c04b65f90ae
Content-Type: multipart/alternative; boundary=90e6ba61384691694804b65f90ac

--90e6ba61384691694804b65f90ac
Content-Type: text/plain; charset=ISO-8859-1

Hello list,

Using kernel 3.2, ubifs failed to mount a fs properly due to a corrupt
empty space encoutered while replaying the journal. Please notice the
bitflip occurring in the supposedly empty space shown in the log below. The
storage medium is an SLC NAND flash.

The stack dump shown below shows that replay_log_leb() was behind the call
to ubifs_scan(), and could not deal with the -EUCLEAN error returned.
ubifs_scan() returned this error because it detected the corrupt empty
space.
The fs was unmounted cleanly, resulting in no need for fs recovery to
happen during the mount (need_recovery=0). Therefore the recovery of the
log_leb in question couldn't be performed, causing the mount to abort. This
problem was also seen in the following thread:
http://lists.infradead.org/pipermail/linux-mtd/2009-March/024953.html with
a NOR flash

I applied the attached patch and the fs was successfully mounted giving the
fs a second life.

My main questions are:
1) What should be the expected behavior of ubifs in this case?
2) Is there a systematic way to recover from a situation like that?
3) Is the usage of this patch safe?
4) Any suggestions?

Thank you,

Gabriel Matni

Kernel log when attempting to mount the file system (2 UBI volumes on mtd12
each having a ubifs):

<5>[   68.901714] UBI: attaching mtd12 to ubi12
<5>[   68.905773] UBI: physical eraseblock size:   131072 bytes (128 KiB)
<5>[   68.912640] UBI: logical eraseblock size:    126976 bytes
<5>[   68.918070] UBI: smallest flash I/O unit:    2048
<5>[   68.923217] UBI: VID header offset:          2048 (aligned 2048)
<5>[   68.929255] UBI: data offset:                4096
<5>[   69.853538] UBI: max. sequence number:       52629
<5>[   69.906701] UBI: attached mtd12 to ubi12
<5>[   69.911170] UBI: MTD device name:            ""
<5>[   69.916702] UBI: MTD device size:            192 MiB
<5>[   69.922134] UBI: number of good PEBs:        1528
<5>[   69.926871] UBI: number of bad PEBs:         8
<5>[   69.931756] UBI: number of corrupted PEBs:   0
<5>[   69.936239] UBI: max. allowed volumes:       128
<5>[   69.941285] UBI: wear-leveling threshold:    4096
<5>[   69.946023] UBI: number of internal volumes: 1
<5>[   69.950900] UBI: number of user volumes:     2
<5>[   69.955378] UBI: available PEBs:             0
<5>[   69.960254] UBI: total number of reserved PEBs: 1528
<5>[   69.965253] UBI: number of PEBs reserved for bad PEB handling: 30
<5>[   69.971786] UBI: max/mean erase counter: 165/36
<5>[   69.976348] UBI: image sequence number:  1271161585
<5>[   69.981721] UBI: background thread "ubi_bgt12d" started, PID 891
<3>[   70.085510] UBIFS error (pid 893): ubifs_scan: corrupt empty space at
LEB 5:3775
<3>[   70.093329] UBIFS error (pid 893): ubifs_scanned_corruption:
corruption at LEB 5:3775
<7>[   70.101696] 00000000: ffffffef ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
<7>[   70.101847] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
etc...
<3>[   70.144549] UBIFS error (pid 893): ubifs_scan: LEB 5 scanning failed
<5>[   70.445773] UBI: mtd12 is detached from ubi12

Stack dump at the location of interest (inside ubifs_scan):

<4>[   60.988112] [<c000c29c>] (dump_backtrace+0x0/0x114) from [<c0234460>]
(dump_stack+0x18/0x1c)
<4>[   60.996995]  r7:c613a000 r6:00000ebf r5:0001e140 r4:c8be7ebf
<4>[   61.003266] [<c0234448>] (dump_stack+0x0/0x1c) from [<c00f3fd4>]
(ubifs_scan+0x334/0x3a0)
<4>[   61.011959] [<c00f3ca0>] (ubifs_scan+0x0/0x3a0) from [<c00f417c>]
(replay_log_leb+0x94/0x7e8)
<4>[   61.021016] [<c00f40e8>] (replay_log_leb+0x0/0x7e8) from [<c00f5aa0>]
(ubifs_replay_journal+0x198/0x398)
<4>[   61.031029] [<c00f5908>] (ubifs_replay_journal+0x0/0x398) from
[<c00e802c>] (ubifs_fill_super+0xbdc/0x1854)
<4>[   61.041283] [<c00e7450>] (ubifs_fill_super+0x0/0x1854) from
[<c00e9138>] (ubifs_mount+0x494/0x564)
<4>[   61.050769] [<c00e8ca4>] (ubifs_mount+0x0/0x564) from [<c00816cc>]
(mount_fs+0x14/0x40)

--90e6ba61384691694804b65f90ac
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Hello list,</p>
<p>Using kernel 3.2, ubifs failed to mount a fs properly due to a corrupt e=
mpty space encoutered while replaying the journal. Please notice the bitfli=
p occurring in the supposedly empty space shown in the log below. The stora=
ge medium is an SLC NAND flash.</p>

<p>The stack dump shown below shows that replay_log_leb() was behind the ca=
ll to ubifs_scan(), and could not deal with the -EUCLEAN error returned. ub=
ifs_scan() returned this error because it detected the corrupt empty space.=
</p>

<div>The fs was unmounted cleanly, resulting in no need for fs recovery to =
happen during the mount (need_recovery=3D0). Therefore the recovery of the =
log_leb in question couldn&#39;t be performed, causing the mount to abort. =
This problem was also seen in the following thread: <a href=3D"http://lists=
.infradead.org/pipermail/linux-mtd/2009-March/024953.html">http://lists.inf=
radead.org/pipermail/linux-mtd/2009-March/024953.html</a>=A0with a NOR flas=
h</div>

<div>=A0</div>
<div>I applied the attached patch and the fs was successfully mounted givin=
g the fs a second life.</div>
<p>My main questions are:<br>1) What should be the expected behavior of ubi=
fs in this case? <br>2) Is there a systematic way to recover from a situati=
on like that?<br>3) Is the usage of this patch safe?<br>4) Any suggestions?=
</p>

<p>Thank you,</p>
<p>Gabriel Matni</p>
<p>Kernel log when attempting to mount the file system (2 UBI volumes on mt=
d12 each having a ubifs):</p>
<p>&lt;5&gt;[=A0=A0 68.901714] UBI: attaching mtd12 to ubi12<br>&lt;5&gt;[=
=A0=A0 68.905773] UBI: physical eraseblock size:=A0=A0 131072 bytes (128 Ki=
B)<br>&lt;5&gt;[=A0=A0 68.912640] UBI: logical eraseblock size:=A0=A0=A0 12=
6976 bytes<br>&lt;5&gt;[=A0=A0 68.918070] UBI: smallest flash I/O unit:=A0=
=A0=A0 2048<br>
&lt;5&gt;[=A0=A0 68.923217] UBI: VID header offset:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 2048 (aligned 2048)<br>&lt;5&gt;[=A0=A0 68.929255] UBI: data offset:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4096<br>&lt;5&gt;[=A0=A0 69.8535=
38] UBI: max. sequence number:=A0=A0=A0=A0=A0=A0 52629<br>&lt;5&gt;[=A0=A0 =
69.906701] UBI: attached mtd12 to ubi12<br>
&lt;5&gt;[=A0=A0 69.911170] UBI: MTD device name:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 &quot;&quot;<br>&lt;5&gt;[=A0=A0 69.916702] UBI: MTD device size:=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 192 MiB<br>&lt;5&gt;[=A0=A0 69.922134] UB=
I: number of good PEBs:=A0=A0=A0=A0=A0=A0=A0 1528<br>&lt;5&gt;[=A0=A0 69.92=
6871] UBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 8<br>
&lt;5&gt;[=A0=A0 69.931756] UBI: number of corrupted PEBs:=A0=A0 0<br>&lt;5=
&gt;[=A0=A0 69.936239] UBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 128<br>=
&lt;5&gt;[=A0=A0 69.941285] UBI: wear-leveling threshold:=A0=A0=A0 4096<br>=
&lt;5&gt;[=A0=A0 69.946023] UBI: number of internal volumes: 1<br>
&lt;5&gt;[=A0=A0 69.950900] UBI: number of user volumes:=A0=A0=A0=A0 2<br>&=
lt;5&gt;[=A0=A0 69.955378] UBI: available PEBs:=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0<br>&lt;5&gt;[=A0=A0 69.960254] UBI: total number of reserved PE=
Bs: 1528<br>&lt;5&gt;[=A0=A0 69.965253] UBI: number of PEBs reserved for ba=
d PEB handling: 30<br>
&lt;5&gt;[=A0=A0 69.971786] UBI: max/mean erase counter: 165/36<br>&lt;5&gt=
;[=A0=A0 69.976348] UBI: image sequence number:=A0 1271161585<br>&lt;5&gt;[=
=A0=A0 69.981721] UBI: background thread &quot;ubi_bgt12d&quot; started, PI=
D 891<br>&lt;3&gt;[=A0=A0 70.085510] UBIFS error (pid 893): ubifs_scan: cor=
rupt empty space at LEB 5:3775<br>
&lt;3&gt;[=A0=A0 70.093329] UBIFS error (pid 893): ubifs_scanned_corruption=
: corruption at LEB 5:3775<br>&lt;7&gt;[=A0=A0 70.101696] 00000000: ffffffe=
f ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=A0 .......=
.........................<br>
&lt;7&gt;[=A0=A0 70.101847] 00000020: ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff=A0 ................................<br>e=
tc...<br>&lt;3&gt;[=A0=A0 70.144549] UBIFS error (pid 893): ubifs_scan: LEB=
 5 scanning failed<br>
&lt;5&gt;[=A0=A0 70.445773] UBI: mtd12 is detached from ubi12</p>
<div><br>Stack dump at the location of interest (inside ubifs_scan):</div>
<div><br>&lt;4&gt;[=A0=A0 60.988112] [&lt;c000c29c&gt;] (dump_backtrace+0x0=
/0x114) from [&lt;c0234460&gt;] (dump_stack+0x18/0x1c)<br>&lt;4&gt;[=A0=A0 =
60.996995]=A0 r7:c613a000 r6:00000ebf r5:0001e140 r4:c8be7ebf<br>&lt;4&gt;[=
=A0=A0 61.003266] [&lt;c0234448&gt;] (dump_stack+0x0/0x1c) from [&lt;c00f3f=
d4&gt;] (ubifs_scan+0x334/0x3a0)<br>
&lt;4&gt;[=A0=A0 61.011959] [&lt;c00f3ca0&gt;] (ubifs_scan+0x0/0x3a0) from =
[&lt;c00f417c&gt;] (replay_log_leb+0x94/0x7e8)<br>&lt;4&gt;[=A0=A0 61.02101=
6] [&lt;c00f40e8&gt;] (replay_log_leb+0x0/0x7e8) from [&lt;c00f5aa0&gt;] (u=
bifs_replay_journal+0x198/0x398)<br>
&lt;4&gt;[=A0=A0 61.031029] [&lt;c00f5908&gt;] (ubifs_replay_journal+0x0/0x=
398) from [&lt;c00e802c&gt;] (ubifs_fill_super+0xbdc/0x1854)<br>&lt;4&gt;[=
=A0=A0 61.041283] [&lt;c00e7450&gt;] (ubifs_fill_super+0x0/0x1854) from [&l=
t;c00e9138&gt;] (ubifs_mount+0x494/0x564)<br>
&lt;4&gt;[=A0=A0 61.050769] [&lt;c00e8ca4&gt;] (ubifs_mount+0x0/0x564) from=
 [&lt;c00816cc&gt;] (mount_fs+0x14/0x40)<br></div>

--90e6ba61384691694804b65f90ac--

--90e6ba61384691694c04b65f90ae
Content-Type: application/octet-stream;
	name="ubifs-corrupt-empty-space.patch"
Content-Disposition: attachment; filename="ubifs-corrupt-empty-space.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gxckmg930

ZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3JlcGxheS5jIGIvZnMvdWJpZnMvcmVwbGF5LmMKaW5kZXgg
Y2NhYmFmMS4uYzY1NDNlZCAxMDA2NDQKLS0tIGEvZnMvdWJpZnMvcmVwbGF5LmMKKysrIGIvZnMv
dWJpZnMvcmVwbGF5LmMKQEAgLTgzMyw3ICs4MzMsNyBAQCBzdGF0aWMgaW50IHJlcGxheV9sb2df
bGViKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSwgaW50IG9mZnMsIHZvaWQgKnNidWYp
CiAJZGJnX21udCgicmVwbGF5IGxvZyBMRUIgJWQ6JWQiLCBsbnVtLCBvZmZzKTsKIAlzbGViID0g
dWJpZnNfc2NhbihjLCBsbnVtLCBvZmZzLCBzYnVmLCBjLT5uZWVkX3JlY292ZXJ5KTsKIAlpZiAo
SVNfRVJSKHNsZWIpKSB7Ci0JCWlmIChQVFJfRVJSKHNsZWIpICE9IC1FVUNMRUFOIHx8ICFjLT5u
ZWVkX3JlY292ZXJ5KQorCQlpZiAoUFRSX0VSUihzbGViKSAhPSAtRVVDTEVBTikKIAkJCXJldHVy
biBQVFJfRVJSKHNsZWIpOwogCQkvKgogCQkgKiBOb3RlLCB0aGUgYmVsb3cgZnVuY3Rpb24gd2ls
bCByZWNvdmVyIHRoaXMgbG9nIExFQiBvbmx5IGlmCg==
--90e6ba61384691694c04b65f90ae--
