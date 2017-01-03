Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOKgq-0004yx-Re
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 08:43:30 +0000
Date: Tue, 3 Jan 2017 09:43:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cappelle Wouter <W.Cappelle@TELEVIC.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] nand gpmi fix erased block bitflip counting
Message-ID: <20170103094307.397da89b@bbrezillon>
In-Reply-To: <8c685cf6a6994056ab9db940649bccfd@SRV-MAIL02.TELEVIC.com>
References: <1478694920-6453-1-git-send-email-w.cappelle@televic.com>
 <1478694920-6453-2-git-send-email-w.cappelle@televic.com>
 <8aa7c7cb-5093-3bee-2807-f2734b7c7b06@gmail.com>
 <8c685cf6a6994056ab9db940649bccfd@SRV-MAIL02.TELEVIC.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wouter,

Sorry for the late reply.

On Wed, 16 Nov 2016 07:33:02 +0000
Cappelle Wouter <W.Cappelle@TELEVIC.com> wrote:

> On 15-11-16 21:54, Marek Vasut wrote:
> > On 11/09/2016 01:35 PM, w.cappelle@televic.com wrote:  
> >> From: Wouter Cappelle <w.cappelle@televic.com>  
> > Please add commit message explaining the purpose of the patch.
> > CCing some more interested people.  
> Sorry, first patch, and don't know what went wrong or how to fix.
> 
> There should have been some introduction being added to the commit:
> 
> Some time ago, a patch was added to detect bitflips in erased pages 
> (http://lists.infradead.org/pipermail/linux-mtd/2014-January/051467.html).
> After running some test on my board (i.MX6UL), I detected some unexpected 
> behavior with it, especially with the counting of the # of bitflips in the
> erased chunks. I have the impressions that with some pattern, the gpmi block
> did try to correct the data on an empty page. Therefore the gpmi block changed
> the data leading to introducing extra bitflips and failing the criteria to 
> decide if the (sub)page is erased.
> 
> I'm using BCH8 on a 2k nand page and created a testpage with 6 bitflips at following locations:
> 0x02D:FB
> 0x057:FE
> 0xA5:FB
> 0x16A:FB
> 0x18A:DF
> 0x4EE:FE
> 
> When reading the page through the driver, the page is uncorrectable (as 
> expected), then it will verify if the page is erased (gpmi_erased_check).
> There i can see that the first count of the first subpage, is returning me
> it detected 7 bitflips (should be 5 in that subpage). The second count of 
> bitflips on the full raw page returns me the correct amount of bitflips 
> (being 6 for the complete page).
> 
> I Don't really see the need of the first subpage check, except of speed 
> improvement. But as it is failing due to the gpmi block trying to repair the 
> page and alternating the wrong bits, I would propose to either increase the
> threshold of the first check with the max number of repairable bitflips the 
> gpmi block is set to, or just skip the first check since on empty pages it will
> however not make a difference in speed. For real uncorrectable pages, this will
> not have a huge speed penalty due to the unlikely event that this will happen.
> 
> I propose following patch to be be applied to detect the correct number of 
> bitflips based on the raw nand read data.
> 
> >  
> >> ---
> >>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 14 +++++++-------
> >>  1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> >> index 8339d4f..6ae118c 100644
> >> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> >> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> >> @@ -1217,6 +1217,7 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,

You're referring to a function that is not available in mainline. Please
make sure you're basing your work on Linus' tree when you prepare a
patch.

Also note that the 'bitflips in erased pages' has been fixed in
mainline. See commit bd2e778c9ee3 ("gpmi-nand: Handle ECC Errors in
erased pages")

Thanks,

Boris

> >>  	int base = geo->ecc_chunkn_size * chunk;
> >>  	unsigned int flip_bits = 0, flip_bits_noecc = 0;
> >>  	uint64_t *buf = (uint64_t *)this->data_buffer_dma;
> >> +	unsigned char *chunkbuf =(unsigned char*) this->data_buffer_dma;
> >>  	unsigned int threshold;
> >>  	int i;
> >>  
> >> @@ -1224,13 +1225,6 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
> >>  	if (threshold > geo->ecc_strength)
> >>  		threshold = geo->ecc_strength;
> >>  
> >> -	/* Count bitflips */
> >> -	for (i = 0; i < geo->ecc_chunkn_size; i++) {
> >> -		flip_bits += hweight8(~data[base + i]);
> >> -		if (flip_bits > threshold)
> >> -			return false;
> >> -	}
> >> -
> >>  	/*
> >>  	 * Read out the whole page with ECC disabled, and check it again,
> >>  	 * This is more strict then just read out a chunk, and it makes
> >> @@ -1246,6 +1240,12 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
> >>  			return false;
> >>  	}
> >>  
> >> +	/* Count bitflips in the current chunk for correct stats reporting */
> >> +	for (i = 0; i < geo->ecc_chunkn_size; i++) {
> >> +		flip_bits += hweight8(~chunkbuf[base + i]);
> >> +	}
> >> +
> >> +
> >>  	/* Tell the upper layer the bitflips we corrected. */
> >>  	mtd->ecc_stats.corrected += flip_bits;
> >>  	*max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
> >>  
> >  
> 
