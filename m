Date: Tue, 11 Jan 2005 12:29:33 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: joern@wohnheim.fh-wedel.de
Message-ID: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi:
>If I am right CRCs are not only against the effect of unclean reboots 
>but also to handle flash errors. On NAND flashes the ECC handles this
>problem but NOR doesn't have any error detection system. 

Joern Engel wrote:
>So either we can make sure this case never happens, or we can't.  It
>depends on the type of flash, for sure, and it may be pretty hard with
>some types.  But if it doesn't work at all, the flash is broken,
>period.

Hi, that is really interesting, *why* do we need CRCs in JFFS2?

Do we need CRC *only* to handle unclean reboots? If so, we may possibly 
handle it another way, just putting some magic word at the end of node. 
Possibly, no need for CRC at all.

Joern stands that if Flash got rotten, we *do not need* to do something 
special trying to recover data. Am I right?

I still think we need to do recovery in case of NAND, mark the rotten 
block bad and keep working, so we still need CRC. In case of NOR, we 
possibly should just report error and do nothing (we can't mark block bad 
there). Do not know about ECC NOR.

Comments?

P.S. By the way, we could put CRCs at the end of blocks (*after* data) - 
in this case CRC well be extremely strong detecting unclean reboots, isn't 
it?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
