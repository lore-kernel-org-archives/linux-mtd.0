Received: from tomts6.bellnexxia.net ([209.226.175.26] helo=tomts6-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aMwU-0001sJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 21:53:07 +0100
Date: Thu, 1 Aug 2002 16:53:03 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <20020801144115.SM02488@there>
Message-ID: <Pine.LNX.4.44.0208011649190.21990-100000@server.superbt.com>
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

On Thu, 1 Aug 2002, Mark Meade wrote:

> Additionally, the M-Sys firmware also locked up on both machines.  The 
> earlier Grub patch (the one with the -256 and -512 options) works fine.  I'm 
> not sure what's going on here, but I'll continue to try to figure out what is 
> wrong.  

Could that be due to change in MTD patch I made?  I added the
informational message output "DoC found" at the time of ROM BIOS extension
scan.  I wonder if the video card's BIOS extension can render INT 10h
unstable at that time.

Ilguiz
