Received: from za-gw.sanpeople.com ([196.211.225.226])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hr8Gd-0006Fu-LK
	for linux-mtd@lists.infradead.org; Thu, 24 May 2007 04:01:53 -0400
Subject: Re: PATCH: at91_nand rdy_pin fix
From: Andrew Victor <andrew@sanpeople.com>
To: Ivan Kuten <ivan.kuten@promwad.com>
In-Reply-To: <51303.127.0.0.1.1179957194.squirrel@localhost>
References: <51303.127.0.0.1.1179957194.squirrel@localhost>
Content-Type: text/plain
Message-Id: <1179992828.13098.26.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 24 May 2007 09:47:08 +0200
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

hi Ivan,

> -       nand_chip->dev_ready = at91_nand_device_ready;
> +
> +       if (host->board->rdy_pin)
> +               nand_chip->dev_ready = at91_nand_device_ready;
> +       else
> +               nand_chip->dev_ready = NULL;

Patch looks correct.

Since the at91_nand_host structure is allocated with kzalloc(),
nand_chip->dev_ready is already initialized to NULL.
So we don't really need the "else" part.


Regards,
  Andrew Victor
