Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvLy1-0001aK-DH
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 08:36:38 +0000
Received: by pdbnk13 with SMTP id nk13so100683306pdb.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 01:36:16 -0700 (PDT)
Date: Thu, 21 May 2015 01:36:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [PATCH] mtd: cfi: Deiline large functions
Message-ID: <20150521083612.GH11112@norris-Latitude-E6410>
References: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
 <20150520185641.GI11598@ld-irv-0074> <555D8E4E.9030109@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <555D8E4E.9030109@redhat.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Aaron Sierra <asierra@xes-inc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 21, 2015 at 09:50:38AM +0200, Denys Vlasenko wrote:
> On 05/20/2015 08:56 PM, Brian Norris wrote:
> > On Mon, May 18, 2015 at 12:58:40PM +0200, Denys Vlasenko wrote:
> >> With this .config: http://busybox.net/~vda/kernel_config,
> >> after uninlining these functions have sizes and callsite counts
> >> as follows:
> > 
> > Most of this is probably good, thanks. But I'm curious about one:
> > 
> >> cfi_udelay(): 74 bytes, 26 callsites
> > 
> > ^^ This is pretty dead-simple. If it's generating bad code, we might
> > look at fixing it up instead. Almost all of its call sites are with
> > constant input, so it *should* just become:
> > 
> > 	udelay(1);
> > 	cond_resched();
> > 
> > in most cases. For the non-constant cases, we might still do an
> > out-of-line implementation. Or maybe we just say it's all not worth it,
> > and we just stick with what you have. But I'd like to consider
> > alternatives to out-lining this one.
> 
> You want to consider not-deinlining (IOW: speed-optimizing)

Inlining isn't always about speed.

> a *fixed time delay function*?
> 
> Think about what delay functions do...

I wasn't really looking at speed. Just memory usage.

And I was only pointing this out because udelay() has a different
implementation for the __builtin_constant_p() case. You can't take
advantage of that for non-inlined versions of cfi_udelay().

But that may be irrelevant anyway, now that I think again. At best,
you're trading one function call (arm_delay_ops.const_udelay() on ARM)
for another (cfi_udelay()), since you can never completely optimize out
the latter. And in fact, my suggestion yields extra inlined calls, due
to the cond_resched().

Brian
