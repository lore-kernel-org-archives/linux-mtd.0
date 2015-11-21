Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzwMb-0004qL-S2
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 00:49:15 +0000
Received: by qgea14 with SMTP id a14so83935913qge.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 16:48:51 -0800 (PST)
Date: Fri, 20 Nov 2015 19:48:48 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <linux@arm.linux.org.uk>
Subject: Re: [PATCH] mtd: maps: kill DC21285 driver
In-Reply-To: <1448058755-45834-1-git-send-email-computersforpeace@gmail.com>
Message-ID: <alpine.LFD.2.20.1511201942420.22569@knanqh.ubzr>
References: <1448058755-45834-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Nov 2015, Brian Norris wrote:

> This driver wouldn't build for over 5 years, between commit:
> 
>   bd31b85960a7 ("locking, ARM: Annotate low level hw locks as raw")
> 
> and
> 
>   e5babdf928e5 ("mtd: dc21285: use raw spinlock functions for nw_gpio_lock")
> 
> Also, it's unsafe to build into arbitrary kernels, as it might just
> start probing around memory, whether or not there's a compatible flash
> there. See comments here, last time someone tried to enable it:
> 
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/347133.html
> 
> So, let's kill it. I bet no one will notice.

Waow.  And I'm apparently the author.  Last time I had access to 
hardware that could use it was in 2001.

Now I suppose this depends if there are still people with Netwinders out 
there, and if they're interested in having mainline running on it.


Nicolas
