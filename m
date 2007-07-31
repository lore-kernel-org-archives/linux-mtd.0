Date: Tue, 31 Jul 2007 13:56:29 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Unlocking with Intel J3 series flash
Message-ID: <20070731175629.GB25447@marvin.netwinder.org>
References: <20070731153547.GA24705@marvin.netwinder.org>
	<20070731162331.GA31821@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070731162331.GA31821@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 31, 2007 at 05:23:31PM +0100, Ben Dooks wrote:
 
> My solution, which I can post the patch for, is to check the lock
> status of the page before trying to unlock the device.

In principle this sounds like a good idea, but we then trust the
device to give us status... wherease prevously the unlock command
would be issued regardless.  I wonder if there are any errata
regarding device status... probably... here is one:
http://download.intel.com/design/flcomp/applnots/30855503.pdf
although your code looks like it will deal correctly with this.

> +	/* check to see if the block is actually in the right state */
> +
> +	map_write(map, CMD(0x90), adr + (2 * ofs_factor));
> +	chip->state = FL_JEDEC_QUERY;

Ok.

> +	status = map_read(map, adr + (2 * ofs_factor));

Any reason you're not doing:
	 status = cfi_read_query(map, adr+(2*ofs_factor));
as is done in the do_printlockstatus_oneblock() function?

> +	/* return the chip to a state */
> +	map_write(map, CMD(0xf0), adr);
> +	map_write(map, CMD(0xff), adr);
> +
> +	chip->state = FL_READY;

That sequence worries me... I don't know enough about the state
machines in the MTD code to know if it safe to do this here...

The rest looks ok.

I do wonder if this should be done in cfi_cmdset_0001, or should 
it happen more globally?  Are there AMD chips with the same "feature"?

-R
