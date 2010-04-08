Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzmma-0002I6-7b
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:08:13 +0000
Subject: Re: CONFIG_MTD_DEBUG vs generic DEBUG support in kernel.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
In-Reply-To: <87vdctzjn4.fsf@tac.ki.iif.hu>
References: <878w9swhlv.fsf@tac.ki.iif.hu>
	<1268744759.20017.58.camel@localhost>  <87vdctzjn4.fsf@tac.ki.iif.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:06:20 +0300
Message-ID: <1270713980.6754.94.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-03-18 at 17:20 +0100, Ferenc Wagner wrote:
> Artem Bityutskiy <dedekind1@gmail.com> writes:
> 
> > On Tue, 2010-03-16 at 13:55 +0100, Ferenc Wagner wrote:
> > 
> >> include/linux/mtd/mtd.h contains the following snippet:
> >> 
> >> #ifdef CONFIG_MTD_DEBUG
> >> #define DEBUG(n, args...)                               \
> >>         do {                                            \
> >>                 if (n <= CONFIG_MTD_DEBUG_VERBOSE)      \
> >>                         printk(KERN_INFO args);         \
> >>         } while(0)
> >> 
> >> which conflicts with the generic debugging support in
> >> include/linux/kernel.h:
> >> 
> >> #ifdef DEBUG
> >> #define pr_devel(fmt, ...) \
> >>         printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> >> 
> >> (that is, gcc emits redefinition warnings on modules which
> >> #define DEBUG on their own and also include mtd.h)
> >> Unfortunately, the DEBUG macro is used rather heavily under
> >> drivers/mtd.  Should we resolve this somehow or is it better
> >> to just live with it?
> >
> > IMO, this MTD debug stuff is not very useful and could be just killed.
> 
> Well, I found the mtdcore debugging somewhat useful.  But anyway,
> killing it would be about as much work as renaming the macro, or using
> something standard as dev_(v)dbg or pr_debug/devel (btw. what's the
> difference?) instead.  I'm willing to do some mechanical work on either
> one if you wish.

Yeah, probalby you can transform them to dev_dbg. But the "levels" do
not seem to be available with dev_dbg, so I guess you could nuke some
higher level messages?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
