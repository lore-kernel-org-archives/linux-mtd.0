Received: from mail.renesas.com ([202.234.163.13] helo=mail03.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nbu0g-00082W-Hz
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 11:00:07 +0000
Date: Mon, 01 Feb 2010 19:59:40 +0900
From: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
Subject: Re: [PATCH] mtd: trivial sh_flctl changes
In-reply-to: <20100127091120.21312.77488.sendpatchset@rxone.opensource.se>
Sender: shimoda.yoshihiro@renesas.com
To: Magnus Damm <magnus.damm@gmail.com>
Message-id: <4B66B41C.4020904@renesas.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-2022-JP
Content-transfer-encoding: 7bit
References: <20100127091120.21312.77488.sendpatchset@rxone.opensource.se>
Cc: dwmw2@infradead.org, lethal@linux-sh.org, linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> This patch contains a few changes for the sh_flctl driver:
>  - not sh7723-only driver - get rid of kconfig dependency
>  - use dev_err() instead of printk()
>  - use __devinit and __devexit for probe()/remove()
>  - fix probe() return values
> 

Thank you for your patch.

Acked-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>

Thanks,
Yoshihiro Shimoda
