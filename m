Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjXIT-0007JB-OC
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 05:08:23 -0400
Message-ID: <4639A680.6060507@ru.mvista.com>
Date: Thu, 03 May 2007 13:08:16 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vitalywool@gmail.com>
Subject: Re: patch/respin] generic nand driver for SoCs 
References: <mailman.718.1178114330.2239.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.718.1178114330.2239.linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> +	data->chip.priv = &data;
> +	data->mtd.priv = &data->chip;
> +	data->mtd.owner = THIS_MODULE;
>   
Seems it would be useful to pass the name of mtd driver (data->mtd.name) 
here from platform dependent data. The name is used to created custom 
mtd partitions from command line, if cmdlineprobe passed in probe list.
> +
> +	data->chip.IO_ADDR_R = data->io_base;
> +	data->chip.IO_ADDR_W = data->io_base;
> +	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
> +	data->chip.dev_ready = pdata->ctrl.dev_ready;
> +	data->chip.select_chip = pdata->ctrl.select_chip;
> +
>   
