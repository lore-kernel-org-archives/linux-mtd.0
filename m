Received: from [202.108.35.238] (helo=sina.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rKC8-0005hn-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Mar 2002 14:51:05 +0000
Message-ID: <20020330144506.12877.qmail@sina.com>
From: fyaowen <fyaowen@sina.com>
To: linux-mtd@lists.infradead.org
Subject: problem with build jffs2 filesystem
MIME-Version: 1.0
Date: Sat, 30 Mar 2002 22:45:06 +0800
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

Hi, all
I am running linux-2.4.2-rmk2-np2 on Assabet + Neponset.
There is total 64M flash memory on them. I have patitioned it 
as follows:
  length      device      name      
0x00040000     mtd0     bootloader   \
0x000c0000     mtd1     kernel        |
0x00300000     mtd2     ramdisk       |  on Assabet (32M)
0x01c00000     mtd3     apps         /
0x00040000     mtd4     bootloader1  \
0x000c0000     mtd5     kernel1       | 
0x00300000     mtd6     ramdisk1      |  on Neponset(32M) 
0x00e00000     mtd7     apps1         |
0x00e00000     mtd8     apps2        /

I want to make jffs2 filesystem on mtd7: 
   mkfs.jffs2 -e 0x00040000 -p -r some/dir -o jffs2.image
   (build a jffs2 image, am I right?)

   dd if=jffs2.image of=/dev/mtd7
   mount -t jffs2 /dev/mtd7 /mnt

After I gave out this instruction, all partitions on Neponset were erased. 

This is the messages from the kernel.
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00000000: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00000004: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00000008: 0xffff instead
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00040000: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00040004: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00040008: 0xffff instead
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00080000: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00080004: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1984 not found at 0x00080008: 0xffff instead
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased

What's wrong with it? 
Any help is appreciated.

fyaowen

______________________________________

===================================================================
新浪免费电子邮箱 (http://mail.sina.com.cn)
新浪分类信息：二手市场走一走，该出手时就出手！ (http://classad.sina.com.cn/2shou/)
