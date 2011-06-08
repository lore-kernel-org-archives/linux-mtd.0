Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUHNi-0002Qo-Sz
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 11:57:07 +0000
Received: by eyh6 with SMTP id 6so166835eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 04:57:04 -0700 (PDT)
Subject: Re: [PATCH v2] libmtd: add helper funcs for getting regioninfo and
	locked info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307460482-3745-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-4-git-send-email-vapier@gentoo.org>
	<1307460482-3745-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 14:52:46 +0300
Message-ID: <1307533966.31223.66.camel@localhost>
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

On Tue, 2011-06-07 at 11:28 -0400, Mike Frysinger wrote:
> This extends the libmtd with the helper functions:
> 	mtd_regioninfo: interface to MEMGETREGIONINFO
> 	mtd_islocked: interface to MEMISLOCKED
> 
> Users of these functions will follow shortly ...
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed with a small tweak, thanks!

> +int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
> +{
> +	int ret;
> +	erase_info_t ei;
> +
> +	ei.start = eb * mtd->eb_size;
> +	ei.length = mtd->eb_size;
> +
> +	ret = ioctl(fd, MEMISLOCKED, &ei);
> +	if (ret < 0)
> +		return mtd_ioctl_error(mtd, eb, "MEMISLOCKED");
> +

I've removed this error message - if we fail, better return an error
code silently. At least your next patch is built a way that it will keep
iterating and executing this function.

We might as well print an error message if (!ENOTTY && !ENOTSUPP), but I
did not do this. I expect you to send a correction patch if you do not
like this :-)

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
