Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1Goy-0003uq-PY
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 14:10:42 +0000
Date: Mon, 22 Jul 2013 11:10:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
Message-ID: <20130722141006.GA2387@localhost>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
 <20130520123733.GB2904@localhost>
 <CALF0-+W+4NCLimsP1E+aGNLEuE9GtThsm6dNE-iyeju5ixx8Rg@mail.gmail.com>
 <1372663276.22014.29.camel@sauron.fi.intel.com>
 <20130720143643.GB24504@localhost>
 <CAN8TOE9n6e1FnR2hZ3ntWkwPBTtBNvLYyMn+GN8DMY3pROdhgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE9n6e1FnR2hZ3ntWkwPBTtBNvLYyMn+GN8DMY3pROdhgA@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <elezegarcia@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Maen Suleiman <maen@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 21, 2013 at 11:39:49PM -0700, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Sat, Jul 20, 2013 at 7:36 AM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > Hi Artem,
> >
> > On Mon, Jul 01, 2013 at 10:21:16AM +0300, Artem Bityutskiy wrote:
> >> On Fri, 2013-06-07 at 11:22 -0300, Ezequiel Garcia wrote:
> >> > > Since this patch affects directly the PXA hardware, I'd like to have some
> >> > > response from PXA maintainers.
> >> > >
> >> > > Guys, could you take a look at this?
> >> > >
> >> >
> >> > Ping?
> >>
> >>
> >> sorry for long delay. I simply had no time to look an any of my
> >> open-source things, too busy.
> >>
> >> I've pushed this series to l2-mtd.git, thanks!
> >>
> >
> > Thanks!
> >
> > Any chance you can push this to some branch that's included in linux-next?
> > (when you get back to work, of course)
> 
> Artem's l2-mtd.git 'master' branch is already included in linux-next.

Indeed.

I checked before asking but somehow thought it wasn't...

Sorry for the noise and thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
