Received: from idiom.com ([216.240.32.1] ident=espin)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 167NHs-0005Ob-00
	for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2001 20:51:04 +0000
Received: (from espin@localhost)
	by idiom.com (8.9.3/8.9.3) id NAA06127
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2001 13:01:37 -0800 (PST)
Date: Fri, 23 Nov 2001 13:01:36 -0800
From: Geoffrey Espin <espin@idiom.com>
To: linux-mtd@lists.infradead.org
Subject: 4 x AMD29LV800B CFI?
Message-ID: <20011123130136.A94932@idiom.com>
References: <E1669aI-0001iv-00@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E1669aI-0001iv-00@pentafluge.infradead.org>; from linux-mtd-request@lists.infradead.org on Tue, Nov 20, 2001 at 12:01:02PM +0000
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

Is there a definitive URL to discover what chips are CFI and
which are not?  I've Googled the planet for the AMD29LV800B family.

The chip is appears in mtd/chips/amd_flash.c, not necessarily
CFI.  I found a nearly dead link on AMD site to source code:

    http://www.amd.com/us-en/assets/content_type/utilities/cfiflash.h.txt
    http://www.amd.com/us-en/assets/content_type/utilities/cfiflash.c.txt

which contains the part, yet the datasheet:

    http://www.amd.com/us-en/assets/content_type/DownloadableAssets/21531.pdf

doesn't list it as having CFI.

The NEC/MIPS "Korva" board I'm trying to get this working on has
4 x AMD29LV800B's byte interleaved for 4MB total.  I've tinkered
with cfi/jedec/amd_flash and not one of them will recognize the
part(s).  After sending the command code(s), it replies with the
contents at the particular offset, not the chip code.  Perhaps
my h/w setup is insisting that all 4 parts are programmed at
once?  I see ifdef SOMEONE_ACTUALLY... for width 4 type 32
interleave 4; maybe this means generate the right pattern?  I'm
now driven to more furious surgery, it seems.  :-(

Geoff
-- 
Geoffrey Espin
espin@idiom.com
