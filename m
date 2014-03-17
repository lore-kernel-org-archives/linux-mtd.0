Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPgfs-0001ee-I0
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 23:10:29 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <87bnx9eqel.fsf@nbsps.com> <20140317194658.GD3834@ld-irv-0074>
 <87wqfs8mgc.fsf@nbsps.com>
Date: Mon, 17 Mar 2014 19:01:41 -0400
In-Reply-To: <87wqfs8mgc.fsf@nbsps.com> (Bill Pringlemeir's message of "Mon,
 17 Mar 2014 18:55:15 -0400")
Message-ID: <87ob148m5m.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 17 Mar 2014, computersforpeace@gmail.com wrote:

>> Subpage writing is performed within the MTD layer. Do you have any
>> examples aside from subpage writes? I really don't know the specifics of
>> how UBIFS tries to read blank pages (I think Artem replied pretty
>> in-depth to Pekon's UBIFS patches about this; I'll have to re-read), but
>> I did not understand them to be in the hot path.
>
> [snip]
>
>> I'm curious: which drivers are you looking at?
>
>> If MTD drivers are doing "subpage" writing by doing read/modify/write,
>> that does indeed seem to be rather broken. Or at least, it doesn't seem
>> very maintainable in the presence of bitflips like this. Can't subpage
>> writes be done where all "unprogrammed" data is assumed to be 0xff? (I'm
>> admittedly not very familiar with subpage programming implementations.)


On 17 Mar 2014, bpringlemeir@nbsps.com wrote:

> Sub page writing seems to be like this for many Freescale controllers
> (the only ones I am familiar with).  I don't think the controllers can
> read a partial page.  It must read/write full pages.  As the MTD has no
> state about how many sub-pages are written, it does a
> 'read-modify-write' to ensure that already written data is preserved.
> Zero to three sub-pages may have already been written with 2k pages and
> 512 byte sub-pages chips.

> See:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/mxc_nand.c#n1099

> I beleive that the 'NAND_CMD_SEQIN' is sent before a
> 'NAND_CMD_PAGEPROG', by the MTD/nand base.  This will read the page
> before programming it so that sub-pages are done correctly.

Sorry, this one is even more obvious.

 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/mpc5121_nfc.c#n367

As a matter of fact, I could be wrong about the 'mxc_nand'.  Although
my bench mark data does say that the read is ~2x as fast as the writes
for the 'mxc_nand'.

Regards,
Bill Pringlemeir.
