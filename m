Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUTo2-0002Mf-Pp
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 14:46:01 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IOX00LUGISB5S60@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 14:45:47 -0400 (EDT)
Date: Tue, 25 Oct 2005 14:45:47 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
To: Jared Hulbert <jaredeh@gmail.com>
Message-id: <Pine.LNX.4.64.0510251436590.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
	<1130173789.15275.1.camel@windu.rchland.ibm.com>
	<6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 Oct 2005, Jared Hulbert wrote:

> Sorry. It took me longer than it should have to track down a P30 part
> and get it on my machine.  Does this work for you?

I have a problem convincing myself it should work at all.

> --- trunk/drivers/mtd/chips/cfi_cmdset_0001.c	(revision 8)
> +++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c	(revision 10)
> @@ -285,7 +285,7 @@
>  			      sizeof(struct cfi_intelext_otpinfo);
> 
>  		/* Burst Read info */
> -		extra_size += (extp->MinorVersion < '4') ? 6 : 5;
> +		extra_size += (unsigned int)extp->extra[extra_size+1]+2;

Here you're dereferencing the extra array which (initially) has not even 
been read into memory yet.  It probably only work because it just 
happens that extra_size is not increased enough to bypass the later 
"goto again" which would manage to read the extra data needed and things 
would get back on track at that point.  but that's relying on pure luck.

Could you fix that and get rid of the needless cast please?  (extra is 
uint8_t so there is no signedness issues to worry about)


Nicolas
