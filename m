From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Koeller <thomas.koeller@baslerweb.com>
In-Reply-To: <200310151330.02902.thomas.koeller@baslerweb.com>
References: <1065598642.12197.6.camel@famine>
	 <200310151211.29172.thomas.koeller@baslerweb.com>
	 <1066215157.14783.933.camel@hades.cambridge.redhat.com>
	 <200310151330.02902.thomas.koeller@baslerweb.com>
Content-Type: text/plain
Message-Id: <1066299929.14783.2697.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 16 Oct 2003 11:25:29 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: [ECOS] Stress testing JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-15 at 13:30 +0200, Thomas Koeller wrote:
> I do not think this path leads anywhere I want to go. The flash size
> was chosen to meet the expected storage requirements, which means that
> at some point the flash will be filled with valid data and consequently
> there will be few obsoleted nodes. I expect this to be true for most
> systems.

A sane observation.

> > Omitting the 'totlen' field should be relatively simple if you're not
> > freeing obsolete refs. Observe that in 99% of cases, it's true that
> >
> > 	ref->totlen == ref_offset(ref->next_phys) - ref_offset(ref)
> >
> > Make it 100% and make me believe it, and you can remove totlen from the
> > structure.
> >
> 
> I will consider that.

OK... I've made it slightly easier for you by switching all use of
'ref->totlen' to an accessor function ref_totlen(c, jeb, ref), where
'jeb' can be NULL if the caller doesn't know it -- it _can_ be
calculated in the relatively rare case that it's required, but if it's
already to hand we might as well use it.

I've written what I suspect will be the new version of that accessor
function, and included some sanity checks for it. It's in #if 0 for now
since we know it'll be broken -- look in nodelist.h. We may end up
wanting it out of line, since it's not entirely trivial.

To make it usable, we need to ensure that we have a node reference for
areas of dirty space which we've previously been ignoring -- scan.c can
no longer just skip over stuff it ignores but must allocate node
references for it, and we must allocate node references for the wasted
space at the end of eraseblocks when we've filled them _almost_ to the
end and then filed them elsewhere.

It should be relatively simple.

-- 
dwmw2
