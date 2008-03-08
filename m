Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXr9b-0002l1-Nj
	for linux-mtd@lists.infradead.org; Sat, 08 Mar 2008 04:59:28 +0000
Received: by fg-out-1718.google.com with SMTP id 22so692543fge.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Mar 2008 20:59:25 -0800 (PST)
Message-ID: <d70576c70803072059u5222c599r392c508c93114d27@mail.gmail.com>
Date: Sat, 8 Mar 2008 12:59:25 +0800
From: "hero sun" <armhero@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MLC nand flash ECC on Samsung S3C2412/S3C2413 based board
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am working on a Samsung S3C2413 based board. According the manual, I
wrote a test code for this CPU. But it seems the cpu can't product the
proper ECC code for the MLC flash. My flash type is Samsung K9G8G08,
8GBits Nand, 4bits for each cell.

The CPU manual on my hand is <<S3C2413X 32-BIT RISC MICROPROCESSOR
USER'S MANUAL>> Revision 1.06, I have compared some code fragment
provided by Samsung and this manual's description, there is some
difference (NFCONFregister bit 30, e.g), is there more later version?


B.R.

armhero
