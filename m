Received: from cerga.lunarpages.com ([67.210.123.115])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RzcqT-0003fk-PC
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2012 23:40:39 +0000
Received: from [201.137.176.56] (helo=[10.25.3.10])
 by cerga.lunarpages.com with esmtpa (Exim 4.69)
 (envelope-from <elopez@softel.net.mx>) id 1RzcqG-0002tv-27
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2012 15:40:24 -0800
Message-ID: <4F4285AF.30300@softel.net.mx>
Date: Mon, 20 Feb 2012 17:41:03 +0000
From: Esteban Lopez <elopez@softel.net.mx>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: df -h, du -ahx and flash size  not match
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello List

I have a linux box with debian 5, kernel 2.6.27, running over a nand 
flash with two partitions

cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00020000 "Partition 1"
mtd1: 1c000000 00020000 "Partition 2"

The Partition 2 is my ROOTFS where I have ubifs. The size of this 
partition is 0x1c000000=469762048 bytes


My ubinfo output is this

ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi0

ubi0:
Volumes count:                           1
Logical eraseblock size:                 129024
Total amount of logical eraseblocks:     3583 (462292992 bytes, 440.9 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       1
Count of reserved physical eraseblocks:  35
Current maximum erase counter value:     33
Minimum input/output unit size:          2048 bytes
Character device major/minor:            253:0
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        3544 LEBs (457261056 bytes, 436.1 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 253:1


Like you can see I have 3544 LEBS to work = 457261056 bytes

Well my question is that if I run a df -h commnad I get this output
df -h
Filesystem            Size  Used Avail Use% Mounted on
tmpfs                  30M     0   30M   0% /lib/init/rw
udev                   10M   48K   10M   1% /dev
tmpfs                  30M  4.0K   30M   1% /dev/shm
rootfs                236M  161M   75M  69% /
/tmp                   30M     0   30M   0% /tmp

Why only 236M???


If I create big files and I run du -ahx command over / I get a  total of 
593M
  of info
Why the size not match ? why I can have 593M in my ROOTFS if I only have 
469762048 bytes?? Why df -h report 161M used in rootfs if du report 593M?

Could you help me to understand this?

Thank you !!!
