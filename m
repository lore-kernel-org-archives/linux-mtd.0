Received: from mail.newlogic.at ([194.208.88.201])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19yvMZ-0006DH-VU
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 16:34:04 +0100
Received: from enterprise2.newlogic.at (e2-1.newlogic.at [172.27.1.1])
	by mail.newlogic.at (8.12.9/8.12.9) with ESMTP id h8FFWdYu004141
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Sep 2003 17:32:39 +0200 (MEST)
Received: from blade100-2 (blade100-2.newlogic.at [172.27.120.2])
	h8FFWrZS029259	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Sep 2003 17:32:53 +0200 (MEST)
Message-Id: <200309151532.h8FFWrZS029259@enterprise2.newlogic.at>
MIME-Version: 1.0
In-Reply-To: <200309151049.h8FAn2ZS023621@enterprise2.newlogic.at>
Date: Mon, 15 Sep 2003 17:32:53 +0200 (MEST)
Sender: nwaibel@newlogic.com
From: Niki Waibel <niki.waibel@newlogic.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: RE: Unknown flash chip found: 55 55
Reply-To: Niki Waibel <niki.waibel@newlogic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

okay -- this 0x55 i get is because the
CDSNIO buffer starts with 0x55 (55 aa 10 eb ...).

the problem: if i read the 512byte buffer like
for(i=0; i<512-1; i++) {
        buf[offset++] = doc_read(bios, _CDSNIO_BASE);
}
then i get the same value all the time.
am i correct that the value should change during reads?

in addition i have the problem that if i read a
page more times then some values change ...

all this seems to be like a timing issue...
i am testing with modified version of flash_rom.c
from the linuxbios project. a userspace prg is
much more handy then the kernel modules.

i tried different kind of reads ... pipelined and
also the SlowIO stuff --- same result.

maybe i did sthg wrong when selecting the page.

can someon tell me if this code is fine:
===
static void
doc_write_cdsncontrol(volatile char *bios, unsigned char data)
{
        doc_write(data, bios, _CDSNControl);
        doc_read_4nop(bios);
} /* static void doc_write_cdsncontrol(volatile char *bios,
        unsigned char data) */
int
cmd(volatile unsigned char *bios, unsigned char cmd)
{
        doc_write_cdsncontrol(bios, CDSN_CTRL_CLE|CDSN_CTRL_CE);
        doc_write(cmd, bios, _CDSNIO_BASE);
        doc_write(0, bios, WritePipelineTermination);
        doc_write_cdsncontrol(bios, CDSN_CTRL_CE);
        if(doc_wait(bios, 5000)) {
                printf("outch...\n");
                return(-1);
        }
        return(0);
}
int
adr(volatile unsigned char *bios, unsigned int adr)
{
        doc_write_cdsncontrol(bios, CDSN_CTRL_ALE|CDSN_CTRL_CE);
        doc_write(            0, bios, _CDSNIO_BASE);
        doc_write((adr>>0)&0xff, bios, _CDSNIO_BASE);
        doc_write((adr>>8)&0xff, bios, _CDSNIO_BASE);
        doc_write_cdsncontrol(bios, CDSN_CTRL_CE);
        if(doc_wait(bios, 5000)) {
                printf("outch...\n");
                return(-1);
        }
        return(0);
}
===

no more ideas ...,  niki


