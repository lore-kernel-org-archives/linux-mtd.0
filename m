Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEeWu-0003ZO-IW
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 00:49:46 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: manningc2@actrix.gen.nz
In-Reply-To: <20031028232658.9B8854414@blood.actrix.co.nz>
References: <3F9D3D98.6453.14E703@localhost>
	 <20031027202807.DA4481A0A7@desire.actrix.co.nz>
	 <1067339503.15551.429.camel@hades.cambridge.redhat.com>
	 <20031028232658.9B8854414@blood.actrix.co.nz>
Message-Id: <1067388508.17740.9.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 29 Oct 2003 00:48:28 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: SmartMedia FAT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-29 at 12:33 +1300, Charles Manning wrote:
> The flip side to this is that if you can find an SDDR09  you could likely get 
> YAFFS/JFFS2 working with that by bypassing the usb storage driver and 
> exposing it as NAND to mtd. However, SDDR09's are pretty rare. Samsung does 
> make a USB device for experimenting with NAND that could be used for the same 
> purpose.

Can't you just hang one off the parallel port and bitbang it? Should be
fairly trivial to make a driver which uses the generic NAND code and
does that.... left as an exercise for the reader with a soldering iron.

-- 
dwmw2
