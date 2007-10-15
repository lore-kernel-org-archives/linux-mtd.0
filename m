Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IhVy6-0003Ss-BB
	for linux-mtd@lists.infradead.org; Mon, 15 Oct 2007 20:51:17 +0100
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JPY00COJXMP0J50@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 15 Oct 2007 15:47:14 -0400 (EDT)
Date: Mon, 15 Oct 2007 15:47:13 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Recursion in CFI driver. Is it really necessary to have.
In-reply-to: <Pine.LNX.4.64.0710151552170.1863@pentafluge.infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
Message-id: <alpine.LFD.0.9999.0710151534180.19446@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0710121547550.21455@pentafluge.infradead.org>
	<alpine.LFD.0.9999.0710121112450.19446@xanadu.home>
	<Pine.LNX.4.64.0710151552170.1863@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 Oct 2007, Alexey Korolev wrote:

> Hi,
> 
> > 
> > Wow.  That's certainly bad.
> > 
> > It's been a while that I wrote that code, but looking at it now I just
> > can't see how that could happen.  It is like if it was recursing on
> > itself, but the code explicitly guards against that.  See:
> > 
> > 		if (contender && contender != chip) {
> > 			[...]
> > 			ret = get_chip(map, contender, contender->start,
> > mode);
> > 
> > So from that point, 'chip' and 'contender' must be equal when get_chip()
> > is called again, and therefore recursion should stop there.
> > 
> I think it has a hole here. The issue takes place if we have three or more
> processes wishing to own chip.

Right.

> The most important here, that from point of silicon state machine design view
> there is no need to have recursion deeper than "level 1".

Exact.

> I've made the patch which heals the deadlock problem. Could you please look at
> this?

One issue: you now force the resettime behavior for every cases.  Should 
we care?

Also some style issues:

> @@ -709,6 +709,23 @@
>  		spin_unlock(&shared->lock);
>  	}
> 
> +	ret = chip_ready(map, chip, adr, mode);
> +	if (ret == -EAGAIN)
> +		goto retry;
> +
> +
> +	return ret;
> +}

One blank line too many above.

> +
> +static int chip_ready (struct map_info *map, struct flchip *chip, unsigned
> long adr, int mode)
> +{

You'll have to add a prototype for that function which is called before 
its definition.


Nicolas
