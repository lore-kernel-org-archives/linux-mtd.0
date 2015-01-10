Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YA5dh-0006Av-FQ
 for linux-mtd@lists.infradead.org; Sat, 10 Jan 2015 23:40:18 +0000
Received: by mail-pd0-f173.google.com with SMTP id ft15so24035212pdb.4
 for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2015 15:39:55 -0800 (PST)
Date: Sat, 10 Jan 2015 15:39:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Giel van Schijndel <me@mortis.eu>
Subject: Re: [PATCH v2] mtd: nftl: reorganize operations in condition check
Message-ID: <20150110233948.GA13943@norris-Latitude-E6410>
References: <1420663040-3857-1-git-send-email-andy.shevchenko@gmail.com>
 <20150109232900.GB9759@ld-irv-0074>
 <CAHp75VdBuqdFYTuQuSPY7QUpL0p7Ku1n7=t7aT+QP=d17ndwHw@mail.gmail.com>
 <20150110201113.GA7918@salidar.dom.custoft.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150110201113.GA7918@salidar.dom.custoft.eu>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 10, 2015 at 09:11:13PM +0100, Giel van Schijndel wrote:
> On Sat, Jan 10, 2015 at 14:56:32 +0200, Andy Shevchenko wrote:
> > On Sat, Jan 10, 2015 at 1:29 AM, Brian Norris <computersforpeace@gmail.com> wrote:
> >> On Wed, Jan 07, 2015 at 10:37:20PM +0200, Andy Shevchenko wrote:
> >>> We need to compare ret variable for negative value. The current code
> >>> assigns the boolean to the ret and prints it wrongly in the warning
> >>> message.
> >>>
> >>> Reported-by: Andrey Karpov <karpov@viva64.com>
> >>> Cc: Giel van Schijndel <me@mortis.eu>
> >>> Cc: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
> >>> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >>
> >> To be clear, this touches some commented out code (yuck). I think you
> >> noted this previously.
> > 
> > It had been proposed by Giel.
> 
> Yes, and I suspect (and hope) Brian's referring to the existence of
> commented-out code as "yuck", not the removal of bugs from it.

Yes, I was just commenting about the existence of all that dead code.
The code won't even compile now, as it's using some old interfaces.

> >> For my reference, are you actually testing this driver?
> > 
> > Not a real testing. Only compilation on x86_32.
> 
> Combined with review I think that's enough given the nature of this
> change.

Yeah, I wasn't objecting to fixing this trivial stuff. I just don't know
who uses some of the aging drivers we have in MTD.

Brian
