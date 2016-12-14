Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHJAG-0004OH-Rn
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 23:40:50 +0000
Received: by mail-pg0-x244.google.com with SMTP id x23so3907439pgx.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2016 15:40:28 -0800 (PST)
Date: Wed, 14 Dec 2016 15:40:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Karl Beldan <karl.beldan@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Walter <dwalter@sigma-star.at>, Stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2 01/46] mtdpart: Propagate _get/put_device()
Message-ID: <20161214234025.GA24990@google.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
 <20160921121531.7786ee9b@bbrezillon>
 <20160928201611.GB142302@google.com>
 <CACYmx9P8LgpZFu8yZR0UqAi52D2Sn6Ht+A6h-qygeAz8AsULwA@mail.gmail.com>
 <20161214210935.GA135941@google.com>
 <a536190d-1ad1-2ed6-2491-250007532ef8@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a536190d-1ad1-2ed6-2491-250007532ef8@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 14, 2016 at 10:12:42PM +0100, Richard Weinberger wrote:
> On 14.12.2016 22:09, Brian Norris wrote:
> > Also, note that this isn't a regression; it's been broken forever and
> > apparently no one noticed. IMO that raises the bar a bit (but not
> > impossibly so) for -stable.
> 
> Yes. AFAICT you can only trigger it using my "new" nandsim
> which is not mainline so far.

Ah, OK. So the only current _{get,put}_device() implementor in mainline
is gluebi, so far. And it's OK for now to just have the master device be
refcounted, and just rely on the partitions being removed before the
master, right?

In that case, no, this shouldn't go to -stable.

Brian
