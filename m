Received: from tomts13-srv.bellnexxia.net ([209.226.175.34])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ajx3-0004XA-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 22:27:13 +0100
Date: Fri, 2 Aug 2002 17:27:11 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <200208021549578.SM02488@there>
Message-ID: <Pine.LNX.4.44.0208021720020.1426-100000@server.superbt.com>
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

On Fri, 2 Aug 2002, Mark Meade wrote:

> Anyway, is it possible to take an unmodified 0.92 Grub, and cleanly apply the 
> latest (07-29) patch?  I was not able to do this, mainly because of automake 
> version differences.  

I once moved to post-0.92 snapshot by adjusting the MTD DOC patch to the
new terminal emulation.  It's not a big deal to downgrade the terminal
emultaion changes, but I have some other issues at work till the middle of
August.

I updated the 07-29 patch in the folowing areas:
 
  a) correct the READID memory block and flash addresses
  b) restore the accidentally dropped builtins.c modifications

The correction (b) came up after a routine check of the new patch against
the old patch.  Could be another reason for GRUB malfunction on P133...

Ilguiz
