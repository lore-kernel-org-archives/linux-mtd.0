Date: Fri, 16 Nov 2007 10:47:56 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
In-Reply-To: <1195194827.2533.79.camel@shinybook.infradead.org>
Message-ID: <Pine.LNX.4.64.0711161040540.30610@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
	<1195194827.2533.79.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roman.borisov@intel.com, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David
> 
> It shouldn't, no. jffs2_build_inode_fragtree() should check the data CRC
> before adding anything to the tree.
> 
> Can I see the debug output from jffs2_build_inode_fragtree() when it's
> building the offending file?
>
No problem. I will send you log today. 
> Does this happen before my recent optimisations?
>
We saw the issue on Linux versions 2.6.22.2 and 2.6.23.1
Is it include recent optimizations?

Thanks,
Alexey
