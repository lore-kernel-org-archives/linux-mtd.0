Message-ID: <48694BA3.7010805@freescale.com>
Date: Mon, 30 Jun 2008 16:09:55 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH 3/3] MTD: NAND: fsl_elbc_nand: ecclayout cleanups
References: <20080627190243.GA4713@polina.dev.rtsoft.ru>
	<20080627190420.GC16901@polina.dev.rtsoft.ru>
In-Reply-To: <20080627190420.GC16901@polina.dev.rtsoft.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> This patch deletes oobavail assignments, they're calculated by the nand
> core code in nand_scan_tail, plus current oobavail values are wrong for
> the LP NANDs.
> 
> Also remove mtd->ecclayout and mtd->oobavail assignments, mtd core
> handles this all by itself.
> 
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>

ACK

-Scott
