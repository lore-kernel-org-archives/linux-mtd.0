Received: from mail05a.webhosting-verizon.net ([209.238.3.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LH6i-0000b9-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 06:37:16 +0100
From: "David Cooper" <david@forcedpotato.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Ilguiz Latypov" <ilatypov@superbt.com>,
	"Linux MTD" <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000 
Date: Fri, 21 Jun 2002 01:46:15 -0400
Message-ID: <AIEOIMKIOAAJKHJOGAEFMEFCCEAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <10120.1024619960@redhat.com>
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

David,

Some test results:

(1) X (MTD-enabled kernel,IDE)

- Works fine.

(2) X after first mounting nftla2 on /mnt/doc (MTD-enabled kernel,IDE)

- Works fine.
- But, if I try to perform any file operations on /mnt/doc the system hangs.
- If I stay away from /mnt/doc it is business as usual.

(3) X (MTD-enabled kernel,IDE), then stopping X and mounting nftla2 on
/mnt/doc

- Mount operation mount /dev/nftla2 /mnt/doc causes the shell to hang.
- Viewing the process "mount" using top shows that it is running
continuously and using 84% CPU time.
- All attempts to kill the mount process are futile.


So, it seems that once X has had its way with the system, use of the
DiskOnChip is impossible.  Question is, why?

I have been reflecting some on why SVGAlib apps run while X does not when I
use the DoC as the root file system.  My theory was that the SVGAlib
application is loaded into memory before it starts executing and talking to
the VESA BIOS.  In contrast, X is trying to setup the VESA BIOS and then
attempts to load modules from the DoC (at which point it hangs).

However, I repeated the above tests with SVGAlib and found that SVGAlib apps
and file operations on the DoC can occur at the same time with no apparent
problems.

hmmmm?

Cheers,

David Cooper



-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Thursday, June 20, 2002 8:39 PM
To: David Cooper
Cc: Ilguiz Latypov; Linux MTD
Subject: Re: X Windows Performance with DOC 2000



david@forcedpotato.com said:
>  Yes, when I use a kernel with the MTD support built-in for DoC 2000
> and nftl I can still run X with the DoC in the system (unless I use
> the M-Systems 4.2 firmware which prevents X from running with or
> without MTD support).  I have not tried loading and unloading MTD
> support as a kernel module.  Maybe this is worth a go.

If you have the drivers built-in and can still run X, that's what I wanted
to know. Can you even have the file system on NFTL mounted, as long as your
X modules aren't on it?

>  Interestingly, I can run SVGAlib applications from the DoC (using the
> VESA driver) without any trouble.  This is confusing because I would
> imagine that the SVGAlib VESA driver and the XFree86 VESA driver are
> both accessing the VESA BIOS.

True.

> M-Systems have told me that the firmware DoC driver that loads into
> memory at bootup sometimes conflicts in memory space that linux is
> trying to use. I suppose this would explain why using different
> firmware versions can prevent X from running from the IDE drive.

That caused Linux to fail to boot -- but once you're actually in Linux,
the allocations of the old DOS driver should be long forgotten.

Unless the XFree86 code somehow tries to re-run the DiskOnChip firmware --
but you said you'd reproduced the problem even with that obliterated,
didn't you?

--
dwmw2
