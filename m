Received: from tomts23.bellnexxia.net ([209.226.175.185] helo=tomts23-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173J8k-0003nK-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 17:09:06 +0100
Date: Thu, 2 May 2002 12:09:03 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: John Sutton <john@scl.co.uk>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Booting from DOC2000 with GRUB loader
In-Reply-To: <02050212224002.09412@diva.localdomain>
Message-ID: <Pine.LNX.4.44.0205021157100.10381-100000@server.superbt.com>
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

John,

On Thu, 2 May 2002, John Sutton wrote:

> Erase size not 8Kb - I'm confused

Do I understand correctly from the numerous clarifications in this mailing
list that the nftl_format utility may result in an NFTL layer incompatible
with the M-System's one when the chip's erase size is not 8Kb?  I myself 
removed the check and was able to format and use the chip.

I am dumber when it comes to the bad block table issue.  My guess is that
nftl_format marks bad erase sectors in the NFTL bad block table.  No way
GRUB itself is aware of any bad sectors in its own area.  My impression is
that erase sectors can be marked as bad in their ECC header, but others
may give you a less idiotic answer.

Ilguiz