On 15-Sep-2003 Niki Waibel wrote:
> i am playing with the md2802-d08 and i get:
> ===
> Sep 12 13:43:51 epiam-1 kernel: Unknown flash chip found: 55 55
> Sep 12 13:43:51 epiam-1 kernel: Please report to dwmw2@infradead.org
> ===
> 
> i doublechecked with my userspace tool and i get the same values
> for manuf id and dev id:
> ===
> [root@epiam-1 root]#
> /home/niki/packages/freebios-20030910.new/util/flash_and_burn/flash_rom -r xxx
> Calibrating timer since microsleep sucks ... takes a second
> Setting up microsecond timing loop
> 118M loops per second
> OK, calibrated, now do the deed
> Enabling flash write on VT8235...OK
> Trying Am29F040B, 512 KB
> probe_29f040b: id1 0x55, id2 0xaa
> Trying At29C040A, 512 KB
> probe_jedec: id1 0x55, id2 0xaa
> Trying Mx29f002, 256 KB
> probe_29f002: id1 85, id2 170
> Trying SST29EE020A, 256 KB
> probe_jedec: id1 0x55, id2 0xaa
> Trying SST28SF040A, 512 KB
> probe_28sf040: id1 0x55, id2 0xaa
> Trying SST39SF020A, 256 KB
> probe_39sf020: id1 0x55, id2 0xaa
> Trying SST39VF020, 256 KB
> probe_39sf020: id1 0x55, id2 0xaa
> Trying W29C011, 128 KB
> probe_jedec: id1 0x55, id2 0xaa
> Trying W29C020C, 256 KB
> probe_jedec: id1 0x55, id2 0xaa
> Trying W49F002U, 256 KB
> probe_49f002: id1 0x55, id2 0xaa
> Trying M29F400BT, 512 KB
> probe_m29f400bt: id1 0x55, id2 0x10
> Trying 82802ab, 512 KB
> probe_82802ab: id1 0x55, id2 0xaa
> Trying 82802ac, 1024 KB
> probe_82802ab: id1 0xff, id2 0xff
> Trying MD-2802 (M-Systems DiskOnChip Millennium Module), 8 KB
> probe_md2802:
> probe_md2802: *******************************
> probe_md2802: * THIS IS A PRE ALPHA VERSION *
> probe_md2802: * IN THE DEVELOPEMENT *********
> probe_md2802: * PROCESS RIGHT NOW. **********
> probe_md2802: *******************************
> probe_md2802: * IF YOU ARE NOT A DEVELOPER **
> probe_md2802: * THEN DO NOT TRY TO READ OR **
> probe_md2802: * WRITE TO THIS DEVICE ********
> probe_md2802: *******************************
> probe_md2802:
> probe_md2802: switching on reset mode ...
> probe_md2802: switching on reset mode ... done
> probe_md2802: switching off reset mode ...
> probe_md2802: switching off reset mode ... done
> probe_md2802:
> probe_md2802: switching off write protection ...
> probe_md2802: switching off write protection ... done
> probe_md2802:
> probe_md2802: IPL_0x0000: 0x55
> probe_md2802: IPL_0x0001: 0xaa
> probe_md2802: IPL_0x0002: 0x10
> probe_md2802: IPL_0x0003: 0xeb
> probe_md2802:
> probe_md2802: ChipID: 0x30
> probe_md2802: DOCStatus: 0x01
> probe_md2802: FloorSelect: 0x00
> probe_md2802: CDSNControl: 0x80
> probe_md2802: CDSNDeviceSelect: 0x00
> probe_md2802: ECCConfiguration: 0x82
> probe_md2802: CDSNSlowIO: 0x82
> probe_md2802: ECCSyndrome0: 0xff
> probe_md2802: ECCSyndrome1: 0x00
> probe_md2802: ECCSyndrome2: 0xff
> probe_md2802: ECCSyndrome3: 0xff
> probe_md2802: ECCSyndrome4: 0xff
> probe_md2802: ECCSyndrome5: 0xff
> probe_md2802: AliasResolution: 0x00
> probe_md2802: ConfigurationInput: 0x01
> probe_md2802: ReadPipelineInitialization: 0x01
> probe_md2802: LastDataRead: 0x55
> probe_md2802:
> probe_md2802: checking ECCConfiguration toggle bit
> probe_md2802: 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00
> probe_md2802: toggle result: 0/5
> MD-2802 (M-Systems DiskOnChip Millennium Module) found at physical address:
> 0xffffe000
> Part is MD-2802 (M-Systems DiskOnChip Millennium Module)
> Reading Flash...read_md2802: nand maf: 0x55; nand dev: 0x55
> done
> [root@epiam-1 root]# 
> ===
> 
> any ideas?
> 
> niki
