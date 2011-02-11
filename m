Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnueG-0008Nx-P5
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:11:05 +0000
Received: by fxm19 with SMTP id 19so2871520fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 07:11:03 -0800 (PST)
Subject: Re: [PATCH] mtd: export mtd->writebufsize attribute over sysfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1297424789-4144-1-git-send-email-agust@denx.de>
References: <1297424789-4144-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 17:09:54 +0200
Message-ID: <1297436994.2760.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-11 at 12:46 +0100, Anatolij Gustschin wrote:
> +static ssize_t mtd_writebufsize_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t size)
> +{
> +	struct mtd_info *mtd = dev_to_mtd(dev);
> +	unsigned long value;
> +	int ret;
> +
> +	ret = strict_strtoul(buf, 0, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	mtd->writebufsize = value;
> +	return size;
> +}
> +static DEVICE_ATTR(writebufsize, S_IRUGO, mtd_writebufsize_show,
> +		   mtd_writebufsize_store);


I think writebufsize should be read-only. This is characteristic of the
flash and should not be changed. OK, if the chip allows to change it, it
could be done, but this is not what the patch seems to be about.

I mean, writebufsize is like writesize. Why writesize sysfs attribut is
R/O but writebufsize should be RW?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
