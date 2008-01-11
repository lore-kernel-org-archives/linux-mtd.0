Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JDJy7-0003tt-Oa
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 13:30:50 +0000
Date: Fri, 11 Jan 2008 14:24:45 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Message-ID: <20080111132444.GA1399@lazybastard.org>
References: <47866921.40904@solarflare.com>
	<20080110201309.GC26820@lazybastard.org>
	<20080111125000.GL3544@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080111125000.GL3544@solarflare.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	linux-net-drivers@solarflare.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 January 2008 12:50:01 +0000, Ben Hutchings wrote:
> >
> >   The prefix "efx_mtd_" causes me personally some trouble.  By the
> >   time I have reached the relevant part of the name, my brain has
> >   already fallen half asleep.  But maybe I'm just overreacting after
> >   working with in-house code for five years.
> > 
> >   I have no idea why you need eraseregions, if there is just one.
> >   Kill them?
> 
> Earlier versions of this driver supported our first controller and
> NICs, EF1/EF1002, which did have multiple regions of flash.  I
> simplified the code after this support was removed, but I wasn't aware
> that we could avoid specifying eraseregions at all.

Even when eraseregions exist, most code simply ignores them and treats
the complete flash a having a single uniform erasesize.
*greps the source*
The only two users are UBI and mtdchar.  UBI is bogus and mtdchar
exposes it to userspace, where anything could theoretically exist.

Anything else is confined to the CFI code, which you don't use.

> >   efx_mtd->dead is fun.  Does this still happen with production
> >   hardware?
> 
> It shouldn't happen with anything that passed manufacturing tests.
> This is playing safe.

Fair enough.  Then I would prefer the dead_device_operations approach.

> >   Even if it does, instead of setting the flag and checking it in
> >   every function, you could replace the operations with
> >   dead_device_operations that simply return -EIO for every call.
> >
> >   struct semaphore access_lock; should become a mutex.
> 
> Right.  We've tended to be quite conservative in using newer kernel
> features, since we also need to support old kernels, but we have a
> good backward-compatibility layer now (unifdef'd out of the submitted
> code) so this shouldn't be a problem.

Ok.  A straight conversion to a mutex will likely cause trouble with
your reset routine.  Not sure what to do here.

Jörn

-- 
All models are wrong. Some models are useful.
-- George Box
