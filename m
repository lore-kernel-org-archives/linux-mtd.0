Received: from web13204.mail.yahoo.com ([216.136.174.189])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t9lh-0005we-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 17:07:22 +0100
Message-ID: <20020404160719.36532.qmail@web13204.mail.yahoo.com>
Date: Thu, 4 Apr 2002 08:07:19 -0800 (PST)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: jffs2 mounting problem 
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi All,
I am using linux2.4.2.
I am using two AMD flash of 4MB each. Then I am relocating them such that they
are continuous.
Then I create  three partitions, first one for bootloader, second for JFFS2
root partition and the last is free to be used latter.

Then probing of the flash also shows the following information -
physmap flash device: 800000 at bf800000
Number of erase regions: 2
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)

Now when I boot the system from 2nd jffs2 root partition I see the following info -

#cat /proc/mtd
dev:    size   erasesize  name
mtd0: 000a0000 00010000 "bootstrap and kernel"
mtd1: 00360000 00010000 "jffs2 filesystem"
mtd2: 00400000 00010000 "jffs2 2nd filesystem"

Also I have following devices created -
#ls -l
crwxr--r--   1 root     root      90,   0 Mar 27  2002 mtd0
crwxr--r--   1 root     root      90,   1 Mar 27  2002 mtd1
crwxr--r--   1 root     root      90,   2 Mar 27  2002 mtd2
crw-r--r--   1 root     root      90,   4 Jan  1 00:03 mtd4
brwxr--r--   1 root     root      31,   0 Mar 27  2002 mtdblock0
brwxr--r--   1 root     root      31,   1 Mar 27  2002 mtdblock1
brw-r--r--   1 root     root      31,   2 Jan  1 00:02 mtdblock2



Now I want the last partition to be mounted to /mnt directory.
For that first I use /dev/mtd4 for erasing the partition and 
then I use the following command to mount the last partition -

#mount -t jffs2 /dev/mtdblock2 /mnt
which starts displaying the following -
ofs 0x00200044 has already been seen. Skipping
ofs 0x00202ea8 has already been seen. Skipping
ofs 0x0020636c has already been seen. Skipping
ofs 0x0020d370 has already been seen. Skipping
ofs 0x0020f044 has already been seen. Skipping
.
.
.
ofs 0x003f4524 has already been seen. Skipping
ofs 0x003fb13c has already been seen. Skipping
ofs 0x003ff0b0 has already been seen. Skipping


When the mounting is completed I use the command "df" and I see the
used space in the partition increases rapidly to 100%.

#df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                 3456      2080      1376  60% /
/dev/mtdblock2            4096      2944      1152  72% /mnt
#df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                 3456      2080      1376  60% /
/dev/mtdblock2            4096      3392       704  83% /mnt
#df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                 3456      2080      1376  60% /
/dev/mtdblock2            4096      3648       448  89% /mnt
#df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                 3456      2080      1376  60% /
/dev/mtdblock2            4096      3968       128  97% /mnt
#busybox df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                 3456      2080      1376  60% /
/dev/mtdblock2            4096      4096         0 100% /mnt

Also at last I see the following information -
#Newly-erased block contained word 0x0 at offset 0x003f0000
Newly-erased block contained word 0x9aa39aa3 at offset 0x003e0000


I don't know where I am doing any wrong.


Please help in solving this problem. Any kind of suggestions is welcome.

Thanks & Regards,
Sanjay




__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
