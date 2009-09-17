Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFaf-0004v2-2p
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 11:56:01 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KQ400GSW6H57S@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 20:55:54 +0900 (KST)
Received: from Sarathbabu ([107.108.214.67])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KQ400BUK6H49U@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 20:55:53 +0900 (KST)
Date: Thu, 17 Sep 2009 17:24:04 +0530
From: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: Re: [MTD-Tests]- issue while inserting modules
To: linux-mtd@lists.infradead.org
Message-id: <EFE8EA804139414AAAFE7C5C7F01F8D8@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <1FF44128171E4E6E900BD9EAEB332E73@sisodomain.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Now I am able to run MTD Tests on OneNAND.
MTD Tests by default takes the mtd0 as the device number as per the code.
I disabled the Writable Mask in the 0th partition in my architecture specific file and it started 
working.
I am using the mtd2 partition as the mtd device . So i initialized the "dev" variable in 
mtd_oobtest.c to the respective number and similarly all other test files.
I feel user should be prompted with the mtd device number he wants to run these tests.
Any comments?

Regards,
Sarath
----- Original Message ----- 
From: "Tadimarri Sarath Babu" <sarath.babu@samsung.com>
To: <linux-mtd@lists.infradead.org>
Sent: Tuesday, September 15, 2009 5:04 PM
Subject: [MTD-Tests]- issue while inserting modules


> Hi,
> I am testing OneNAND on linux 2.6.31 using mtd-tests. I have built the modules for mtd-tests.
> When i try to insert the mtd-test modules , i am facing the issue. Please find the log below.
>
> LOG :
> # insmod mtd_oobtest.ko
> Using mtd_oobtest.ko
>
> =================================================
> mtd_oobtest: MTD device: 0
> mtd_oobtest: MTD device size 131072, eraseblock size 131072, page size 2048, cou
> nt of eraseblocks 1, pages per eraseblock 64, OOB size 64
> mtd_oobtest: scanning for bad eraseblocks
> mtd_oobtest: scanned 1 eraseblocks, 0 are bad
> mtd_oobtest: test 1 of 5
> mtd_oobtest: erasing whole device
> mtd_oobtest: error -30 while erasing EB 0
> mtd_oobtest: error -30 occurred
> =================================================
> insmod: cannot insert `mtd_oobtest.ko': Read-only file system (-1): Read-only fi
> le system
>
> Regards,
> Sarath.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
