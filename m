Received: from bay13-f53.bay13.hotmail.com ([64.4.31.53] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BXx26-0005FU-MB
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2004 02:58:00 -0400
From: "zhang hao" <zh_chaohao@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 09 Jun 2004 06:57:55 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY13-F53EymQtczmul0003ee3c@hotmail.com>
Subject: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I use kernel 2.4.18 and mtd-snapshot-20030110. My flash is 16M AMD/Fujitsu 
flash.I update cfi_cmdset_0002.c from v1.61 to 1.63.

My partitions is:
bootloader 16k
kernel 2032k
rootfs 6M

If I boot up the board, problem appears like this:

"...........................................
Empty flash at 0x002fdffc ends at 0x002fe000
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 40k freed
init-2.05a# mount -t jffs2 /dev/mtdblock2 /tmp
Waiting for write to complete timed out in do_write_oneword.<5>Write of 68 
bytes at 0x002fe
514 failed. returned -5, retlen 0
Not marking the space at 0x002fe514 as dirty because the flash driver 
returned retlen zero
can't create lock file /etc/mtab~9: Input/output error (use -n flag to 
override)
init-2.05a# cd bin
Node CRC 27c9a666 != calculated CRC 3a68bebd for node at 0003567c
Node CRC 277ca666 != calculated CRC eab325e6 for node at 00035e18
Node CRC 27cea666 != calculated CRC 70c74bd7 for node at 000366bc
Node CRC 2784a666 != calculated CRC 44fe4247 for node at 00036e28
Node CRC 2771a666 != calculated CRC 14440ce0 for node at 00037554
Node CRC 270fa666 != calculated CRC 8df1f32c for node at 00037ce0
Node CRC 270ea666 != calculated CRC d639ca66 for node at 00038568
Node CRC 271fa666 != calculated CRC 56581f9a for node at 00038c44
Node CRC 271fa666 != calculated CRC 56581f9a for node at 00038c44
Node CRC 271fa666 != calculated CRC 56581f9a for node at 00038c44
Waiting for write to complete timed out in do_write_oneword.<5>Write of 68 
bytes at 0x002fe
514 failed. returned -5, retlen 4
Node CRC f61f06e7 != calculated CRC fc464067 for node at 00038c44
Node CRC f61f06e7 != calculated CRC fc464067 for node at 00038c44
................................................................."

any advice?
thanks.

               zhanghao

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn  
