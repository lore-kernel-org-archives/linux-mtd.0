Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CmxX-0003z7-5P
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 21:53:15 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: <tom@ceisystems.com>, <linux-mtd@lists.infradead.org>
Date: Tue, 6 May 2003 08:54:52 +1200
References: <6D31D5429FA6884CBE9ECAB6C9B5E6A907E05F@intel-srvr.patcameron.ne.mediaone.net>
In-Reply-To: <6D31D5429FA6884CBE9ECAB6C9B5E6A907E05F@intel-srvr.patcameron.ne.mediaone.net>
MIME-Version: 1.0
Message-Id: <20030505205326.63E2D4789@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: CompactFlash...
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 06 May 2003 08:08, tom@ceisystems.com wrote:
> Hello all,
>
> 	I have recently come to own a motherboard that supports the ATA
> interface to a CompactFlash card, which has been purchased from my local
> BestBuy.  I am wondering what the best implimentation would be for this
> flash, as it is seen at /dev/hdd.  Is there a way to still see it as a
> MTD device, and use jffs2 or yaffs on it?  Thanks in advance for any
> information.

This has been raised many times and is explained in an mtd doc.

The flash in Compact Fash is not visible as raw flash, only as ATA (which is 
basically functionally the same as IDE hard-disk). This means that you can't 
really use it as flash for YAFFS or JFFSx (except by bodging up a mtd 
emulation on a block device which would not really buy you anything).

-- Charles
