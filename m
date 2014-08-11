Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGuFk-0000pR-Ci
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 18:23:28 +0000
Received: by mail-pa0-f47.google.com with SMTP id kx10so11555290pab.34
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 11:23:07 -0700 (PDT)
Date: Mon, 11 Aug 2014 11:23:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 3/8] mtd: spi-nor: move "wait-till-ready" checks into
 erase/write functions
Message-ID: <20140811182304.GW3711@ld-irv-0074>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-4-git-send-email-computersforpeace@gmail.com>
 <20140809084221.GA32664@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140809084221.GA32664@localhost.localdomain>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 09, 2014 at 04:42:24PM +0800, Huang Shijie wrote:
> On Wed, Aug 06, 2014 at 06:16:57PM -0700, Brian Norris wrote:
> > We shouldn't have *every* function checking if a previous write is
> > complete; this should be done synchronously after each write/erase.
> 
> IMHO, this is not a good idea. :(

Do you mean you think it is a good idea for every unrelated function to
check if the previous erase/write is complete?

> this patch prevents the erase-suspend and program-suspend.
> We should add these two features for spi-nor in future.

OK, how would you propose that such features be implemented, and how
would they be used to the benefit of higher layers?

Directed toward the former: specifically, how does leaving the
SR/FSR-checking burden on all subsequent commands benefit a potential
erase/program suspend implementation? The code is not written at all
with erase/program suspend in mind, and the current patch solves a
current problem; that we perform checking in all the wrong places.

To the latter: are file systems (e.g., UBIFS) aware of suspend-able
program/erase? Would they have the knowledge to take advantage of
suspend-able program/erase? i.e., could they suspend an unimportant
erase command in order to prioritize a read or write?

Finally, this patch mostly prepares for elimination of code from
lower-level drivers (m25p80.c and fsl-quadspi, in the following two
patches). These drivers should *not* be worrying about the details of
command statuses; this should be handled by the generic code
(spi-nor.c).

So, unless you can provide some outline as to how program/erase suspend
can be implemented reasonably within this framework, and how this
particular patch makes that so much more difficult, I plan to move
forward with this.

Thanks,
Brian
