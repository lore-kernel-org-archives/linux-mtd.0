Received: from mailwasher.lanl.gov ([192.65.95.54] helo=mailwasher-b.lanl.gov)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4idJ-0007Gb-Ls
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 11:48:06 -0500
Received: from ccs-mail.lanl.gov (ccs-mail.lanl.gov [128.165.4.126])
	by mailwasher-b.lanl.gov (8.12.11/8.12.11/(ccn-5)) with ESMTP id
	j1PGm3rF023372
	for <linux-mtd@lists.infradead.org>; Fri, 25 Feb 2005 09:48:03 -0700
Date: Fri, 25 Feb 2005 09:48:02 -0700
To: linux-mtd@lists.infradead.org
Message-ID: <20050225164802.GA9612@durango.c3.lanl.gov>
References: <20050224175552.GR3347@durango.c3.lanl.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050224175552.GR3347@durango.c3.lanl.gov>
From: Greg Johnson <gjohnson@lanl.gov>
Cc: gjohnson@lanl.gov
Subject: Re: MTD for Intel 28F320C3B BIOS flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 24, 2005 at 05:55:52PM +0000, Greg Johnson wrote:
> Hi,
> 
> I would like to be able to update the BIOS of a bunch of Intel SE7520JR2
> motherboards from Linux.  According to the spec for this board, it has a
> Intel 28F320C3B flash chip.  
> 
> What would be required to support this under Linux MTD?  Grepping the
> source reveals references to Intel 28F320B3 chips.  Are these supported?
> If so, how similar are they?  I'm happy to read the spec and write code,
> but I need a little direction first.

Ok, I was able to get the 28F320C3B to work as an MTD device by adding
the appropriate entry to jedec_table[] in jedec_probe.c:


diff -ur linux-2.6.10/drivers/mtd/chips/jedec_probe.c linux-2.6.10-fix/drivers/mtd/chips/jedec_probe.c
--- linux-2.6.10/drivers/mtd/chips/jedec_probe.c        2004-12-24 16:35:40.000000000 -0500
+++ linux-2.6.10-fix/drivers/mtd/chips/jedec_probe.c    2005-02-24 19:34:20.790309335 -0500
@@ -101,6 +101,7 @@
 #define I28F160B3B     0x8891
 #define I28F320B3T     0x8896
 #define I28F320B3B     0x8897
+#define I28F320C3B     0x88c5
 #define I28F640B3T     0x8898
 #define I28F640B3B     0x8899
 #define I82802AB       0x00ad
@@ -1018,6 +1019,20 @@
                }
        }, {
                .mfr_id         = MANUFACTURER_INTEL,
+               .dev_id         = I28F320C3B,
+               .name           = "Intel 28F320C3B",
+               .uaddr          = {
+                       [1] = MTD_UADDR_UNNECESSARY,    /* x16 */
+               },
+               .DevSize        = SIZE_4MiB,
+               .CmdSet         = P_ID_INTEL_STD,
+               .NumEraseRegions= 2,
+               .regions        = {
+                       ERASEINFO(0x02000, 8),
+                       ERASEINFO(0x10000, 63),
+               }
+       }, {
+               .mfr_id         = MANUFACTURER_INTEL,
                .dev_id         = I28F320B3T,
                .name           = "Intel 28F320B3T",
                .uaddr          = {

The parameters seem to be correct from the specs including the regions
and sizes.  

With this patch, I am able to read the entire 4MB of the device (using
mtdchar), and the resulting file appears to contain valid BIOSes.
However, I can only write to half of the chip, i.e. 2MB.  I believe that
this is because the BIOS does "rolling updates".  The flash chip
contains two copies of the BIOS.  The flash chip is 4MB, and the BIOS
image is 2MB.  When updating, the active BIOS is saved, and the new BIOS
is written to the other "partition".  Afterwards, a flag is set
somewhere telling the hardware which is the active partition to boot
from.  If for some reason the new BIOS is bad, the system falls back to
the old one.

In any case, I am able to update the inactive partition (with flashcp),
but don't know how to set the flag to make it active.  Any thoughts on
how to do this?  Alternatively, if I could write to both partitions that
would work.  Maybe something to do with locking?

Thanks for any help,

Greg
