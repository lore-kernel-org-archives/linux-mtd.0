Received: from email.aftek.com ([128.121.126.111])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EO6W-0004eT-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2001 05:36:04 +0100
Message-ID: <001e01c0fd31$331d58c0$4f00000a@ashwin>
From: "Ashwin" <ashwinp@aftek.com>
To: <linux-mtd@lists.infradead.org>, <jffs-dev@axis.com>
Subject: jffs mount fails
Date: Mon, 25 Jun 2001 10:11:44 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi ,
I am using a L7205 board from linkup with amd flash.I managed to get mtd
working on the board. The problem comes when I try to mount the jffs the
system oppses. from what I get from the debug messages below is that the
routine tries to read flash from 0 to 8388608.
I have mapped my flash at physical location 800000 with size 400000 uisng
physmap.
what I think is that the start and end address in the routine
jffs_scan_flash are going wrong and the start should be
 map->map_priv_1 and end should be map->map_priv_1 + 400000.Or just the end
address is going wrong because the data shown in dump is from the flash
region in question.
As the end address may be wrong the kernel oppses since it is trying to read
beyond actually mapped memory.
Am I correct?What should be done to solve this problem?
below is the capture of the screen.

#erase /dev/mtd0
*MTD_open
*GET_MTD_DEVICE okay
*MTD_ioctl
Era*MTD_ioctl
*erase : 0x0 0x20000 0x0 0x800000
sesize 0x20000
Performing Flash Erase of length 131072 at offset 0*erase ret OK
don*MTD_close
*sync
*sync end
# cd /
# cp /bin/ls /root/
# mkfs.jffs -d /root/ > jffs.img
Constructing JFFS filesystem...
root
ls
# cp jffs.img /dev/mtd0
*MTD_open
*GET_MTD_DEVICE okay
*MTD_write
*<6>MTD_write
.
.
*<6>MTD_write
*<6>MTD_close
*sync
*sync end
# mknod /dev/mtdblock0 b 31 0
# mount -t jffs /dev/mtdblock0 /mnt
* MAJOR1 31
* MAX_BLK 1
* MAX_BLK 31
*mtdblock_open
*ok
*JFFS: Trying to mount device 1f:00.
*jffs_scan_flash(): start pos = 0x0, end = 0x8388608
*jffs_scan_flash(): Bad checksum: checksum = 6926185, raw_inode.dchksum =
3009104
*jffs_scan_flash(): Bad checksum: checksum = 3552929, raw_inode.dchksum =
1302987
*jffs_scan_flash(): 0xff at pos 0x49960.
*jffs_scan_flash(): 0xff ended at pos 0x65536.
**************** Dirty flash memory or bad inode: hexdump(pos = 0x65536, len
= 128):
*65536:* 69*6c* 20*31* 32*30* 20*70* 72*61* 62*68* 61*74* 73*75*
*i*l*.*1*2*0*.*p*r*a*b*h*a*t*s*u*
*65552:* 6e*69* 6c*20* 70*61* 74*69* 6c*20* 31*32* 30*20* 70*72*
*n*i*l*.*p*a*t*i*l*.*1*2*0*.*p*r*
*65568:* 61*62* 68*61* 74*73* 75*6e* 69*6c* 20*70* 61*74* 69*6c*
*a*b*h*a*t*s*u*n*i*l*.*p*a*t*i*l*
*65584:* 20*31* 32*30* 20*70* 72*61* 62*68* 61*74* 73*75* 6e*69*
*.*1*2*0*.*p*r*a*b*h*a*t*s*u*n*i*
*65600:* 6c*20* 70*61* 74*69* 6c*20* 31*32* 30*20* 70*72* 61*62*
*l*.*p*a*t*i*l*.*1*2*0*.*p*r*a*b*
*65616:* 68*61* 74*73* 75*6e* 69*6c* 20*70* 61*74* 69*6c* 20*31*
*h*a*t*s*u*n*i*l*.*p*a*t*i*l*.*1*
*65632:* 32*30* 20*70* 72*61* 62*68* 61*74* 73*75* 6e*69* 6c*20*
*2*0*.*p*r*a*b*h*a*t*s*u*n*i*l*.*
*65648:* 70*61* 74*69* 6c*20* 31*32* 30*20* 70*72* 61*62* 68*61*
*p*a*t*i*l*.*1*2*0*.*p*r*a*b*h*a*
*Unable to handle kernel paging request at virtual address c2c00000
*current->tss.memmap = F1348000
**pgd = f002f011*, *pmd = f002f011*, *pte = 00000000*
*Internal error: Oops: 2
*CPU: 0
*pc : [<c00d82a4>] lr : [<c00d6718>]
sp : c134fcb4 ip : c2800000 fp : 00000000
*sp : c134fcb4 ip : c2800000 fp : 00000000

Please guide me and correct me if I am going wrong somewhere.
Thanks ,
Regards,
Ashwin
