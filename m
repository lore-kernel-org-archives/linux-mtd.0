Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3VB7-0007kt-Co
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 16:17:58 +0000
Message-ID: <4F50F2AB.10209@flatfrog.com>
Date: Fri, 2 Mar 2012 17:17:47 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Spurious ECC errors with mtd_subpagetest (OMAP3, NAND)
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When running the mtd_subpagetest I'm seeing more or less spurious ECC 
corrections.  I.e., one round may show 4 corrections and the next will 
show 7, only some of which are the same as the previous 4.

Are the ECC errors expected to be that volatile and frequent?


I've seen various discussions regarding the OMAP sub page support, as 
well as problems with the GPMC prefetch engine.  Disabling both made no 
difference regarding this.  I've also tried two different sets of NAND 
timings (relaxed and optimized), with no difference.

I'm using a Micron NAND that requires 4-bit ECC correction but I'm 
running with only 1-bit (software) ECC.  This is on an old kernel, 2.6.32.

Thanks,
Orjan

-- 
Orjan Friberg
FlatFrog Laboratories AB
