Received: from ex.2n.cz ([213.29.92.11])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KcnsU-00014C-GG
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 21:02:30 +0000
Date: Mon, 8 Sep 2008 23:02:27 +0200
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: [PATCH 6/6] [MTD-UTILS] nandwrite: Add Support for Reading from
	Standard Input
Message-ID: <20080908210227.GA7461@michl.2n.cz>
References: <20080908161418.GA7185@michl.2n.cz>
	<C4EAA2B4.118A3%gerickson@nuovations.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <C4EAA2B4.118A3%gerickson@nuovations.com>
From: Ladislav Michl <ladis@linux-mips.org>
Cc: Tommi Airikka <tommi.airikka@ericsson.com>, linux-mtd@lists.infradead.org,
	Richard Titmuss <titmuss@slimdevices.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 08, 2008 at 09:36:52AM -0700, Grant Erickson wrote:
> On 9/8/08 9:14 AM, Ladislav Michl wrote:
> > So what about:
> >
> > while (not eof)
> >   read page (and oob if selected) data into buffer
> 
> What about a short read in which you only get part of a page or a whole page
> and part of the OOB data? Bail out? Best effort?

Simply loop reading (assuming blocking read) until
- read whole buffer (read returns something greater than zero) or
- read returns zero (end of file) and then pad buffer or
- read returns -1 and then bail out gracefully with strerror
  printed to user.

> > next:
> > if (write buffer fails)
> >   mark bad, select next page, goto next
> >
> > Reading from stdin would imply padding. Care to implement that?
> 
> For the time being, padding must be explicitly requested.

Yes, I'm just suggesting to enable it for stdin input as it IMHO makes
sense namely with buffering described above.

> > PS: It is remotely possible that one day I do it myself, but I'm
> > notoriously slow on doing things I do not urgently need.
> 
> Understood and agreed.
> 
> For the present, the patch satisfies my cited use case (clearly those of
> Richard and hopefully those of Tommi) and given the value added, I'd
> advocate its inclusion and incremental evolution through future patches.

Sure, I cannot raise single complain against patch as I do not offer
anything better. I just merely pointed to possible solution.

Best regards,
	ladis
