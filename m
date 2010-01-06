Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSWxO-0008SO-7K
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 14:33:58 +0000
Subject: Re: ubifs mount failure upon power cycle
From: Artem Bityutskiy <dedekind1@gmail.com>
To: sid@ics.uci.edu
In-Reply-To: <ba9f10a6e8ef14a2d032fba7f1686df9.squirrel@webmail.ics.uci.edu>
References: <ba9f10a6e8ef14a2d032fba7f1686df9.squirrel@webmail.ics.uci.edu>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 16:32:44 +0200
Message-Id: <1262788364.3177.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, 2009-12-11 at 10:28 -0800, sid@ics.uci.edu wrote:
> I'm trying to use UBIFS (linux 2.6.31) on a MIPS based platform, 128 MB
> SLC (2k page) NAND flash as rootfs. After erasing the flash and mounting
> ubifs as rootfs, I do a large amount of file copies from NFS. However, if
> there is an abrupt power cycle, upon reboot the rootfs mount fails with
> the following error messages:
> 
> UBIFS: recovery needed
> UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 6:43008
> UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 6:43008
> UBIFS error (pid 1): ubifs_scan: LEB 6 scanning failed
> UBIFS error (pid 1): ubifs_recover_leb: corrupt empty space LEB 6:24576,
> corruption starts at 18432
> UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 6:18432
> UBIFS error (pid 1): ubifs_recover_leb: LEB 6 scanning failed
> VFS: Cannot open root device "ubi0:rootfs" or unknown-block(8,1)
> 
> I searched the list for similar messages. There was a similar thread
> (http://lists.infradead.org/pipermail/linux-mtd/2009-April/025229.html)
> for NOR flash. However, the fixes to recovery.c from that thread are
> already in the current sources.
> 
> Any suggestions/pointers on how to debug/fix would be greatly appreciated.

No idea why this could happen. Did you try do narrow down the problem to
a simpler use-case?

That thread was about NOR, that should not happen on NAND. This looks
like you have issues on NAND flash driver or HW level, not in UBI/UBIFS.

Please, start from running MTD tests and validate you NAND:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

And next time please try to follow these bug-report suggestions:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
