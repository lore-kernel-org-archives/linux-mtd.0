Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CoN94-0000yy-Re
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 09:37:20 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0BEbFTb028924
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2005 09:37:15 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0BEbFvh076956
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2005 09:37:15 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0BEbEu1030130
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2005 09:37:14 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1105454234.31055.14.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 11 Jan 2005 08:37:14 -0600
Content-Transfer-Encoding: 7bit
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

On Tue, 2005-01-11 at 06:29, Artem B. Bityuckiy wrote:
> Ferenc Havasi:
> >If I am right CRCs are not only against the effect of unclean reboots 
> >but also to handle flash errors. On NAND flashes the ECC handles this
> >problem but NOR doesn't have any error detection system. 
> 
> Joern Engel wrote:
> >So either we can make sure this case never happens, or we can't.  It
> >depends on the type of flash, for sure, and it may be pretty hard with
> >some types.  But if it doesn't work at all, the flash is broken,
> >period.
> 
> Hi, that is really interesting, *why* do we need CRCs in JFFS2?
> 
> Do we need CRC *only* to handle unclean reboots? If so, we may possibly 
> handle it another way, just putting some magic word at the end of node. 
> Possibly, no need for CRC at all.
> 
> Joern stands that if Flash got rotten, we *do not need* to do something 
> special trying to recover data. Am I right?
> 
> I still think we need to do recovery in case of NAND, mark the rotten 
> block bad and keep working, so we still need CRC. In case of NOR, we 
> possibly should just report error and do nothing (we can't mark block bad 
> there). Do not know about ECC NOR.

Just some info.

The only ECC NOR that I know of has transparent ECC that automagically
does the corrections for you.  There is no mechanism provided by the ECC
logic to let you know that an error occured.  It's not like ECC on NAND.

So those chips are really almost identical to NOR in this kind of
discussion.  The CRCs are really the only way to detect any kind of
errors.

josh
