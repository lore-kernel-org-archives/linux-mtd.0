Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Ghp1-0003Ah-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 15:40:24 +0000
Date: Tue, 26 Nov 2002 12:22:27 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: Thomas Gleixner <tglx@linutronix.de>
cc: John Hall <john.hall@optionexist.co.uk>, <linux-mtd@lists.infradead.org>,
   <manningc2@actrix.gen.nz>
Subject: Re: SmartMedia Card need to create fs before mounting it ?
In-Reply-To: <200211261138.16297.tglx@linutronix.de>
Message-ID: <Pine.LNX.4.44.0211261219490.21417-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 26 Nov 2002, Thomas Gleixner wrote:
mount -t jffs2 /dev/mtdblock/6 /mnt
getting follow error messages.
--------
jffs2_scan_empty(): Empty block at 0x0000000c ends at 0x00000200 (with
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000208 ends at 0x00000400 (with
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0000040c ends at 0x00000600 (with
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000608 ends at 0x00000800 (with
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000808 ends at 0x00000a00 (with
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000a08 ends at 0x00000c00 (with
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000c08 ends at 0x00000e00 (with
0x00000000)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000e08:
0xff00 instead
<............................. skip
JFFS2: Erase block at 0x007fe000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes 
-------

> The I/O errors indicate probably that you have bad blocks on your FLASH.
> Use dmesg to verify.
> But it's not a problem. JFFS2 can handle this.
> 
> now 
> mount -t jfss2 /dev/mtdblock/x /mnt/bla
> 
> 
