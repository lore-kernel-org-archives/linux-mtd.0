Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EU2QJ-0001Mh-Rb
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 09:32:31 -0400
Message-ID: <435CE231.8020206@ieee.org>
Date: Mon, 24 Oct 2005 09:31:29 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
References: <43591AFA.21753.1B79E87@localhost>
In-Reply-To: <43591AFA.21753.1B79E87@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Do I need TrueFFS on INFTL Disk-On-Chip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joseph M Dupre (AVAB Inc.) wrote:
> I am a bit confused over the functions of nftl/inftl and TrueFFS in 
> regards to wear-leveling on DOC devices.
> 
> The DOC 2000 devices come pre-partitioned with a FAT filesystem on a 
> "disk" (BDTL) partition.  It is my understanding that what M-Systems 
> calls "TrueFFS" is loaded at boot time from the "binary" (BDK) 
> partition.  Is it this TrueFFS that sits between the FAT filesystem 
> and the flash that does all the necessary wear-leveling?

The TrueFFS code (BIOS extension) is normally stored on the BDK.  This 
code is used in real-mode operating systems such as DOS.  OS's such as 
Windows and Linux use their own drivers instead, as they don't 
(generally) use the BIOS.

The TrueFFS *data*, on the other hand, is stored in the BDTL partition. 
  TrueFFS (aka NFTL or INFTL) is essentially a block-remapping 
pseudo-filesystem designed to ensure proper wear leveling.  The idea 
(much simplified) is that when the higher-level filesystem (such as FAT) 
wants to write to block X, INFTL will actually write it to block Y, in 
such a way as to evenly distribute writes on the device.  Obviously 
INFTL also has to keep track of a lot of bookkeeping to remember that 
block X should be fetched from location Y.  This metadata is stored in 
the out-of-band (OOB) areas of the flash device.

> I am assuming that if I reformat the disk (BDTL) partition to Ext2 or 
> Ext3 or whatever using linux fdisk and mkfs, the TrueFFS is still 
> sitting there doing the job of wear leveling on whatever filesystem I 
> choose to use on the DOC.  Is this correct?

Not exactly.  You can't put normal filesystems (ie, those NOT designed 
to run directly on flash) into the BDTL partition directly.  Filesystems 
such as FAT, ext2/3, etc must be installed on top of the INFTL layer.  So:

	ext2 talks to /dev/inftla0 (or something like that)
	INFTL talks to /dev/mtd2

The only sense in which INFTL is "sitting" there is that Linux has an 
INFTL driver intended to do the same thing as the TrueFFS code that 
comes with the device.  It's not clear to me that the Linux INFTL driver 
actually *works*.  Anyone with any experience with it should feel free 
to chime in on this one; I don't use (I)NFTL.

> So what happens when I re-write the BDK partition with code like 
> DOCboot or Grub?  Is the wear leveling mechanism gone at that point 
> or is wear-leveling part of the "inftl" layer which still exists?  
> Where does the "inftl" reside?  Is that part of the DOC or the 
> kernel?

What you'll lose is the ability to boot to DOS and have the DOC show up 
as your C: drive.  Which you'd lose anyway if you switch to a non-FAT 
filesystem.  The wear leveling is part of the Linux driver code.

Note that as implied above, you can use your DOC without using 
TrueFFS/INFTL.  Linux filesystems such as JFFS2 or YAFFS are designed to 
run directly on the flash (in your case, on the BDTL partition).  These 
filesystems incorporate wear leveling directly into the filesystem, 
rather than having a separate block-remapping layer.  I highly recommend 
looking into JFFS2 for your application, rather than ext2.

	-Dan
