From: David Woodhouse <dwmw2@infradead.org>
To: joshua@dashnine.joshuawise.com
In-Reply-To: <Pine.LNX.4.44.0312021653280.30871-100000@dashnine.joshuawise.com>
References: 
	 <Pine.LNX.4.44.0312021653280.30871-100000@dashnine.joshuawise.com>
Content-Type: text/plain
Message-Id: <1070446527.15108.80.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 03 Dec 2003 10:15:28 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: manningc2@actrix.gen.nz
Subject: Re: nand_write_ecc() broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-12-02 at 16:54 -0500, joshua@dashnine.joshuawise.com wrote:
> >   If bad block managemnet is not really an mtd responsibility then why
> > does nand_erase() inside mtd/nand/nand.c call
> > this->block_bad(mtd, page) which checks for bad blocks?
> It is in the specification for most chips that you must not erase bad
> blocks, as you'll wipe out the bad block data and generally cause Bad
> Stuff to happen.

Also, sometimes the precise way in which bad blocks are marked is very
hardware-specific. On the DiskOnChip, for example, we mark bad blocks as
such in a separate Bad Block Table, then erase the good blocks and reuse
the byte in the spare area which was used by the manufacturer for the
good/bad mark. 

I prefer to let the low-level driver keep track of bad blocks and refuse
to allow erase/write on them. 

-- 
dwmw2
