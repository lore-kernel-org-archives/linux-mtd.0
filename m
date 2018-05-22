Received: from sender-of-o51.zoho.com ([135.84.80.216])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL8f1-0002cG-DQ
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 14:53:12 +0000
Date: Tue, 22 May 2018 20:22:54 +0530
From: Siddharth Chandrasekaran <siddharth@embedjournal.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Message-ID: <1638856b945.101c6b59a6973.7576653443668587481@embedjournal.com>
In-Reply-To: 
Subject: NOR Flash Test Utility
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to test some NOR flashes to for manufacturing defects. I see there
is a test utility that reads and writes sequentially for NAND flash under
`nand-utils`, but `nor-utils` doesn't seem to have anything similar.

Where can I find one for NOR? If I have to write my own, will you be interested
in a patch?

-Sid.
