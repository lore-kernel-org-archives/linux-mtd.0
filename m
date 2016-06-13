Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCLVI-0001Ft-Di
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 06:37:44 +0000
Date: Mon, 13 Jun 2016 08:37:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: introduce the mtd_pairing_scheme concept
Message-ID: <20160613083722.7630afe8@bbrezillon>
In-Reply-To: <20160613062229.GA115118@google.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
 <1461578481-26567-2-git-send-email-boris.brezillon@free-electrons.com>
 <20160611021715.GH89390@google.com>
 <20160611085408.74b2295f@bbrezillon>
 <20160613055532.GB107340@google.com>
 <20160613062229.GA115118@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 12 Jun 2016 23:22:29 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Sun, Jun 12, 2016 at 10:55:32PM -0700, Brian Norris wrote:
> > On Sat, Jun 11, 2016 at 08:54:08AM +0200, Boris Brezillon wrote:  
> > > On Fri, 10 Jun 2016 19:17:15 -0700
> > > Brian Norris <computersforpeace@gmail.com> wrote:  
> [...]
> > > > Also, the "pair" term (and examples you use) seem to imply 2-cell MLC,
> > > > whereas I believe you're trying to handle TLC too. I don't know if we
> > > > should drop the "pair" term, or just explain it better.  
> > > 
> > > I clearly have some problems with the words I've chosen, but those terms
> > > were extracted from NAND datasheets (group and pair), and I think
> > > keeping the same wording help people converting datasheet specs into
> > > pairing scheme implementation.
> > > 
> > > Any suggestions to replace those 2 words?  
> > 
> > I'm not sure we should replace the words (esp. if those are used by
> > multiple vendors). [...]  
> 
> I see that George highlighted a Micron datasheet in other parts of this
> thread, and I noticed it uses the term "shared page." That explains why
> I couldn't find the word "pair" in my quick search of Micron datasheets!
> So I guess "shared page" would be a nomination, though I'm certainly not
> forcing it, if you think pair is better.

Samsung and Hynix datasheets are using the term 'paired', and Toshiba
ones are not naming this concept.
It's just a detail anyway, I'm fine switching to 'shared pages'.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
