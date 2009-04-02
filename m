Received: from mail.feig.de ([195.145.139.42] helo=srv-mail02.feig.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLDo-00057Z-0o
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 11:36:48 +0000
Message-Id: <49D4BF5A.187F.00BC.1@feig.de>
Date: Thu, 02 Apr 2009 13:36:29 +0200
From: "Manuel Sahm" <Manuel.Sahm@feig.de>
To: <linux-mtd@lists.infradead.org>
Subject: Create, Flash and Mount UBIFS Images
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

Could anybody explain me how to build an ubi.img that I could flash
inside my system ? 

NAND Flash: Micron 256 MByte 
Physical Eraseblock Size = 131072 
Logical Eraseblock Size = 129024 
Min I/O Size = 2048 
SubPage = 512 

The Partition /dev/mtd6 is 32MByte. 


I did the following steps: 
On my host I created the file through: 

mkfs.ubifs -d /exports/ -m 2048 -e 129024 -o ubifs.img -x "none" -c
2047 
ubinize -p 128KiB -m 2048 -s 512 -O 512 -o ubi.img ubi.ini 

with ubi.ini 
[TEST] 
mode=ubi 
image=ubifs.img 
vol_id=0 
vol_size=3MiB 
vol_type=dynamic 
vol_alignment=1 
vol_flags=autoresize 

Then I copy this creted ubi.img to my embedded system. 

On my embedded system I did: 
flash_eraseall /dev/mtd6 
ubiformat /dev/mtd6 -s 512 -f ubi.img 
ubiattach /dev/ubi_ctrl -m6 -d6 -O512 
mount -t ubifs ubi6_0 /mnt/ubi6 

Then at the mount command I got the error: 
validate_sb: bad superblock 

So what´s wrong ? 

Thank you
