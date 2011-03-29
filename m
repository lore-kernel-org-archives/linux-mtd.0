Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4b6R-0006Q3-3z
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 15:45:07 +0000
Received: by ewy3 with SMTP id 3so110882ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Mar 2011 08:45:05 -0700 (PDT)
Subject: Re: How to write to nand with an image containing oob data,
	including ECC?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Mar 2011 18:42:51 +0300
Message-ID: <1301413371.21445.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kelly Anderson <kelly@silka.with-linux.com>,
	Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-29 at 17:30 +0200, Ricard Wanderlof wrote:
> Hi,
> 
> In order to test an ECC algorithm (BCH in this case, as I recently posted 
> about), i want to write an image to a nand flash which contains bit 
> errors.
> 
> What I want to do, and I seem to remember doing this in the past, is to 
> dump the whole image, change a single bit, and write it back, including 
> the oob.
> 
> So what I'm doing is
> 
> $ nandwrite -o -n /dev/mtd3 /tmp/mtd3-badimage
> 
> where /tmp/mtd3-badimage contains an image including all oobs for all 
> pages.
> 
> However, this fails saying
> 
> Writing data to block 0 at offset 0x0
> libmtd: error!: cannot write 2048 bytes to mtd3 (eraseblock 0, offset 0)
>          error 22 (Invalid argument)
> nandwrite: error!: /dev/mtd3: MTD write failure
>             error 22 (Invalid argument)
> Data was only partially written due to error
> : Invalid argument
> 
> Using just -o doesn't work because it seems nandwrite writes the oob, but 
> then since it doesn't write the main page in raw mode, the ecc gets 
> overwritten. Strangely enough, the ECC doesn't seem to match the data 
> written, as I get uncorrectable errors when reading back (not just with 
> BCH, but also with the standard mtd built-in algorithm). Perhaps the oob 
> gets written twice, once with my data and once more with the calculated 
> ecc?
> 
> Is this a known bug, or are the some other options I should be using?

Check this bug-report, probably it is about the same. Not sure, I did
not have time to look at this:

http://lists.infradead.org/pipermail/linux-mtd/2011-March/034505.html

would be great if someone just sent a fix :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
