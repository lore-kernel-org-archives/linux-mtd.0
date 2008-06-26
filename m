Message-ID: <4863E721.60906@freescale.com>
Date: Thu, 26 Jun 2008 13:59:45 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: fix OOB workability for large
	page NAND chips
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
In-Reply-To: <20080626184156.GA2356@polina.dev.rtsoft.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> For large page chips, nand_bbt is looking into OOB area, and checking
> for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
> reserved for bbt means.

Interesting... both the 8313 manual and the manual for a random large 
page NAND chip say that the bad block indicator is one byte.

BTW, I was just looking at NAND boot on this chip, and it seems that it 
expects ECCM=1 for large page devices, so we should make that the 
default (preferably at the same time as we fix this problem, so that we 
don't break compatibility with a working version).

-Scott
