Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SmEM-0006Wv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 21:43:54 +0000
Received: from ilatypov (helo=localhost)
	by infradead.org with local-esmtp (Exim 3.20 #2)
	id 16SmP2-00087P-00
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2002 21:54:56 +0000
Date: Mon, 21 Jan 2002 21:54:56 +0000 (GMT)
From: ilatypov@infradead.org
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DOC, grub and whatever is in between
Message-ID: <Pine.LNX.4.44.0201212153480.31203-100000@infradead.org>
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

Paolo,

It seems one has to find enough time and courage to copy the
Millenium-specific lines from MTD drivers' doc2000.c to GRUB's
bdev_diskonchip.c.  As far as I understand the ReadPipeInit and 
LastDataRead registers should be dealt with.

I don't have a DOC Millenium to test the changes with.

Ilguiz

On Mon, 21 Jan 2002, Paolo Supino wrote:

>   I'm trying to activate a system that has a DOC Millenum as primary
> boot device and I want to use grub. I do the following:
