Received: from port-46.ottawa4.achilles.net ([209.151.2.145] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15QUOm-0008Jt-00
	for <linux-mtd@lists.infradead.org>; Sat, 28 Jul 2001 14:44:57 +0100
Date: Sat, 28 Jul 2001 09:50:26 -0400 (EDT)
From: David Woodhouse <dwmw2@infradead.org>
To: Ruslan Satlykov <ruslan@mik.ru>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: Acrosser ARB-1047
In-Reply-To: <Pine.LNX.4.21.0107281541340.191-100000@okawango.mik.ru>
Message-ID: <Pine.LNX.4.33.0107280946590.13562-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 28 Jul 2001, Ruslan Satlykov wrote:

>  Is there are support for the Acrosser's AR-B1047 flash card? This board
> have a own BIOS, detected by system BIOS at startup. AR-B1047 has support
> for many types of chips, such as flash, ERPOMs and SRAM. Can I access to
> that chips and use it with mtd?

It's probably not too difficult to work out how to access the chips. If 
the BIOS uses some kind of translation layer on flash to make it emulate a 
block device then that might be more interesting, unless it's something 
we already support or have documentation for. It would probably be best 
just to get the chips working and use JFFS2 on it, although then you have 
to work out how to boot it.

-- 
dwmw2
