Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jycu-0002s5-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 16:41:08 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: point()/unpoint() questions + small cfi_cmdset_0001.c patch 
Date: Mon, 17 Jun 2002 17:41:06 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLGEKNFEAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20561.1024307796@redhat.com>
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

Hi again

This will take some time to digest. Here is my initial comments  ... :-)

I am mainly interested in using point() in scan.c to reduce mount time. A quick and dirty hack
to impl. point() gives me better a scan time, from 4.43 sec to 3.53 sec, but this will probably go up
a bit if I do a proper impl. of point().


>
> Note that using AMD chips instead of Intel chips seems to be particularly
> sensible if you want XIP -- with Intel chips, the whole chip goes into
> status mode when you're doing things with it. Yet I believe that with AMD
> chips, only the block to which you're actually writing returns status bits,
> and all other erase blocks remain readable during the operation.

They do? I have not seen any evidence of this, do you happen to known
any perticular AMD device that does this?

>
> Anyway, to get back to the point... given that I don't like the possibility
> of deadlock with the naïve point/unpoint routines, and that I think we will
> need to do the page-based thing for XIP anyway, I suspect we should just
> use the suggested XIP setup for doing what you want in kernel space.
>
> So if you're looking at letting JFFS2 read directly from the flash, it
> would call a chip driver method akin to ioremap(), which would return a
> kernel virtual address from which all the flash can be read. The chip
> driver then marks pages absent as an when necessary -- for kernel mappings
> we can do that even without the rmap VM. We can probably also mark these
> pages as cacheable, to let burst reads work.
>
> Comments?
>
> --
> dwmw2
>
>
>
