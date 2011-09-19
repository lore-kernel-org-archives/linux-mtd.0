Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5W0Z-0000eu-Ui
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 05:03:09 +0000
Received: by fxg7 with SMTP id 7so4363277fxg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Sep 2011 22:03:05 -0700 (PDT)
Subject: Re: RomFS MTD and NAND Flash with ECC (EUCLEAN).
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Pringlemeir <bpringle@sympatico.ca>
Date: Mon, 19 Sep 2011 08:05:45 +0300
In-Reply-To: <BLU0-SMTP394611D4685CA5AE953006B8060@phx.gbl>
References: <BLU0-SMTP394611D4685CA5AE953006B8060@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316408751.24366.55.camel@sauron>
Mime-Version: 1.0
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

On Fri, 2011-09-16 at 16:46 -0400, Bill Pringlemeir wrote:
>  #ifdef CONFIG_ROMFS_ON_MTD
> -#define ROMFS_MTD_READ(sb, ...) ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__))
> -
> +#define ROMFS_MTD_READ(sb, ...)                                        \
> +    ({ int res;                                                        \
> +        res = ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__)) == -EUCLEAN ? \
> +            0 : res; })                                                         

I do not think this is the most elegant way to handle this, but yes,
EUCLEAN is used nowadays to report about bit-flips, which are actually
not an error, more like an info that this eraseblock needs some
attention.

I am not sure MTD is the right subsystem for this patch, could you try
to send it to fs-devel / Al Viro instead?

-- 
Best Regards,
Artem Bityutskiy
