Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOA31-0007Wd-P8
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 20:17:09 +0000
Date: Tue, 26 Jan 2016 21:16:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Han Xu <xhnjupt@gmail.com>, Huang Shijie <shijie.huang@arm.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove deprecated oobinfo retrieval
Message-ID: <20160126211638.31033039@bbrezillon>
In-Reply-To: <20160126195941.GA118766@google.com>
References: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
 <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
 <20160126195941.GA118766@google.com>
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

On Tue, 26 Jan 2016 11:59:41 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Jan 26, 2016 at 07:42:16AM +0100, Boris Brezillon wrote:
> > From: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > 
> > This remove OOB info retrieval, which is not used anywhere else in the code
> > and can generate errors when called on newer NAND that have more than 32
> > bytes of ECC or 16 bytes available for user usage in the OOB area.
> > 
> > Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > ---
> >  src/mtd.c | 8 --------
> >  src/mtd.h | 1 -
> >  2 files changed, 9 deletions(-)
> 
> What source are you trying to patch? Doesn't look like Linux or
> mtd-utils.

Nope, those patches apply on the kobs-ng project (BTW, didn't find any
git repo hosting this project).
I realize I shouldn't send those patches to the MTD ML (I just kept
the @ Han Xu sent his request to, including the ML).

Sorry for the inconvenience.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
