Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CwH2-0006RF-5y
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 07:50:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Moedt <xemc@yahoo.com>
In-Reply-To: <20030505224936.32155.qmail@web13908.mail.yahoo.com>
References: <20030505224936.32155.qmail@web13908.mail.yahoo.com>
Message-Id: <1052203806.7532.20.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 06 May 2003 07:50:06 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-05 at 23:49, Michael Moedt wrote:
> (You'll have to correct for the altering that yahoo
> mail does to the text.  I can't use my normal outgoing
> email server because it fights with infradead's.)

What was the problem? We can make exceptions to RBL lists if that helps.
> +#ifdef CFIDEV_BUSWIDTH_8
> +        __u64 ones = 0;
> +#else
>          __u32 ones = 0;
> +#endif

cfi_word is there to prevent these ifdefs.


> +        if ( CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_1 ) {

Use cfi_buswidth_is_1() et al. Then the compiler really will be able to
optimise them out in the appropriate cases.

-- 
dwmw2
