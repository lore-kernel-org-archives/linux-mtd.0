Received: from carrot.linuxgrrls.org ([212.18.228.66] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EZEl-0005Gb-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2001 17:29:19 +0100
Date: Mon, 25 Jun 2001 17:33:29 +0100 (BST)
From: kira brown <kira@linuxgrrls.org>
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: Disk-On-Module
In-Reply-To: <019101c0fd93$ecf78c40$326c020a@SENSORIA>
Message-ID: <Pine.LNX.4.30.0106251732570.1186-100000@carrot.linuxgrrls.org>
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


On Mon, 25 Jun 2001, Bao C. Ha wrote:

> How do I build a JFFS2 on Disk-On-Modules?  Or
> any flash-based ATA/IDE devices?

You don't.  They have their own wear levelling, journalling flash
translation layer built into them.  You just use them as discs.

kira.
