Received: from web13606.mail.yahoo.com ([216.136.175.117])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aW0g-0004MK-00
	for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2001 06:29:30 +0100
Message-ID: <20010825053526.25584.qmail@web13606.mail.yahoo.com>
Date: Fri, 24 Aug 2001 22:35:26 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: JFFS problems for the Am29LV065D
To: linux-mtd@lists.infradead.org, JFFS mailing list <jffs-dev@axis.com>
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

Hello,

I have "successfully" gotten linux to recognize my second flash chip.  The system I am building
has 2 flash chips with the first one containing the kernel, initrd, and bios and some room for
some data. I have decided for the moment to get this 2nd flash chip working before trying to
partition the first one to use a middle chunk for data storage.

Upon booting I see: 

physmap flash device: 800000 at 10000000
Physically mapped flash: Found 1 x8 devices at 0x0 in 8-bit mode
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
mtd: Giving out device 0 to Physically mapped flash

and if I cat /proc/mtd I see:
dev:      size        erasesize          name
mtd0    00800000      00010000        "physically mapped flash"

I created a mount point at /mnt/flash1 and then mounted:

#mount -t jffs2 /dev/mtdblock0 /mnt/flash1
mtdblock_open
ok           
JFFS2: Erase black at 0x00000000 is not formatted. It will be erased
JFFS2: Erase black at 0x00000000 is not formatted. It will be erased
JFFS2: Erase black at 0x00000000 is not formatted. It will be erased
...
...
JFFS2: Erase black at 0x007e0000 is not formatted. It will be erased
JFFS2: Erase black at 0x007f0000 is not formatted. It will be erased

#df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963       711      3252  18% /
/dev/mtdblock0            8192         0      8192   0% /mnt/flash1

I then proceeded to unmount (which took 3-4 minutes)

I then decided to mount again and see what happened:

#mount -t jffs2 /dev/mtdblock0 /mnt/flash1
mtdblock_open
ok           
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0000: 0x8366 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0004: 0xfb59 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0008: 0xcb24 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f000c: 0xb964 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0010: 0x21d2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0014: 0xb734 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0018: 0x5cd7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f001c: 0x3b29 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0020: 0x0eaf instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0024: 0xf64d instead
Further such events for this erase block will not be printed                         
JFFS2: Erase block at 0x000f0000 is not formatted. It will be erased
#                                                                   
# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963       711      3252  18% /
/dev/mtdblock0            8192       388      7804   5% /mnt/flash1
# 
# waiting for erase to complete timed out.<4>Erase at 0x000f0000 failed immediately: -5
#

Is this 388 Used supposed to be there?  Is this some space that jffs2 has grabbed for its use?

I then created a 1 line test file and tried to copy it over and got this:

# cp test /mnt/flash1
Waiting for chip to read, status = 4

---
At this point my system is completely hung (at least it has been
waiting to copy for over 30 minutes and I can't break out.)

At this point, I need to hard reset and reboot.  :-(
                                                                                       
Any ideas on what is wrong? I am using the mtd cvs snapshot from 8-24-01 and kernel 2.4.8-ac9
(patched with the mtd snapshot).

The flash chip is a Am29LV065D:
    - 64 Megabit (8M x 8-bit)
    - uniform sector flash memory
    - 128 64 Kbyte sectors
    - CFI compliant
    
Thanks,
Luke

ps. What does the following line from the linux boot mean anyway - was this something detected? 
"Amd/Fujitsu Extended Query Table v1.1 at 0x0040"



__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
