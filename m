Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy8ex-0005gH-1l
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 14:42:59 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j6SDgWYY029400
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 09:42:32 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j6SDgWNI236814
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 09:42:32 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j6SDgW0O015395
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 09:42:32 -0400
Received: from weaponx.rchland.ibm.com (weaponx.rchland.ibm.com [9.10.78.88])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j6SDgWhN015348
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 09:42:32 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 28 Jul 2005 08:42:20 -0500
Message-Id: <1122558140.22995.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [Fwd: mtd/drivers/mtd/chips cfi_cmdset_0001.c, 1.179, 1.180
	cfi_cmdset_0002.c, 1.119, 1.120 cfi_cmdset_0020.c, 1.19,
	1.20 cfi_util.c, 1.8, 1.9]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-------- Forwarded Message --------
> From: tpoynor@infradead.org
> To: linux-mtd-cvs@lists.infradead.org
> Subject: mtd/drivers/mtd/chips cfi_cmdset_0001.c, 1.179, 1.180
> cfi_cmdset_0002.c, 1.119, 1.120 cfi_cmdset_0020.c, 1.19, 1.20
> cfi_util.c, 1.8, 1.9
> Date: Wed, 20 Jul 2005 22:01:17 +0100 
> Update of /home/cvs/mtd/drivers/mtd/chips
> In directory phoenix.infradead.org:/tmp/cvs-serv16629/drivers/mtd/chips
> 
> Modified Files:
> 	cfi_cmdset_0001.c cfi_cmdset_0002.c cfi_cmdset_0020.c 
> 	cfi_util.c 
> Log Message:
> [MTD] CHIPS: Recognize Spansion CFI 1.4 chips
> 
> Modify Amd/Fujitsu CFI NOR flash primary vendor extension table revision
> check to recognize version 1.4.  Verified the existing driver can
> handle version 1.4 chips without additional info from 1.4 extended table.
> 
> Move the primary vendor extension table revision check from common file
> to the 3 CFI chip driver files, since the data structures and revisions
> handled by those data structures are specific to the chip driver.

It seems Intel also has some chips that use version 1.4 of the CFI
extended query table.  The Intel StrataFlash P30 (JS28FxxxP30xxx) report
version 1.4 of the table.

Has anyone had a chance to test out whether these will work with the
current driver?

thx,
josh
