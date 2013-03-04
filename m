Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYa2-0007Vu-CF
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:49:43 +0000
Message-ID: <1362415826.5269.65.camel@coredoba.hi.pengutronix.de>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Date: Mon, 04 Mar 2013 17:50:26 +0100
In-Reply-To: <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 18:42 +0200, Artem Bityutskiy wrote:
>  /**
>   * struct nand_flash_dev - NAND Flash Device ID Structure
>   * @name:	Identify the device type
> - * @dev_id:	device ID code
> + * @mfr_id:     manufecturer ID part of the full chip ID array (byte 0)

This should be 'manufacturer'.

> + * @dev_id:     device ID part of the full chip ID array (byte 1)

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
