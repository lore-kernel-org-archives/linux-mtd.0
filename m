Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA5ht-0005bc-LU
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2015 00:49:10 +0000
Received: by mail-pa0-x232.google.com with SMTP id jx14so39324867pad.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 16:48:48 -0800 (PST)
Date: Fri, 18 Dec 2015 16:48:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
Message-ID: <20151219004845.GW10460@google.com>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <20150818042426.GA27858@laptop> <874mjwa1w6.fsf@belgarion.home>
 <87r3mt3jpw.fsf@belgarion.home>
 <CAAEAJfD2NB+JkpwwcwRz6gWOfcNVEY2MqWGkCskf0a0WRNR9gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfD2NB+JkpwwcwRz6gWOfcNVEY2MqWGkCskf0a0WRNR9gQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Garbage collecting some old patches before vacation...

On Mon, Aug 24, 2015 at 10:46:18AM -0300, Ezequiel Garcia wrote:
> I agree that the hack is useful for debugging purposes, it's just that I don't
> see why we want it in mainline - where we usually avoid clutter.

I'm not sure this is really that important of clutter. It's in a nicely
hidden abstraction (the local nand_{read,write}l() helpers), and it
doesn't add any compile time cost for most users.

> Also, your argument applies to all the other drivers, but that doesn't mean
> we will patch them all.
> 
> Anyway, this is just my opinion. If Brian thinks differently, I have no problem
> with it.

I don't have very strong opinions on this. It's kind of annoying to have
this sort of stuff duplicated for every driver, if it's really needed.
But I'll admit this kind of infrastructure is sometimes useful.

Anecdote: I recently found the regmap trace event infrastructure pretty
nice for debugging some other drivers. This would only require you to
have tracing enabled, and then no recompiles are necessary at all. Just
cmdline changes.

So, I could go with this patch, if Robert still desires it. Or you could
convert to using regmap for MMIO :)

Brian
