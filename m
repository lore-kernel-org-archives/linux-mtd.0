Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LSPj7-0003RV-Vb
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2009 05:46:12 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH RFC] sh: maple: Add support for SEGA Dreamcast VMU and
	clean up maple bus driver (3/3)
Date: Thu, 29 Jan 2009 00:46:05 -0500
References: <1233186456.6734.16.camel@localhost.localdomain>
	<1233187750.6734.27.camel@localhost.localdomain>
	<1233188287.6734.32.camel@localhost.localdomain>
In-Reply-To: <1233188287.6734.32.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901290046.07659.vapier@gentoo.org>
Cc: linux-sh <linux-sh@vger.kernel.org>, Greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 28 January 2009 19:18:07 Adrian McMenamin wrote:
> --- a/drivers/input/keyboard/maple_keyb.c
> +++ b/drivers/input/keyboard/maple_keyb.c
> -	if (!kbd || !idev) {
> -		error = -ENOMEM;
> +	if (!kbd) {
> +		error = ENOMEM;
>  		goto fail;
>  	}
> ...
> -	return error;
> +fail:
> +	return -error;

this driver has the weird/broken error inverting other patches of yours have 
had recently ... that stuff really needs to stop showing up ;)
-mike
