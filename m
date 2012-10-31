Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTbPe-00016e-T3
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 16:45:08 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH for 3.7] mtd: nand: fix Samsung SLC NAND identification
 regression
Date: Wed, 31 Oct 2012 17:45:00 +0100
References: <1349850366-4731-1-git-send-email-computersforpeace@gmail.com>
 <1349855329.6072.72.camel@shinybook.infradead.org>
 <CAN8TOE8yzJY67b=S=KyONe2pLYGJVe9vW4KXzsjvU7AU9aFpHg@mail.gmail.com>
In-Reply-To: <CAN8TOE8yzJY67b=S=KyONe2pLYGJVe9vW4KXzsjvU7AU9aFpHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210311745.00677.marex@denx.de>
Cc: Robin van der Gracht <robin@protonic.nl>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> Hi David,
> 
> On Wed, Oct 10, 2012 at 12:48 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> > On Tue, 2012-10-09 at 23:39 -0700, Brian Norris wrote:
> >> I can see if that's possible, but I think it's unlikely. They don't
> >> even bother following standards (ONFI). Is this an obstacle to
> >> merging?
> > 
> > No. I already pushed it.
> 
> This is a "bump" for a 3.7-rc pull request. This regression has been
> noticed by others.

[whine] my nand doesn't work ;-)

Thanks for keeping eye on this, Brian.

Best regards,
Marek Vasut
