Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1zK5-0004Tk-Nd
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:46:18 +0000
Message-ID: <1404225954.6841.114.camel@sauron.fi.intel.com>
Subject: Re: Request for help booting Gumstix from MTD Flash
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Larry Martin <Larry@GlueLogix.com>
Date: Tue, 01 Jul 2014 17:45:54 +0300
In-Reply-To: <53AEC7C9.5070408@GlueLogix.com>
References: <53AEC7C9.5070408@GlueLogix.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-06-28 at 09:48 -0400, Larry Martin wrote:
> Hello, I am writing this list because my question is not being answered 
> on the Gumstix list, so I am turning to the subsystem developers.  I 
> have a u-boot, kernel and rootfs all booting properly from MMC, but when 
> I try to boot the set from NAND the kernel says the rootfs superblock is 
> empty.

I'd try to mark every eraseblock with its number. Then try to boot, and
see what is the number of the block where UBIFS searches for the
superblock.

Probably if you take your 'rootfs.ubifs', then modify it like this:

for each 128KiB-2KiB block
      fill the block with its number

Then you ubinize it and to the same as you did.

And in the mount failure you should see the block number instead of
zeros, I'd assume.

Or you may hack ubinize and make it put the block number to the 'sqnum'
field. And then hack the UBI driver and make it print sqnum for you.

Basically this is an idea how to detect misplaced partitioning.

-- 
Best Regards,
Artem Bityutskiy
