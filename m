Received: from pop.scorch.co.nz ([203.167.215.14] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FkE6T-0003qY-Iu
	for linux-mtd@lists.infradead.org; Sun, 28 May 2006 01:46:25 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Sun, 28 May 2006 17:54:26 +1200
References: <BAY110-F408C270588868018C9B3D3BC9C0@phx.gbl>
In-Reply-To: <BAY110-F408C270588868018C9B3D3BC9C0@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605281754.26258.manningc2@actrix.gen.nz>
Cc: Han Chang <posaune@hotmail.com>
Subject: Re: FAT vs jFFS2 for NAND.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 28 May 2006 14:58, Han Chang wrote:
> Hi there,
>
> My first question is that if I can use FAT file system for NAND. If yes,
> what are the pros and cons for using FAT vs. JFFS2.

FAT needs to work with a block driver, so you can use FAT if you use a block 
driver on top of the NAND. 

You can use JFFS2 or YAFFS as true flash file systems (ie that work directly 
with the NAND).


Pros of FAT:
*) If you're using this on a device that must look like a USB mass storage 
device, or similar, then FAT is easier for people to use.
*) Have a smaller RAM footprint than JFFS2 or YAFFS. JFFS2 and YAFFS both use 
ram to build runtime look-up trees. 
*) FAT file systems will typically mount faster than JFFS2 and YAFFS, though 
both YAFFS and JFFS2 mount times have reduced significantly in recent weeks.

Pros of YAFFS or JFFS2:
*) Faster.  YAFFS is faster than JFFS2 which should be faster than FAT.
*) YAFFS and JFFS2 are both log structured fs which make them far more robust 
against corruption than FAT.
*) YAFFS abd JFFS2 support features like links which are missing from FAT.

-- Charles
