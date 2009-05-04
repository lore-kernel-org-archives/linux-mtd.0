Received: from imta-38.everyone.net ([216.200.145.38]
	helo=omta0107.mta.everyone.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M14KY-0004Al-WB
	for linux-mtd@lists.infradead.org; Mon, 04 May 2009 20:00:09 +0000
Subject: Re: NAND + YAFFS2 - bad blocks
From: Subramani <subbu@fortisys.com>
To: Stanislav Popov <s.popov@rsc.bg>
In-Reply-To: <49F7FBB6.8080301@rsc.bg>
References: <20090428145901.ED9188BC@resin13.mta.everyone.net>
	<49F7FBB6.8080301@rsc.bg>
Content-Type: text/plain
Date: Mon, 04 May 2009 16:00:00 -0400
Message-Id: <1241467200.7488.5.camel@subbuv30-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Flash_eraseall does not any problem, I belive it should be an issue with
nand_write or your NAND ECC module. These are the things you need to
verify at your end.

Regards,
Subbu
On Wed, 2009-04-29 at 10:03 +0300, Stanislav Popov wrote:
> Hi,
> 
> thanks for your reply!
> 
> If I use flash_eraseall then the bug could be in it ?
> So there should be no issue in YAFFS2 FS or Kernel Driver?
> 
> How do you suggest to write the FS?
> 
> Thank you very much!
> Stanislav
> 
> subbu@fortisys.com wrote:
> > Hi,
> > Yaffs2 is combination 2048+64 Bytes, when you write filesystem to NAND, you have to make sure that oob data is written to oob block from offset 0x2 to 0x34, if you write at oob data at offset 0x0 0x1, NAND will identify it as bad block, therefore you have to make sure to avoid writing oob from 0x0.
> >
> > Try using nandwrite utility with the above mention changes.
> >
> >
> > Regards,
> > Subramani V
> > Massuchussets
> > USA
> >
> >
> > --- s.popov@rsc.bg wrote:
> >
> > From: Stanislav Popov <s.popov@rsc.bg>
> > To: linux-mtd@lists.infradead.org
> > Subject: NAND + YAFFS2 - bad blocks
> > Date: Tue, 28 Apr 2009 19:03:26 +0300
> >
> > Hi,
> >
> > I have 64 MB NAND flash on Jacinto (ARM) board.
> > I am using the device formatted as one YAFFS2 partition.
> > My SW ECC from NAND is enabled in the kernel and "useNANDECC" in YAFFS 
> > is set to 0
> > (If this is non-zero, then YAFFS will not perform ECC and it is assumed 
> > that the hardware ECC or specified NAND access functions will perform EC 
> > checks.)
> >
> > I found that I have 1000-2000 eraseblocks that were reported as "bad block".
> > I can see them in u-boot with "nand bad" command and when laoding my 
> > nand_jacinto driver.
> > When using the NAND they are getting much more.
> > Actually they are NOT bad blocks!
> >
> > I edited the kernel and remove is_bad checking when erasing.
> > Also I edited the mtd-utils (flash_eraseall) and removed is_bad checking 
> > when erasing.
> > So I was able to make low-level format of my NAND flash which also erase 
> > the bad blocks.
> > (like 'nand erase scrub' command in u-boot, but I currently I do not 
> > have such command)
> > After that I had NO bad blocks.
> >
> > I made some tests:
> > I formatted Nand with YAFFS2 FS
> > -  YAFFS2 ECC + NO NAND ECC - when using fs appeared bad blocks and 
> > getting more.
> > -  YAFFS2 NO ECC + NAND SW ECC - when using fs appeared bad blocks and 
> > getting more.
> >
> > I formatted Nand with EXT2 FS (ext2 fs is not writing into oob)
> > -  NAND SW ECC ENABLE - NO bad blocks appeared in the time!!!
> >
> > So the result is that the issue is in using YAFFS2 + NAND.
> >
> > Maybe the source of the issue is some YAFFS2 configurations?
> > Do you have any idea?
> > It's very critical issue for me.
> >
> > Thanks and Regards,
> > Stanislav
> >
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> >
> >   
> 
