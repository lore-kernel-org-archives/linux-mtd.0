Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0a6e-0006Ih-1E
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 05:48:44 +0000
Received: from il06exr03.mot.com (il06exr03.mot.com [129.188.137.133])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i295lBAO016292
	for <linux-mtd@lists.infradead.org>;
	Mon, 8 Mar 2004 22:47:11 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr03.mot.com (Motorola/il06exr03) with ESMTP id i295l6rE018634
	for <linux-mtd@lists.infradead.org>; Mon, 8 Mar 2004 23:47:07 -0600
Message-ID: <01139FC052A0D411900B00508B9535FC102796CD@ZCH07EXM04.corp.mot.com>
From: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 9 Mar 2004 13:47:05 +0800 
MIME-Version: 1.0
Content-Type: text/plain
Subject: How to verify the ECC code for NAND Flash do work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

  I have modified the ECC part of code in my Linux system, but I don't know how to confirm that it does work.
  One way I'm thinking of is to get a NAND Flash with bad block somewhere inside it. Then there will be three points to be thought about. 
      1. A suitable probram to create a period of bad block inside a normal NAND Flash is needed. 
      2. How to run the program? Just run it on the running Linux platform or should use extern tools like AXD?
      3. What's the result if the ECC part fails?

  Thanks.

//Aaron.
