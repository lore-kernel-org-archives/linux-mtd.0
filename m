Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg4Tp-0001Os-VL
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 03:17:30 +0000
Message-ID: <52819E75.6010809@freescale.com>
Date: Tue, 12 Nov 2013 11:20:21 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2] mtd: gpmi: fix the NULL pointer
References: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
 <1384166419-23568-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1384166419-23568-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, stable@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C211=C8=D5 18:40, Huang Shijie =D0=B4=B5=C0:
> +	chip->buffers =3D kzalloc(sizeof(*chip->buffers), GFP_KERNEL);
> +	if (!chip->buffers)
> +		return -ENOMEM;
> +	chip->options |=3D NAND_OWN_BUFFERS;
It has a memory leak for the NAND_OWN_BUFFERS. i should free this buffer
myself too.

thanks
Huang Shijie
