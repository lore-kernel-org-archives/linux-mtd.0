Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqac-0003ZC-Qn
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:20:39 +0000
Received: by wwb39 with SMTP id 39so3603305wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:20:35 -0700 (PDT)
Subject: Re: [PATCH 1/6] jffs2: make lzo optional at build time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 10:16:19 +0300
Message-ID: <1307430979.11104.50.camel@localhost>
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
> +
> +#else
> +
> +int jffs2_lzo_init(void)
> +{
> +	return 0;
> +}

This function should return -1, I think, so that mkfs.jffs2 would fail
if lzo was not compiled-in.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
