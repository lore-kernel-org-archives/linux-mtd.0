Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gWy-0003HU-FL
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:45:01 +0000
Received: by eyh6 with SMTP id 6so1204355eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 08:44:58 -0700 (PDT)
Subject: Re: [PATCH 0/2] do not select KALLSYMS_ALL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paulo Marques <pmarques@grupopie.com>
In-Reply-To: <4D95F092.4080604@grupopie.com>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
	<4D948D52.4040708@grupopie.com>  <1301669776.2789.92.camel@localhost>
	<1301670104.2789.94.camel@localhost>  <4D95F092.4080604@grupopie.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 18:42:29 +0300
Message-ID: <1301672549.2789.107.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 16:34 +0100, Paulo Marques wrote:
> Artem Bityutskiy wrote:
> > On Fri, 2011-04-01 at 17:56 +0300, Artem Bityutskiy wrote:
> >> Well, ok, I've measured how much is this "a lot". On an embedded arm
> >> platform this makes the kernel only 1.5% larger. 
> > 
> > But in absolute numbers this is 70KiB in my case, which is indeed
> > considerable amount. So, I agree that it makes sense to keep this as a
> > separate option.
> 
> Yes, and this depends a lot on the kernel configuration options you've
> selected (and that 1.5% of the kernel size, might be 50%~100% of the
> kallsyms table).
> 
> IIRC, I had configurations where the KALLSYMS_ALL option was increasing
> the kallsyms table from something like 150kB to above 500kB (before
> compression). This was a long time ago though and I can't say exactly
> what was the configuration that made this happen.

Yes, thanks, I agree that having 2 separate options is OK.

> As for the CONFIG_KALLSYMS_EXTRA_PASS, I think the original idea (it was
> not mine) was that it should be off by default and then the user would
> need to turn it on when something went wrong.

Yes, but my point is that this feature is about the build and it does
not affect run-time, so it should not be in Kconfig.

> With an automatic makefile mechanism, the problem would go unnoticed and
> it just wouldn't be fixed, increasing the kernel compile time for
> everyone who hits the same troublesome configuration.

Yes, the build system may print a message:

Your symbols table is screwed, this is a bug, report about it. As a
temporary workaround use "make KALLSYMS_EXTRA_PASS=1"

Or something like that.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
