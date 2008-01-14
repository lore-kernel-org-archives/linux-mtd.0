Received: from ocean.emcraft.com ([213.221.7.182])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEP3j-0005Fq-4l
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 13:08:59 +0000
Received: from [172.17.0.11] (helo=iron.emcraft.com)
	by ocean.emcraft.com with esmtp (Exim 4.43) id 1JEP0j-00010K-CK
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 16:05:56 +0300
Content-Disposition: inline
From: Yuri Tikhonov <yur@emcraft.com>
To: linux-mtd@lists.infradead.org
Subject: Block Device Emulation over UBI
Date: Mon, 14 Jan 2008 15:57:18 +0300
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200801141557.18349.yur@emcraft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 Hello all,

 We are about to implement and then maintain a block device driver which is 
intended to work on the top of UBI and provide users with the block-device 
interface to the underlying Flash chips. The goal of this driver is to 
provide users with the possibility to easily organize reliable file storage 
in Flash memory chips (especially NAND Flash) using Flash-unaware 
file-systems like FAT, EXT2/3, etc (UBI is supposed to provide the necessary 
reliability using its features of wear-leveling and bad blocks handling).

 In many cases the ability to have the file-system formatted with, for 
example, FAT is a highly desirable feature of the embedded devices (e.g. for 
exporting the embedded storage via USB link to a Windows-based USB host), so 
we guess our work will be usefull for the embedded world.

 Any suggestions or comments as to possible issues we may run into on this 
road would be very appreciated.

 Regards, Yuri

-- 
Yuri Tikhonov, Senior Software Engineer
Emcraft Systems, www.emcraft.com
