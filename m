Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AIGcx-0003AS-LX
	for <linux-mtd@lists.infradead.org>; Sat, 08 Nov 2003 00:06:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Chris Ellec <cellec@celerity.net>
In-Reply-To: <3FAAF44B.8020804@celerity.net>
References: <3FAAF44B.8020804@celerity.net>
Message-Id: <1068249762.18801.43.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 08 Nov 2003 00:02:42 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL report
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-06 at 17:24 -0800, Chris Ellec wrote:
> INFTL: corrupt block 7140 in chain 7140, chain length 0, erase mark 0x0?
> INFTL: formatting chain at block 7140
> INFTL: error while formatting block 7140
> 
> repeated for a few more addresses.

Hmmm. I suspect those could be bad blocks, and we're not interpreting
the Bad Block Table correctly. I really do need to spent a little time
on fixing the BBT handling for all the DiskOnChip devices; I want to
make it completely impossible to erase a bad block without hacking the
code to allow it.

Can you take a complete dump of the /dev/mtd0 device with nanddump and
let me have a copy, please?

> also the loading of docprobe.o seem to fail most of times, even though 
> /dev/inftla1 is available for me to mount and create files on it.

That's intentional and harmless. It installs the appropriate (doc2000)
driver and exits having done its work -- the docprobe module _really_ is
just for probing.

-- 
dwmw2
