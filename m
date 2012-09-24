Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGADL-0007Fj-Gp
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 15:04:52 +0000
Received: by obbta17 with SMTP id ta17so5772105obb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 08:04:47 -0700 (PDT)
Message-ID: <50607688.6090601@gmail.com>
Date: Mon, 24 Sep 2012 11:04:40 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Per-partition NAND ECC?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On the OMAP3 parts the bootrom has a hard requirement of using 1-bit
Hamming ECC to read the 2nd stage bootloader(x-loader / SPL) out of the
first four blocks of NAND.  The Micron MT29C4G48MAZAPAKQ5 PoP part we're
using requires 4-bit ECC for all the other NAND blocks to maintain an
acceptable UBER.

Currently this wasn't a problem since I could use u-boot to update the
2nd stage bootloader. I now have a need to be able to update the 2nd
stage bootloader from Linux only so I need the ability to write/read
pages in a NAND partition with a different ECC method than that
specified over the device.  I think it would be more elegant to solve
this by allowing partition entry/mtdparts to specify its ECC
methodology, track that as part of the MTD device down into the nand
driver, and switch ECC methods/entrypoints as it changes.

Does anyone have suggestions on how to best approach this?

Thanks in advance!

-- 
Peter Barada
peter.barada@gmail.com
