Received: from pintail.mail.pas.earthlink.net ([207.217.120.122])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XEdA-0007G2-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 06:24:12 +0100
Received: from 24-205-79-158.pas-res.charterpipeline.net ([24.205.79.158])
	by pintail.mail.pas.earthlink.net with esmtp (Exim 3.33 #1)
	id 17XEd7-0001GJ-00
	for linux-mtd@lists.infradead.org; Tue, 23 Jul 2002 22:24:09 -0700
Subject: MTD/DOC2000 question
From: Conrad Steenberg <conrad@hep.caltech.edu>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 23 Jul 2002 22:26:09 -0700
Message-Id: <1027488370.4105.7.camel@Tafelberg>
Mime-Version: 1.0
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

Hi

I'm trying to create a filesystem on a 72M DOC2000 (Netier XL1000), and
get up to creating a partition (/dev/nftla1). This is with Bering-rc3.

When I try mke2fs /dev/nftla1, the following gets reported:

NFTL_writeblock(): Cannot find block to write to
end_request; I/O error, dev 5d:01 (unknown) sector XXXXX
Argh! No free blocks found LastFreeEUN = 4603, FirstEUN = 3
No Virtual Unit Chains available for folding. Failing request

The device was formatted with nftl_format first.

Any ideas?

Cheers!

Conrad
