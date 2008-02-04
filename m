Received: from rv-out-0910.google.com ([209.85.198.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JM2Af-0005RS-EF
	for linux-mtd@lists.infradead.org; Mon, 04 Feb 2008 14:19:49 +0000
Received: by rv-out-0910.google.com with SMTP id c24so2668005rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Feb 2008 06:19:37 -0800 (PST)
Message-ID: <47A71EF4.2090202@gmail.com>
Date: Mon, 04 Feb 2008 09:19:32 -0500
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtdblock mount issue
Content-Type: multipart/mixed; boundary="------------020403050503050509090401"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020403050503050509090401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am trying to mount a cramfs partition from flash. I have the low level 
driver written and MTDBLOCK_RO module is enabled in MTD,

My mount fails with invalid argument error.

/mount: Mounting /dev/mtdblock on /home/crfs failed: Invalid argument/

I am using a 512 byte NAND flash 16byte spare.

I can find cramfs in /proc/filesytems and the mtdblock is under 
/proc/devices.

I had enabled a few debug statements in the mtdblock_ro and the low 
level nand driver code. I find that the mount is reading 32 pages after 
which it fails with invalid argument. Below is the log.

If you see the log below, the flow of code is

 cramfs_read ==> do_blktrans_request ==> mtdblock_readsect ==> 
mt_read(my low level read function which returns success)

I even dumped the hex of the data being read by my low level driver 
module and found to match the cramfs image that I wrote to the flash.


######################*LOG*##########################

/home # mkdir crfs
/home # cat /proc/devices | grep mtdblock
 31 mtdblock
/home # cat proc/filesystems | grep cramfs
    cramfs
/home #
/home # mknod /dev/mtdblock b 31 0
/home # mount -t cramfs /dev/mtdblock /home/crfs
mount: /dev/mtdblock is write-protected, mounting read-only
cramfs_read
do_blktrans_request nsect:8 block:0
mtdblock_readsect
mt_read offset:0
mt_read status:0
mtdblock_readsect
mt_read offset:512
mt_read status:0
mtdblock_readsect
mt_read offset:1024
mt_read status:0
mtdblock_readsect
mt_read offset:1536
mt_read status:0
mtdblock_readsect
mt_read offset:2048
mt_read status:0
mtdblock_readsect
mt_read offset:2560
mt_read status:0
mtdblock_readsect
mt_read offset:3072
mt_read status:0
mtdblock_readsect
mt_read offset:3584
mt_read status:0
do_blktrans_request nsect:8 block:0
mtdblock_readsect
mt_read offset:4096
mt_read status:0
mtdblock_readsect
mt_read offset:4608
mt_read status:0
mtdblock_readsect
mt_read offset:5120
mt_read status:0
mtdblock_readsect
mt_read offset:5632
mt_read status:0
mtdblock_readsect
mt_read offset:6144
mt_read status:0
mtdblock_readsect
mt_read offset:6656
mt_read status:0
mtdblock_readsect
mt_read offset:7168
mt_read status:0
mtdblock_readsect
mt_read offset:7680
mt_read status:0
do_blktrans_request nsect:8 block:0
mtdblock_readsect
mt_read offset:8192
mt_read status:0
mtdblock_readsect
mt_read offset:8704
mt_read status:0
mtdblock_readsect
mt_read offset:9216
mt_read status:0
mtdblock_readsect
mt_read offset:9728
mt_read status:0
mtdblock_readsect
mt_read offset:10240
mt_read status:0
mtdblock_readsect
mt_read offset:10752
mt_read status:0
mtdblock_readsect
mt_read offset:11264
mt_read status:0
mtdblock_readsect
mt_read offset:11776
mt_read status:0
do_blktrans_request nsect:8 block:0
mtdblock_readsect
mt_read offset:12288
mt_read status:0
mtdblock_readsect
mt_read offset:12800
mt_read status:0
mtdblock_readsect
mt_read offset:13312
mt_read status:0
mtdblock_readsect
mt_read offset:13824
mt_read status:0
mtdblock_readsect
mt_read offset:14336
mt_read status:0
mtdblock_readsect
mt_read offset:14848
mt_read status:0
mtdblock_readsect
mt_read offset:15360
mt_read status:0
mtdblock_readsect
mt_read offset:15872
mt_read status:0
cramfs_read
mount: Mounting /dev/mtdblock on /home/crfs failed: Invalid argument
/home #

########################################################


I hope I have provided the maximum information. Looking forward for some 
help.

--------------020403050503050509090401
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:M S
n:S;M
version:2.1
end:vcard


--------------020403050503050509090401--
