Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqBj-000351-CD
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:54:56 +0000
Received: by ewy3 with SMTP id 3so1963146ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 23:54:53 -0700 (PDT)
Subject: Re: [PATCH 4/6] libmtd: add helper funcs for getting fds,
	regioninfo, and locked info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307427548-29306-4-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-4-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 09:50:36 +0300
Message-ID: <1307429436.11104.43.camel@localhost>
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

On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote: 
> +int mtd_open_dev1(int mtd_num)
> +{
> +	char devpath[128];
> +	int fd;
> +
> +	sprintf(devpath, "/dev/mtd%i", mtd_num);
> +	fd = open(devpath, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return sys_errmsg("cannot open \"%s\"", devpath);
> +

Could we avoid hard-coding device node names?

We indeed have -m option in mtdutils which opens a device by its number.
But I think it was a mistake. Generally, MTD devices can have any name,
it is up to udev configuration. So I'd rather deprecate and would
require a list of device node names.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
