Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PiOUc-0007t8-2E
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 09:50:18 +0000
Message-ID: <4D413FBC.4080403@nokia.com>
Date: Thu, 27 Jan 2011 11:49:48 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>
Subject: 4KiB page OneNAND OOB
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	"Tereshonkov Roman \(Nokia-D/Helsinki\)" <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
