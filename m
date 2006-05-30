Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl9II-0004j0-Ha
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 14:50:31 -0400
Date: Tue, 30 May 2006 20:50:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Message-ID: <20060530185017.GG26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060530152406.GA15284@wohnheim.fh-wedel.de>
Cc: 
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006 17:24:06 +0200, Jörn Engel wrote:
> 
> This patch is 90% uncontroversial.  The remaining 10% introduce a new
> field to struct mtd_info.  Looks like we need something similar to
> this patch, but probably not identical to it.
> 
> Comments?

/me just noticed how stupid the introduction of the kernel flags was.
Here is another migration path, that will likely receive Artems
objections as well.

Invariant:
In the end, initialization of the wbuf code will be identical for all
devices that require wbuf.  Whether a device requires wbuf is simply
checked by looking at mtd->size.  If mtd->size is greater than 1, we
need wbuf.

Step 1:
Turn MTD_NOR into MTD_GENERIC_TYPE and call the current initialization
for NOR the generic one.

Step 2:
Turn MTD_DATAFLASH into MTD_GENERIC_TYPE, remove its special cased
wbuf initialization and make sure the generic one is usable for
DATAFLASH as well.

Step 3:
Turn MTD_NAND into MTD_GENERIC_TYPE, remove its special cased wbuf
initialization and make sure the generic one is usable for NAND as
well.

Since step 3 isn't that simple, it need to be broken down further.

Step 3a:
Poke tglx to add his double-page-write code.  This should allow
mtd->writesize to go down for NAND flashes.

Step 3b:
Remove the OOB erasemarkers and move them in-band, just as for the
other types.

Step 3c:
See above


Again, Artem won't like this.  But this time I would like to see
better objections than before.  Just to show how silly they are:

	"*you* should prove why it is useless, not me"
That is what these patches are doing.  I remove every existing user of
mtd->type and thereby prove that mtd->type was useless in this
particular case.  When I'm finished and have dealt with every case,
the proof is complete.

	"i want to print a type of flash my JFFS2 file system is
	working on"
Show me the code.  If you have out-of-tree patches that may collide
with my work - tough luck.  I have out-of-tree patches as well and as
long as they are not merged, it is _my_ duty to deal with any breakage
created by other's changes in the kernel.  That has always been the
general rule and for a good reason.

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
