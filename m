Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsbGe-0007pA-7y
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 09:07:24 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1150790417.6780.107.camel@localhost.localdomain>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
	<4497A723.2070006@epico.si>
	<1150790417.6780.107.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 10:08:22 +0200
Message-Id: <1150790903.6780.111.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Savin Zlobec <savin@epico.si>, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

On Tue, 2006-06-20 at 10:00 +0200, Thomas Gleixner wrote:
> +	if (cmd == NAND_CMD_NONE)
> +		return;
>  
> +	if (ctrl & NAND_CLE)
> +		writeb(cmd, host->io_base + (1 << host->board->cle));
> +	else
> +		writeb(cmd, host->io_base + (1 << host->board->ale));
> +}

Can you please fixup those host->board->cle and ale values at the point
where they actually are initialized ? 

	tglx
