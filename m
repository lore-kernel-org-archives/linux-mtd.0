Received: from e4.ny.us.ibm.com ([32.97.182.104])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmaPX-0005MF-Qf
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 11:50:41 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: D.A.Fedorov@inp.nsk.su
In-Reply-To: <Pine.SGI.4.10.10407192037090.204659-100000@Sky.inp.nsk.su>
References: <Pine.SGI.4.10.10407192037090.204659-100000@Sky.inp.nsk.su>
Content-Type: text/plain
Message-Id: <1090252216.13986.6.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 19 Jul 2004 10:50:16 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: starting address of mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-07-19 at 09:01, Dmitry A. Fedorov wrote:
> Yes, physmap.c, but now I can't specify address/length for it
> from kernel .config parameters. Instead, I should create my own module
> and place it before physmap.o in Makefile.

Ah, I see now.  I was only looking at the Kconfig file, which still has
the options in there.  Sorry, I must be especially dense today.

> 
> Well, what about generic physmap board module?
> I can make patch.

Jun Sun removed the CONFIG option support a while ago, and then
submitted a patch to the list that put it back.  Not sure why that patch
didn't make it into CVS...  it should have.

josh
