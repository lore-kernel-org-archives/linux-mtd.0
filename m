Received: from tomts10.bellnexxia.net ([209.226.175.54] helo=tomts10-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DROv-0005CJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 15:59:42 +0100
Date: Thu, 30 May 2002 10:59:33 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
cc: linux-mtd@lists.infradead.org
Subject: Re: Grub Booting Disk On Chip
In-Reply-To: <1022768943.26053.19.camel@tweedy.ksc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0205301054300.16783-100000@server.superbt.com>
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

On 30 May 2002, Bob Chiodini wrote:

> 1.  I get "DoC 2000 at D600".  The DOC is really at D000.

Weird.  Looks like BIOS calls DoC 2000 firmware with a different value of
Command Segment register.  I don't know if addressing D000:0 by offsetting
the D600 segment with a different value of IP register is possible.

> default=1
> [...]
> 2.  I get several messages about GRUB trying to find
> /boot/grub/menu.lst.  None of the messages indicate drive 0xE0.

Does the "default" parameter in menu.lst makes GRUB attempt to load the
second entry which refers to the disk 0x80?

Ilguiz
