Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnWKL-0002TA-3K
	for linux-mtd@lists.infradead.org; Tue, 15 Sep 2009 11:36:09 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KQ000FQFG80NK@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 15 Sep 2009 20:36:00 +0900 (KST)
Received: from Sarathbabu ([107.108.214.67])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KQ00020DG7WOJ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 15 Sep 2009 20:36:00 +0900 (KST)
Date: Tue, 15 Sep 2009 17:04:11 +0530
From: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: [MTD-Tests]- issue while inserting modules
To: linux-mtd@lists.infradead.org
Message-id: <1FF44128171E4E6E900BD9EAEB332E73@sisodomain.com>
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am testing OneNAND on linux 2.6.31 using mtd-tests. I have built the modules for mtd-tests.
When i try to insert the mtd-test modules , i am facing the issue. Please find the log below.

LOG :
# insmod mtd_oobtest.ko
Using mtd_oobtest.ko

=================================================
mtd_oobtest: MTD device: 0
mtd_oobtest: MTD device size 131072, eraseblock size 131072, page size 2048, cou
nt of eraseblocks 1, pages per eraseblock 64, OOB size 64
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 1 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: error -30 while erasing EB 0
mtd_oobtest: error -30 occurred
=================================================
insmod: cannot insert `mtd_oobtest.ko': Read-only file system (-1): Read-only fi
le system

Regards,
Sarath. 
