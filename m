Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7VAF-0000ih-Nf
	for linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 08:57:04 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>,
	David Updegraff <dave@cray.com>
Date: Sun, 28 Mar 2004 20:06:10 +1200
References: <406328A2.3060905@cray.com> <4065A81B.6020607@cray.com>
	<1080404311.17352.69.camel@imladris.demon.co.uk>
In-Reply-To: <1080404311.17352.69.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040328075658.221981764D@desire.actrix.co.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 28 March 2004 04:18, David Woodhouse wrote:
> On Sat, 2004-03-27 at 10:13 -0600, David Updegraff wrote:
> > In all this discussion, the need for anyone outside the driver to know
> > hardware positions of ECC and badblock markers still elludes me.  Yes,
> > various FS need to scribble oob info of their own in a particular
> > format, and in a way that won't scribble over ecc/badblock, but is there
> > anything more than that?
>
> Nope. The file system just need to be told which are bad blocks, where
> the ECC data are, and which bytes are still available. In fact, it
> possibly doesn't even need to know where the ECC data are in the general
> case.

I agree with the idea of abstacting this as much as possible. Where the EEC 
is stores (if indeed it even is stored in OOB) should not be the FS's concern 
and should not be known to the FS. The FS should just be told that the ECC 
passed, failed or fixed a single bit error.

Unless we go for one abstract interface it will [continue to] be hell to 
support more than one FS (it is already a /dev/ass/pain to try get YAFFS and 
JFFS2 going on one machine due to different OOB layouts). The [already bad] 
situation will only get worse when trying to deal with all the fun that the 
newer NAND devices bring us.
>
> > So, again, what if the 'oobsize' and 'oob_buf' (or a renamed relative
> > thereof) were interpreted to mean "region available in OOB for misc.
> > file system housekeeping, that will not stomp on private ECC or badblock
> > areas and will not be interpreted by nand driver".  And let the driver
> > put it wherever it wants/needs to in OOB.  Driver gets to ignorant of FS
> > details, FS gets to be ignorant of chip-HW-dependent ECC and badblock
> > layout.
>
> Seems reasonable. We can make it a bitmask of available bytes, perhaps?

No bitmask. That just passes mucky knowledge through the interface.

Rather:
* Have the mtd tell the FS the number of unused bytes in the OOB.
* Pass a byte array through the interface and the mtd packs/unpacks this 
around the ECC, bad block markers and other stuff.

-- Charles
