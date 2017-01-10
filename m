Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQxWR-0003Z8-7B
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 14:35:40 +0000
Message-ID: <1484058912.2133.22.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] UBI: Make mtd parameter readable
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Date: Tue, 10 Jan 2017 16:35:12 +0200
In-Reply-To: <adfd384d-edb7-1255-f614-174a6793a2a8@nod.at>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
 <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
 <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
 <1484056111.2133.16.camel@linux.intel.com>
 <71c71f00-dcb1-081b-ec55-bc7c39ad32d5@nod.at>
 <1484057496.2133.18.camel@linux.intel.com>
 <adfd384d-edb7-1255-f614-174a6793a2a8@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-01-10 at 15:16 +0100, Richard Weinberger wrote:
> Am 10.01.2017 um 15:11 schrieb Andy Shevchenko:
> > On Tue, 2017-01-10 at 14:54 +0100, Richard Weinberger wrote:
> > > Am 10.01.2017 um 14:48 schrieb Andy Shevchenko:

> > > > Permissions 0000 are error prone.
> > > 
> > > Why?
> > 
> > Because of a trick is being used here.
> 
> You are not really the answering questions kind of guy? ;-)

You see, you have to keep in mind that you are not allowed to use
anything except 0 because parser is gone, variable is gone. I'm talking
about module_param_cb(..., 0) cases only.

> > P.S. If you strongly against it I will give up, it doesn't cost my
> > efforts anymore. That's why one of the possible "solution" is to put
> > comment there for other brave guys.

> Did you check? Do other drivers in the kernel that have a parser
> behind a non-trivial
> module parameter also expose it to user space?

Just checked. The only one which is not, this one.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
