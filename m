Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBnfl-0004Vi-R0
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2013 14:44:26 +0000
Message-ID: <1362235493.2745.11.camel@sauron>
Subject: Re: [PATCH v2] mtd: torturetest: add the support for random data
 pattern
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Sat, 02 Mar 2013 16:44:53 +0200
In-Reply-To: <CAMiH66FFzeSg7r_hedet5deynxY6OF18UMcASsX-GaHjGmXiZQ@mail.gmail.com>
References: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
 <1360052485-11961-1-git-send-email-b32955@freescale.com>
 <1360751856.12703.132.camel@sauron.fi.intel.com>
 <CAMiH66FFzeSg7r_hedet5deynxY6OF18UMcASsX-GaHjGmXiZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, ricard.wanderlof@axis.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-02-16 at 12:00 +0800, Huang Shijie wrote:
> On Wed, Feb 13, 2013 at 6:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2013-02-05 at 16:21 +0800, Huang Shijie wrote:
> >> Add a new module parameter 'pattern'. The meaning of the pattern is:
> >>   (1) pattern == 0 for 55/AA pattern.
> >>   (2) pattern < 0 for random pattern.
> >>   (3) pattern > 0 for random pattern too, the value of the pattern is used
> >>       as the seed for the random generator.
> >
> > Please, do not add parameters, make it simple - teach the test to use
> > both the old patterns plus additional cycles with random patterns.
> 
> but if we do not add new parameter, how can we create a random seed?

Unless you have a real practical reason to let users pass the initial
random seed, do not do this.

> Is it ok without set the random seed?

I think so.

-- 
Best Regards,
Artem Bityutskiy
