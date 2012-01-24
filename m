Received: from p3plsmtp16-05-2.prod.phx3.secureserver.net ([173.201.193.62]
 helo=p3plwbeout16-05.prod.phx3.secureserver.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RpotE-0007PK-K3
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 22:30:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Message-Id: <20120124153052.9a4f1a4b2a45238f732670fb1ee2460e.355e0f7a6b.wbe@email16.secureserver.net>
From: "Brad Parker" <brad@heeltoe.com>
To: linux-mtd@lists.infradead.org
Subject: ubifs - scrubbing failed due to ecc error on new
 =?UTF-8?Q?eraseblock=3F?= =?UTF-8?Q?=20=28=32=2E=36=2E=33=39=29?=
Date: Tue, 24 Jan 2012 15:30:52 -0700
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I saw this panic on 2.6.39; is this an example of an ecc error on a new =0A=
block during scrubbing?=0A=0A...=0AFile Edit Options Buffers Tools Help=0AU=
BI: scrubbed PEB 3762 (LEB 0:1548), data moved to PEB 3684=0AUBI error: ubi=
_io_read: error -74 (ECC error) while reading 65 bytes =0Afrom PEB 3684:648=
64, read 65 bytes=0AUBIFS error (pid 912): ubifs_read_node: bad node type (=
0 but expected 2)=0AUBIFS error (pid 912): ubifs_read_node: bad node at LEB=
 1548:56952, LEB =0Amapping status 1=0ANot a node, first 24 bytes:=0A000000=
00: 68 02 00 00 00 00 00 00 c6 4a 39 4c 00 00 00 00 b6 02 01 00 00=0A=0A00 =
00 00 h........J9L............=0A[<c002b968>] (unwind_backtrace+0x0/0xf0) f=
rom [<c0108608>] =0A(ubifs_read_node+0x324/0x368)=0A[<c0108608>] (ubifs_rea=
d_node+0x324/0x368) from [<c0129de0>] =0A(ubifs_tnc_read_node+0x4c/0x190)=
=0A[<c0129de0>] (ubifs_tnc_read_node+0x4c/0x190) from [<c010afd0>] =0A(matc=
hes_name+0x44/0xcc)=0A[<c010afd0>] (matches_name+0x44/0xcc) from [<c010b08c=
>] =0A(resolve_collision+0x34/0x334)=0A[<c010b08c>] (resolve_collision+0x34=
/0x334) from [<c010dfa4>] =0A(ubifs_tnc_add_nm+0xec/0x2c4)=0A[<c010dfa4>] (=
ubifs_tnc_add_nm+0xec/0x2c4) from [<c00fb9e4>] =0A(ubifs_jnl_rename+0x6bc/0=
x90c)=0A[<c00fb9e4>] (ubifs_jnl_rename+0x6bc/0x90c) from [<c010033c>] =0A(u=
bifs_rename+0x47c/0x614)=0A[<c010033c>] (ubifs_rename+0x47c/0x614) from [<c=
0099df8>] =0A(vfs_rename+0x214/0x364)=0A[<c0099df8>] (vfs_rename+0x214/0x36=
4) from [<c009aaf4>] =0A(sys_renameat+0x168/0x1e0)=0A[<c009aaf4>] (sys_rena=
meat+0x168/0x1e0) from [<c0027640>] =0A(ret_fast_syscall+0x0/0x2c)=0AUBIFS =
warning (pid 912): ubifs_ro_mode: switched to read-only mode, =0Aerror -22=
=0A[<c002b968>] (unwind_backtrace+0x0/0xf0) from [<c00fbbd4>] =0A(ubifs_jnl=
_rename+0x8ac/0x90c)=0A[<c00fbbd4>] (ubifs_jnl_rename+0x8ac/0x90c) from [<c=
010033c>] =0A(ubifs_rename+0x47c/0x614)=0A[<c010033c>] (ubifs_rename+0x47c/=
0x614) from [<c0099df8>] =0A(vfs_rename+0x214/0x364)=0A[<c0099df8>] (vfs_re=
name+0x214/0x364) from [<c009aaf4>] =0A(sys_renameat+0x168/0x1e0)=0A[<c009a=
af4>] (sys_renameat+0x168/0x1e0) from [<c0027640>] =0A(ret_fast_syscall+0x0=
/0x2c)=0AUBIFS error (pid 603): make_reservation: cannot reserve 160 bytes =
in =0Ajhead 1, error -30=0A...=0A=0A=0A=0A
