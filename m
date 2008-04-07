Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JigCd-0008JO-Lw
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 01:31:19 +0000
Date: Mon, 7 Apr 2008 11:31:13 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: can't mount ubifs on volume smaller than 265 LEBs/32MiB
Message-ID: <20080407013113.GA32108@cloud.net.au>
References: <20080404041251.GA2752@cloud.net.au>
	<1207285579.8040.14.camel@sauron> <1207291737.8040.24.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207291737.8040.24.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 04, 2008 at 09:48:57AM +0300, Artem Bityutskiy wrote:
> On Fri, 2008-04-04 at 08:06 +0300, Artem Bityutskiy wrote:
> > I'll look at this shortly, thanks for the report. As a suggestion, if
> > you have problems with UBIFS and going to send a bug-report, try to
> > enable debugging, reproduce the problem and send dmesg. With debugging
> > enabled it prints more useful information and makes it easier to
> > identify and fix the issue.
> 
> Adrian said he fixed a validation bug recently, so you should update and
> the problem will probably go away.

Thanks. I confirm that with the latest code from the git-v2.6.24 tree, I
can mount the 16MiB (131 LEB) volume.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
