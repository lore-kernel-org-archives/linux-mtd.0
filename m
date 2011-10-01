Received: from mail05.home.net.pl ([62.129.252.15])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RA0yC-00022H-M9
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2011 14:55:17 +0000
Message-ID: <4E8729C8.1050305@data.pl>
Date: Sat, 01 Oct 2011 16:55:04 +0200
From: -= KuK =- <kuk@data.pl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem with JFFS2 mount
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have problem with creating image file from mounted jffs2 file system.

I have 1:1 dump from 1GB NAND which is UBI format.
But it contains JFFS part also.
This part can be downloaded from my server.
www.pouchx.com/PRV/HDS/K9G8G08U0M_Samsung_1GB_NAND_Config.ini_block_JFFS.rar

Archive contains two files. One is original JFFS copy, second is same 
file but I deleted ECC blocks.

I mount jffs image (noECC) with this script:

$ sudo apt-get install mtd-tools
$ sudo modprobe -v mtd
$ sudo modprobe -v jffs2
$ sudo modprobe -v mtdram total_size=8192 erase_size=256
$ sudo modprobe -v mtdchar
$ sudo modprobe -v mtdblock
$ sudo dd if=/HDS/Config.img of=/dev/mtd0
$ sudo mount -t jffs2 /dev/mtdblock0 /HDS/JFFS

After that I can see all 3 files that are in jffs image:
can_unique_id
Config.ini
MAC

I make no changes to these files.

That I want to make new image from mounted device.

I use this command:
$ sudo mkfs.jffs2 -r /HDS/JFFS -o /HDS/newimage.jffs2 -e 256 -l

Output file is only 696bytes.
www.pouchx.com/PRV/HDS/newconfig2.zip

Can anyone help me with this.
How can I get same image as original one?

In the future I want to edit Config.ini but now I just want to test that 
I will be able to create correct and working image.

Jakub
