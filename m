Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLLyE-0003YC-HW
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 13:57:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <4098DF0D.1040703@intracom.gr>
References: <4098DF0D.1040703@intracom.gr>
Content-Type: text/plain
Message-Id: <1083761869.26125.1382.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 05 May 2004 13:57:49 +0100
Content-Transfer-Encoding: 7bit
cc: Thomas Gleixner <tglx@linutronix.de>
cc: linux-mtd@lists.infradead.org
cc: David Daney <ddaney@avtrex.com>
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-05-05 at 15:33 +0300, Pantelis Antoniou wrote:
> Hello there.
> 
> The following patch allows you to have any filesystem over NAND when mounted
> read only.

Please don't do it like this. Do it as a block device 'translation
layer' instead. See nftl/ftl/mtdblock for examples.

Can you join irc.freenode.net #mtd ?

-- 
dwmw2
