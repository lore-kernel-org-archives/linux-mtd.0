Received: from [208.234.19.99] (helo=sensaphone.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9vvI-0004oN-WF
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 21:00:13 -0500
Received: from [10.1.2.108] (w219.z208177034.bos-ma.dsl.cnc.net
	[208.177.34.219])
	by sensaphone.com (8.12.10/8.12.10) with ESMTP id j2BJqjsS021859
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 14:52:45 -0500
Message-ID: <4231F713.9000605@yahoo.com>
Date: Fri, 11 Mar 2005 14:52:51 -0500
From: John Reynolds <jjreynolds2004@yahoo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Cirrus Logic EDB9302 JFFS2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
 I have a  Cirrus Logic EDB9302 pcb running Linux version 
2.4.21-rmk1-crus1.4.3,
and have a problem with a flash partition I created.
I followed the instructions in the Cirrus app note and setup
the kernel mtd stuff.  I've used various versions of
mkfs.jffs2, up to 1.42

     mkfs.jffs2 -r partition_dir -o output_file -e 0x20000 -p,

using a 128K erase block to match the MT28F128 chip.

I download the flash file into the pcb and write it  using
Reboot

  lo -r -v -b 0x1000000 jffs2.out
  fi cr  -r  -l  0x400000

creating a 4M partition.

I can mount /dev/mtdblock6 and read it ok. The files cmp
ok with the originals located in /etc. One thing I notice is
df indicated more usage that if should be, less then 50K
worth of files in a 4M partition showing  32% used !
When I starting witting or erasing files in the partition
on the following remount I get various errors and corrupt
files.

jffs2_scan_inode_node(): Data CRC failed on node at 0x000abc44: Read 
0x189aa386, calculated 0xefa9b9b2
jffs2_scan_inode_node(): CRC failed on node at 0x000afd54: Read 
0x09afa921, calculated 0xf472bf46
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000afd58: 
0x1044 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000afd5c: 
0x586d instead
 .
 .
 .

 Am I missing something ? Anyone have this problem or is it just me :)


 Thanks for any feedback,
 John Reynolds




 
