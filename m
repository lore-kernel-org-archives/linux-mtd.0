Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FskCv-0006Mw-Fu
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 18:40:10 +0100
Subject: Re: FAT vs jFFS2 for NAND.
From: Thomas Gleixner <tglx@linutronix.de>
To: Claudio Lanconelli <lanconelli.claudio@eptar.com>
In-Reply-To: <44982FC3.8080501@eptar.com>
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
	<4497DCA6.2080006@eptar.com>
	<1150806658.17609.55.camel@hades.cambridge.redhat.com>
	<4497F758.5090708@eptar.com>
	<1150811549.6780.192.camel@localhost.localdomain>
	<44982FC3.8080501@eptar.com>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 19:41:24 +0200
Message-Id: <1150825284.6780.270.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Claudio,

On Tue, 2006-06-20 at 19:26 +0200, Claudio Lanconelli wrote:
> Thanks Thomas for your tips.
> Here a second try, does it look fine?

Much better now.

> I attached the file instead of inline to avoid tab/space replacement by 
> email client.

> however can I ask you where I find prototype/usage for mtd->block_is_bad()?

Oops, mtd->block_isbad()

	if (mtd->block_isbad(mtd, offset)
		skip_bad_block();
	else
		scan_block()

offs is the offset of the block:
0 for the first block
16384 for the second ...
you certainly have this offset handy in the scan any way

This looks up the bad block table which is created in ram after the NAND
chip has been detected in nand_scan() and helps you to avoid reading bad
blocks. Just skip the block, when the function returns 1.

The only exception I think is block 0, which contains the SSFDC header
and is marked bad for protection.

> And against which tree I need to build it? Be patient, please.

The best is to build against mtd-26.git from git.infradead.org. git
instructions are on the MTD homepage.

I do a thorough review, when you have it running with that tree.

Thanks,

	tglx


> #define ArraySize(x)	( sizeof(x) / sizeof((x)[0]) )

use the existing ARRAY_SIZE() macro please


> //Must be ordered by size

C++

> static const chs_entry_t chs_table[] = {

> /* Read and check for a valid CIS sector */
> static int get_valid_cis_sector(struct mtd_info *mtd)
> {
> 	int ret, k, cis_sector;
> 	size_t retlen;
> 	loff_t offset;
> 	uint8_t sect_buf[SECTOR_SIZE];
> 
> 	/* Look for CIS/IDI sector on the first GOOD block (give up after 4 bad
> 	   blocks). If the first good block doesn't contain CIS number the flash
> 	   is not SSFDC formatted */

	/*
	 * Use this for 
	 * multiline comments please
	 */
