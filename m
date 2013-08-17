Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAl1t-0000bv-Df
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 18:15:14 +0000
Received: by mail-pa0-f49.google.com with SMTP id ld10so3124129pab.22
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 11:14:51 -0700 (PDT)
Date: Sat, 17 Aug 2013 11:14:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v4 6/6] mtd: update the ABI document about the ecc step
 size
Message-ID: <20130817181447.GC5034@norris.computersforpeace.net>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-7-git-send-email-b32955@freescale.com>
 <1376660759.2089.358.camel@sauron.fi.intel.com>
 <20130817032644.GA27332@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130817032644.GA27332@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, pekon@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 11:26:47PM -0400, Huang Shijie wrote:
> On Fri, Aug 16, 2013 at 04:45:59PM +0300, Artem Bityutskiy wrote:
> > On Fri, 2013-08-16 at 10:10 +0800, Huang Shijie wrote:
> > > +
> > > +What:          /sys/class/mtd/mtdX/ecc_step_size
> > > +Date:          May 2013
> > > +KernelVersion: 3.10
> > > +Contact:       linux-mtd@lists.infradead.org
> > > +Description:
> > > +               The size of each ECC step which is used for ECC.
> > > +               Note that some devices will have multiple ecc steps within each
> > > +               writesize region.
> > 
> > Actually this phrase is a bit confusing because it may be interpreted as
> > that one write-size may have ECC steps of multiple sizes. Would you
> > re-phrase, may be?
> What's about the following:
>  -----------------------------------------------------------------
>    The size of each ECC step which is used for ECC.
>    Note that some devices will have multiple ecc steps within each
>    writesize region, and the ecc steps share the same size.
>  -----------------------------------------------------------------

I took pieces of your message and rewrote it myself. Diff pasted below
(I edited ecc_strength to be less redundant and added a few details that
were worth mentioning). Let me know if you want to revise it, but I'll
push it to l2-mtd.git.

Brian

---
 Documentation/ABI/testing/sysfs-class-mtd | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 3105644..a795582 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -128,9 +128,8 @@ KernelVersion:	3.4
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		Maximum number of bit errors that the device is capable of
-		correcting within each region covering an ecc step.  This will
-		always be a non-negative integer.  Note that some devices will
-		have multiple ecc steps within each writesize region.
+		correcting within each region covering an ECC step (see
+		ecc_step_size).  This will always be a non-negative integer.
 
 		In the case of devices lacking any ECC capability, it is 0.
 
@@ -173,3 +172,16 @@ Description:
 		This is generally applicable only to NAND flash devices with ECC
 		capability.  It is ignored on devices lacking ECC capability;
 		i.e., devices for which ecc_strength is zero.
+
+What:		/sys/class/mtd/mtdX/ecc_step_size
+Date:		May 2013
+KernelVersion:	3.10
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The size of a single region covered by ECC, known as the ECC
+		step.  Devices may have several equally sized ECC steps within
+		each writesize region.  The step size counts only the data area,
+		not the spare area.
+
+		It will always be a non-negative integer.  In the case of
+		devices lacking any ECC capability, it is 0.
