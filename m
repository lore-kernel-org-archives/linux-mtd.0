Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvUpT-0007hL-Tn
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 18:04:24 +0000
Received: by pdea3 with SMTP id a3so115994433pde.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 11:04:02 -0700 (PDT)
Date: Thu, 21 May 2015 11:03:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [PATCH] mtd: cfi: Deiline large functions
Message-ID: <20150521180346.GD11598@ld-irv-0074>
References: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
 <20150520185641.GI11598@ld-irv-0074> <555D8E4E.9030109@redhat.com>
 <20150521083612.GH11112@norris-Latitude-E6410>
 <555DAFB6.7080208@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <555DAFB6.7080208@redhat.com>
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

On Thu, May 21, 2015 at 12:13:10PM +0200, Denys Vlasenko wrote:
> On 05/21/2015 10:36 AM, Brian Norris wrote:
> > On Thu, May 21, 2015 at 09:50:38AM +0200, Denys Vlasenko wrote:
> >>>> cfi_udelay(): 74 bytes, 26 callsites
> >>>
> >>> ^^ This is pretty dead-simple. If it's generating bad code, we might
> >>> look at fixing it up instead. Almost all of its call sites are with
> >>> constant input, so it *should* just become:
> >>>
> >>> 	udelay(1);
> >>> 	cond_resched();
> >>>
> >>> in most cases. For the non-constant cases, we might still do an
> >>> out-of-line implementation. Or maybe we just say it's all not worth it,
> >>> and we just stick with what you have. But I'd like to consider
> >>> alternatives to out-lining this one.
> >>
> >> You want to consider not-deinlining (IOW: speed-optimizing)
> > 
> > Inlining isn't always about speed.
> > 
> >> a *fixed time delay function*?
> >>
> >> Think about what delay functions do...
> > 
> > I wasn't really looking at speed. Just memory usage.
> 
> I don't follow.
> 
> A single, not-inlined cfi_udelay(1) call is
> a minimal possible code size. Even
> 
> udelay(1);
> cond_resched();
> 
> ought to be bigger.

That's not really true. If all cases could be inlined to a single
udelay/msleep call, then that would be the minimal code size; you'd save
the non-inlined copy that would just call to msleep/udelay, as well as
save the need for additional EXPORT_SYBMOL_*(). But in most realistic
cases (including this case), your patch is in fact optimal. My follow up
comment (trimmed from below) was intended to concede that I was a little
off-base in my request.

Thanks for putting up, even though some of your comments are tackling a
straw man (I never mentioned performance).

Thanks,
Brian
