Received: from verifonedns.verifone.com ([192.30.91.34])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HsVW-0008OK-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 21:44:50 +0100
Message-ID: <614CC7C21856D1118DA30060B06B487302ACCA37@SMF-NT-MAIL1>
From: Eric Nelson <eric_n2@verifone.com>
To: 'David Woodhouse' <dwmw2@infradead.org>,
	brendan.simon@bigpond.com
Cc: linux-mtd@lists.infradead.org
Subject: RE: DOC2000 partitiioning question 
Date: Tue, 11 Jun 2002 13:44:40 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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


-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, June 11, 2002 12:06 AM
To: brendan.simon@bigpond.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 partitiioning question 



brendan.simon@bigpond.com said:
> I've got a single DOC2000 in PowerPC embedded system.  I want to have
> 3  seperate partiton, one which is read-only and the other two
> read-write. 
>  I've been told that this is easy to do from the filesystem level but
> the underlying NFTL stuff can still swap bits a pieces underneath the
> read-only partition.  I think what I'm after is the ability to create
> 3  "virtual disk devices" with single partions on each, as apposed to
> 1  disk device with 3 partions.

> Is this doable ? Is it reliable ? Where can I find information on this
> (Howtos, etc). 

Yep, it's doable. You're right -- using partitions on the 'nftl' device 
would still leave your read-only parts being moved around the flash. The 
typical layout of a DiskOnChip is something like this...

                     -------------------------------------------
 NFTL                |             EXT2/3/FAT/etc              |
 block device        |              file system                |
       ----------------------------------------------------------
  Raw  | Boot code, |         NFTL formatted                    |
 Flash |  firmware  |         pseudo-filesystem                 |
       ----------------------------------------------------------

As you know, NFTL is a kind of pseudo-filesystem which is used to emulate a 
normal hard drive, on which you use a normal file system. If you partition 
the contents of that emulated block device it would still all be within the 
same NFTL pseudo-fs. It's akin to having multiple files in the same 
filesystem, some of them read-only.

Theoretically, you could have as many NFTLs as you like though - so you 
could divide your raw flash into something like this:

                        nftla                     nftlb
                     ------------------------- -----------------
 NFTL                |    cramfs             | |     ext2      |
 block devices       |                       | |               |
       ----------------------------------------------------------
  Raw  | Boot code, |      NFTL               |     NFTL        |
 Flash |  firmware  |                         |                 |
       ----------------------------------------------------------

(Note that the NFTL-provided fake block devices are intentionally smaller 
than the amount of raw flash taken by the NFTL itself -- you can't fit as 
much inside a file system as you can on a raw device, of course.)

The above layout hasn't been tested much but should work OK. You can give 
both offset and size arguments to the 'nftl_format' program. When using the 
nftl_format program, ensure that the NFTL driver module is not loaded into 
the kernel -- any time the module is loaded (or support is built-in), 
that's like having the NFTL 'mounted', and you shouldn't reformat a mounted 
file system.

> What are the most suitable filesystems to place on  DOC for
> reliability  (ext2, ext3, JFFS, JFFS2 ...) ? Is a journalling file
> system suitable for a device such as a DOC ? 

Using a non-journalling file system such as FAT or ext2 on NFTL would be 
silly -- you have all the same problems with consistency as you would have 
with using those same file systems on a normal hard drive.

Using a journalling file system such as ext3 or reiserfs on NFTL is also 
silly. These file systems operate by keeping a seperate portion of the 
block device for a 'journal', to which all operations are logged before 
starting to actually modify the filesystem proper. If power is lost during 
the operation, the log can be replayed to deduce what was happening during 
the crash, and hence recover to a sane state. 

With full data journalling, this means that for each write to the file 
system, the data hit the block device _twice_ -- you're actually doubling 
the number of writes to the flash, hence halving the life time of the 
device and your write performance. In fact, you can do just metadata 
journalling which isn't quite that bad, but it still sucks.

> Are flash file systems suitable for a DOC or are they desinged for
> ordinary flash chips ? 

A DiskOnChip _is_ just a bunch of flash chips, with a clever ASIC that does 
the ECC calculation for you in hardware. But it's NAND flash, not the 
normal type (NOR flash). That has some interesting characteristics which 
the flash file system has to be able to cope with.

JFFS had some support for NAND, but JFFS development was abandoned in favour
of JFFS2 -- after much work on the original I concluded that the best way to
fix it was to rewrite it from scratch. It's only being maintained for the
sake of those who started using it before JFFS2 was ready. I would not
recommend starting to use it now.

Recently, JFFS2 has also had support added for NAND flash, and that should
be about ready for use now. I'd want to spend three or four weeks on it
before letting a customer have it (and as ever I wish somebody would just
give my masters enough money to let me do that...:) There are some rough
edges and it needs a lot more testing, but it's basically working already.
We may need to fix the physical DiskOnChip driver to accept reads which 
aren't precisely 512 bytes long, if nobody's done so already -- but that 
should be simple enough.


David-

I know, from following this list, that there are many, like me, who have no
choice but to use DOC, and are sold on JFFS2, but just don't have the time or
expertise to make these modifications.  I know you are busy, but you are the
expert, and it would be widely appreciated if you lend your expertise to
finishing porting JFFS2 to DOC, so I, and many others, could quit telling our
bosses that JFFS2 is definitely the best, but it's not quite ready for DOC??


> Is there a way to search the linux-mtd archives ?

http://www.google.com/search?hl=en&lr=&q=site%3Alists.infradead.org

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
