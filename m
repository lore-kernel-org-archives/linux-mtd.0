Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpKaE-0002a8-Ua
 for linux-mtd@lists.infradead.org; Wed, 28 Sep 2016 19:31:59 +0000
Received: by mail-pf0-x241.google.com with SMTP id 21so2518272pfy.1
 for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2016 12:31:38 -0700 (PDT)
Date: Wed, 28 Sep 2016 12:31:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] MTD NAND fixes for v4.8-rc8
Message-ID: <20160928193134.GA142302@google.com>
References: <91984e2b-9bc9-0938-f4af-8decc00b7e63@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91984e2b-9bc9-0938-f4af-8decc00b7e63@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Fri, Sep 23, 2016 at 02:05:20PM +0200, Richard Weinberger wrote:
> This pull request contains fixes for bugs which got introduced in -rc1.
> You may wonder why I'm sending this pull request. Usually Brian takes NAND patches
> from Boris, but since Brian is very busy these days with other stuff and Boris is
> not yet member of the kernel.org web of trust I stepped in.

Thank you for doing this.

> Boris will be in Berlin at ELCE, I'll sign his key and hopefully other
> Kernel developers too such that he can issue his own pull requests soon.

Perfect.

> Brian, if there is anything wrong with this pull request, please let us know.
> We're not trying to bypass you. All we want is getting these fixes upstream
> before the merge window opens and new bugs emerge.

No problem, and all looks good. Sorry I've been too distracted :(

Unfortunately, there are also two other bugfixes I had queued in
linux-mtd.git weeks ago, and I didn't get around to sending a PR. They
are very minor (in risk and patch size) so I'll send the PR now.

Brian
