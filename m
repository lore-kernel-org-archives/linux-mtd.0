Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joqe5-0002fI-Fw
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 01:53:10 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Joqe4-0001Tv-AK
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 20:53:08 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Joqdz-00043v-NO
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 11:53:03 +1000
Date: Thu, 24 Apr 2008 11:53:03 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
Message-ID: <20080424015303.GB13358@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
	<1208955467.11721.69.camel@sauron>
	<20080423134254.GA17867@cloud.net.au>
	<1208959759.11721.76.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208959759.11721.76.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 05:09:19PM +0300, Artem Bityutskiy wrote:
> You may make it save the BBT on the flash media. So next time you boot,
> it reads the BBT from a pre-defined place (e.g., the last eraseblock)
> and that's it. It does not scan and does not waste time.

Thanks for the info. It looks like this would not save me very much
time so I don't think I will bother.

[    0.960000] Scanning device for bad blocks
[    1.000000] Bad eraseblock 494 at 0x03dc0000
[    1.050000] Bad eraseblock 1300 at 0x0a280000
[    1.140000] Bad eraseblock 2554 at 0x13f40000
[    1.160000] Bad eraseblock 2923 at 0x16d60000
[    1.200000] Bad eraseblock 3349 at 0x1a2a0000
[    1.230000] Bad eraseblock 3790 at 0x1d9c0000
[    1.250000] UBI: attaching mtd9 to ubi-1
[    6.890000] UBI: attached mtd9 to ubi0

I notice in your patch that you read a whole min_io_size block, even
though you only need the EC and VID headers (total of 128 bytes each, or
576 bytes as a single read according to my calculation):

+	/*
+	 * During scanning we read EC and VID headers at one go in to the
+	 * @si->read_buf, and then check EC and VID header. This must be faster
+	 * than doing 2 small read operations.
+	 */
+	si->read_len = ubi->vid_hdr_offset + UBI_VID_HDR_SIZE;
+	si->read_len = ALIGN(si->read_len, ubi->min_io_size);
+	si->read_buf = kmalloc(si->read_len, GFP_KERNEL);
+	if (!si->read_buf) {
+		err = -ENOMEM;
 		goto out_si;
+	}
 
Won't reading 2K bytes be slower than 576 in some cases? If you have
soft ECC then you have to read the whole page anyway, but if you have
hardware ECC then you have no need to read the whole page into RAM.

Hmm. The software ECC seems to work internally on 256 byte blocks.
However it appears that nand_base will always read in a whole page (2K
on my flash). It should be ok to read only a 256-byte block as that's
all you need for ECC calculation? Not a whole 2K which requires 8 ECC
calculations.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
