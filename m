Received: from web15710.mail.cnb.yahoo.com ([202.165.102.77])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7nmH-0005hm-B5
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 00:21:53 -0400
Message-ID: <20040916031038.30732.qmail@web15710.mail.cnb.yahoo.com>
Date: Thu, 16 Sep 2004 11:10:38 +0800 (CST)
From: <gyf606-mtd@yahoo.com.cn>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1095234403.9144.964.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 filesystem on flash problem CRC errpr
Reply-To: gyf606-mtd@yahoo.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 --- David Woodhouse <dwmw2@infradead.org> wrote：
> 
> And new to email? Look at your mail at
> http://lists.infradead.org/pipermail/linux-mtd/2004-September/010425.html
> 
> Can you make sense of it? I can't :)
> 
> -- 
> dwmw2
> 

I'm sorry for the unreadable mail. ^_^

My problem is , I'm trying to set up jffs2 filesystem on my flash . The basic information of the
flash is :
-----------------------------------------------------
Bank # 1: AMD 29LV160BB (16 Mbit, bottom boot sector)
  Size: 4 MB in 35 Sectors
  Sector Start Addresses:
B0000000 (RO) B0008000 (RO) B000C000 (RO) B0010000 (RO) B0020000 (RO)
B0040000 B0060000 B0080000 B00A0000 B00C0000   
B00E0000 B0100000 B0120000 B0140000 B0160000     
B0180000 B01A0000 B01C0000 B01E0000 B0200000     
B0220000 B0240000 B0260000 B0280000 B02A0000     
B02C0000 B02E0000 B0300000 B0320000 B0340000     
B0360000 B0380000 B03A0000 B03C0000 B03E0000     
----------------------------------------------
dev:    size   erasesize  name
mtd0: 00040000 00020000 "u-boot"
mtd1: 000a0000 00020000 "kernel"
mtd2: 00020000 00020000 "config"
mtd3: 00200000 00020000 "ramfs"
mtd4: 00100000 00020000 "jffs2fs"
mtd5: 00800000 00020000 "mtdram test device"
-----------------------------------------
First I enabled jffs2 support in uClinux,
and then downloaded mkfs.jffs2 (version1.39) from internet and built the filesystem by 
./mkfs.jffs2 -b -e 0x20000 -d mydir -o fs.img
I copied fs.img to flash and when I tried to mount the filesystem, CRC failed error occurs.
The following is the process
---------------------------------------
/usr> ls
fs1.img
fs2.img
/usr> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "u-boot"
mtd1: 000a0000 00020000 "kernel"
mtd2: 00020000 00020000 "config"
mtd3: 00200000 00020000 "ramfs"
mtd4: 00100000 00020000 "jffs2fs"
mtd5: 00800000 00020000 "mtdram test device"
/usr> erase /dev/mtd4
Erase Total 1 Units
Performing Flash Erase of length 131072 at offset 0x0 done
/usr> cp fs2.img /dev/mtd4
/usr> mount -t jffs2 /dev/mtdblock4 /mnt
jffs2_scan_dirent_node(): Name CRC failed on node at 0x00000000: Read 0xca6598d0, calculated
0x00000000
Name for which CRC failed is (now) '', ino #2
jffs2_scan_dirent_node(): Name CRC failed on node at 0x00000070: Read 0xc1d3e37e, calculated
0x715da5a5
Name for which CRC failed is (now) 'readme.t', ino #3
jffs2_scan_inode_node(): Data CRC failed on node at 0x000000a4: Read 0x935644bc, calculated
0x73b2c32c
/usr>
----------------------------------
So, what's the reason? Is the format of the filesystem which I built with mkfs.jffs2 bad or there
is some problem with the uClinux system I configured?

It seems that the filesystem has been mounted , I can cd into the /mnt directory and see only part
of the folders and files , but there is always CRC errors.

Anybody can help me? or do you need more information ?

_________________________________________________________
Do You Yahoo!?
150万曲MP3疯狂搜，带您闯入音乐殿堂
http://music.yisou.com/
美女明星应有尽有，搜遍美图、艳图和酷图
http://image.yisou.com
1G就是1000兆，雅虎电邮自助扩容！
http://cn.rd.yahoo.com/mail_cn/tag/1g/*http://cn.mail.yahoo.com/event/mail_1g/
