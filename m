From: David Woodhouse <dwmw2@infradead.org>
To: Roy Lauer <rlaor@yahoo.com>
In-Reply-To: <20040202131627.72316.qmail@web20420.mail.yahoo.com>
References: <20040202131627.72316.qmail@web20420.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1075728808.786.28.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 02 Feb 2004 13:33:29 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with DOC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-02-02 at 05:16 -0800, Roy Lauer wrote:
> The first problem I encountered was that the kernel
> build failed due to unresolved symbol BUG_ON in
> mtd_core.c and mtd_blkdevs_24.c.
> I guess this is a bug.

Probably not. There is no Linux kernel which it makes sense to use but
which does not contain the definition of BUG_ON. You're probably using a
kernel which is too old. Although there does exist a possibility that I
just forgot to include the correct header file -- I doubt it though or
someone would have complained sooner.

> NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $

The DiskOnChip Millennium Plus uses INFTL not NFTL. You should be very
careful using the current INFTL code -- it does not observe the Bad
Block Table.

-- 
dwmw2
