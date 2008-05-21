Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JylLd-0005F9-NV
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 10:15:06 +0000
Message-ID: <4833F626.1060600@feig.de>
Date: Wed, 21 May 2008 12:15:02 +0200
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 ?!
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have lot of problems concerning my NANDflash:

I?ve downloaded mtd-utils 1.1.0 and compiled it on my host pc [Suse 
Linux 10.2 - Kernel 2.6.18]

I enter:
mkfs.jffs2 -d /exports/ -p -s 0x800 -e 0x20000 -n -l -o /RFS.jffs2

NAND Flash has Pagesize = 2048 Byte = 2kByte
EraseBlockSize= 128 kByte
oob = 64

I could mount the Image on my target [linux 2.6.25.3]through:

mount -rw -t jffs2 /dev/mtdblock5 /media/DATAfs

BUT:
If I want to write to the device like: touch /media/DATAfs/test.txt
and then unmount /media/DATAfs/test.txt
and mount -rw -t jffs2 /dev/mtdblock5 /media/DATAfs


There?s an message:

empty flash at [address] end at [address] !!!!!!!!!!!!!!!!!!!!!!!


Please help me........
