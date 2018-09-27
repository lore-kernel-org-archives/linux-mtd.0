Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5eGv-00036M-Jp
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 21:56:36 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: Daniel Mack <daniel@zonque.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Date: Thu, 27 Sep 2018 21:55:57 +0000
Message-ID: <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13> <20180927105630.19fc1ff8@bbrezillon>
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

Hi All,=0A=
=0A=
On 27/09/18 20:56, Boris Brezillon wrote:=0A=
> On Thu, 27 Sep 2018 10:11:45 +0200=0A=
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:=0A=
> =0A=
>> Hi Daniel,=0A=
>>=0A=
>> Daniel Mack <daniel@zonque.org> wrote on Thu, 27 Sep 2018 09:17:51=0A=
>> +0200:=0A=
>>=0A=
>>> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR regis=
ter=0A=
>>> will only cause the IRQ to latch when the RDY lanes are changing, and n=
ot=0A=
>>> in case they are already asserted.=0A=
>>>=0A=
>>> This means that if the controller finished the command in flight before=
=0A=
>>> marvell_nfc_wait_op() is called, that function will wait for a change i=
n=0A=
>>> the bit that can't ever happen as it is already set.=0A=
>>>=0A=
>>> To address this race, check for the RDY bits after the IRQ was enabled,=
=0A=
>>> and complete the completion immediately if the condition is already met=
.=0A=
>>>=0A=
>>> This fixes a bug that was observed with a NAND chip that holds a UBIFS=
=0A=
>>> parition on which file system stress tests were executed. When=0A=
>>> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount=
=0A=
>>> the filesystem read-only, reporting lots of warnings along the way.=0A=
>>>=0A=
>>> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller dri=
ver=0A=
>>> Cc: stable@vger.kernel.org=0A=
>>> Signed-off-by: Daniel Mack <daniel@zonque.org>=0A=
>>> ---=0A=
>>=0A=
>> Sorry I haven't had the time to check on my Armada, but you figured it=
=0A=
>> out, and the fix looks good to me!=0A=
>>=0A=
>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>=0A=
>>=0A=
>> Boris, do you plan to send another fixes PR of can I take it into=0A=
>> the nand/next branch?=0A=
> =0A=
> Queued to mtd/master.=0A=
=0A=
After fixing my R/B configuration I get a new error with this patch when =
=0A=
running stress_1 from mtd-utils-2.0.0. I don't see this without the patch.=
=0A=
=0A=
My board is a custom design using an Armada-385 SoC with Macronix NAND.=0A=
=0A=
# stress_1=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ/WRDREQ while =0A=
draining raw data (NDSR: 0x00000000)=0A=
ubi0 error: ubi_io_write: error -5 while writing 4096 bytes to PEB =0A=
1858:110592, written 0 bytes=0A=
CPU: 1 PID: 1170 Comm: stress_1 Not tainted 4.19.0-rc5-at1+ #8=0A=
Hardware name: Marvell Armada 380/385 (Device Tree)=0A=
[<8011143c>] (unwind_backtrace) from [<8010c17c>] (show_stack+0x10/0x14)=0A=
[<8010c17c>] (show_stack) from [<805ec28c>] (dump_stack+0x88/0x9c)=0A=
[<805ec28c>] (dump_stack) from [<80418a28>] (ubi_io_write+0x55c/0x6c0)=0A=
[<80418a28>] (ubi_io_write) from [<80415b4c>] (ubi_eba_write_leb+0x80/0x780=
)=0A=
[<80415b4c>] (ubi_eba_write_leb) from [<80414580>] (ubi_leb_write+0xbc/0xe0=
)=0A=
[<80414580>] (ubi_leb_write) from [<802d46b4>] (ubifs_leb_write+0xa0/0x118)=
=0A=
[<802d46b4>] (ubifs_leb_write) from [<802d5620>] =0A=
(ubifs_wbuf_write_nolock+0x184/0x6ac)=0A=
[<802d5620>] (ubifs_wbuf_write_nolock) from [<802c8a18>] =0A=
(ubifs_jnl_write_data+0x1c0/0x2bc)=0A=
[<802c8a18>] (ubifs_jnl_write_data) from [<802caed8>] =0A=
(do_writepage+0xa4/0x1b0)=0A=
[<802caed8>] (do_writepage) from [<801aa160>] (__writepage+0x14/0x48)=0A=
[<801aa160>] (__writepage) from [<801aa900>] (write_cache_pages+0x1d0/0x3e4=
)=0A=
[<801aa900>] (write_cache_pages) from [<801aab68>] =0A=
(generic_writepages+0x54/0x80)=0A=
[<801aab68>] (generic_writepages) from [<801ac9a0>] =0A=
(do_writepages+0x68/0x8c)=0A=
[<801ac9a0>] (do_writepages) from [<801a0ac8>] =0A=
(__filemap_fdatawrite_range+0x88/0xc0)=0A=
[<801a0ac8>] (__filemap_fdatawrite_range) from [<801a0cc4>] =0A=
(file_write_and_wait_range+0x3c/0x98)=0A=
[<801a0cc4>] (file_write_and_wait_range) from [<802cb600>] =0A=
(ubifs_fsync+0x3c/0xb0)=0A=
[<802cb600>] (ubifs_fsync) from [<801a2828>] =0A=
(generic_file_write_iter+0x198/0x24c)=0A=
[<801a2828>] (generic_file_write_iter) from [<802ccb84>] =0A=
(ubifs_write_iter+0xf0/0x158)=0A=
[<802ccb84>] (ubifs_write_iter) from [<801ef854>] (__vfs_write+0xfc/0x160)=
=0A=
[<801ef854>] (__vfs_write) from [<801efa60>] (vfs_write+0xa4/0x1ac)=0A=
[<801efa60>] (vfs_write) from [<801efcac>] (ksys_write+0x54/0xb8)=0A=
[<801efcac>] (ksys_write) from [<80101000>] (ret_fast_syscall+0x0/0x54)=0A=
Exception stack(0xbd789fa8 to 0xbd789ff0)=0A=
9fa0:                   0ca5d000 00000000 00000003 7e9f2900 00008000 =0A=
ffffffff=0A=
9fc0: 0ca5d000 00000000 00008000 00000004 00000003 00000000 76f24fb4 =0A=
00000000=0A=
9fe0: 00000000 7e9f27fc 00010fd8 76e775ec=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
ttyS ttyS1: tty_port_close_start: tty->count =3D 1 port count =3D 2=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining =0A=
FIFO (data) (NDSR: 0x00000810)=0A=
=0A=
... (RDDREQ messages repeat).=0A=
