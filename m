Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071115122042.GA10165@lazybastard.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Nov 2007 01:33:47 -0500
Message-Id: <1195194827.2533.79.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Roman.borisov@intel.com, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-11-15 at 13:20 +0100, Jörn Engel wrote:
> On Wed, 14 November 2007 15:17:36 -0500, David Woodhouse wrote:
> > 
> > That shouldn't happen. When one node obsoletes an earlier node covering
> > the same range, we _should_ be checking the data CRC. I reimplemented
> > this part of the code only recently.
> 
> Doesn't that fail for newly created files or for previously sparse
> blocks of files? 

It shouldn't, no. jffs2_build_inode_fragtree() should check the data CRC
before adding anything to the tree.

Can I see the debug output from jffs2_build_inode_fragtree() when it's
building the offending file?

Does this happen before my recent optimisations?

-- 
dwmw2
