Received: from e2.ny.us.ibm.com ([32.97.182.102])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0lB3-0002IX-Hz
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 14:10:20 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Brian T <btuch@usa.net>
In-Reply-To: <053c01c48c60$4976ad80$fd0ba8c0@briantpc>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
	<045201c48c4b$8407dc40$fd0ba8c0@briantpc>
	<Pine.LNX.4.61.0408271203050.2901@xanadu.home>
	<053c01c48c60$4976ad80$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1093630215.25339.15.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Fri, 27 Aug 2004 13:10:15 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-08-27 at 13:04, Brian T wrote:
> Ok,
> 
> So MTD is no longer compatable with the current 2.4 tree?  I just unpacked
> it and didn't see it in linux/asm-i386/bitops.h .  Am I looking in the wrong
> place?

Not really.  Some efforts have been made to fixup the current code to
work with 2.4, but I don't know to what extent.  It shouldn't take too
much effort to get whatever is broken working again (famous last words).

As long as it doesn't make the 2.6 code ugly.  Right, dwmw2... ;)

josh
