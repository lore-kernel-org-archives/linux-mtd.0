Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKSPF-00047T-FK
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 09:09:50 +0000
Received: by wwb31 with SMTP id 31so1537657wwb.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2010 01:09:47 -0800 (PST)
Date: Mon, 22 Nov 2010 10:09:41 +0100
From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: block2mtd and ubi
Message-ID: <20101122090940.GK9645@vicerveza.homeunix.net>
References: <20101120175856.GD9645@vicerveza.homeunix.net>
	<20101121000145.GF9645@vicerveza.homeunix.net>
	<1290413562.2289.14.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1290413562.2289.14.camel@localhost>
Cc: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 22, 2010 at 10:12:42AM +0200, Artem Bityutskiy wrote:
> On Sun, 2010-11-21 at 01:01 +0100, Lluís Batlle i Rossell wrote:
> > On Sat, Nov 20, 2010 at 06:58:56PM +0100, Lluís Batlle i Rossell wrote:
> > It's a pity that the same 'ubinize' cannot do that job automatically, and give
> > an image filling all the memory blocks. That would easy down a lot the job for
> > block2mtd.
> 
> Use ubiformat - it should get it right:
> 
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img

I know, but I cannot do that on a block2mtd, if the block2mtd device I use is
the rootfs of the system. All I have is a kernel, qemu, and a rootfs in a
'ubinize' ubi image.

Regards,
Lluís.
