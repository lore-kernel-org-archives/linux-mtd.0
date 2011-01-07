Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pb238-0007jW-Qg
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2011 02:27:31 +0000
Received: by qyk10 with SMTP id 10so16672qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Jan 2011 18:27:29 -0800 (PST)
Message-ID: <4D267A11.80208@gmail.com>
Date: Thu, 06 Jan 2011 21:27:29 -0500
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Peter Barada <peter.barada@gmail.com>
Subject: Re: New NAND flash die rev recommends 4 bit ECC
References: <Acut6YF5NCbjdNzPQvGZlLLc/xPTRA==>	<1CD05B980C94AC408B37C82BBABAA3E6149861DA@mtsexchange.dc.multitech.prv>
	<AANLkTi=oO3DvWD_sxkzTN8vajUyWfzmruihFouTRifNV@mail.gmail.com>
In-Reply-To: <AANLkTi=oO3DvWD_sxkzTN8vajUyWfzmruihFouTRifNV@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/06/2011 08:08 PM, twebb wrote:
>> I just got a notice from Micron that they are making changes to the
>> 29F2G08/16 (2 Gbit SLC device). For instance, the 29F2G0816AAD is going
>> EOL this month and is being replaced by the MT29F2G08ABAEA. The problem
>> is that the new data sheet is recommending 4 bit per 526 byte ECC
>> instead of 1 bit per 526 byte ECC. As far as I can tell, the processor
>> we are using (AT91SAM9G20) only does 1 bit HW ECC and the software ECC
>> code for MTD is also 1 bit. The new NAND Flash die does have a HW 4 bit
>> ECC engine added in, which probably would need to have code written to
>> support it in order to be able to use it.
>>
>> So, is anyone working on a 4 bit software ECC code or code modifications
>> to utilize the on chip HW ECC engine?
>>
>> Right now we can use a part from an alternate vendor or do a lifetime
>> buy, but I am wondering if this is a trend as die size shrinks and other
>> vendors will soon require higher level ECC as well.
> Yes, I believe this is a trend.
>
> Since the new part has on-board ECC, can you just configure your NAND
> controller to NOT use ECC?  Then, in theory, it's business as usual
> but you just won't ever get any correctable or uncorrectable bit
> errors when you read the flash because the on-board ECC will handle
> it.
Yes you can, at least on OMAP35x.

We're using a MT29C2G224MAKLAJG POP NAND/DDR in a OMAP35x design and its 
required a fair bit of work to integrate the NAND into the MTD layer.  
Once a read command is executed and the NAND is ready to return the 
data, a status command is required to determe if there's a hard/soft ECC 
error but on the soft there's no indication of the number of bits that 
required correction.  Worse the ECC in the OOB (on a 2KB/64 byte part) 
leaves only 16 bytes(corrected) out of the 64 byte spare area avaliable 
for meta data, barely enough for YAFFS2 to work (had to turn off tags 
ECC to have enough space to make it work (and the metadata in those 16 
bytes is already ECC'd)).

Unfortunately we're seeing a soft ECC rate of somewhere around 1E-10 
(far less than the assumed 10E-16 error rate for SLC NAND), enough that 
leads YAFFS2 to retire blocks waaaaay too quickly.  We've worked around 
it so far by raising the "strike count" in YAFFS2 to not retire blocks 
too quickly, but the proper fix is to modify the NAND driver to re-read 
the page w/o ECC on a soft ECC error and count the bit errors by hand 
(since it already has the corrected data available) - something I 
haven't coded up yet.
> twebb
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
