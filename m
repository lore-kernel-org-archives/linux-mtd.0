Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJeZB-0008FY-FN
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2004 16:57:18 -0400
Date: Mon, 18 Oct 2004 13:57:03 -0700
From: Marc Singer <elf@buici.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041018205703.GA30241@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Odd behavior with non-linear mapping and CFI_0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On my target hardware, the flash is mapped in two discontiguous 8MiB
regions with an 8MiB gap between them.  Initially, I used the physmap
driver and gave it the whole 24MiB region.  The CFI driver correctly
recognized the two chips, at 0x0 and at 0x01000000.  The chip data
structures were correct in that the chipshift and start addresses
correctly described the flash devices.  I forcibly disabled the
point/unpoint methods because the cfi driver assumed that it was OK.

But there was a subtle problem.  Periodically, the first chip would
become unreadable.  It would get in a mode that I couldn't recognize
and I could not reset unless I cycled the target's power.  Sending the
READARRAY command would not reset it.  I could usually get it to
display the array status (which was 0x80), but it would not go back to
the READARRAY state.

I would have assumed that this was a hardware problem except that when
I wrote a new map driver to map the flash chips onto a contiguous
virtual memory region, the whole kit and kaboodle worked fine.  I'm
now able to mount a jffs2 partition as /.

It seems to me that there could be something wonky in the cfi driver,
but I was never able to pin down the location where the array went
south.

Any comments?

Cheers.
