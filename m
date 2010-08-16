Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ol0uK-0000ZD-VT
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 14:43:25 +0000
Received: by wwi17 with SMTP id 17so1258018wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 07:43:23 -0700 (PDT)
Subject: NAND ECC on a per-partition basis
From: Peter Barada <peter.barada@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Aug 2010 10:38:31 -0400
Message-ID: <1281969511.13433.207.camel@thunk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: peter.barada@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working with a Micron POP part for an omap3530, and I need to write
pages in the boot block using the builtin Hamming ECC(as the bootrom
expects it), but the rest of the blocks I want to use the NAND's builtin
4-bit ECC engine.

Is there any way to specify the ECC method on a per-partition basis?

If not, what would be the best way to go about modifying the MTD code to
allow such?


-- 
Peter Barada <peter.barada@gmail.com>
