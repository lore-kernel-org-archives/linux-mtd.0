Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IjVqp-0002Ea-EA
	for linux-mtd@lists.infradead.org; Sun, 21 Oct 2007 09:08:01 +0100
Date: Sun, 21 Oct 2007 10:06:53 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH] BUG() when passing illegal parameters to decode_rs8()
	or decode_rs16()
In-Reply-To: <20071020111126.GE32465@lazybastard.org>
Message-ID: <alpine.LFD.0.9999.0710211005110.22770@localhost.localdomain>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
	<20071020111126.GE32465@lazybastard.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-814843274-1192954014=:22770"
Cc: David Woodhouse <dwmw2@infradead.org>, Matt Reimer <mreimer@vpop.net>,
	linux-mtd@lists.infradead.org, mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-814843274-1192954014=:22770
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sat, 20 Oct 2007, Jörn Engel wrote:

> Returning -ERANGE should never happen.
> 
> --- linux-2.6.22cow/lib/reed_solomon/decode_rs.c~rs_ERANGE	2006-10-13 15:58:51.000000000 +0200
> +++ linux-2.6.22cow/lib/reed_solomon/decode_rs.c	2007-10-20 13:07:57.000000000 +0200
> @@ -39,8 +39,7 @@
>  
>  	/* Check length parameter for validity */
>  	pad = nn - nroots - len;
> -	if (pad < 0 || pad >= nn)
> -		return -ERANGE;
> +	BUG_ON(pad < 0 || pad >= nn);


No. It should never happen, but escalating an error which the kernel
can survive under a lot of circumstances to a fatal death error is
wrong.

Thanks,

	tglx
--8323328-814843274-1192954014=:22770--
