Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDc9j-0007zc-MJ
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 05:37:47 +0100
Message-ID: <407CC018.3030505@avtrex.com>
Date: Tue, 13 Apr 2004 21:37:44 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mtd, mtdblock and nand ecc.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there some reason that the mtd and mtdblock drivers do not use ECC 
when the backing device is nand with ECC enabled?

I guess that kind of sums up my question.

If the answer is no, I am thinking of patching them so that they do use 
ECC when available.

I suppose you could run into problems if the backing device were a 
concatenation of ECC and non-ECC devices, but that could probably be 
detected either on open or at each page read/write.

Thanks in advance,

David Daney.
