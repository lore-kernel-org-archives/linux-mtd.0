Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bgljq-00048d-Eq
	for linux-mtd@lists.infradead.org; Sat, 03 Jul 2004 10:43:35 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Date: Sat, 3 Jul 2004 16:37:04 +0200
References: <20040703110325.GA26836@pengutronix.de>
In-Reply-To: <20040703110325.GA26836@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200407031637.04488.tglx@linutronix.de>
Cc: Robert Schwebel <robert@schwebel.de>
Subject: Re: [PATCH] gen_probe forgets to clean chip_map
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 03 July 2004 13:03, Robert Schwebel wrote:
> ----------8<----------
> diff -urN mtd-20040622-1/drivers/mtd/chips/gen_probe.c
> mtd-20040622-1-ptx1/drivers/mtd/chips/gen_probe.c ---
> mtd-20040622-1/drivers/mtd/chips/gen_probe.c	2003-11-09 00:00:04.000000000
> +0100 +++ mtd-20040622-1-ptx1/drivers/mtd/chips/gen_probe.c	2004-06-25
> 14:38:28.000000000 +0200 @@ -114,6 +114,7 @@
>  		kfree(cfi.cfiq);
>  		return NULL;
>  	}
> +	memset(chip_map, 0, ((max_chips / 8) + ((max_chips % 8) ? 1 : 0)));
>
>  	set_bit(0, chip_map); /* Mark first chip valid */

Thanks, fixed due to your previous suggestion since 06-24 in CVS

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
