Received: from mailbox1.avalonworks.net ([216.58.97.66])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJS7K-0006Rl-B4
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2003 06:35:10 +0000
Received: from localhost (i216-58-64-247.igs.net [216.58.64.247])
	hAB6Xknq090012	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Nov 2003 01:33:47 -0500 (EST)
	(envelope-from ilatypov@infradead.org)
Received: from ilgiz by localhost with local (Exim 4.24)
	id 1AJS5y-0000M4-DF
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2003 01:33:46 -0500
Date: Tue, 11 Nov 2003 01:33:45 -0500
From: Ilguiz Latypov <ilatypov@infradead.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20031111063345.GA1336@ei.homeip.net>
References: <3FB05364.2000608@sympatico.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FB05364.2000608@sympatico.ca>
Sender: Ilguiz Latypov <ilatypov@infradead.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: GRUB MTD DISKONCHIP patch failure with
	"grub-2003-01-08-doc.patch" on file stage2/disk_io.c using latest
	GRUB CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Mike,

On Mon, Nov 10, 2003 at 10:11:32PM -0500, Mike Gore wrote:
> I downloaded the latest CVS for grub on 10 Nov 2003 at 9:30pmEST and 
> attempted to apply the MTD patch grub-2003-01-08-doc.patch
> Besides the expected Changelog and Authors errors I got one rejected 
> section on stage2/disk_io.c (see below for copy of the failed section)

I updated the patch to match the change in disk_io.c you've found.  The
new patch is grub-2003-11-10-doc.patch.  I tested it only with a floppy
boot.

-- 
Ilguiz Latypov

tel.  +1 (519) 569-8746
66 Wildlark Crescent
Kitchener, Ontario N2N 3E9
