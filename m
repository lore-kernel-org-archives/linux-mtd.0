Received: from e2.ny.us.ibm.com ([32.97.182.102])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnGGu-00066F-HX
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 08:32:33 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: D.A.Fedorov@inp.nsk.su
In-Reply-To: <1090252216.13986.6.camel@weaponx.rchland.ibm.com>
References: <Pine.SGI.4.10.10407192037090.204659-100000@Sky.inp.nsk.su>
	<1090252216.13986.6.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Message-Id: <1090413135.13986.9.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Wed, 21 Jul 2004 07:32:15 -0500
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

On Mon, 2004-07-19 at 10:50, Josh Boyer wrote:
> > 
> > Well, what about generic physmap board module?
> > I can make patch.
> 
> Jun Sun removed the CONFIG option support a while ago, and then
> submitted a patch to the list that put it back.  Not sure why that patch
> didn't make it into CVS...  it should have.

Jun Sun's patch is in CVS now.  CONFIG_MTD_PHSYMAP options are back.

josh
