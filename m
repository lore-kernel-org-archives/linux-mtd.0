Date: Thu, 15 Nov 2007 12:45:08 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
In-Reply-To: <20071115122042.GA10165@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0711151241140.30407@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roman.borisov@intel.com, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> On Wed, 14 November 2007 15:17:36 -0500, David Woodhouse wrote:
> > 
> > That shouldn't happen. When one node obsoletes an earlier node covering
> > the same range, we _should_ be checking the data CRC. I reimplemented
> > this part of the code only recently.
> 
> Doesn't that fail for newly created files or for previously sparse
> blocks of files?  Alexey's testcase creates a new file, so you should be
> able to create such images yourself.  This testcase should be a bit more
> reliable to hit the problem:
> 
That happens as for newly created files as for updated files. Roman and me made log file and image files requested by David to show the problem.
> for i in `seq -w 1000000`; do echo 12345 > $i; done &
> # wait half a sec
> # hit reset button
> cat `ls | sort | tail -1`
> 
> Completely untested, as always.
I think using this way the issue could be reproduced.
Please find image files in the next directly addressed message.
Thanks,
Alexey
