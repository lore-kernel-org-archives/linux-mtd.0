Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bj4Dv-0001Wn-4m
 for linux-mtd@lists.infradead.org; Sun, 11 Sep 2016 12:51:04 +0000
Subject: Re: [PATCH v3] mtd: nand: tango: import driver for tango chips
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com> <57D2DF96.7060705@sigmadesigns.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <57D5530B.2060209@free.fr>
Date: Sun, 11 Sep 2016 14:50:19 +0200
MIME-Version: 1.0
In-Reply-To: <57D2DF96.7060705@sigmadesigns.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/09/2016 18:13, Marc Gonzalez wrote:

> This driver supports the NAND Flash controller embedded in recent
> Tango chips, such as SMP8758 and SMP8759.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/mtd/nand/Kconfig      |   6 +
>  drivers/mtd/nand/Makefile     |   1 +
>  drivers/mtd/nand/tango_nand.c | 482 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 489 insertions(+)
>  create mode 100644 drivers/mtd/nand/tango_nand.c

Still on the TODO/MAYBE list:

1) Remove the cast in tango_write_page
2) Update stats.failed
3) Implement read/write_oob
4) Report OOB layout to framework (?)
5) Tweak (?) Peripheral Bus setup (timings and CS config)
6) Write device_cfg register (or report weirdness as a bug)

Regards.
