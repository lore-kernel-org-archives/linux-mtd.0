Received: from wx-out-0506.google.com ([66.249.82.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbzdE-0001ou-Kg
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 09:46:40 -0400
Received: by wx-out-0506.google.com with SMTP id t8so164902wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Apr 2007 06:46:33 -0700 (PDT)
Received: from pooky.senux.com (localhost.localdomain [127.0.0.1])
	by pooky.senux.com (8.13.7/8.13.7) with ESMTP id l3CDfbCQ025910
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 12 Apr 2007 22:41:37 +0900
Received: (from senux@localhost)
	by pooky.senux.com (8.13.7/8.13.7/Submit) id l3CDfb8Z025909
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 22:41:37 +0900
Date: Thu, 12 Apr 2007 22:41:37 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: FAT file system on NAND flash memory
Message-ID: <20070412134137.GA25860@pooky.senux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In my knowledge, mtdblock.c must be used to use 
FAT filesystem on bare NAND flash memories 
because NFTL is made only for a specific hardware, 
DiskOnChip.

(Layer 0) VFS
(Layer 1) FAT (or EXT2, EXT3)
(Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
(Layer 3) NAND flash memory driver (vendor specific)
(Layer 4) Physical NAND flash memory

Please let me know if it is wrong.

-- 
Seongsu's personal blog - http://www.senux.com/
LILO, you've got me on my knees! (from David Black,
dblack@pilot.njin.net, with apologies to Derek and the
Dominos, and Werner Almsberger)
