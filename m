Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WMbU-0002L9-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 20:15:08 +0000
Subject: Re: CRAMFS on MTD/NAND Issue
From: Russ Dill <Russ.Dill@asu.edu>
To: Henrik Nordstrom <hno@marasystems.com>
Cc: Srinivasu.Vaduguri@nokia.com, linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0301082125001.9261-100000@filer.marasystems.com>
References: <Pine.LNX.4.44.0301082125001.9261-100000@filer.marasystems.com>
Content-Type: text/plain
Message-Id: <1042058764.10721.17.camel@timmy>
Mime-Version: 1.0
Date: 08 Jan 2003 13:46:04 -0700
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2003-01-08 at 13:33, Henrik Nordstrom wrote:
> On 8 Jan 2003, Russ Dill wrote:
> 
> > roll your own: Please, make a static compressed filesystem (like cramfs)
> > that incorporates extra blocks, so that when the checksum is bad while
> > initially writing the filesystem, or reading the file system (in the
> > case where ecc can save the data), it rewrites this block to a free
> > sector). It would seem like a simple modification to cramfs to me.
> 
> It would indeed be quite simple to adopt cramfs to bad blocks as long as
> the superblock can be read. You only need to make a list of bad blocks,
> and then teach mkcramfs about this, avoiding allocating the bad areas when
> making the filesystem layout.

afaik***, NAND blocks can go bad after time, so it may not be a one time
thing (especially if you have say, 10k units in the field). If you did
it right, it'd be ok if the sb went bad, just use the oob data to mark
blocks as bad, and to number them (your sb might be block 0x00 (or
0x01), and if it was bad, you'd just rewrite the block later on, with
the same block number. When you boot, just check for the last occurance
of each block. (btw, this isn't reinvented the wheel imho, jffs2 adds a
lot of code in the kernel, and often the bootloader of the board, as
well as not being as efficient space wise as cramfs). Course, most of
the space constraints are moot on NAND
