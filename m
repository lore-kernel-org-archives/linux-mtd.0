Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cqxic-0003uJ-5u
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 13:04:45 -0500
Message-ID: <41ED50B7.9000107@redhat.com>
Date: Tue, 18 Jan 2005 12:08:55 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41ED2EB3.1070203@redhat.com>
	<1106068748.16877.109.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: additional error checks for AG-AND erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thomas Gleixner wrote:
> On Tue, 2005-01-18 at 09:43 -0600, David A. Marlin wrote:
> 
>>The Renesas AG-AND chips support additional error checking on erase and
>>write operations beyond just checking the operation status.  I think the
>>logic is that since ECC can correct 2-bit errors on read, if only a
>>single bit error occurs on and erase or write the operation should not
>>be considered FAIL.  Even if a single bit error occurs on read (in
>>addition to the single bit error on write), it will still be corrected
>>and no data will be lost.
> 
> Hmm, have you other information ?

Yes.  Please see the flowcharts on pages 35 and 36 of the HN29V1G91T-30 
data sheet.  They show the additional checks I referred to.

>>From the data sheet:
>  
> When an error occurs in program page, block replacement including
> corresponding page should be done. 
> ...
> When an error occurs in erase operation, future access to this bad block
> is prohibited. 
> 
> An error on erase is definitely a criteria for putting the block on the
> bad list. Actually JFFS2 tries to erase it again before sorting it out.
> 
> The single bit programming error does not make a lot of sense to me, as
> you always have to do RS error correction when you read the page, which
> results in a nice performance penalty. And its a clear sign that
> something went wrong. We try to reuse the block, see above.

I would not disagree, but the Renesas considers this a "feature" of 
their chips that they would like to see supported.  It could be that 
they are trying to avoid marking blocks bad, since doing so makes 128KiB 
unusable (JFFS2 virtual erase block size), and they think it is worth 
the performance hit.  I'm just trying to figure out if it is practical 
to implement in the current driver.

I have hacked nand_base.c to implement part of the logic (extra status 
checks and read), but these are not really acceptable changes (just 
something to test with), and I haven't worked out where to check for 
single bit errors yet (probably in read_ecc).  I'm still trying to find 
a "less invasive" approach that might be acceptable.


d.marlin
