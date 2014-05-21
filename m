Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnD3I-0004qx-Fk
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 20:23:52 +0000
Received: by mail-pa0-f53.google.com with SMTP id kp14so1727571pab.40
 for <linux-mtd@lists.infradead.org>; Wed, 21 May 2014 13:23:30 -0700 (PDT)
Date: Wed, 21 May 2014 13:23:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Subject: Re: [l2-mtd:master 28/29] drivers/mtd/lpddr/lpddr2_nvm.c:149:2:
 error: implicit declaration of function 'writel_relaxed'
Message-ID: <20140521202326.GH22233@ld-irv-0074>
References: <537bfc24.N6Jd/c3WxnkfHn37%fengguang.wu@intel.com>
 <20140521014908.GE22233@ld-irv-0074>
 <CADBu1QtQpXQTqEDBV3bzQkLmEq3s6k3rtQ2en4L7StcLszO9rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADBu1QtQpXQTqEDBV3bzQkLmEq3s6k3rtQ2en4L7StcLszO9rQ@mail.gmail.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vincenzo,

Please, can you avoid top-posting?

On Wed, May 21, 2014 at 08:38:00AM +0200, Vincenzo Aliberti wrote:
> Brian,
>    considering that this memory interface is implemented only on ARM
> we can litimit the driver to ARM
> in my opinion. Is it ok for you?

I suppose. I'd really like to be able to compile test this on other
architectures (maybe by depending on COMPILE_TEST, so it still only
shows up on ARM?). But for now, adding an ARM dependency would be OK.

Are you sure that writel_relaxed() is correct here, BTW? Does your
hardware expect ordering between these register writes? If so, then you
should be using writel() instead.

> On Wed, May 21, 2014 at 3:49 AM, Brian Norris <computersforpeace@gmail.com> wrote:
> > What do you think? Should we:
> >
> >  1. Limit your driver to ARM (or other ARCH that supports
> >     writel_relaxed()?
> >  2. Use writel() instead?
> >  3. Wait for other ARCH'es to support writel_relaxed()?

Brian
