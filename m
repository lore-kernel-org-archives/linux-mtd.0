Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPKQ5-0003XX-MT
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 18:02:08 +0000
From: David Brownell <david-b@pacbell.net>
To: "vimal singh" <vimalsingh@ti.com>
Subject: Re: [PATCH 1:2] [MTD][NAND]omap: Adding support for nand
	prefetch-read and post-write, in MPU mode.
Date: Fri, 10 Jul 2009 11:01:57 -0700
References: <61339.192.168.10.89.1247226724.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <61339.192.168.10.89.1247226724.squirrel@dbdmail.itg.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200907101101.58029.david-b@pacbell.net>
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 10 July 2009, vimal singh wrote:
> +static void omap_read_buf8(struct mtd_info *mtd, u_char *buf, int len)
> +{
> +       struct nand_chip *nand = mtd->priv;
> +       u_char *p = (u_char *)buf;
> +
> +       while (len--)
> +               *p++ = __raw_readb(nand->IO_ADDR_R);
> +}

Better as __raw_readsb() yes?  Or maybe ioread8_rep().

... speaking of which, maybe the MTD layer can finally
default to using the accelerated block PIO calls, now
that ioreadX_rep() is supposed to work on all arches...

Last time I measured, that change alone was worth
something like a 10% speedup.  Maybe more.
