Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEwwk-0007Vy-3r
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 20:29:38 +0000
Received: from there (203-96-62-254-tollfree.actrix.co.nz [203.96.62.254])
	by desire.actrix.co.nz (Postfix) with SMTP id 5261E1984C
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Oct 2003 09:27:54 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Thu, 30 Oct 2003 09:33:48 +1300
References: <3F9D3D98.6453.14E703@localhost>
	<20031028232658.9B8854414@blood.actrix.co.nz>
	<1067388508.17740.9.camel@imladris.demon.co.uk>
In-Reply-To: <1067388508.17740.9.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Message-Id: <20031029202754.5261E1984C@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: SmartMedia FAT
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 October 2003 13:48, David Woodhouse wrote:
> On Wed, 2003-10-29 at 12:33 +1300, Charles Manning wrote:
> > The flip side to this is that if you can find an SDDR09  you could likely
> > get YAFFS/JFFS2 working with that by bypassing the usb storage driver and
> > exposing it as NAND to mtd. However, SDDR09's are pretty rare. Samsung
> > does make a USB device for experimenting with NAND that could be used for
> > the same purpose.
>
> Can't you just hang one off the parallel port and bitbang it? Should be
> fairly trivial to make a driver which uses the generic NAND code and
> does that.... left as an exercise for the reader with a soldering iron.

Last time I tried reading with a soldering iron I burnt the page. 

Samsung had a schematic for their parallel port thingy on their www. This is 
no longer there. If you want, email me.

Samsung's  USB NAND thingy is:
http://www.samsung.com/Products/Semiconductor/Flash/TechnicalInfo/NANDUSB_Introduction.pdf

-- CHarles
