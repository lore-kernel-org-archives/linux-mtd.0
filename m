Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMJLj-0001Td-6R
 for linux-mtd@lists.infradead.org; Wed, 28 Dec 2016 18:53:19 +0000
Received: by mail-wj0-x243.google.com with SMTP id j10so55398267wjb.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Dec 2016 10:52:54 -0800 (PST)
Date: Wed, 28 Dec 2016 18:53:34 +0000
From: Karl Beldan <karl.beldan@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Walter <dwalter@sigma-star.at>, Stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2 01/46] mtdpart: Propagate _get/put_device()
Message-ID: <20161228185334.yxn5tyselki464m3@gobelin>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
 <20160921121531.7786ee9b@bbrezillon>
 <20160928201611.GB142302@google.com>
 <CACYmx9P8LgpZFu8yZR0UqAi52D2Sn6Ht+A6h-qygeAz8AsULwA@mail.gmail.com>
 <20161214210935.GA135941@google.com>
 <CACYmx9Oh6z84HggiWw+zou9Zy9cFerrm8Krpd-Y2Rk8oVDP1kg@mail.gmail.com>
 <4a84fc5f-5980-5be0-6488-af77e0e8548a@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a84fc5f-5980-5be0-6488-af77e0e8548a@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 15, 2016 at 08:51:06AM +0100, Richard Weinberger wrote:
> On 15.12.2016 08:09, Karl Beldan wrote:
> >>> I think this should also go into -stable.
> >>
> >> Why? Do you have real use cases that are broken by this? I understand
> > 
> > I do, some code adding partitions on a gluebi master.
> 
> What exactly are you doing?
> 
> >> this is a problem, but I'm curious on how this satisfies the stable
> >> rules.
> >>
> >> Also, note that this isn't a regression; it's been broken forever and
> >> apparently no one noticed. IMO that raises the bar a bit (but not
> >> impossibly so) for -stable.
> >>
> > 
> > I just encountered the bug yesterday and yes it is obvious it has been
> > broken forever.
> > I don't have strong opinion about these things so no worries.
> 
> If existing stuff is broken, and you can trigger it. Please let us
> know. Then it should go into -stable.
> 

I thought that's what I already did.

Anyways, it didn't require much imagination to come up with a script
triggering the issue so here you are:

#{{

modprobe nandsim
modprobe gluebi
ubiattach -p /dev/mtd1 -b 1
ubimkvol /dev/ubi0 -S 4 -N vol_0
mtdpart add /dev/mtd2 vol_0_0 0 0x1000
tail -F /dev/mtd2 &
while :; do dd bs=1 count=1 if=/dev/mtd3 >/dev/null 2>&1 || break; done
kill -9 %1 # Oops

#}}

 
Karl
