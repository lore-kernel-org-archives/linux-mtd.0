Date: Fri, 7 Nov 2008 11:01:09 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Werner Almesberger <werner@openmoko.org>
Subject: Re: clarify calculation in nand_read_subpage and fix possible bug
In-Reply-To: <20081107050912.GM31758@almesberger.net>
Message-ID: <alpine.LFD.2.00.0811071049170.22975@casper.infradead.org>
References: <20081102055138.GB5177@almesberger.net>
	<alpine.LFD.2.00.0811061739390.8644@casper.infradead.org>
	<20081107050912.GM31758@almesberger.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Werner,

Hah. You are right. But this case is so weird!
Please send patch in form of patch with your Signed-off line and add 
Acked-by: Alexey Korolev <akorolev@infradead.org>

Thank you very much for this patch!

Alexey

> 
> > But I did not understand the note about a bug.
> > What is the case when bug appears? (What is the distribution of ecc
> > positions)
> 
> That bug is just for a hypothetical layout. If we assume that the
> ECC layout can be completely arbitrary, then we could have a layout
> that looks like this:
> 
> position	0 1 2 3 4 5 6 7 8 9 10
> ECC block	- A A A B B B - C C C
> 
> Let's assume we want to read the ECC bytes AAA and BBB. Our bus
> width is 2 bytes. With the original algorithm, the unaligned
> position would be 1, the unaligned length 6. 
> 
> 	/* no alignment: pos = 1, length = 6 */
> 
> 	aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
> 
> 	/* aligned_pos = 0, ok */
> 
> 	aligned_len = eccfrag_len;
> 
> 	/* aligned_len = 6 */
> 
> 	if (eccpos[start_step * chip->ecc.bytes] & (busw - 1))
> 		aligned_len++;
> 
> 	/* the original start was unaligned, so aligned_len = 7 */
> 
> 	if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
> 		aligned_len++;
> 
> 	/* the next block is aligned, so aligned_len = 7 */
> 
> I don't know if this is something one could encounter in real life,
> but then, there are lot of people with crazy ideas out there ;-)
> 
> - Werner
> 
