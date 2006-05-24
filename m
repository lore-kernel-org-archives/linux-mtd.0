Received: from [202.108.3.160] (helo=vip3-160.sinamail.sina.com.cn)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FikKx-00046k-RQ
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 23:47:28 -0400
Message-ID: <20060524034656.74939.qmail@vip3-160.sinamail.sina.com.cn>
Date: Wed, 24 May 2006 11:46:56 +0800
MIME-Version: 1.0
From: superlidu@vip.sina.com
To: linux-mtd@lists.infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
Subject: fdisk problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Now I am building my ARM board, and use the Samsung\'s nand flash as the main 

storage. I register the NAND flash as a general disk in to the system.after that I patition 



the disk with the following steps

/*****************************************************************/

fdisk /dev/sbulla

command : n

Command action

   e   extended

   p   primary partition (1-4)

p

Partition number (1-4): 1

First cylinder (1-384, default 1):

Using default value 1

Last cylinder or +size or +sizeM or +sizeK (1-384, default 384): 256



Command (m for help): n

Command action

   e   extended

   p   primary partition (1-4)

p

Partition number (1-4): 2

First cylinder (257-384, default 257):

Using default value 257

Last cylinder or +size or +sizeM or +sizeK (257-384, default 384):

Using default value 384



Command (m for help): w

The partition table has been altered!

/****************************************************************/

after the above steps, I use the \'fdisk -l\', then print the result:



/dev/sbulla: 25 MB, 25165824 bytes

16 heads, 8 sectors/track, 384 cylinders

Units = cylinders of 128 * 512 = 65536 bytes



      Device Boot    Start       End    Blocks   Id  System

/dev/sbulla1             1         256       16380   83  Linux

/dev/sbulla2             257         384        8192   83  Linux

but I \\'cat /proc/partitions\\', the result is not the same with above

major minor  #blocks  name



  44     0      24576 sbulla

  44     1      16380 sbulla1



there is no sbulla2, why?

and more, after \\'mknod /dev/sbulla1 b 44 1\\', then I can use \\'mkfs.ext2 /dev/sbulla\\'. if  



\'mknod /dev/sbulla2 b 44 2\', I can not use \'mkfs.ext2 /dev/sbulla\', the result is 

mkfs.ext2: mke2fs 1.37 (21-Mar-2005)

mkfs.ext2: Could not determine filesystem size



anyone can help me? thanks a lot !



Br,

sword
