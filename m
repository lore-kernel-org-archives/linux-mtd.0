Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDAmM-0001YN-Nv
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 04:14:14 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1325734wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Jun 2008 21:14:13 -0700 (PDT)
Message-ID: <9c9fda240806292114m43d4e940h3346c03d92d65b32@mail.gmail.com>
Date: Mon, 30 Jun 2008 13:14:13 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "David Brownell" <david-b@pacbell.net>
Subject: Re: [patch 2.6.26-rc8+] mtd: dataflash OTP support
In-Reply-To: <200806292019.53376.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200806292019.53376.david-b@pacbell.net>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>
> +#ifdef CONFIG_MTD_OTP
> +#define HAVE_OTP
> +#endif
> +
> +#ifdef CONFIG_MTD_ONENAND_OTP
> +#define HAVE_OTP
> +#endif
> +
> +#ifdef CONFIG_MTD_DATAFLASH_OTP
> +#define HAVE_OTP
> +#endif
> +

How about to add these at Kconfig like this,

config MTD_HAVE_OTP
         bool
         default n

and NOR, OneNAND, and DATAFLASH select MTD_HAVE_OTP if OTP support.

Thank you,
Kyungmin Park
