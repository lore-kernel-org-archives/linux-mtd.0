Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmqf-0005IP-Ic
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:26:45 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IYC003ZX8CCNM70@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:26:36 -0400 (EDT)
Date: Wed, 26 Apr 2006 12:26:36 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060426160834.GO29108@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <Pine.LNX.4.64.0604261214570.18520@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_4NsBG13YN0x7oDp+hsLagw)"
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
	<20060426160834.GO29108@wohnheim.fh-wedel.de>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_4NsBG13YN0x7oDp+hsLagw)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Wed, 26 Apr 2006, Jörn Engel wrote:

> On Wed, 26 April 2006 12:04:51 -0400, Nicolas Pitre wrote:
> > On Wed, 26 Apr 2006, Belyakov, Alexander wrote:
> > 
> > > JFFS2 (and not only JFFS2) does not work on top of concatenated MTD
> > > device in case of NAND and Sibley chips due to missing
> > > concat_block_isbad(), concat_block_markbad(), concat_writev() and
> > > concat_writev_ecc() functions. If anyone cares - the patch below fixes
> > > that issue.
> > 
> > That won't work with Sibley.  You must call the underlying devices with 
> > writev() as well, using the appropriate vector for each device, and only 
> > once per subdevice.  Sibley flash must write everything all at once with 
> > a single writev call.
> 
> Everything?  Not just in chunks of 1KiB?

Well you can do more, obviously, and you can do less too.  But if you 
write less then it's still the whole 1KB that is gone.

The point is why is the patch so complex?

Something like:

	for (each subdevice) {
		determine_number_of_vector_entries_for_this_subdevice;
		limit_that_last_vector_entry_length_if_needed;
		writev(subdevice, vector, number_of_entries);
		update_vector_ptr_to_last_entry_above;
		readjust_offset_and_length_for_that_vector_entry;
		if (no_more_to_write)
			break;
	}

It seems to me that this should take four times less code than the 
proposed patch, and won't have any memory allocation nor copying 
required.


Nicolas

--Boundary_(ID_4NsBG13YN0x7oDp+hsLagw)--
