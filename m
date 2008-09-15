Subject: Re: [PATCH 3/3] [MTD] m25p80.c
From: David Woodhouse <dwmw2@infradead.org>
To: Chen Gong <g.chen@freescale.com>
In-Reply-To: <1218080495-2653-4-git-send-email-g.chen@freescale.com>
References: <1218080495-2653-1-git-send-email-g.chen@freescale.com>
	<1218080495-2653-2-git-send-email-g.chen@freescale.com>
	<1218080495-2653-3-git-send-email-g.chen@freescale.com>
	<1218080495-2653-4-git-send-email-g.chen@freescale.com>
Content-Type: text/plain
Date: Mon, 15 Sep 2008 00:06:38 -0700
Message-Id: <1221462398.3201.33.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, viro@ftp.uk.linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-08-07 at 11:41 +0800, Chen Gong wrote:
> @@ -547,6 +550,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
>         u8                      code = OPCODE_RDID;
>         u8                      id[3];
>         u32                     jedec;
> +       u16                     ext_jedec;
>         struct flash_info       *info;
>  
>         /* JEDEC also defines an optional "extended device information"
	 * string for after vendor-specific data, after the three bytes
	 * we use here.  Supporting some chips might require using it.
	 */
	tmp = spi_write_then_read(spi, &code, 1, id, 3);
	if (tmp < 0) {
		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC ID\n",
			spi->dev.bus_id, tmp);
		return NULL;
	}
	jedec = id[0];
	jedec = jedec << 8;
	jedec |= id[1];
>         jedec = jedec << 8;
>         jedec |= id[2];
>  
> +       ext_jedec = id[3] << 8 | id[4];
> +

You're trying to read off the end of the id[] array, which has only
three elements. And you didn't ask spi_write_then_read() to read that
many bytes _anyway_. And if you did... would it fail on chips which
don't have the extended device information?

Please test and send a fix, since this is already in the git tree.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
