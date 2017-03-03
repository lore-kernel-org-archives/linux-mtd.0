Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjjnV-0002Cb-85
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 09:46:51 +0000
Date: Fri, 3 Mar 2017 10:46:27 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [BUG?] ubi.fm_autoconvert=1 on first boot
Message-ID: <20170303094627.phm6oofazfyxj4l3@pengutronix.de>
References: <20161125113412.3ozyc7bjjecjahnb@pengutronix.de>
 <4d53ffff-a294-8238-bab1-004416e8d7be@nod.at>
 <20161125135152.f4npajnz5x76f5x7@pengutronix.de>
 <6708b0f4-63e4-663f-794a-13b95f38a928@nod.at>
 <20170228145045.jlutsmkbrzrq4zam@pengutronix.de>
 <20170301094243.4x6nivi55wy5qiqi@pengutronix.de>
 <036b186e-45e8-8b32-d594-845617c29052@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <036b186e-45e8-8b32-d594-845617c29052@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Fri, Mar 03, 2017 at 09:15:55AM +0100, Richard Weinberger wrote:
> Sascha,
> 
> Am 01.03.2017 um 10:42 schrieb Sascha Hauer:
> >> The patch works.
> > 
> > Hm, this patch works on mainline, but not on my 3.10 Frankenkernel. I
> > wonder if there's anything in mainline that makes sure that the wearlevel
> > worker has actually produced free PEBs before they are needed?
> 
> So it works every tine on mainline but never on 3.10?
> Just trying to make sure that it is not a timing issue.

It works on 3.10 when I add a mdelay(100) between starting the wearlevel
thread and autoresizing the volume, so indeed I assume it's a timing
issue.
Maybe I can provoke the failure on mainline with your patch applied by
adding a delay in the wear level thread.

> 
> In 3.10 Fastmap was very buggy and saw in later kernels many fixes,
> did you backport all of them? Sadly in the early days of Fastmap
> we did not mark patches for stable because it was experimental.
> ...which was a major error on our side.
> In doubt you can backport the whole UBI subsystem.
> This is rather easy because it has not much dependencies and does not change
> that fast.

My 3.10 has UBI/UBIFS patches backported from roughly 4.0, so
Frankenkernel is the right term to call it ;)
I remember backporting newer UBI patches at some point becomes difficult
because some newer kernel functions/macros are missing.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
