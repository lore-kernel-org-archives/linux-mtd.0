Received: from pythagoras.zen.co.uk ([212.23.3.140])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDJKq-0001Iu-WE
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 12:50:16 +0000
Date: Fri, 11 Jan 2008 12:50:01 +0000
From: Ben Hutchings <bhutchings@solarflare.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Message-ID: <20080111125000.GL3544@solarflare.com>
References: <47866921.40904@solarflare.com>
	<20080110201309.GC26820@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080110201309.GC26820@lazybastard.org>
Sender: "Ben Hutchings <bhutchings>" <bwh@solarflare.com>
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I didn't originally write this driver, but I was the last person to
make significant changes to it.

Jörn Engel wrote:
> On Thu, 10 January 2008 18:51:13 +0000, Robert Stonehouse wrote:
> > 
> > In the last submission that we made to linux-netdev it was requested that
> > people knowledgeable about MTD drivers look over the code ... so I am sure
> >   I am in the right place
> 
> Not quite a review, just a couple of things that stuck out.
> 
>   Even if the patch is too large, appending the relevant hunk for the
>   mtd driver would have been appreciated.

Sorry about that.  We could have posted just mtd.c, but that would
have been missing the pieces inside the net driver that it depends on.

>   The prefix "efx_mtd_" causes me personally some trouble.  By the
>   time I have reached the relevant part of the name, my brain has
>   already fallen half asleep.  But maybe I'm just overreacting after
>   working with in-house code for five years.
> 
>   I have no idea why you need eraseregions, if there is just one.
>   Kill them?

Earlier versions of this driver supported our first controller and
NICs, EF1/EF1002, which did have multiple regions of flash.  I
simplified the code after this support was removed, but I wasn't aware
that we could avoid specifying eraseregions at all.

>   How many of the EFX_LOG() statements are still useful?  They may
>   have initially helped writing the code, but today they hurt people
>   reading the code.
>   As a general rule, if you cannot give a good reason why this
>   particular log statement is needed in 20s, there usually is none and
>   the code can get axed.

You're right, it is a bit verbose.

>   efx_mtd->dead is fun.  Does this still happen with production
>   hardware?

It shouldn't happen with anything that passed manufacturing tests.
This is playing safe.

>   Even if it does, instead of setting the flag and checking it in
>   every function, you could replace the operations with
>   dead_device_operations that simply return -EIO for every call.
>
>   struct semaphore access_lock; should become a mutex.

Right.  We've tended to be quite conservative in using newer kernel
features, since we also need to support old kernels, but we have a
good backward-compatibility layer now (unifdef'd out of the submitted
code) so this shouldn't be a problem.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
