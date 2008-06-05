Received: from py-out-1112.google.com ([64.233.166.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4NAZ-0002xo-2s
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 21:38:51 +0000
Received: by py-out-1112.google.com with SMTP id a73so925490pye.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Jun 2008 14:38:49 -0700 (PDT)
Message-ID: <9e4733910806051438g2b0bdd8tc4fbfceecd8dc1ea@mail.gmail.com>
Date: Thu, 5 Jun 2008 17:38:48 -0400
From: "Jon Smirl" <jonsmirl@gmail.com>
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: jffs2 and unaligned access
In-Reply-To: <20080507132514.GF4326@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080507102724.GE4326@pengutronix.de>
	<1210157630.25560.884.camel@pmac.infradead.org>
	<20080507132514.GF4326@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/7/08, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Wed, May 07, 2008 at 11:53:49AM +0100, David Woodhouse wrote:
>  > On Wed, 2008-05-07 at 12:27 +0200, Sascha Hauer wrote:
>  > > memcpy_from/to_io() use word aligned accesses on the io side of memory.
>  > > The MPC5200 local plus bus where our flashes are connected does not
>  > > allow unaligned accesses, so we have to use the io versions of memcpy.
>  >
>  > But this region of flash is marked as suitable for execute-in-place,
>  > otherwise the point() function wouldn't be working to give a direct
>  > pointer to it. It sounds like we shouldn't be allowing that.
>
>
> It actually is suitable for execute-in-place. It's the flash U-Boot
>  starts from. The compiler will generate a proper alignment for you.
>
>
>  >
>  > Which in turn means that perhaps we should have a property in the
>  > corresponding node in the device-tree which indicates that it's not
>  > suitable for direct access?
>
>
> So far we did not work with the device-tree flash binding but with the
>  physmap-flash driver, but ok, this is subject to change anyway.
>
>  I gave it a quick try to disable direct accesses. It works, but has a
>  1:10 performance impact on mounting a jffs2. At least it's a clean
>  solution.

How did this get resolved? The thread died without any final solution
being proposed.


>
>
>  Sascha
>
>
>
>  --
>  Pengutronix e.K. - Linux Solutions for Science and Industry
>  -----------------------------------------------------------
>  Kontakt-Informationen finden Sie im Header dieser Mail oder
>  auf der Webseite -> http://www.pengutronix.de/impressum/ <-
>


-- 
Jon Smirl
jonsmirl@gmail.com
