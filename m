Date: Wed, 14 May 2008 18:06:35 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: jkimble@one.net
Subject: Re: Porting to Intel P33 flash 
In-Reply-To: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net>
Message-ID: <Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
References: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Does anyone know at what kernel release this particular flash (Intel
> 256P33B StrataFlash) was supported (if any)?
> 
> I can't go to the latest kernel and back porting the MTD section form
> 2.6.24 to 2.6.10 turned out to be impractical. There's just too many basic
> structures (like devices Vs platform_devices) that I'm not prepared to
> change in 2.6.10.
> 
> I just need to know when/if P33 was supported. It would be good to have a
> version I know works to work from.
>


There are two versions of P33 one has version of CFI 1.4 another version
1.5 

P33 with CFI 1.4 works Ok starting 2.6.17 
P33 with CFI 1.5 works Ok starting 2.6.24 

Since the difference between P33 with CFI 1.4 and P33 with CFI 1.5 are
minor applying the following very simple patch:
http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=b1c9c9be6da010510459aca93f5754efb19695ff 
should solve the problem for linux >= 2.6.17.

Thanks,
Alexey
