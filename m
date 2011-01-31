Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pjmcr-0004QR-Jl
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2011 05:48:34 +0000
Received: by bwz5 with SMTP id 5so5241997bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jan 2011 21:48:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimSqWO_7hBhmBsRKtmm-S=dtJK1wjDv8ekby+3H@mail.gmail.com>
References: <AANLkTimVCusWk1qkeY4geXBQ0Bw=rM0mUAaFO32tyoy=@mail.gmail.com>
	<AANLkTimSqWO_7hBhmBsRKtmm-S=dtJK1wjDv8ekby+3H@mail.gmail.com>
Date: Mon, 31 Jan 2011 14:48:31 +0900
Message-ID: <AANLkTimkjy7KcO=QULXYubEPnrh4H1gPpYBL3yE7NDSy@mail.gmail.com>
Subject: Re: Question about CFI allocation
From: Mitsutaka Amano <mitsutaka.amano@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 26, 2011 at 11:43 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Wed, Jan 26, 2011 at 6:09 AM, Mitsutaka Amano
> <mitsutaka.amano@gmail.com> wrote:
>> Hi all, I'm a newbie about mtd.
>>
>> I'm trying to use the cfi on the mpc85xx board. Part of mtdblock is
>> used by rootfs. So I have questions.
>>
>> Why does CFI(or other flash memory) have to alloc to the vmalloc
>> area(such as PHYSMAP or PHYSMAP_OF)?
>
> The CFI code is not calling vmalloc explicitly.  It's calling ioremap,
> which happens to come from vmalloc space on most (all?) architectures.
>  It has to do that because otherwise the CFI driver can't get access
> to the physical flash because of the MMU.
I understand that CFI needs ioremap() -> vmalloc space for accessing
to the physical flash via MMU.

Why allocate amount of flash memory size? my board has 256MB flash
memory and be allocated 256MB over by of_flash_probe.
# cat /proc/vmallocinfo
0xc1000000-0xc1002000    8192 _mpic_map_mmio+0x1c/0x40 ioremap
0xc1004000-0xc1007000   12288 _mpic_map_mmio+0x1c/0x40 ioremap
0xc1008000-0xc100a000    8192 _mpic_map_mmio+0x1c/0x40 ioremap
0xc100c000-0xc100e000    8192 _mpic_map_mmio+0x1c/0x40 ioremap
0xc1010000-0xc1012000    8192 of_iomap+0x34/0x44 ioremap
0xc101c000-0xc101e000    8192 serial_dev_init+0x114/0x16c ioremap
0xc1020000-0xc1022000    8192 serial_dev_init+0x114/0x16c ioremap
0xc1023000-0xc102f000   49152 cramfs_uncompress_init+0x5c/0xa8 pages=11 vmalloc
0xc1030000-0xc1073000  274432 jffs2_zlib_init+0x18/0xc0 pages=66 vmalloc
0xc1074000-0xc1080000   49152 jffs2_zlib_init+0x54/0xc0 pages=11 vmalloc
0xc1082000-0xc1084000    8192 of_iomap+0x34/0x44 ioremap
0xc1086000-0xc1088000    8192 of_iomap+0x34/0x44 ioremap
0xc108a000-0xc108c000    8192 of_iomap+0x34/0x44 ioremap
0xc108e000-0xc1090000    8192 fsl_pq_mdio_probe+0xf4/0x474 ioremap
0xc1092000-0xc1094000    8192 fsl_pq_mdio_probe+0xf4/0x474 ioremap
0xc1096000-0xc1098000    8192 fsl_pq_mdio_probe+0xf4/0x474 ioremap
0xc109a000-0xc109c000    8192 usb_hcd_pci_probe+0x2c4/0x3a4 ioremap
0xc1100000-0xd1101000 268439552 of_flash_probe+0x290/0x814 ioremap

Thanks,
Mitsutaka

>
> The mtdblock driver does call vmalloc explicitly and that is because
> it creates a DRAM cache of the current eraseblock being written to.
> If it didn't do that, every write to the block device would generate a
> read/modify/erase/write cycle, which is fairly suboptimal.  So it will
> cache the writes to that block until it moves onto the next block, at
> which point it will flush the whole buffer back.  That helps with
> performance and flash lifetime (somewhat), but it does mean that usage
> of mtdblock can be prone to data loss in the event of a power failure,
> panic, or some other reset.
>
> It uses vmalloc because getting physically contiguous pages to cover a
> whole eraseblock (often 128KiB in size), is both unnecessary and will
> quite often fail after the board has been running for a bit due to
> page fragmentation.
>
> josh
>
