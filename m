Received: from [212.209.10.220] (helo=miranda.se.axis.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgOFd-00069X-TC
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 13:06:35 +0000
Date: Tue, 13 Jan 2004 14:08:01 +0100
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040113130800.GB29496@axis.com>
References: <002201c3d985$8ff790f0$1a140a0a@leonnb>
	<1073976604.5541.10.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1073976604.5541.10.camel@imladris.demon.co.uk>
cc: ????????? <lnys@avamax.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2004 at 06:50:05AM +0000, David Woodhouse wrote:
> On Tue, 2004-01-13 at 11:30 +0800, ????????? wrote:
> >              I also do another test for reading or writing Nand flash by MTD
> > block driver and it is ok (I mean reading or writing 200KB data from/to Nand
> > flash is not more than 1 second).  So I don't know what the problem is. Do
> > anyone meet the similar problem or any idea?
> 
> Use profiling to see where it's spending all its time. Read the
> 'readprofile' man page.

The time it takes to write to a regular file depends a lot on the 
buffer size when copying data. Some implementations of cp, for 
example, always use the same buffer size and doesn't use stat or 
statfs to find out the blocksize of the destination file system. I 
guess the compression in JFFS2 is a bottleneck when copying too small 
chunks.

/Jonas
