Received: from mail-vw0-f202.google.com ([209.85.212.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZDhk-00058Z-J8
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 00:53:13 +0000
Received: by vws40 with SMTP id 40so1298440vws.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Aug 2009 17:53:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <200908062305.n76N5but004994@imap1.linux-foundation.org>
References: <200908062305.n76N5but004994@imap1.linux-foundation.org>
Date: Fri, 7 Aug 2009 09:53:06 +0900
Message-ID: <9c9fda240908061753l58776235j44f733b6dab354b1@mail.gmail.com>
Subject: Re: [patch 8/8] mtd: make onenand/generic.c more generic
From: Kyungmin Park <kmpark@infradead.org>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: tony@atomide.com, damm@igel.co.jp, lethal@linux-sh.org, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> +/*
> + * Note: Driver name and platform data format have been updated!
> + *
> + * This version of the driver is named "onenand-flash" and takes struct
> + * onenand_platform_data as platform data. The old ARM-specific version
> + * with the name "onenand" used to take struct flash_platform_data.
> + */
> +#define DRIVER_NAME =A0 =A0"onenand-flash"
>

At least only apollon board use this driver name, "onenand" at kernel.
so there's no reason to change it.
Of course internally we use it "onenand" at other board. but at this
time no need to rename it.

we not fully discuss it so I hope to discuss it more. I hope to keep
the name as before.

Thank you,
Kyungmin Park
