Received: from mailbox1.avalonworks.net ([216.58.97.66])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMwNw-0000RT-97
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 21:30:44 +0000
Received: from localhost (i216-58-64-9.igs.net [216.58.64.9])
	hAKLTEmO077958	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Nov 2003 16:29:14 -0500 (EST)
	(envelope-from ilatypov@infradead.org)
Received: from ilgiz by localhost with local (Exim 4.24)
	id 1AMwMb-0002Oe-Ni
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2003 16:29:21 -0500
Date: Thu, 20 Nov 2003 16:29:20 -0500
From: Ilguiz Latypov <ilatypov@infradead.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20031120212920.GA8274@ei.homeip.net>
References: <7iu14yeq4s.fsf@thor.cctechnol.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7iu14yeq4s.fsf@thor.cctechnol.com>
Sender: Ilguiz Latypov <ilatypov@infradead.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: DiskOnChip 2000 TSOP bad blocks table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello Al,

On Thu, Nov 20, 2003 at 02:33:55PM -0600, Al Cousson wrote:
> 2.  Does doc_loadbios need to be updated to work on the DiskOnChip
>     2000 TSOP? 

I am not sure if the current patch to GRUB recognizes INFTL.  I know
that the NFTL block access layer did work.  The beginning of the NFTL
layer must not be overwritten by the GRUB firmware.  Once you burned the
firmware, you may need to re-format the rest of the chip.  The size of
the GRUB firmware rounded to the next erase sector boundary could be
given to the format utility as the start offset for the NFTL layer.

-- 
Ilguiz Latypov
