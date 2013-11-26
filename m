Date: Tue, 26 Nov 2013 09:40:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Arnaud Ebalard <arno@natisbad.org>
Subject: Re: [PATCH v5 00/14] Armada 370/XP NAND support
Message-ID: <20131126124003.GA2344@localhost>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <87d2lp28pd.fsf@natisbad.org> <20131125120335.GD2408@localhost>
 <87r4a4f5gr.fsf@natisbad.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r4a4f5gr.fsf@natisbad.org>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arnaud,

On Tue, Nov 26, 2013 at 12:04:52AM +0100, Arnaud Ebalard wrote:
> 
> And \o/ i.e. here is what I get:
> 
> root@mood:~# dmesg
> ...
> pxa3xx-nand d00d0000.nand: This platform can't do DMA on this device
> NAND device: Manufacturer ID: 0xad, Chip ID: 0xf1 (Hynix H27U1G8F2BTR-BC)
> NAND device: 128MiB, SLC, page size: 2048, OOB size: 64
> Bad block table found at page 65472, version 0x01
> Bad block table found at page 65408, version 0x01
> 5 ofpart partitions found on MTD device pxa3xx_nand-0
> Creating 5 MTD partitions on "pxa3xx_nand-0":
> 0x000000000000-0x000000180000 : "u-boot"
> 0x000000180000-0x0000001a0000 : "u-boot-env"
> 0x000000200000-0x000000800000 : "uImage"
> 0x000000800000-0x000001800000 : "minirootfs"
> 0x000001800000-0x000008000000 : "jffs2"
> ...
> 
> root@mood:~# ls /dev/mtd
> mtd0       mtd1ro     mtd3       mtd4ro     mtdblock2  
> mtd0ro     mtd2       mtd3ro     mtdblock0  mtdblock3  
> mtd1       mtd2ro     mtd4       mtdblock1  mtdblock4  
> 
> root@mood:~# dd if=/dev/mtd2ro of=/tmp/foo
> 12288+0 records in
> 12288+0 records out
> 6291456 bytes (6.3 MB) copied, 1.98731 s, 3.2 MB/s
> 
> root@mood:~# file /tmp/foo 
> /tmp/foo: u-boot legacy uImage, Linux-3.12.0.rn102-00048-gbe408c, Linux/ARM, OS Kernel Image (Not compressed), 3740317 bytes, Tue Nov  5 22:24:01 2013, Load Address: 0x00008000, Entry Point: 0x00008000, Header CRC: 0xD84586E1, Data CRC: 0xC4357CED

Good!

> 
> But then /o\ i.e. write does not seem to work out of the box ;-)
> 
> root@mood:~# flash_erase /dev/mtd2 0 0 
> Erasing 128 Kibyte @ 5e0000 -- 100 % complete 
> root@mood:~# nand
> nanddump   nandtest   nandwrite  
> root@mood:~# nandwrite -p /dev/mtd2 /tmp/uImage
> Writing data to block 0 at offset 0x0
> [ 1456.154142] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1456.354143] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1456.554144] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1456.754141] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1456.954140] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1457.154140] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1457.354140] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1457.554140] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1457.754140] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1457.954197] pxa3xx-nand d00d0000.nand: Wait time out!!!
> [ 1458.154140] pxa3xx-nand d00d0000.nand: Wait time out!!!
> 

Yes, this behavior was expected, and it is the reason I wanted to try with
the 'pxa3xx' compatible.

> But I guess this gives you some hints on possible directions.
> 

Indeed! Thanks a lot for such detailed testings. Can you test this
branch instead (you will have to add the DTS for your board)?

  https://github.com/MISL-EBU-System-SW/mainline-public/tree/pxa3xx-armada-nand-new-ecc

It's basically v3.13-rc1, plus latest NAND patches (cherry-picked
from l2-mtd.git), plus a couple more patches to support 2048 pages.

Using this branch you should be able to have detect the device
and test read/write without any issues. You previous DT node should work:

nand@d0000 {
	status = "okay";
	num-cs = <1>;
	marvell,nand-keep-config;
	marvell,nand-enable-arbiter;
	nand-on-flash-bbt;
};


Thanks a lot!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
