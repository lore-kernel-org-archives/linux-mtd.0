Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LRnAB-0006lT-2E
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2009 12:35:33 +0000
Subject: Re: UBIFS performance with no_chk_data_crc option
From: Artem Bityutskiy <dedekind@infradead.org>
To: Reuben Dowle <Reuben.Dowle@navico.com>
In-Reply-To: <70F6AAAFDC054F41B9994A9BCD3DF64E08308B18@exch01-aklnz.MARINE.NET.INT>
References: <70F6AAAFDC054F41B9994A9BCD3DF64E08308B18@exch01-aklnz.MARINE.NET.INT>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jan 2009 14:35:12 +0200
Message-Id: <1233059712.7085.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-01-27 at 13:09 +1300, Reuben Dowle wrote:
> It seems to me that enabling the no_chk_data_crc option actually causes
> SLOWER read performance. I get these results:

Reuben,

thanks for noticing this. We've fixed the issue. You may find the fix in
the linux-next branch of the ubifs-2.6.git tree:

commit 6f7ab6d458bbfc2f55d295fa3e6b9e69cdb1d517
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Tue Jan 27 16:12:31 2009 +0200

    UBIFS: fix no_chk_data_crc

    When data CRC checking is disabled, UBIFS returns incorrect return
    code from the 'try_read_node()' function (0 instead of 1, which means
    CRC error), which make the caller re-read the data node again, but using
    a different code patch, so the second read is fine. Thus, we read the
    same node twice. And the result of this is that UBIFS is slower
    with no_chk_data_crc option than it is with chk_data_crc option.
    This patches fixes the problem.

    Reported-by: Reuben Dowle <Reuben.Dowle@navico.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch has also been pushed to all UBIFS back-port git trees.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
