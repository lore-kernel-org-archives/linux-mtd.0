Received: from tomts20.bellnexxia.net ([209.226.175.74] helo=tomts20-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DS9k-0005Ga-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 16:48:04 +0100
Date: Thu, 30 May 2002 11:48:02 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
cc: linux-mtd@lists.infradead.org
Subject: Re: Grub Booting Disk On Chip
In-Reply-To: <1022772338.26053.42.camel@tweedy.ksc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0205301138270.16856-100000@server.superbt.com>
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

Bob,

On 30 May 2002, Bob Chiodini wrote:

> root (dc0,0)
> configfile /boot/grub/menu.lst
> 
> At this point a get a menu with the second entry highlighted.  Hitting
> enter boots from /dev/hda1.  /dev/hda1 is the only disk on the system.

Does GRUB show unsuccessful attempts to load /boot/grub/menu.lst from the 
disk 0xE0 before going to interactive mode?  

Also, the fact that menu.lst is a symbolic link could confuse the stripped
down ext2 filesystem driver of GRUB.  Can you remove the link and create a 
regular configuration file?

> It looks like DS is saved as the address of the DOC, if it is not a
> Millenium DOC.

Oops, you are right.  In fact, the read-only initial program loader of DoC 
2000 will copy the firmware from the flash memory to 0x2000:0 before 
jumping there with the DS segment pointing to the DoC BIOS window.  Here 
is the David's comment in the patch:

        * With DoC 2000, _start is loaded at 0x20000 by the IPL,
        * and is jumped to with CS:IP 0x2000:0, DS is <DoC segment>.

Later DS is stored in %cs:doc_seg where %cs holds the segment at the end
of conventional RAM.

Ilguiz
