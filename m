Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Etwvm-0005a9-78
	for linux-mtd@lists.infradead.org; Tue, 03 Jan 2006 19:55:16 -0500
Date: Tue, 3 Jan 2006 16:54:37 -0800
From: Andrew Morton <akpm@osdl.org>
To: kyungmin.park@samsung.com
Message-Id: <20060103165437.2311cfc1.akpm@osdl.org>
In-Reply-To: <0IRK00I50JP6FZ@mmp1.samsung.com>
References: <20051216005505.GW23349@stusta.de>
	<0IRK00I50JP6FZ@mmp1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, torvalds@osdl.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, bunk@stusta.de
Subject: Re: drivers/mtd/onenand/: unacceptable stack usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park <kyungmin.park@samsung.com> wrote:
>
>  OK. I change the source code. 
>  It is working well on OMAP H4 with 2.6.15-rc4 kernel and LTP fs test is
>  passed.
> 
>  And please apply the recent onenand patch
> 
>  	- check correct manufacturer 
>  	- unlock problem in DDP (Double Density Package)
>  	- add platform_device.h instead of device.h
> 
>  Thank you

These patches are wordwrapped and cannot be applied.

You've included three separate patches in the body of a single email. 
Please don't do that.  One patch per email is preferred.

So please redo these patches against 2.6.15 and resend them, as per
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt, thanks.
