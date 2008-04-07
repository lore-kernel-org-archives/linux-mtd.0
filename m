Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JiqNH-0000IT-MM
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 12:23:00 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1JiqNG-000322-FN
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:22:58 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1JiqNB-0003F4-SL
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 22:22:53 +1000
Date: Mon, 7 Apr 2008 22:22:53 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: choosing a file system to use on NAND/UBI
Message-ID: <20080407122253.GA12359@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron>
	<20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron>
	<20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron>
	<20080407112010.GA8942@cloud.net.au>
	<1207570534.8040.94.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207570534.8040.94.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 07, 2008 at 03:15:34PM +0300, Artem Bityutskiy wrote:
> On Mon, 2008-04-07 at 21:20 +1000, Hamish Moffatt wrote:
> > Also I found that the image can be compressed further with gzip or lzma.
> 
> Yes, because of several factors:
> 1. UBIFS (and JFFS2) does not compress meta-data.
> 2. UBIFS (and JFFS2) compresses 4KiB chunks of data independently.
> Compression is better when you compress large chunks (which happens when
> you use gzip or lzma), rather then small chunks.
> 3. The image has paddings, like paddings to the end of NAND page or to
> the end of eraseblock. They also introduce more compressible data for
> gzip.
> 
> > Could ubiupdatevol support on-the-fly decompression?
> Err, why?
> 
> >  I will develop a
> > patch if I have time.. I already patched flashcp to do this once.
> 
> Sorry, I am not sure what you mean here as well. What did your patch do?

My idea is that you can "ubiupdatevol /dev/ubi0_0 myimage.gz", which
ubiupdatevol would decompress on the fly. You could decompress it
somewhere first but it may not fit in RAM (and writing it to flash
temporarily would be slower).

Looking at the code I see the main issue is that you need to know the
file size before you start updating. I think this is possible with zlib
(flashcp needed to know the same).

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
