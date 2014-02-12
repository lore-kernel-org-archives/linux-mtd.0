Received: from mail-by2ln0179.outbound.protection.outlook.com
 ([2a01:111:f400:7c0c::179] helo=na01-by2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDNLk-0000XH-Ad
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 00:06:51 +0000
Message-ID: <1392163570.6733.409.camel@snotra.buserror.net>
Subject: Re: [U-Boot] NAND bad block table
From: Scott Wood <scottwood@freescale.com>
To: Naveen Mamindlapalli <naveen.mamindlapalli@xilinx.com>
Date: Tue, 11 Feb 2014 18:06:10 -0600
In-Reply-To: <155aac48-cedd-4daa-80b0-577f85080950@CO1EHSMHS005.ehs.local>
References: <52e923ea-96b0-4e9b-9c3f-b733cf46b144@CO9EHSMHS020.ehs.local>
 <1391546816.6733.172.camel@snotra.buserror.net>
 <52F247DA.2010209@monstr.eu>
 <1391627762.6733.202.camel@snotra.buserror.net>
 <155aac48-cedd-4daa-80b0-577f85080950@CO1EHSMHS005.ehs.local>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "monstr@monstr.eu" <monstr@monstr.eu>, Michal Simek <michals@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-02-10 at 15:05 +0000, Naveen Mamindlapalli wrote:
> Cc: linux-mtd-list
> 
> Hi Scott,
> 
> Yes, the searching of BBT happens from the end of flash when
> NAND_BBT_USE_FLASH option is used & NAND_BBT_ABSPAGE option is not
> used. The searching of BBT happens by scanning the last 4 blocks for
> BBT signature starting from end block. The number of blocks to scan
> from the end for BBT signature is defined by macro
> NAND_BBT_SCAN_MAXBLOCKS in "include/linux/mtd/bbm.h" which is currently
> set to value 4.
> 
> If the last 4 blocks are factory marked bad by the vendor, then the
> flash is not usable by u-boot or Linux. We can fix this issue by
> changing the macro value NAND_BBT_SCAN_MAXBLOCKS to a value greater
> than 4 (depending on the flash part) which doesn't seem to be a good
> solution since the change has to be done to the MTD layer default
> values.
> 
> It would be good if there is a device tree binding to specify the
> number of blocks to scan to check if BBT is present in the flash.
> Currently there is no such device tree option is available.
> 
> Thanks and Regards,
> Naveen

I see.  I wonder where the value of 4 came from -- it seems a bit small.
The only downside of increasing NAND_BBT_SCAN_MAXBLOCKS would be a
little extra startup latency when no BBT is present, right?

-Scott
