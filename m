Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FErey-0000vM-92
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 12:32:24 -0500
Date: Thu, 2 Mar 2006 18:32:02 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Message-ID: <20060302173202.GA28045@wohnheim.fh-wedel.de>
References: <20060302135400.GB12074@wohnheim.fh-wedel.de>
	<20060302171539.GA30402@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060302171539.GA30402@xi.wantstofly.org>
Cc: Jesse Off <joff@embeddedARM.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] ts72xx NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2 March 2006 18:15:39 +0100, Lennert Buytenhek wrote:
> 
> > > +	if (nand_scan (ts7250_mtd, 1)) {
> > > +		kfree (ts7250_mtd);
> >                      ^
> > Non-compliant to kernel coding style.
> 
> ACK.
> 
> New version attached -- how does this look?

Unchanged wrt. the second irrelevant comment.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
