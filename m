From: vdoukhan@cbnco.com (Vladimir Doukhanine)
Date: Tue, 11 Feb 2003 12:36:05 -0500
Subject: cfi_cmdset_0002.c do_write_oneword(...) problem.
Message-ID: <oprkfxufr27bj7b7@cbnsitar.cbnco.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello,

I use the latest mtd from cvs, 2.4.19 kernel for sh-4 processor and
AMD AM29LV641DL (Dev.ID: 22D7 ) flash chip which is equal to Fujitsu 
MBM29LV650UE defined in jedec_probe.c.
The problem is that for some reason I can???t write more then one word of 
data without errors.
But if I have debug printf inserted in do_write_oneword(???) 
cfi_cmdset_0002.c everything looks OK.

I???ll appreciate any suggestions.
Have a look at my screenshot:

Thanks,
Vlad

P.S.One more thing - I can program this chip without any errors from an 
emulator with small assembler routine which supports two commands "Chip 
erase"(555-AA 2AA-55 555-80 555-AA 2AA-55 555-10)
and "Program" (555-AA 2AA-55 555-A0 PA-PD)from AM29LV641DL specification 
datasheet.




With debug printf in do_write_oneword :

# fcp test2.txt /dev/mtd4
MTD_open
MTD_ioctl
MTD_ioctl
MTD_write
do_write_oneword datum=0xa47 adr=0x00190000
MTD_read
MTD_close

# erase /dev/mtd4
MTD_open
Erase Total 1 UMTD_ioctl
MTD_ioctl
nits
MTD_ioctl
Performing Flash Erase of length 65536 at offset 0x0 done
MTD_close

# fcp test1.txt /dev/mtd4
MTD_open
MTD_ioctl
MTD_ioctl
MTD_write
do_write_oneword datum=0x4746 adr=0x00190000
do_write_oneword datum=0xff0a adr=0x00190002
MTD_read
MTD_close

# erase /dev/mtd4
MTD_open
Erase Total 1 UMTD_ioctl
MTD_ioctl
nits
MTD_ioctl
Performing Flash Erase of length 65536 at offset 0x0 done
MTD_close

# fcp test.txt /dev/mtd4
MTD_open
MTD_ioctl
MTD_ioctl
MTD_write
do_write_oneword datum=0x4241 adr=0x00190000
do_write_oneword datum=0x4443 adr=0x00190002
do_write_oneword datum=0x4645 adr=0x00190004
do_write_oneword datum=0xa47 adr=0x00190006
MTD_read
MTD_close

Without debug printf in do_write_oneword :

# fcp test2.txt /dev/mtd4     MTD_open
MTD_ioctl
MTD_ioctl
MTD_write
MTD_read
MTD_close

# erase /dev/mtd4
MTD_open
Erase Total 1 UMTD_ioctl
MTD_ioctl
nits
MTD_ioctl
Performing Flash Erase of length 65536 at offset 0x0 done
MTD_close

# fcp test1.txt /dev/mtd4
MTD_open
MTD_ioctl
MTD_ioctl
MTD_write
MTD_read
File does not seMTD_close
em to match flash data. First mismatch at 0x00000000-0x00000003

# erase /dev/mtd4
MTD_open
Erase Total 1 UMTD_ioctl
MTD_ioctl
nits
MTD_ioctl
Performing Flash Erase of length 65536 at offset 0x0 done
MTD_close

# fcp test.txt /dev/mtd4
MTD_open
MTD_ioctl
MTD_ioctl
MTD_write
MTD_read
File does not seMTD_close
em to match flash data. First mismatch at 0x00000000-0x00000008

# cat test2.txt
G
# cat test1.txt
FG
# cat test.txt
ABCDEFG
