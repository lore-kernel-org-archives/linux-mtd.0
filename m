Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AA8t1-00061G-GT
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 15:13:55 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: ch@hpl.hp.com
In-Reply-To: <000901c39376$9cb111e0$d203b60f@duckduck>
References: <000901c39376$9cb111e0$d203b60f@duckduck>
Message-Id: <1066313282.10573.121.camel@tubarao>
Mime-Version: 1.0
Date: 16 Oct 2003 08:08:02 -0600
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: 'mtd list' <linux-mtd@lists.infradead.org>
Subject: Re: Regression of mtd/chips/jedec_probe.c in 2.6.0-test7
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-15 at 17:46, Christopher Hoover wrote:
> Perhaps this is already known, but it may serve as useful news to some. 
> 
> The version of mtd/chips/jedec_probe.c in 2.6.0-test7 (revision 1.29
> according to $Id$) has suffered a regression.  That version fails to detect
> AMD AM29LV800BB flash in 16-bit x 1 configuration.  Replacing it with
> revision 1.32 from CVS or downgrading to revision 1.6 from 2.5.70-rmk1,
> holding everything else constant, solves the problem.

Does that mean that 1.29 and 1.7 didn't work or did you just try those
versions because they were convenient for your?

> Also, all versions of mtd/chips/jedec_probe.c need:
> 
> #include <linux/init.h>

I fixed it moments before I read your email - thanks.

I'm concerned that the changes from 1.29 -> 1.33 are significant and
will meet resistance for inclusion in 2.6.0.  If you can narrow the
problem down to just a few lines that are obviously incorrect then the
patch should have a fighting chance.  There is a section that is an
obvious bug in jedec_match() that should be fixed:

@@ -1480,7 +1524,7 @@
 	DEBUG( MTD_DEBUG_LEVEL3,
 	       "MTD %s(): Check fit 0x%.8x + 0x%.8x = 0x%.8x\n",
 	       __func__, base, 1 << finfo->DevSize, base + (1 <<
finfo->DevSize) );
-	if ( base + ( 1 << finfo->DevSize ) > map->size ) {
+	if ( base + cfi->interleave * ( 1 << finfo->DevSize ) > map->size ) {
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
 		       __func__, finfo->mfr_id, finfo->dev_id,

The most likely problem, however is this chunk:

@@ -1538,10 +1582,10 @@
 	 */
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__ );
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
cfi->device_type, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
 	/* FIXME - should have a delay before continuing */
 
  match_done:	


Of course I can point to a few more chunks that should go into 2.6 (and
2.4 obviously), but the arguments are much weaker about why they have to
go in *now*.

If you figure out exactly what the regression is then we should lob it
at lkml.

Once again, thanks.
