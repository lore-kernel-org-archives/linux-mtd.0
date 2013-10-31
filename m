Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbuF1-0002wi-JB
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 15:33:00 +0000
Date: Thu, 31 Oct 2013 12:32:43 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand_bbt: kill NAND_BBT_SCANALLPAGES
Message-ID: <20131031153242.GB1092@localhost>
References: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
 <20131031102038.GA2391@localhost>
 <20131031152245.GB4700@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131031152245.GB4700@norris.computersforpeace.net>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 11:22:45AM -0400, Brian Norris wrote:
> On Thu, Oct 31, 2013 at 07:20:39AM -0300, Ezequiel Garcia wrote:
> > On Wed, Oct 30, 2013 at 10:29:35PM -0400, Brian Norris wrote:
> > > Now that the last user of NAND_BBT_SCANALLPAGES has been removed, let's
> > > kill this peculiar BBT feature flag.
> > > 
> > 
> > I must admit I also find this option a bit puzzling.
> > 
> > However, I'm wondering what happens if a manufacturer specifies
> > the bad block mark is in some page at the middle of a block.
> > 
> > AFAIK, some of them do exactly that, and I've always thought
> > this option was the solution for such cases.
> 
> Well, it's not really a *good* solution for a marker in the middle of
> the page, as it's both inaccurate and heavily inefficient.

Granted.

> I've never heard of such a device. (There is a rare one or two that uses
> the 2nd-to-last or 3rd-to-last page.) Do you have any examples?
> 

Not at hand.

> > So, is this really no longer needed?
> 
> I think it just adds unnecessary complexity to nand_bbt.c. Generally,
> the fewer (unused) options the better. Also, this helps clear the way
> for some nand_base/nand_bbt simplification that I have planned.
> 
> Additionally, I think its only users were either accidental (in the case
> of omap2.c) or lazy (which didn't want to figure out the correct pages
> to scan for bad block markers). And now there are no users.
> 

Ok, agreed. But do we have any mechanism to scan a *particular*
page?

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
