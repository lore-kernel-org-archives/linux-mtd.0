Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1xsX-0007YZ-IG
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 10:00:11 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1R1xsW-0007Ug-BT
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 12:00:08 +0200
Received: from 89-97-203-114.ip19.fastwebnet.it ([89.97.203.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2011 12:00:08 +0200
Received: from marco_cantu_ranzani by 89-97-203-114.ip19.fastwebnet.it with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2011 12:00:08 +0200
To: linux-mtd@lists.infradead.org
From: marco <marco_cantu_ranzani@libero.it>
Subject: Re: ubiattach problem
Date: Fri, 9 Sep 2011 09:53:57 +0000 (UTC)
Message-ID: <loom.20110909T115341-832@post.gmane.org>
References: <1246888221.17871.5.camel@tlvorens3lnx>
	<1246889142.20721.293.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind <at> infradead.org> writes:

> 
> On Mon, 2009-07-06 at 16:50 +0300, Oren wrote:
> > HI,
> > 
> > I am trying to attached a ubi image to an MTD nand device.
> > I am using kerenl version 2.6.27.18.
> > using latest MTD-UTILS + ubi_utils.
> > 
> > For some reosone i get UBI error while trying to attache..
> > DO i miss someting?
> > 
> > 
> > dev:    size   erasesize  name
> > mtd0: 01000000 00020000 "NAND-block1"
> > mtd1: 01e00000 00020000 "jffs2"
> > mtd2: 05200000 00020000 "NAND-block2"
> > ./ubinfo
> > UBI version:                    1
> > Count of UBI devices:           0
> > UBI control device major/minor: 10:63
> > ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
> > ubiformat: mtd0 (nand), size 16777216 bytes (16.0 MiB), 128 eraseblocks
> > of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> > libscan: scanning eraseblock 127 -- 100 % complete  
> > ubiformat: 128 eraseblocks are supposedly empty
> > ubiformat: flashing eraseblock 16 -- 100 % complete  
> > ubiformat: formatting eraseblock 127 -- 100 % complete
> > ubiattach /dev/ubi_ctrl -m 0  
> > [42949485.550000] UBI error: ubi_read_volume_table: the layout volume
> > was not found
> > [42949485.560000] UBI error: ubi_attach_mtd_dev: failed to attach by
> > scanning, error -22
> > ubiattach: error!: cannot attach mtd0
> >            error 22 (Invalid argument)
> 
> Looks strange. Does dmesg has anything interesting when you enable
> UBI debugging?
> (http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport)
> 


NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit)
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad eraseblock 4236 at 0x000021180000

Creating 5 MTD partitions on "NAND 1GiB 3,3V 8-bit":
0x000000000000-0x000000040000 : "bootloader"
0x000000040000-0x000000060000 : "param"
0x000000060000-0x000000560000 : "Kernel"
0x000000560000-0x000040560000 : "root"
mtd: partition "root" extends beyond the end of device "NAND 1GiB 3,3V 8-bit" --
size truncated to 0x3faa0000
0x000000000000-0x000040000000 : "nand"

>> ubiformat --version
1.5


>>ls -la /dev/ubi_ctrl 
crw-rw----    1 root     root       10,  58 Sep  5  2011 /dev/ubi_ctrl

First time:


>> ubiformat /dev/mtd3 -y -e 0 
ubiformat: mtd3 (nand), size 1068105728 bytes (1018.6 MiB), 8149 eraseblocks of
131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 8148 -- 100 % complete  
ubiformat: 8144 eraseblocks are supposedly empty
ubiformat: 5 bad eraseblocks found, numbers: 4193, 8145, 8146, 8147, 8148
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: formatting eraseblock 8148 -- 100 % complete  block 2397 -- 29 %
complete  

>> ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: max. sequence number:       0
UBI error: ubi_read_volume_table: the layout volume was not found
ubiattach: error!: cannot attach mtd3
           error 22 (Invalid argument)



Second time:


>> ubiformat /dev/mtd3 -y -e 0 -f /ubi.img 
ubiformat: mtd3 (nand), size 1068105728 bytes (1018.6 MiB), 8149 eraseblocks of
131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan:nand_bbt: Error while writing bad block table -5
libscan: scanning eraseblock 8148 -- 100 % complete  
ubiformat: 5 bad eraseblocks found, numbers: 4193, 8145, 8146, 8147, 8148
ubiformat: warning!: 8144 of 8144 eraseblocks contain non-ubifs data
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: flashing eraseblock 0 --  6 % complete  libmtd: error!: MEMERASE64
ioctl failed for eraseblock 0 (mtd3)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 0
           error 5 (Input/output error)
ubiformat: marking block 0 bad
libmtd: error!: MEMSETBADBLOCK ioctl failed for eraseblock 0 (mtd3)
        error 5 (Input/output error)
