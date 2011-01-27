Received: from mailout4.samsung.com ([203.254.224.34])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PiOdk-0007yK-TV
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 09:59:46 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LFO00K1NEFGSSD0@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 18:59:40 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LFO00E36EFHA6@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 18:59:41 +0900 (KST)
Date: Thu, 27 Jan 2011 18:59:40 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: RE: 4KiB page OneNAND OOB
In-reply-to: <4D413FBC.4080403@nokia.com>
To: 'Adrian Hunter' <adrian.hunter@nokia.com>,
	'Kyungmin Park' <kmpark@infradead.org>
Message-id: <0a2301cbbe08$ea2d8a60$be889f20$%park@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: ko
Content-transfer-encoding: 7BIT
References: <4D413FBC.4080403@nokia.com>
Cc: 'linux-mtd Mailing List' <linux-mtd@lists.infradead.org>,
	"'Tereshonkov Roman \(Nokia-D/Helsinki\)'" <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

Umm strange, I also got the 4KiB page OneNAND, but it has 4 bytes free from
2 at each spare area, So current code is right. 

8011h 10022h Managed by internal ECC logic
8012h 10024h Managed by internal ECC logic

Thank you,
Kyungmin Park

-----Original Message-----
From: Adrian Hunter [mailto:adrian.hunter@nokia.com] 
Sent: Thursday, January 27, 2011 6:50 PM
To: Kyungmin Park; Kyungmin Park
Cc: linux-mtd Mailing List; Tereshonkov Roman (Nokia-D/Helsinki)
Subject: 4KiB page OneNAND OOB

Hi

Current onenand_base.c has

/**
  *  onenand_oob_128 - oob info for Flex-Onenand with 4KB page
  *  For now, we expose only 64 out of 80 ecc bytes
  */
static struct nand_ecclayout onenand_oob_128 = {
	.eccbytes	= 64,
	.eccpos		= {
		6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
		22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
		38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
		70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
		86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
		102, 103, 104, 105
		},
	.oobfree	= {
		{2, 4}, {18, 4}, {34, 4}, {50, 4},
		{66, 4}, {82, 4}, {98, 4}, {114, 4}
	}
};

but our manual for a 4KiB Samsung OneNAND specifies
that each 512 byte sector has 16 bytes of OOB

0-1 bad block info
2-3 free
5-6 reserved
7-15 ecc

which implies ecc layout should be as follows for
4KiB pageOneNAND.

/**
  *  onenand_oob_128 - oob info for Onenand with 4KB page
  *  For now, we expose only 64 out of 72 ecc bytes
  */
static struct nand_ecclayout onenand_oob_128 = {
	.eccbytes	= 64,
	.eccpos		= {
		7, 8, 9, 10, 11, 12, 13, 14, 15,
		23, 24, 25, 26, 27, 28, 29, 30, 31,
		39, 40, 41, 42, 43, 44, 45, 46, 47,
		55, 56, 57, 58, 59, 60, 61, 62, 63,
		71, 72, 73, 74, 75, 76, 77, 78, 79,
		87, 88, 89, 90, 91, 92, 93, 94, 95,
		103, 104, 105, 106, 107, 108, 109, 110, 111,
		119
		},
	.oobfree	= {
		{2, 3}, {18, 3}, {34, 3}, {50, 3},
		{66, 3}, {82, 3}, {98, 3}, {114, 3}
	}
};

Do 4KiB OneNANDs need a different onenand_oob_128 from
FlexOneNAND?


Regards
Adrian
