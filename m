Received: from ns1.spewey.com ([64.170.22.140])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CKSL-0003hk-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 13:18:05 +0100
Message-Id: <5.1.0.14.0.20010619072331.00a64ac0@mail.spewey.com>
Date: Tue, 19 Jun 2001 07:34:21 -0500
To: MTD mailing list <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Flash Device Database fields?
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

I'm setting up a flash device/board/driver-tested-with etc. database on the 
www.EmbeddedLinuxWorks.com site.

Folks will then be requested to input the part #'s of the flash chips they 
have got working, which driver file they used, version #,
which board they tested this on, the "working state" etc.

Other folks would then be able to do searches in it to see if  someone 
already has a particular driver or development board working and which 
driver file was used to get it working.

This should answer questions like:

"Does the XXX flash chip from the YYY mfg work with MTD, and why driver 
file I need to use?" etc.

I've thought of the following fields: Please review and suggest any new 
one's that may be useful.

If you like, just reply to me privately to avoid unnecessary traffic on the 
mtd list itself.

Thanks

Vipin


             FlashMfg      <AMD, INTEL, etc.> [OpenText field (or should it 
be a "select" list)?]
             PartNumber   <flash device part no> [Open txt field]
             BoardTestedOn <AMD SC520CDP, LART, etc> [open txt field]
             FlashType     <NOR, NAND, DOC etc.> [select list]
             DriverName    <driver file name> [open txt field]
             Results          <works_fine, works_partially, does_not_work> 
[select list]
             Driver Date    <date>
             Date Submitted <today's date>
             Submitted By  <optional> [Open txt field]
             Description   <any detailed instructions, caveats, exceptions, 
but's pointers etc.> [Big txt box.]
