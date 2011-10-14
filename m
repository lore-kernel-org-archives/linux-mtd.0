Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REd1L-0000OQ-M0
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:21:36 +0000
Received: by wwg9 with SMTP id 9so522351wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 01:21:31 -0700 (PDT)
Subject: Re: [PATCH] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Fri, 14 Oct 2011 11:20:57 +0300
In-Reply-To: <1317013806-23640-1-git-send-email-b35362@freescale.com>
References: <1317013806-23640-1-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318580465.12351.63.camel@sauron>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, Li Yang <leoli@freescale.com>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-09-26 at 13:10 +0800, b35362@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> Freescale FCM controller has a 2K size limitation of buffer RAM. In order
> to support the Nand flash chip whose page size is larger than 2K bytes,
> we read/write 2k data repeatedly by issuing FIR_OP_RB/FIR_OP_WB and save
> them to a large buffer.
> 
> Signed-off-by: Liu Shuo <b35362@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>

Please, make checkpatch.pl happy:

dedekind@otc-wbsnb-06:~/git/l2-mtd-2.6$ checkpatch.pl ~/sauron/tmp/liu.mbox 
ERROR: code indent should use tabs where possible
#272: FILE: drivers/mtd/nand/fsl_elbc_nand.c:482:
+^I^I^I         (FIR_OP_CM2 << FIR_OP0_SHIFT) |$

ERROR: code indent should use tabs where possible
#273: FILE: drivers/mtd/nand/fsl_elbc_nand.c:483:
+^I^I^I         (FIR_OP_CA  << FIR_OP1_SHIFT) |$

ERROR: code indent should use tabs where possible
#274: FILE: drivers/mtd/nand/fsl_elbc_nand.c:484:
+^I^I^I         (FIR_OP_PA  << FIR_OP2_SHIFT) |$

ERROR: code indent should use tabs where possible
#275: FILE: drivers/mtd/nand/fsl_elbc_nand.c:485:
+^I^I^I         (FIR_OP_WB  << FIR_OP3_SHIFT));$

ERROR: code indent should use tabs where possible
#295: FILE: drivers/mtd/nand/fsl_elbc_nand.c:554:
+^I^I^I                (FIR_OP_WB  << FIR_OP1_SHIFT) |$

ERROR: code indent should use tabs where possible
#296: FILE: drivers/mtd/nand/fsl_elbc_nand.c:555:
+^I^I^I                (FIR_OP_CM3 << FIR_OP2_SHIFT) |$

ERROR: code indent should use tabs where possible
#297: FILE: drivers/mtd/nand/fsl_elbc_nand.c:556:
+^I^I^I                (FIR_OP_CW1 << FIR_OP3_SHIFT) |$

ERROR: code indent should use tabs where possible
#298: FILE: drivers/mtd/nand/fsl_elbc_nand.c:557:
+^I^I^I                (FIR_OP_RS  << FIR_OP4_SHIFT));$

total: 8 errors, 0 warnings, 295 lines checked

NOTE: whitespace errors detected, you may wish to use scripts/cleanpatch or
      scripts/cleanfile

/home/dedekind/sauron/tmp/liu.mbox has style problems, please review.

If any of these errors are false positives, please report
them to the maintainer, see CHECKPATCH in MAINTAINERS.



Also, please, send a patch which can be applied to my l2-mtd-2.6 tree,
this one is not applicable:

Applying: mtd: workaround for Freescale FCM to support large-page Nand chip
error: patch failed: drivers/mtd/nand/fsl_elbc_nand.c:76
error: drivers/mtd/nand/fsl_elbc_nand.c: patch does not apply
Patch failed at 0001 mtd: workaround for Freescale FCM to support large-page Nand chip
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
dedekind@otc-wbsnb-06:~/git/l2-mtd-2.6$ patch -p1 < .git/re
rebase-apply/ refs/         
dedekind@otc-wbsnb-06:~/git/l2-mtd-2.6$ patch -p1 < .git/rebase-apply/patch 
patching file drivers/mtd/nand/fsl_elbc_nand.c
Hunk #1 FAILED at 76.
Hunk #2 succeeded at 150 (offset -1 lines).
Hunk #3 succeeded at 204 (offset -1 lines).
Hunk #4 succeeded at 223 (offset -1 lines).
Hunk #5 succeeded at 341 (offset 18 lines).
Hunk #6 succeeded at 370 (offset 18 lines).
Hunk #7 succeeded at 399 (offset 18 lines).
Hunk #8 succeeded at 491 (offset 18 lines).
Hunk #9 FAILED at 537.
Hunk #10 succeeded at 620 (offset -5 lines).
Hunk #11 succeeded at 673 (offset -5 lines).
Hunk #12 succeeded at 714 (offset -5 lines).
Hunk #13 succeeded at 752 (offset -5 lines).
Hunk #14 succeeded at 803 (offset -5 lines).
Hunk #15 succeeded at 824 (offset -5 lines).
Hunk #16 succeeded at 996 (offset -9 lines).
2 out of 16 hunks FAILED -- saving rejects to file drivers/mtd/nand/fsl_elbc_nand.c.rej
dedekind@otc-wbsnb-06:~/git/l2-mtd-2.6$ 

-- 
Best Regards,
Artem Bityutskiy
