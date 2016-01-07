Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGy4A-0004DV-JU
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 00:04:35 +0000
Received: by mail-pa0-x22f.google.com with SMTP id do7so5882488pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 16:04:13 -0800 (PST)
Date: Wed, 6 Jan 2016 16:04:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
Message-ID: <20160107000410.GR109450@google.com>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <20150818042426.GA27858@laptop> <874mjwa1w6.fsf@belgarion.home>
 <87r3mt3jpw.fsf@belgarion.home>
 <CAAEAJfD2NB+JkpwwcwRz6gWOfcNVEY2MqWGkCskf0a0WRNR9gQ@mail.gmail.com>
 <20151219004845.GW10460@google.com> <87lh8qhbqp.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lh8qhbqp.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 19, 2015 at 01:19:26PM +0100, Robert Jarzmik wrote:
> Brian Norris <computersforpeace@gmail.com> writes:
> 
> > I don't have very strong opinions on this. It's kind of annoying to have
> > this sort of stuff duplicated for every driver, if it's really needed.
> > But I'll admit this kind of infrastructure is sometimes useful.
> >
> > Anecdote: I recently found the regmap trace event infrastructure pretty
> > nice for debugging some other drivers. This would only require you to
> > have tracing enabled, and then no recompiles are necessary at all. Just
> > cmdline changes.
> >
> > So, I could go with this patch, if Robert still desires it. Or you could
> > convert to using regmap for MMIO :)
> I'm as you, I don't feel strong opinion about it, I'd like to have a debug
> tracing tool, be that this patch or regmap MMIO.

Regmap is probably overkill, and wouldn't do a lot to satisfy Ezequiel's
concern, I expect.

> If we all agree on a path I could even make the final patch, whichever solution
> is chosen.

I'm OK with this one, which still applies OK for me. But I do have one
comment, which I'll post at the top-level.

Brian
