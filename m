Received: from neutrino1.hep.caltech.edu ([131.215.126.112] helo=neutrino2.hep.caltech.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XO0r-0007z7-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 16:25:17 +0100
Received: (from root@localhost)
	by neutrino2.hep.caltech.edu (8.11.6/8.11.6) id g6OFPFa09273
	for linux-mtd@lists.infradead.org; Wed, 24 Jul 2002 08:25:15 -0700
Received: from heppc22.hep.caltech.edu (heppc22.hep.caltech.edu [131.215.126.114])
	by neutrino2.hep.caltech.edu (8.11.6/8.11.6) with ESMTP id g6OFPFV09266
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 08:25:15 -0700
Subject: Re: MTD/DOC2000 question
From: Conrad Steenberg <conrad@hep.caltech.edu>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1027488370.4105.7.camel@Tafelberg>
References: <1027488370.4105.7.camel@Tafelberg>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Jul 2002 15:25:10 -0700
Message-Id: <1027549510.3366.9.camel@heppc22.cithep.caltech.edu>
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

OK, let me reply to myself, since others have asked this question on
various lists, but the answer never seems to get posted :-)

To get the DOC to work if you get the below messages while creating a
filesystem, do the following:

1. nftl_format /dev/nftla
2. Reboot the device so that the bad "blocks" marked in the above
process are detected.
3. fdisk /dev/nftla and create the partitions you want
4. Reboot again so that the partitions can be properly detected (in the
old days exiting fdisk used to warn that this needs to be done)
5. Create the filesystem using mkfs.jffs2, mke2fs etc.

Cheers!

Conrad

On Tue, 2002-07-23 at 22:26, Conrad Steenberg wrote:
> Hi
> 
> I'm trying to create a filesystem on a 72M DOC2000 (Netier XL1000), and
> get up to creating a partition (/dev/nftla1). This is with Bering-rc3.
> 
> When I try mke2fs /dev/nftla1, the following gets reported:
> 
> NFTL_writeblock(): Cannot find block to write to
> end_request; I/O error, dev 5d:01 (unknown) sector XXXXX
> Argh! No free blocks found LastFreeEUN = 4603, FirstEUN = 3
> No Virtual Unit Chains available for folding. Failing request
> 
> The device was formatted with nftl_format first.
> 
> Any ideas?
> 
> Cheers!
> 
> Conrad
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
*-----------------------------------------*
| Conrad Steenberg                        |
| Caltech, Mail Code 356-48               |
| Pasadena, CA, 91125                     |
| e-mail: conrad@hep.caltech.edu          |
| Tel: (626) 395-8758                     |
*-----------------------------------------*
