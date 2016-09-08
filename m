Received: from a.mx.sdesigns.eu ([78.31.43.6])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bi2Kh-0004CX-Go
 for linux-mtd@lists.infradead.org; Thu, 08 Sep 2016 16:37:48 +0000
Subject: Re: [PATCH v2] mtd: nand: tango: import driver for tango chips
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Cc: Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <57D193C5.8040004@sigmadesigns.com>
Date: Thu, 8 Sep 2016 18:37:25 +0200
MIME-Version: 1.0
In-Reply-To: <57D189E1.3020508@sigmadesigns.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/09/2016 17:55, Marc Gonzalez wrote:

> +static int decode_error_report(struct tango_nfc *nfc)
> +{
> +	u32 status, res;
> +
> +	status = readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
> +	if (status & PAGE_IS_EMPTY)
> +		return 0;
> +
> +	res = readl_relaxed(nfc->mem_base + ERROR_REPORT);
> +
> +	if (DECODE_ERR_ON_PKT_0(res) || DECODE_ERR_ON_PKT_N(res))
> +		return -EBADMSG;
> +
> +	return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
> +}

This is probably an incorrect implementation. Boris mentioned that
we shouldn't return -EBADMSG?

# time insmod mtd/mtd_nandbiterrs.ko dev=1
[   19.498729] 
[   19.501435] ==================================================
[   19.508199] mtd_nandbiterrs: MTD device: 1
[   19.512372] mtd_nandbiterrs: MTD device size 536870912, eraseblock=131072, page=2048, oob=64
[   19.520893] mtd_nandbiterrs: Device uses 2 subpages of 1024 bytes
[   19.527034] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
[   19.533986] mtd_nandbiterrs: incremental biterrors test
[   19.539297] mtd_nandbiterrs: write_page
[   19.543413] mtd_nandbiterrs: rewrite page
[   19.547766] mtd_nandbiterrs: read_page
[   19.551746] mtd_nandbiterrs: error: read failed at 0x0
[   19.556924] mtd_nandbiterrs: After 0 biterrors per subpage, read reported error -74
[   19.565432] mtd_nandbiterrs: finished successfully.
[   19.570343] ==================================================

It says "finished successfully", should I believe that?

Regards.
