Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4qXp-0003zd-Be
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2011 08:14:26 +0000
Received: by wwb39 with SMTP id 39so831208wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Mar 2011 01:14:23 -0700 (PDT)
Subject: Re: [PATCH v2] ubifs: fix kconfig dependency warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20110329084855.0de29fff.randy.dunlap@oracle.com>
References: <20110328134016.deb5d0c8.randy.dunlap@oracle.com>
	<1301382178.2816.69.camel@localhost> <4D91F432.2070406@oracle.com>
	<1301411055.21445.13.camel@localhost>
	<20110329084855.0de29fff.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Mar 2011 11:12:09 +0300
Message-ID: <1301472729.2755.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-29 at 08:48 -0700, Randy Dunlap wrote:
> On Tue, 29 Mar 2011 18:04:15 +0300 Artem Bityutskiy wrote:
> 
> > On Tue, 2011-03-29 at 08:01 -0700, Randy Dunlap wrote:
> > > On 03/29/11 00:02, Artem Bityutskiy wrote:
> > > > On Mon, 2011-03-28 at 13:40 -0700, Randy Dunlap wrote:
> > > >> From: Randy Dunlap <randy.dunlap@oracle.com>
> > > >>
> > > >> Fix another kconfig dependency warning, this time in ubifs.
> > > >>
> > > >> warning: (UBIFS_FS_DEBUG && LOCKDEP && LATENCYTOP) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)
> > > >>
> > > >> Without this patch, we can have:
> > > >> # CONFIG_KALLSYMS is not set
> > > >> CONFIG_KALLSYMS_ALL=y
> > > >> which is useless (does nothing unless KALLSYMS is enabled).
> > > >>
> > > >> However, ubifs builds successfully with or without this patch,
> > > >> and it builds with this line completely deleted,
> > > >> so what was this 'select' for?  Just developer convenience?
> > > > 
> > > > Well, here is the idea. You can compile UBIFS with debugging and without
> > > > debugging. Without debugging the resulting ubifs.ko is much smaller, so
> > > > some embedded people prefer it this way.
> > > > 
> > > > If you select debugging support, then we'll compile it a lot of
> > > > assertions, self-checks, test-modes, extra error messages with detailed
> > > > dumps. And we want to see stackdumps when errors or problems happen,
> > > > this is why we select KALLSYMS_ALL.
> > > > 
> > > > So I guess instead we should do:
> > > > 
> > > > select KALLSYMS
> > > > select KALLSYMS_ALL
> > > 
> > > Yes, that should do it.  Thanks for the explanation.
> > 
> > Will you submit a patch? Alternatively, I can make it myself. What is
> > your preference?
> 
> Here's an updated patch.  But since KALLSYMS_ALL depends on DEBUG_KERNEL,
> the lines above aren't quite sufficient and I don't care to select
> DEBUG_KERNEL.

What is the real difference between KALLSYMS_ALL and KALLSYMS? It looks
like for stack dumps KALLSYMS is enough. The Kconfig help text is not
very helpful. And when I look at the help text of
CONFIG_KALLSYMS_EXTRA_PASS I get feeling that this area needs some
clean-up work.

Anyway, any idea why we wouldn't just kill KALLSYMS_ALL by merging it
with KALLSYMS?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
