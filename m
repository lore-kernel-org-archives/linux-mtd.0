Received: from ws6-6.us4.outblaze.com ([205.158.62.215])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KyS79-0002qJ-An
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 14:15:07 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
From: vijay.soni@drishyasystems.com
To: linux-mtd@lists.infradead.org
Date: Fri, 7 Nov 2008 19:45:05 +0530
Subject: nand flash 4K page size
Message-Id: <20081107141506.0F33C54825B@ws6-6.us4.outblaze.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The device driver supports nand flash with page sizes upto 2K as per the co=
de I saw in nand_ids.c=20
What changes we need to do to make it work for 4K page nand flash now that =
they are available. Is anybody already working to update the code to includ=
e 4K Nand flash?
