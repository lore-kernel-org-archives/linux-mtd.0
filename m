Received: from mail05a.webhosting-verizon.net ([209.238.3.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L7f4-0008LJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 20:32:06 +0100
From: "David Cooper" <david@forcedpotato.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>
Cc: "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000
Date: Thu, 20 Jun 2002 15:41:06 -0400
Message-ID: <AIEOIMKIOAAJKHJOGAEFMEEOCEAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.44.0206181008320.3554-100000@server.superbt.com>
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

Hello,

I have tried more and found out more.

(1) M-Systems Firmware

Strange, but true. If I use M-System's DOS-based dformat utility to load
firware version 4.2 into the DOC 2000 this prevents X from runnning from the
IDE drive.  This is true even if I boot with a kernel that has no support
for the DOC 2000.  As long as the DOC is sitting in my system (with Rev 4.2
firmware) X will not run.  I should point out that X does not cause the
system to hang in this case.

(2) nftl_format

So I bit the bullet and tried to remove all firmware (M-Systems dformat
/empty) and then do a complete low-level format with the MTD nftl_format
utility.  Then I put on top of that a ext2 root filesystem (not self
bootable of course).  This provided no improvement.  X still falls over at
the same spot.

(3) X Modules

I then was able to look at the X log file (/var/log/XFree86.0.log) and it
seemed that the point at which X fell over was when it was trying to load
the ddc module (libddc.a).  So I then mounted the entire
/usr/X11R6/lib/modules directory from the IDE drive and ran the rest from
the root filesystem on the DOC.  This allows X to get a little further
(seems to try to load a screen from the VESA BIOS).  But it still hangs,
this time after putting rubbish graphics on the screen (as in a normal
initialisation).

Question:  Why does X have trouble loading the libddc.a module from the DOC?

Thanks for you advice and suggestions thus far.

Cheers,

David Cooper


-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ilguiz Latypov
Sent: Tuesday, June 18, 2002 10:12 AM
To: David Cooper
Cc: Linux MTD
Subject: RE: X Windows Performance with DOC 2000



David,

Perhaps, running xinit command under gdb can help.  To go step-by-step
through the lines of code, a debug version of xinit would be more helpful.
I believe the gcc -g option will provide necessary debug information in
the produced executable binary.

Ilguiz

On Mon, 17 Jun 2002, David Cooper wrote:

> I tried this but, of course, the screen goes blank, system hangs and I
> can never look at the xinit.log file.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
