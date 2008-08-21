Received: from smtpout3.tre.se ([80.251.192.228])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWAv9-0005mJ-5O
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:13:51 +0000
Date: Thu, 21 Aug 2008 16:11:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 02/10] AXFS: Kconfig and Makefiles
Message-ID: <20080821141107.GA20956@uranus.ravnborg.org>
References: <48AD00DF.9080207@gmail.com> <200808211324.22989.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200808211324.22989.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 21, 2008 at 01:24:22PM +0200, Arnd Bergmann wrote:
> On Thursday 21 August 2008, Jared Hulbert wrote:
> > The Kconfig edits and Makefiles required for AXFS.
> > 
> > Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> 
> If you split out this patch separate from the files, please make it the
> *last* patch so that you cannot get build errors during a later git-bisect
> through the middle of your series.

And please use axfs-y := foo.o bar.o
as the old axfs-objs := foo.o bar.o ... syntax is deprecated.

[Replying to this mail as I lost the original]

Thanks,

	Sam
