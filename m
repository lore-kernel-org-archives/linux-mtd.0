Received: from carrot.linuxgrrls.org ([212.18.228.66] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EqkV-0006Hj-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 12:11:15 +0100
Date: Tue, 26 Jun 2001 12:16:49 +0100 (BST)
From: kira brown <kira@linuxgrrls.org>
To: Alex Lennon <ajlennon@arcom.co.uk>
Cc: <linux-mtd@lists.infradead.org>, "Bao C. Ha" <baoha@sensoria.com>
Subject: RE: Disk-On-Module
In-Reply-To: <NEBBKJHOALKOLCFPGELEGEBMCNAA.ajlennon@arcom.co.uk>
Message-ID: <Pine.LNX.4.30.0106261216020.1186-100000@carrot.linuxgrrls.org>
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


On Tue, 26 Jun 2001, Alex Lennon wrote:

> Certainly wear levelling, and with ECC. This 'journalling' term seems
> to be bandied around at levels ranging from block access up to
> application data coherency. As far as I am aware the DOM will retain
> all but the last 512b sector written in a power fail condition. Does this
> count as journalling ?

If it provably will always leave the FTL in a consistent state, then yes,
probably...

kira.
