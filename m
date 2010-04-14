Received: from mail-bw0-f209.google.com ([209.85.218.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1ufr-0004He-Q5
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2010 04:58:04 +0000
Received: by bwz1 with SMTP id 1so3376995bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Apr 2010 21:58:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] MTD: cfi_cmdset_0002: Add reboot notifier for AMD
	flashes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <bb2e763d69a8cc1576fd58fbde424ff5f688c409@localhost.localdomain>
References: <4ccec90e21edfa387822b2cb71c886217c48b4e3@localhost.localdomain>
	<bb2e763d69a8cc1576fd58fbde424ff5f688c409@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Apr 2010 07:57:58 +0300
Message-Id: <1271221078.2532.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: saeed.bishara@gmail.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-13 at 13:30 -0700, Kevin Cernekee wrote:
> +static int cfi_amdstd_reset(struct mtd_info *mtd)
> +{
> +	struct map_info *map = mtd->priv;
> +	struct cfi_private *cfi = map->fldrv_priv;
> +	int i, ret;
> +	struct flchip *chip;
> +
> +	for (i = 0; i < cfi->numchips; i++) {
> +
> +		chip = &cfi->chips[i];
> +
> +		spin_lock(chip->mutex);
> +
> +		ret = get_chip(map, chip, chip->start, FL_SHUTDOWN);
> +		if (!ret) {
> +			map_write(map, CMD(0xF0), chip->start);
> +			chip->state = FL_SHUTDOWN;
> +			put_chip(map, chip, chip->start);
> +		}
> +
> +		spin_unlock(chip->mutex);
> +	}
> +
> +	return 0;
> +}

Kevin, I'd suggest to document why you do this in the code, just for the
next generation, or for the archaeologists who will dig MTD code in the
future. 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
