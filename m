Received: from motgate8.mot.com ([129.188.136.8])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKHK9-0005Vs-Qq
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 10:20:24 -0400
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id i9KELeG2028752
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Oct 2004 07:21:40 -0700 (MST)
Received: from mail-gate2.mtwk.sps.mot.com ([10.82.173.5])
	by il06exr04.mot.com (Motorola/il06exr04) with ESMTP id i9KEIGIk018890
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2004 09:18:16 -0500
From: York Sun <yorksun@freescale.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: 
Content-Type: text/plain
Message-Id: <1098281947.14086.8.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 09:19:08 -0500
Content-Transfer-Encoding: 7bit
Subject: DQ7 vs DQ6 in flash erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shawn,

I have the same problem you had for AMD flash. Polling DQ6 doesn't
always work while polling DQ7 does. I have two board, one is with
AM29LV641D, the other is with AM29LV641M. The latter one always work for
both polling.

Did you figure it out?

  
-- 
Best regards,
 
York Sun, Ph.D
Metrowerks
Freescale Semiconductor Inc.
Phone: (512) 996-5252
Email: yorksun@freescale.com
 
This email, and any associated attachments have been classified as:
[x] Freescale Semiconductor General Business
[ ] Freescale Semiconductor Internal Use Only
[ ] Freescale Semiconductor Confidential Proprietary
