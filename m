Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcvPV-0004sp-PT
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 12:36:50 +0000
MIME-Version: 1.0
Message-ID: <trinity-c02357d1-77b8-45a8-9030-524418e69e18-1427805376579@3capp-gmx-bs38>
From: "Arno Steffens" <star@gmx.li>
To: linux-mtd@lists.infradead.org
Subject: Bad Block recognition in Nand Flash
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2015 14:36:16 +0200
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first 2 bytes of OOB of each block contain the marker for Bad blocks. I found, that this is not protected by ECC in my case here - ore better it is used before ECC is applied. Is this because I am using ancient software or is this a known limitation till today? 
In my implementation this bytes will compared with 0xff. A single bit flip and my device is bricked, as the otherwise good block is not used anymore.

Background for this question: In my old uboot and kernel I just found a few function that are linked with bad block handling. So I am not sure I can make it to find all places where there is just a comparison.

Thanks for your attention.
Arno
