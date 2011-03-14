Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz3Ad-0006Bx-3S
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 08:30:31 +0000
Received: by wwc33 with SMTP id 33so3878840wwc.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Mar 2011 01:30:28 -0700 (PDT)
Subject: Re: fix warning in fs/ubifs compiled with gcc-4.5
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jian Peng <jipeng@broadcom.com>
In-Reply-To: <E18F441196CA634DB8E1F1C56A50A87432421E2F50@IRVEXCHCCR01.corp.ad.broadcom.com>
References: <E18F441196CA634DB8E1F1C56A50A87432421E2F50@IRVEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Mar 2011 10:29:00 +0200
Message-ID: <1300091340.2727.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On Fri, 2011-03-11 at 16:35 -0800, Jian Peng wrote:
> -#define ubifs_debugging_init(c)                0
> -#define ubifs_debugging_exit(c)                ({})
> +#define	ARG1(a)			a
> +#define	ARG2(a1, a2)		a1, a2
> +#define	ARG3(a1, a2, a3)	a1, a2, a3
> +#define	ARG4(a1, a2, a3, a4)	a1, a2, a3, a4
> +
> +#define void_F(name, x)		\
> +static inline void name(x)	\
> +{				\
> +	return;			\
> +}
> +
> +#define int_F(name, x)		\
> +static inline int name(x)	\
> +{				\
> +	return 0;		\
> +}
> +
> +int_F(ubifs_debugging_init, ARG1(struct ubifs_info *c))
> +void_F(ubifs_debugging_exit, ARG1(struct ubifs_info *c))
> +
> +/* Dump functions */
> +void_F(dbg_dump_inode, ARG2(const struct ubifs_info *c,
> +				const struct inode *inode))

Thanks, but this is a too complex solution, I think. It turns easy to
read code into some cryptic and difficult to read code, IMO May be we
can invent something simpler?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
