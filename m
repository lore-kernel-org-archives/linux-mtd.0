Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBKdB-0001xd-Pp
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 07:43:50 +0000
Received: by mail-wi0-f180.google.com with SMTP id hi8so3091652wib.7
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 23:43:46 -0800 (PST)
Date: Fri, 1 Mar 2013 08:43:30 +0100
From: Maurizio Lombardi <m.lombardi85@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBIFS corruption bug
Message-ID: <20130301074330.GA4075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    Hi all,


    I need some help with a problem with the UBIFS on a custom MPC5125-based board.

    First of all, we are running Linux 3.5.7 with a modified mpc5125_nfc driver;
    I ran the mtd tests and all of them were successful with the exception of the
    mtd_oobtest that failed.

    [...]
    mtd_oobtest: error: verify failed at 0x3da000
    mtd_oobtest: error: verify failed at 0x3db000
    mtd_oobtest: error: verify failed at 0x3dc000
    [...]

    By the way, I've read that the flash device probably does not support
    writing oob-only and that I shouldn't worry about this test.

    That said, Linux successfully boots from the ubifs-formatted NAND device and
    apparently it works flawlessly.
    The problem is that sometimes the filesystem gets corrupted and at mount the recovery
    process fails to fix it. This is the error I get at boot time:

    UBIFS: recovery needed
    UBIFS error (pid 1): ubifs_recover_leb: corruptio 0
    UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 404:376832
    UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 404:376832
    UBIFS error (pid 1): ubifs_recover_leb: LEB 404 scanning failed
    VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -117
    Please append a correct "root=" boot option; here are the available partitions:
    1f00            2048 mtdblock0  (driver?)
    1f01         4161536 mtdblock1  (driver?)
    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

    I tried to debug the ubifs to find what is going wrong, I noticed that
    the ubifs_recover_leb() function calls ubifs_scan_a_node(),
    the latter returns SCANNED_A CORRUPT_NODE and subsequently the no_more_nodes() function
    is called.

    no_more_nodes() skips the corrupt node and does a check to verify that after
    the corrupt node there is only empty space by calling is_empty(buf + skip, len - skip);
    is_empty() returns false and the recover procedure fails.


    Is there someone that could give me an advice on how to proceed to fix
    the problem?

    What could cause this problem? A bug in the mpc5125 nfc driver or a bug in ubi/ubifs ?

    Thank you in advance,
    Maurizio Lombardi
