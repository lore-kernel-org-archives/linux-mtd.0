Received: from baythorne.infradead.org ([2001:8b0:10b:1::1])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EeIIS-0001OC-U8
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 15:29:53 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: hs@denx.de
In-Reply-To: <AHEILKONAKAEJPHNMOPNIELBCDAA.hs@denx.de>
References: <AHEILKONAKAEJPHNMOPNIELBCDAA.hs@denx.de>
Content-Type: text/plain
Date: Mon, 21 Nov 2005 20:29:47 +0000
Message-Id: <1132604987.15117.63.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]	MTD:	Add support for the PM82x Boards.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-11-21 at 11:34 +0100, Heiko Schocher wrote:
> Hello,
> 
> the following Patch (against 2.6 kernel.org tree, COMMIT_ID:
> f093182d313edde9b1f86dbdaf40ba4da2dbd0e7) adds support for
> the NOR flashes and for the DiskOnChip on the PM82X Boards
> from Microsys.

Please use the new DiskOnChip driver in drivers/mtd/nand/ not the old
one.

-- 
dwmw2
