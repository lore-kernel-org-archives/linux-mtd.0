Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JD3ro-0008Il-Te
	for linux-mtd@lists.infradead.org; Thu, 10 Jan 2008 20:19:15 +0000
Date: Thu, 10 Jan 2008 21:13:09 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Robert Stonehouse <rstonehouse@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Message-ID: <20080110201309.GC26820@lazybastard.org>
References: <47866921.40904@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47866921.40904@solarflare.com>
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org,
	Steve Pope <spope@solarflare.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 January 2008 18:51:13 +0000, Robert Stonehouse wrote:
> 
> In the last submission that we made to linux-netdev it was requested that
> people knowledgeable about MTD drivers look over the code ... so I am sure
>   I am in the right place

Not quite a review, just a couple of things that stuck out.

  Even if the patch is too large, appending the relevant hunk for the
  mtd driver would have been appreciated.

  The prefix "efx_mtd_" causes me personally some trouble.  By the
  time I have reached the relevant part of the name, my brain has
  already fallen half asleep.  But maybe I'm just overreacting after
  working with in-house code for five years.

  I have no idea why you need eraseregions, if there is just one.
  Kill them?

  How many of the EFX_LOG() statements are still useful?  They may
  have initially helped writing the code, but today they hurt people
  reading the code.
  As a general rule, if you cannot give a good reason why this
  particular log statement is needed in 20s, there usually is none and
  the code can get axed.

  efx_mtd->dead is fun.  Does this still happen with production
  hardware?
  Even if it does, instead of setting the flag and checking it in
  every function, you could replace the operations with
  dead_device_operations that simply return -EIO for every call.

  struct semaphore access_lock; should become a mutex.

Should be enough comments to get things started.

Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
