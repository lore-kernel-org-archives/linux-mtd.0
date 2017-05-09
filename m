Received: from cnshjsmin03.alcatel-sbell.com.cn ([116.246.26.71])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7xY2-0000dA-95
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 05:19:02 +0000
From: ZHANG Hui P <Hui.P.Zhang@alcatel-sbell.com.cn>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: a bug detected in ubifs
Date: Tue, 9 May 2017 05:18:31 +0000
Message-ID: <889DB31BAC79B0408EC03BEFCB9A558011602AF6@cnshjmbx04>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi :  =20
         When we used ubifs on our product, I found one of the ubifs on mtd=
5 is crashed and can't be mounted:
02/12 00:22:09 ||UBI: data offset:                2048
02/12 00:22:10 ||UBI: max. sequence number:       66225
02/12 00:22:10 ||UBI: attached mtd8 to ubi5
02/12 00:22:10 ||UBI: MTD device name:            "logfs"
02/12 00:22:10 ||UBI: MTD device size:            26 MiB
02/12 00:22:10 ||UBI: number of good PEBs:        208
02/12 00:22:10 ||UBI: number of bad PEBs:         0
02/12 00:22:10 ||UBI: number of corrupted PEBs:   0
02/12 00:22:10 ||UBI: max. allowed volumes:       128
02/12 00:22:10 ||UBI: wear-leveling threshold:    4096
02/12 00:22:10 ||UBI: number of internal volumes: 1
02/12 00:22:10 ||UBI: number of user volumes:     1
02/12 00:22:10 ||UBI: available PEBs:             5
02/12 00:22:10 ||UBI: total number of reserved PEBs: 203
02/12 00:22:10 ||UBI: number of PEBs reserved for bad PEB handling: 2
02/12 00:22:10 ||UBI: max/mean erase counter: 621/318
02/12 00:22:10 ||UBI: image sequence number:  0
02/12 00:22:10 ||UBI: background thread "ubi_bgt5d" started, PID 229
02/12 00:22:10 ||UBI device number 5, total 208 LEBs (26836992 bytes, 25.6 =
MiB), available 5 LEBs (645120 bytes, 630.0 KiB), LEB size 129024 bytes (12=
6.0 KiB)
02/12 00:22:10 ||UBIFS: recovery needed
02/12 00:22:10 ||UBIFS error (pid 234): read_pnode: error -22 reading pnode=
 at 8:24749
02/12 00:22:10 ||UBIFS error (pid 234): do_commit: commit failed, error -22
02/12 00:22:10 ||UBIFS warning (pid 234): ubifs_ro_mode: switched to read-o=
nly mode, error -22
02/12 00:22:10 ||Call Trace:
02/12 00:22:10 ||[<80019db8>] dump_stack+0x8/0x34
02/12 00:22:10 ||[<801bdbf8>] do_commit+0x574/0x5a8
02/12 00:22:10 ||[<801c74b4>] ubifs_rcvry_gc_commit+0x7c/0x110
02/12 00:22:10 ||[<801b2f80>] ubifs_get_sb+0x1124/0x150c
02/12 00:22:10 ||[<800c97e8>] vfs_kern_mount+0x6c/0x12c
02/12 00:22:10 ||[<800c9900>] do_kern_mount+0x48/0xfc
02/12 00:22:10 ||[<800e2208>] do_mount+0x668/0x6e8
02/12 00:22:10 ||[<800e230c>] sys_mount+0x84/0xe8
02/12 00:22:11 ||[<80012124>] stack_done+0x20/0x3c
02/12 00:22:11 ||
02/12 00:22:11 ||mount: mounting /dev/ubi5_0 on /logs failed: Invalid argum=
ent
02/12 00:22:11 ||insmod: can't insert 'kxapi.ko': No such file or directory
02/12 00:22:11 ||calibrate_delay() has been called! loops_per_jiffy =3D 124=
1088!

         Then I add some debug print in ubi-fs, and found the damage of thi=
s fs is :one lprop's dirty count is larger than the whole leb size:
ubifs_lpt_start_commit: ubi_5:make_tree_dirty
UBIFS error (pid 240:mount): read_pnode: error -22 reading pnode at 8:24749=
//this is my debug information, it shows which pnode is corrupt.
UBIFS error (pid 240:mount): read_pnode: calc num: 22
UBIFS error (pid 240:mount): read_pnode: first lp num: 98
UBIFS error (pid 240:mount): ubifs_lpt_start_commit: ubi_5:make_tree_dirty =
returned -22
UBIFS error (pid 240:mount): ubifs_lpt_start_commit: ubi_5:ubifs_lpt_start_=
commit finish
UBIFS error (pid 240:mount): do_commit: commit failed, error -22
UBIFS warning (pid 240): ubifs_ro_mode: switched to read-only mode, error -=
22
Call Trace:
[<80019db8>] dump_stack+0x8/0x34
[<801bde48>] do_commit+0x5d4/0x62c
[<801c7878>] ubifs_rcvry_gc_commit+0x7c/0x110
[<801b3004>] ubifs_get_sb+0x1124/0x150c
[<800c97e8>] vfs_kern_mount+0x6c/0x12c
[<800c9900>] do_kern_mount+0x48/0xfc
[<800e2208>] do_mount+0x668/0x6e8
[<800e230c>] sys_mount+0x84/0xe8
[<80012124>] stack_done+0x20/0x3c
         Then I dump the lpt, and checked the pnode at 8:24749 , it is=20

LEB 8:24749, pnode,  0:128408:1, 0:176:0, 0:130160:1, 0:128448:1  //the pri=
nt order is :        for (i =3D 0; i < UBIFS_LPT_FANOUT; i++) {
                                                                           =
                                                       printk(KERN_CONT "%d=
:%d:%d", pnode.lprops[i].free,
                                                                           =
                                                pnode.lprops[i].dirty,pnode=
.lprops[i].flags);
                           =20
         so the problem is the lprops[2], which dirty is 130160, howerver ,=
the leb_size is 129024, so it is returned "-EINVAL" while calling "validate=
_pnode"
         do you see this problem before? Or can you give me some suggestion=
 for the further investgate?
