Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nci2b-0005Vo-38
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 16:25:25 +0000
Subject: Re: [PATCH] mtd: hot spin and code duplication in
	nand_bcm_umi_bch_read_oobEcc()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4B5A172C.2010609@gmail.com>
References: <4B5A172C.2010609@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 03 Feb 2010 18:22:55 +0200
Message-ID: <1265214175.7343.108.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Leo Chen <leochen@broadcom.com>, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-22 at 22:22 +0100, Roel Kluin wrote:
> In the branch where pagesize equalled NAND_DATA_ACCESS_SIZE, NumToRead
> wasn't decremented in the `while (numToRead > 11)' loop.
> Also the first and last while loops were duplicated in both branches.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
>  drivers/mtd/nand/nand_bcm_umi.h |   71 ++++++++++++++-------------------------
>  1 files changed, 25 insertions(+), 46 deletions(-)

Taken to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
