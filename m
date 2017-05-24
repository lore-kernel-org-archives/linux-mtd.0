Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDeOB-0003cN-A2
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 22:04:21 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>
Subject: Re: pxa3xx-nand failing to find device on linux-next
Date: Wed, 24 May 2017 22:03:52 +0000
Message-ID: <ebe9d9bca4754d1ba920295f2fdd1359@svr-chch-ex1.atlnz.lc>
References: <b36366e358904310aee4970b77f57dba@svr-chch-ex1.atlnz.lc>
 <2a79405e219b4c37ba00defbe4a0dfe4@svr-chch-ex1.atlnz.lc>
 <20170524132301.12ad33d8@bbrezillon> <20170524132508.420614c7@bbrezillon>
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

On 24/05/17 23:25, Boris Brezillon wrote:=0A=
> On Wed, 24 May 2017 13:23:01 +0200=0A=
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:=0A=
> =0A=
>> Hi Chris,=0A=
>>=0A=
>> On Wed, 24 May 2017 09:36:56 +0000=0A=
>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> On 23/05/17 17:27, Chris Packham wrote:=0A=
>>>> Hi,=0A=
>>>>=0A=
>>>> I'm doing some testing on linux-next and I'm finding that my nand flas=
h=0A=
>>>> has disappeared.=0A=
>>>>=0A=
>>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this device=
=0A=
>>>> pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
>>>> pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
>>>> pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
>>>> pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
>>>> On-die ECC forcefully enabled, not supported=0A=
>>>> nand: No NAND device found=0A=
>>>> pxa3xx-nand f10d0000.flash: failed to scan nand at cs 0=0A=
>>>>=0A=
>>>> This was working around 4.11. I'll try to do some more digging tomorro=
w=0A=
>>>> to narrow down a failure point but I thought I'd send this out now jus=
t=0A=
>>>> in case it rings any bells.=0A=
>>>>=0A=
>>>> The board I'm using (DB-88F6820-AMC) is unfortunately out-of tree but =
it=0A=
>>>> should be pretty close to the armada-388-db. I can make my dts availab=
le=0A=
>>>> if it's helpful.=0A=
>>>=0A=
>>> Still works on 4.12-rc2. Fails on next-20170524.=0A=
>>>=0A=
>>> This appears to be due to commit b566d9c055de ("mtd: nand: add support=
=0A=
>>> for Micron on-die ECC"). Which based on the description seems intention=
al.=0A=
>>>=0A=
>>> Since I have access to a hardware platform that has a micron flash with=
=0A=
>>> ECC forcefully enabled how can I help to get this implemented.=0A=
>>=0A=
>> Can you try with this patch applied [1]?=0A=
> =0A=
> Sorry, wrong patch. Can you try this one [1] instead?=0A=
> =0A=
> [1]http://code.bulix.org/pkfhmi-135875=0A=
> =0A=
=0A=
With the patch above the chip is detected but ubifs is unhappy=0A=
=0A=
ubi0: attaching mtd0=0A=
random: fast init done=0A=
random: crng init done=0A=
ubi0: scanning is finished=0A=
ubi0: attached mtd0 (name "pxa3xx_nand-0", size 1024 MiB)=0A=
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes=0A=
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096=0A=
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192=0A=
ubi0: good PEBs: 4088, bad PEBs: 8, corrupted PEBs: 0=0A=
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128=0A=
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence =0A=
number: 1508037110=0A=
ubi0: available PEBs: 0, total reserved PEBs: 4088, PEBs reserved for =0A=
bad PEB handling: 72=0A=
ubi0: background thread "ubi_bgt0d" started, PID 597=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 601=0A=
UBIFS (ubi0:0): recovery needed=0A=
UBIFS (ubi0:0): recovery completed=0A=
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "user"=0A=
UBIFS (ubi0:0): LEB size: 253952 bytes (248 KiB), min./max. I/O unit =0A=
sizes: 4096 bytes/4096 bytes=0A=
UBIFS (ubi0:0): FS size: 1016315904 bytes (969 MiB, 4002 LEBs), journal =0A=
size 9404416 bytes (8 MiB, 38 LEBs)=0A=
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)=0A=
UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID =0A=
9D7B5AAA-EFDC-41D4-875B-F9CDB457AE9D, small LPT model=0A=
UBIFS error (ubi0:0 pid 599): ubifs_read_node: bad node type (160 but =0A=
expected 0)=0A=
UBIFS error (ubi0:0 pid 599): ubifs_read_node: bad node at LEB 10:90344, =
=0A=
LEB mapping status 1=0A=
Not a node, first 24 bytes:=0A=
00000000: 00 00 00 00 31 18 10 06 c3 f6 23 f6 3b 00 00 00 00 00 00 00 a0 =
=0A=
00 00 00                          ....1.....#.;...........=0A=
CPU: 1 PID: 599 Comm: mount Not tainted 4.12.0-rc2-next-20170524-at1+ #56=
=0A=
Hardware name: Marvell Armada 380/385 (Device Tree)=0A=
[<801102dc>] (unwind_backtrace) from [<8010b658>] (show_stack+0x10/0x14)=0A=
[<8010b658>] (show_stack) from [<8031aa0c>] (dump_stack+0x88/0x9c)=0A=
[<8031aa0c>] (dump_stack) from [<802aebb8>] (ubifs_read_node+0x130/0x284)=
=0A=
[<802aebb8>] (ubifs_read_node) from [<802ca2a4>] =0A=
(ubifs_tnc_read_node+0x4c/0xd4)=0A=
[<802ca2a4>] (ubifs_tnc_read_node) from [<802b1e60>] =0A=
(ubifs_tnc_locate+0x1c0/0x1c8)=0A=
[<802b1e60>] (ubifs_tnc_locate) from [<802aa15c>] (ubifs_iget+0x78/0x554)=
=0A=
[<802aa15c>] (ubifs_iget) from [<802aa90c>] (ubifs_mount+0x2d4/0x1524)=0A=
[<802aa90c>] (ubifs_mount) from [<801dfab4>] (mount_fs+0x14/0xa4)=0A=
[<801dfab4>] (mount_fs) from [<801fa6b4>] (vfs_kern_mount+0x4c/0xf4)=0A=
[<801fa6b4>] (vfs_kern_mount) from [<801fd738>] (do_mount+0x154/0xb50)=0A=
[<801fd738>] (do_mount) from [<801fe49c>] (SyS_mount+0x74/0x9c)=0A=
[<801fe49c>] (SyS_mount) from [<801077a0>] (ret_fast_syscall+0x0/0x3c)=0A=
UBIFS error (ubi0:0 pid 599): ubifs_iget: failed to read inode 1, error -22=
=0A=
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops=0A=
ubi0: detaching mtd0=0A=
ubi0: mtd0 is detached=0A=
ubi0: attaching mtd0=0A=
ubi0: scanning is finished=0A=
ubi0 error: ubi_read_volume_table: the layout volume was not found=0A=
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd0, error -22=0A=
=0A=
