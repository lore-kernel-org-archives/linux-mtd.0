Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8ZyG-0003qS-19
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2004 08:17:08 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: "William J. Beksi" <wjbeksi@setabox.com>,
	linux-mtd@lists.infradead.org
Date: Wed, 31 Mar 2004 19:26:20 +1200
References: <406A2A5F.7040005@setabox.com>
In-Reply-To: <406A2A5F.7040005@setabox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040331071659.BCFE0605E@blood.actrix.co.nz>
Subject: Re: bad block replacement
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 31 March 2004 14:18, William J. Beksi wrote:
> I'm using a Samsung KM29U256T 32Mb nand flash with 4 partitions on a
> cramfs. I'm trying to implement ECC and a method for replacing bad
> blocks. The spare array consists of 16 bytes, positions 512-528, the
> 517th position being reserved for the bad block marker.
>
> Can I arbitrarily pick where to store the 6 byte ECC code in the spare
> array as long as I don't erase and/or overwrite the bad block marker?

Yes you can so long as there is no conflict with any hardware ECC etc. Since 
I know you're using software ECC that is not a problem.

>
> Concerning the replacement of bad blocks, Samsung guarantees that the
> 1st or 2nd page of every invalid block has non-FFh data at the 517th
> position of the array. They recommend keeping a table of valid/invalid
> blocks.

Generally (speaking for YAFFS and JFFS2 here) we don't keep a table like that 
for devices like this since we can just look at the 517th byte. 

>
> When replacing blocks, should one start at the end of the flash and
> replace a bad block with a good free block? How many free good blocks
> should one typically allocate for the duration of the flash's life?

Perhaps a better way is to save some sort of index marker in thespare area 
(ie some block id). Look at how SmartMedia does it. This should work for what 
you want. The SmartMedia block handling algorithms are on the Samsung www.

Spare blocks can be left in the erased state (ie. kept as a "free pool"). 
When you erase blocks they are released back into the "free pool". Just never 
erase a bad block!

At boot time you can then just scan the blocks to determine the logical to 
physical mapping.

Allowing 2% for all bad blocks is a GoodThing and is what SmartMedia does. 
ie. For each 1024 blocks you round it to 1000.

-- Charles
