Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JipOc-00027F-V1
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 11:20:19 +0000
Date: Mon, 7 Apr 2008 21:20:10 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: choosing a file system to use on NAND/UBI
Message-ID: <20080407112010.GA8942@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron>
	<20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron>
	<20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207555006.8040.76.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 07, 2008 at 10:56:46AM +0300, Artem Bityutskiy wrote:
> On Mon, 2008-04-07 at 17:32 +1000, Hamish Moffatt wrote:
> > UBI attach time appears to be about 6 seconds.
> 
> Looks really a lot. We had 2 seconds for 1GiB flash on OLPC, but OLPC
> has fast flash and fast CPU. I guess you have slow flash.

I'm not sure about the flash (I will have to check tomorrow) but we
don't have a hardware NAND flash controller. The NAND is connected to
the expansion bus of our IXP4XX processor (ARM) and CE is controlled by
a GPIO.. so it's not the fastest. We use the plat_nand driver.

I reduced the time a little by connecting up the NAND ready function in
the driver and reducing the delays. It doesn't look like there is much
else to tweak in the code. The CPU is a 533MHz ARM.

> Yeah. Is there any way to increase read speed on driver level? UBI reads
> 1 NAND page of each eraseblock during scanning and this is the
> bottleneck. It also checks CRC, so if the CPU is very slow, this may be
> the bottleneck as well.

Is that the CRC of one whole page of each block?

> I have 2 quick ideas about how to improve scan speed, but I am not sure
> if they will help.
> 
> 1. Currently what UBI is doing is: read EC header, check it, read VID
> header, check it. So we run mtd->read() 2 times (it might help to run it
> 1 time because EC and VID headers go one after the other): read EC and
> VID headers in one go, check them. We might do this soon.

How much is read each time - just a few bytes? Are those reads
duplicated by the CRC check?

> 4. Finally, one  could invest money and develop UBI2. I would be
> interested to participate. We have some ideas.

I wish we could help but we are a very small company :-) I appreciate
your assistance with ubi and ubifs very much though.

> > I switched my UBIFS from the default lzo to zlib compression, as the
> > resulting images (from mkfs.ubifs) were smaller. Is there any reason to
> > prefer the default lzo?
> 
> Well, the only way is to use mkfs.ubifs for this. You may create an
> empty image, put it to the media and that's it. Would you conceive
> something else?

I mean, I am preparing my root file system on my host and using
mkfs.ubifs to generate an image which I write with ubiupdatevol. I found
that zlib produced a smaller image.

Also I found that the image can be compressed further with gzip or lzma.
Could ubiupdatevol support on-the-fly decompression? I will develop a
patch if I have time.. I already patched flashcp to do this once.


Thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
