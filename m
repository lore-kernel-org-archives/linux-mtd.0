Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IVxd-0004fk-Mc
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 16:57:01 +0100
Date: Wed, 21 May 2003 17:57:03 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030521155703.GA30187@wohnheim.fh-wedel.de>
References: <20030521135230.GA18635@wohnheim.fh-wedel.de>
	<000b01c31fa6$561c8e10$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000b01c31fa6$561c8e10$1200a8c0@JOHNB>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: 'Jonas Holmberg' <jonas.holmberg@axis.com>
cc: 'David Woodhouse' <dwmw2@infradead.org>
Subject: Re: Mtd block access (jffs2 formatted) and mtd char
 access(unformatted) on different partitions of a single flashdevice
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2003 10:36:14 -0400, John Burch wrote:
> > 
> > Is there a way to know if a given chip supports this feature 
> > without checking the chip id against a table?
> 
> Not that I know of.  I think the best case scenario would be that all
> AMD devices supported it - then only the manuf ID would have to be
> checked.  However, that would have to be confirmed by AMD.

Jonas Holmberg:
> Is this chip-feature "probable"? We used to do simutaneous erases in a
> bootloader, but after a while we started using chips that couldn't do
> that so we had to change the behaviour to be able to handle all sorts
> of chips. I'm not sure if CFI covers that particular feature, but it
> would be great if it did. It wouldn't be so great to have to check
> JEDEC IDs...

If I read this correctly, AMD won't confirm your assumption.

Might be another option to assume simultaneous erases work, try it,
catch the failure gracefully and turn that feature off from that point
on. Does anyone have the time and hardware to answer this question?

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
