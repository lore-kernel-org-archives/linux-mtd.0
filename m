Received: from smtp-out1.tiscali.nl ([195.241.79.176])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEZhw-0005Bq-HO
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 00:31:21 +0000
Message-ID: <478BFE1C.1090608@tiscali.nl>
Date: Tue, 15 Jan 2008 01:28:12 +0100
From: Roel Kluin <12o3l@tiscali.nl>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [MTD] potential division by 0 in cfi_build_cmd() and
	cfi_merge_status()?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Doing some grepping, I stumbled upon this possible error:

in include/linux/mtd/cfi.h, lines 302 and 366, resp. functions
cfi_build_cmd() and cfi_merge_status() there is a division by
cfi_interleave(cfi):

chip_mode = map_bankwidth(map) / cfi_interleave(cfi);

This could be problematic when No CONFIG_MTD_CFI_Ix is selected:
cfi_interleave will triggers BUG(), but when BUG is disabled, the
function returns 0, causing a subsequent division by zero.

When a CONFIG_MTD_CFI_Ix is selected, cfi_interleave(cfi) is either
defined 1 or defined (cfi)->interleave.

cfi is a struct cfi_private pointer, with interleave as an int.

I am not sure whether interleave can ever be 0 in this division when 
CONFIG_MTD_CFI_Ix is set.

shouldn't there be an error exit when cfi_interleave(cfi) evaluates
to 0?

I am not subscribed to this list, so please CC.

Roel
