Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbHS6-0004OS-Id
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 17:17:50 +0000
Date: Wed, 12 Aug 2009 10:17:13 -0700
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "Saurabh Kadekodi" <saurabhkadekodi@gmail.com>
Subject: Re: Problem with nand flash while booting 2.6.30
Message-ID: <20090812171713.GA5076@broadcom.com>
References: <967093cd0908120036q51283790se400dc08219daed@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <967093cd0908120036q51283790se400dc08219daed@mail.gmail.com>
Content-Type: text/plain;
 charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 12, 2009 at 12:36:53AM -0700, Saurabh Kadekodi wrote:
> 
> Then later it gives a lot of ECC errors and prints the following messages:
> 
> 
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> > empty_blocks 0, bad_blocks 208, c->nr_blocks 438
> > VFS: Cannot open root device "mtdblock2" or unknown-block(31,2)
> > Please append a correct "root=" boot option; here are the available partitions:
> > 1f00             256 mtdblock0 (driver?)
> > 1f01            2048 mtdblock1 (driver?)
> > 1f02          112128 mtdblock2 (driver?)
> > 1f03             512 mtdblock3 (driver?)
> > b300         2008064 mmcblk0 driver: mmcblk
> >   b301           31288 mmcblk0p1

You may try to re-burn the rootfs to your flash.  I had experienced
similar problem when I switched my kernel from 2.6.27 to 2.6.30.  I
don't know the exact reason, but the ECC algorithm or something may have been changed.


-- 
Leo Hao Chen
Software Engineer
Broadcom Canada Inc.
