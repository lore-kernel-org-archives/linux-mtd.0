Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvb6c-0005FJ-EA
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 07:56:42 -0500
Date: Mon, 31 Jan 2005 13:56:13 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050131125613.GA6345@wohnheim.fh-wedel.de>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
	<1106998793.17802.3.camel@sauron.oktetlabs.ru>
	<1107013860.10670.5.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107013860.10670.5.camel@windu.rchland.ibm.com>
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 29 January 2005 09:51:00 -0600, Josh Boyer wrote:
> 
> Not necessarily.  I was actually thinking of having JFFS2 just "ignore"
> such eraseblocks.  Essentially treating them as bad blocks perhaps.
> 
> However, such blocks could be scattered across the entire device rather
> than contained within a certain address range on the chip.  Updating the
> data would be a bit tricky, which is why I said a driver would need to
> be created in order to deal with it.

Problem would be trivial to solve, if said blocks were not scattered
across the device.  Do you have a good reason to need this?

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
