Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070308125416.GB23216@lazybastard.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Mar 2007 13:04:04 +0000
Message-Id: <1173359044.3461.433.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: R&D4 <r&d4@dave-tech.it>, mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 13:54 +0100, Jörn Engel wrote:
> 
> Last time I checked, JFFS2 got one case wrong.  Don't remember which
> one,
> but there are not that many to check:
>  - mount -o sync
>  - open(..., O_SYNC);

I don't think we've implemented those two at all.

>  - fsync()
>  - sync()

These two should work.

> [ Side note - NOR flash can still have a write buffer and require
> explicit sync. ]

True. For 'NOR' read 'flash without wbuf' and for 'NAND' read 'flash
with wbuf'.

-- 
dwmw2
