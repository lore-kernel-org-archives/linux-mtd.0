Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQ1ni-0003An-BS
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 11:26:22 +0100
From: "Simon Haynes" <simon@baydel.com>
To: linux-mtd@lists.infradead.org,
              Frederic Janot <f.janot@ateme.fr>
Date: Tue, 18 May 2004 11:20:43 +0100
MIME-Version: 1.0
Message-ID: <40A9F18B.12350.192BB7@localhost>
In-reply-to: <1084808911.1659.20.camel@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have had similar problems to this.  As you reboot you must make sure that root is 
remounted read only. If you don't a reboot can cause the JFFS2 garbage collector to 
be stopped mid operation. JFFS2 is verbose in error reporting. I suspect that your 
files are still ok. There was a bug in the JFFS2 layer which caused the garbage 
collector not to flush it's write buffer on remount read only. This would not screw up 
the filesystem but it would generate messages for uncleanly finished garbage 
operations. I have discussed this recently and it should be available via CVS now.

I have had discussions about the empty flash messages too. It seems it is not a 
problem. If the message concerns you move it to KERN_DEBUG

Hope this helps

Simon.

On 17 May 2004 at 17:48, Frederic Janot wrote:

> Hi,
> 
> I've got a problem when using jffs2 filesystem on a nand flash device.
> 
> I've created a root file system image on my pc (little-endian) from
> /rootfs directory which contain all needed files. I burn this image
> into a nand flash (samsung k9f5608 - 32MB nand with 512+16 bytes per
> pages) on a board with a power pc processor (big-endian).
> 
> So, on the pc, i do :
> # mkfs.jffs2 -p --root=/rootfs -e 16384 -b -o fs_img
> 
> My flash partitions are :
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00400000 00004000 "Nand Flash Kernel"
> mtd1: 01a00000 00004000 "Nand Flash RootFS"
> mtd2: 00200000 00004000 "Nand Flash Test"
> 
> On my target, from an nfs mount root file system, i do :
> # nandwrite -j /dev/mtd1 /fs_img
> 
> After that, I reboot my board and make the kernel boot from nand root
> file system. The first boot is ok but when i reboot one more time, I
> have the following message : Empty flash at 0x0047b900 ends at
> 0x0047ba00 jffs2_get_inode_nodes(): Data CRC failed on node at
> 0x015fc000: Read 0x5a62bf55, calculated 0x349968c2
> 
> And each time I reboot, there is one message more. (I do nothing else
> than login and reboot) Empty flash at 0x0047b900 ends at 0x0047ba00
> Empty flash at 0x015fc268 ends at 0x015fc400 jffs2_get_inode_nodes():
> Data CRC failed on node at 0x015fc000: Read 0x5a62bf55, calculated
> 0x349968c2 jffs2_get_inode_nodes(): Data CRC failed on node at
> 0x015fc778: Read 0xdf13fb17, calculated 0xbdff7e75
> 
> etc ...
> 
> Do you have any idea on what happens ?
> 
> Thanks
> 
> Frederic Janot
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
