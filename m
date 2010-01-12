Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUngQ-0007f9-Gd
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 20:49:50 +0000
Received: by fxm22 with SMTP id 22so27203812fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 12:49:44 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
Date: Tue, 12 Jan 2010 15:49:44 -0500
Message-ID: <152584231001121249j32f9a03ax415a322f5d4b4195@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 12, 2010 at 3:23 PM, Jon Ringle <jon@ringle.org> wrote:
> On Mon, Jan 11, 2010 at 11:50 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> As this entry suggests:
>> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>>
>> - validate your flash/driver with the MTD tests - looks like you have a
>> problem there.
>
> Trying to run mtd_readtest I get a seg fault:
> [ =A0 67.470000] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000
> [ =A0 67.480000] pgd =3D cf978000
> [ =A0 67.480000] [00000000] *pgd=3D0d49e031, *pte=3D00000000, *ppte=3D000=
00000
> [ =A0 67.490000] Internal error: Oops: 0 [#1] PREEMPT
> [ =A0 67.490000] Modules linked in: mtd_readtest(+) ixp4xx redboot
> [ =A0 67.490000] CPU: 0 =A0 =A0Not tainted =A0(2.6.31.11-isc #3)
> [ =A0 67.490000] PC is at 0x0
> [ =A0 67.490000] LR is at scan_for_bad_eraseblocks+0x88/0x10c [mtd_readte=
st]

I patched mtd_readtest.c with this:
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readt=
est.c
index 79fc453..9edd658 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -130,7 +130,7 @@ static int is_block_bad(int ebnum)
        loff_t addr =3D ebnum * mtd->erasesize;
        int ret;

-       ret =3D mtd->block_isbad(mtd, addr);
+       ret =3D mtd->block_isbad ? mtd->block_isbad(mtd, addr) : 0;
        if (ret)
                printk(PRINT_PREF "block %d is bad\n", ebnum);
        return ret;

After this, I ran mtd_readtest and it seemed to complete, but then
hang after it was done:
(initramfs) modprobe mtd_readtest dev=3D1
[  194.530000]
[  194.530000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  194.540000] mtd_readtest: MTD device: 1
[  194.540000] mtd_readtest: not NAND flash, assume page size is 512 bytes.
[  194.550000] mtd_readtest: MTD device size 32636928, eraseblock size
131072, page size 512, count of eraseblocks 249, pages per eraseblock
131072, OOB size 0
[  194.570000] mtd_readtest: scanning for bad eraseblocks
[  194.570000] mtd_readtest: scanned 249 eraseblocks, 0 are bad
[  194.580000] mtd_readtest: testing page read
[  194.960000] ------------[ cut here ]------------
[  194.960000] WARNING: at kernel/sched.c:5175 do_page_fault+0x16c/0x1ec()
[  194.960000] Modules linked in: mtd_readtest(+)
