Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MAzzb-0003uh-UW
	for linux-mtd@lists.infradead.org; Mon, 01 Jun 2009 05:23:34 +0000
Message-ID: <52785.192.168.10.89.1243833774.squirrel@dbdmail.itg.ti.com>
Date: Mon, 1 Jun 2009 10:52:54 +0530 (IST)
Subject: Re: [resending-2] [PATCH] [MTD] [NAND] Add OMAP2 / OMAP3 NAND driver
From: "vimal singh" <vimalsingh@ti.com>
To: dedekind@infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 15, 2009 at 6:38 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Thu, 2009-04-30 at 15:03 +0530, vimal singh wrote:
>> This driver is present in the OMAP tree, now pushing it to MTD.
>>
>> Original author(s):
>>        Jian Zhang <jzhang@ti.com>
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>>  drivers/mtd/nand/Kconfig  |    6
>>  drivers/mtd/nand/Makefile |    1
>>  drivers/mtd/nand/omap2.c  |  776
++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 783 insertions(+)
>
> Hi Thomas,
>
> would you please find a little time and Ack/Nack this
> please?

Artem,
This patch is still pending. This patch has already been reviewed by you and
Andrew Morton. Seems like Thomas is not finding time to review this. What
should be the next step about this?

Andrew has already given his signed-off for this patch:
http://lists.infradead.org/pipermail/linux-mtd/2009-May/025562.html

-- 
Regards,
Vimal
