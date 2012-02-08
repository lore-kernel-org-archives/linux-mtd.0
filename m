Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv8v1-00023g-K4
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 14:54:48 +0000
Received: by wera10 with SMTP id a10so510147wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 06:54:45 -0800 (PST)
Date: Wed, 8 Feb 2012 16:54:37 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/3] mtd: move zero length verification to MTD API
 functions
Message-ID: <20120208165437.3d0af6b5@pixies.home.jungo.com>
In-Reply-To: <1328707598.22240.64.camel@sauron.fi.intel.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
 <1328529789-2106-2-git-send-email-dedekind1@gmail.com>
 <20120207143505.6fba6d5b@pixies.home.jungo.com>
 <1328704973.22240.60.camel@sauron.fi.intel.com>
 <1328707598.22240.64.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 08 Feb 2012 15:26:38 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> I guess we can go a bit further and sanitize 'mtd_point()' like this:
> 
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 8 Feb 2012 15:13:26 +0200
> Subject: [PATCH] mtd: harmonize mtd_point interface implementation
> 
> Some MTD drivers return -EINVAL if the 'phys' parameter is not NULL, trying to
> convey that they cannot return the physical address. However, this is not very
> logical because they still can return the virtual address ('virt'). But some
> drivers (lpddr) just ignore the 'phys' parameter instead, which is a more
> logical thing to do.
> 
> Let's harmonize this and:
> 
> 1. Always initialize 'virt' and 'phys' to 'NULL' in 'mtd_point()'.
> 2. Do not return an error if the physical address cannot be found.
> 
> So as a result, all drivers will set 'phys' to 'NULL' if it is not supported.
> None of the 'mtd_point()' users use 'phys' anyway, so this should not break
> anything. I guess we could also just delete this parameter later.

According to a98889f3, it makes some sense to return an error when users
explicitly asked for the 'phys' but driver is unable to return it.

I guess new interface (checking the returned 'phys') is reasonable as
well. And, nothing gets broken since no such users...

Reviewed-by: shmulik.ladkani@gmail.com
