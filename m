Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQ6fU-0006JL-Ih
 for linux-mtd@lists.infradead.org; Tue, 24 Feb 2015 04:00:21 +0000
Received: by pabkx10 with SMTP id kx10so32739643pab.13
 for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2015 19:59:59 -0800 (PST)
Date: Mon, 23 Feb 2015 19:59:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Message-ID: <20150224035956.GE18140@ld-irv-0074>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
 <CAN1oZWwHsm1i2Ap6LJwd5u=1ySokzA6DZCFAqK6wkPCz_P3XMA@mail.gmail.com>
 <CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, nga_chi86 <ngachi86@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 23, 2015 at 09:30:09AM +0800, Viet Nga Dao wrote:
> Hi,
> It has been nearly 2 weeks since i submitted this patch.  Could you
> please help to review?

Those two weeks were during the merge window, so I wasn't queueing
anything up. And there are things that have waited longer, anyway. My
time is unfortunately finite.

I'll get to your patch eventually.

> On Tue, Feb 17, 2015 at 9:33 AM, Viet Nga Dao <vndao@altera.com> wrote:
> > Hi Brian,
> > Could you please help me to review through this 2nd version?
> >
> > On Wed, Feb 11, 2015 at 12:53 PM, Viet Nga Dao <vndao@altera.com> wrote:
> >> From: Viet Nga Dao <vndao@altera.com>
> >>
> >> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
> >> EPCS flash chips. This patch adds driver for these devices.
> >>
> >> Signed-off-by: VIET NGA DAO <vndao@altera.com>
> >>
> >> ---
> >> v2:
> >> - Change to spi_nor structure
> >> - Add lock and unlock functions for spi_nor
> >> - Simplify the altera_epcq_lock function
> >> - Replace reg by compatible in device tree
...

Brian
