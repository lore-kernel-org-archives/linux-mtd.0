Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fPBi-0003ZD-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 17:45:22 +0000
Date: Mon, 25 Feb 2002 18:56:35 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
cc: David Woodhouse <dwmw2@infradead.org>, Adam Wozniak <awozniak@comdev.cc>,
   linux-mtd@lists.infradead.org, Jonas Holmberg <jonas.holmberg@axis.com>
Subject: RE: Re-entrancy of flash erase/write 
In-Reply-To: <IGEFJKJNHJDCBKALBJLLGEMMFBAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.21.0202251855240.12881-100000@dagobert.svc.sysgo.de>
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


On Mon, 25 Feb 2002, Joakim Tjernlund wrote:

> > I see the possibility, but surely that would only _actually_ happen if we 
> > started to support writes during erase suspend? Otherwise, the only thing 
> > that should happen during an erase is a _read_, which doesn't set and clear 
> > vpp.
> The patch I sent a week or 2 ago support that for cmdset0001.c

Bingo! I have been using that version.

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
