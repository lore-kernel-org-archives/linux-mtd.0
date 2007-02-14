Received: from alnrmhc12.comcast.net ([206.18.177.52])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHPF6-0003Yd-0D
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 13:52:39 -0500
Message-ID: <45D35A6F.3060203@ringle.org>
Date: Wed, 14 Feb 2007 13:52:31 -0500
From: Jon Ringle <jon@ringle.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: P30 flash left in read status mode after a write
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We have a hardware architecture with a IXP455 processor that allows read 
access to a P30 flash attached to the IXP's expansion bus from a Pentium 
M that does it's access via the PCI bus. The flash has 4 partitions: 
Redboot, jffs2, fconfig, fis. I am running Linux 2.6.16.29 and I've 
found that whenever a write is done to the jffs2 filesystem that flash 
is left in read status mode and anything trying to do a read of flash 
directly reads only 0x0080. Reading from an mtd device seems to fix the 
problem. I modified the mapper utility from LDD3 so I could read flash 
directly from linux which illustrates the problem:

[root@rsc4 ~]# mapper /dev/mem 0x51fa0000 0x100 1|hexdump -C
mapped "/dev/mem" from 1375338496 (0x51fa0000) to 1375338752 (0x51fa0100)
00000000  00 00 10 00 0b ad fa ce  01 0c 01 00 62 6f 6f 74  
|............boot|
00000010  5f 73 63 72 69 70 74 00  00 00 00 01 04 11 01 0c  
|_script.........|
00000020  62 6f 6f 74 5f 73 63 72  69 70 74 5f 64 61 74 61  
|boot_script_data|
00000030  00 62 6f 6f 74 5f 73 63  72 69 70 74 00 25 7b 73  
|.boot_script.%{s|
00000040  6e 69 66 66 7d 0a 25 7b  67 6f 7d 0a 25 7b 66 69  
|niff}.%{go}.%{fi|
00000050  78 5f 7a 49 6d 61 67 65  7d 0a 00 00 00 00 00 00  
|x_zImage}.......|
00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  
|................|
*
00000100
[root@rsc4 ~]# touch xyz
[root@rsc4 ~]# mapper /dev/mem 0x51fa0000 0x100 1|hexdump -C
mapped "/dev/mem" from 1375338496 (0x51fa0000) to 1375338752 (0x51fa0100)
00000000  00 80 00 80 00 80 00 80  00 80 00 80 00 80 00 80  
|................|
*
00000100
[root@rsc4 ~]# cat /dev/mtd2 > /dev/null
[root@rsc4 ~]# mapper /dev/mem 0x51fa0000 0x100 1|hexdump -C
mapped "/dev/mem" from 1375338496 (0x51fa0000) to 1375338752 (0x51fa0100)
00000000  00 00 10 00 0b ad fa ce  01 0c 01 00 62 6f 6f 74  
|............boot|
00000010  5f 73 63 72 69 70 74 00  00 00 00 01 04 11 01 0c  
|_script.........|
00000020  62 6f 6f 74 5f 73 63 72  69 70 74 5f 64 61 74 61  
|boot_script_data|
00000030  00 62 6f 6f 74 5f 73 63  72 69 70 74 00 25 7b 73  
|.boot_script.%{s|
00000040  6e 69 66 66 7d 0a 25 7b  67 6f 7d 0a 25 7b 66 69  
|niff}.%{go}.%{fi|
00000050  78 5f 7a 49 6d 61 67 65  7d 0a 00 00 00 00 00 00  
|x_zImage}.......|
00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  
|................|
*
00000100

It appears that the MTD_XIP code has what I need to get flash out of 
read status mode after a write, however, since I'm not actually doing 
execute in place, it's overkill for my purposes. It seems that writing a 
xip_enable() function that puts flash in ready mode and leaving the 
other xip_* functions defined as nothing was a quick way to fix the 
problem in my case:

static void __xipram xip_enable(struct map_info *map, struct flchip *chip,
                unsigned long adr)
{
    struct cfi_private *cfi = map->fldrv_priv;
    if (chip->state != FL_POINT && chip->state != FL_READY) {
        map_write(map, CMD(0xff), adr);
        chip->state = FL_READY;
    }
    (void) map_read(map, adr);
}

This did indeed seem to fix the problem, but I'm not sure if I might 
inadvertently be causing some side effect. I believe that I might be 
taking a slight performance hit to consecutive jffs2 write operations 
because now each write operation will need to spend more cycles putting 
the flash in to a write mode.

Any advice would be appreciated.

Thanks,

Jon
