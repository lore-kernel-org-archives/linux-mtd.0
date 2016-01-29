Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEeM-0003vp-Qv
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:24:07 +0000
Received: by mail-pf0-x241.google.com with SMTP id x125so4212096pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:23:45 -0800 (PST)
Date: Fri, 29 Jan 2016 11:23:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Marek Vasut <marex@denx.de>,
 Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 4/8] mtd: spi-nor: disallow further writes to SR if WP#
 is low
Message-ID: <20160129192341.GD19540@google.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
 <1453960307-10181-5-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfC6HM6M0ZJuEqj-=QUUs9+kHJB0m5bt2t9a-VYuiMPx4Q@mail.gmail.com>
 <20160128175905.GA33340@google.com>
 <CAAEAJfDHRutp1R1nKxih-4CENBsjhmFaaTnqD7S6Vub+pqE05Q@mail.gmail.com>
 <20160128194836.GA63180@google.com>
 <CAAEAJfAPbLX9_OOWoUEsVOdUh2DOD+k425u7JkAanjUQxm8MWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfAPbLX9_OOWoUEsVOdUh2DOD+k425u7JkAanjUQxm8MWA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 29, 2016 at 10:22:34AM -0300, Ezequiel Garcia wrote:
> On 28 January 2016 at 16:48, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Thu, Jan 28, 2016 at 04:24:50PM -0300, Ezequiel Garcia wrote:
> >> How about this:
> >>
> >> 1) ioctl(MEMLOCK) the entire flash (SR_SRWD is set)
> >> 2) ioctl(MEMUNLOCK) partially (SW_SRWD keeps set)
> >> 3) ioctl(MEMLOCK) the entire flash again

...

> >> but would (3)  be allowed given
> >> SW_SRWD is set?
> >
> > Yes, if /WP=1 (high).
> >
> 
> Right. So, after giving some more thought do this, I'd say it might
> make sense to clear SRWD only when unlocking the entire flash. If
> anything else, it would allow a path to disable hardware protection on
> the lock range?

Yes, that sounds fine to me, as it does allow removal of the HW
protection. So one could, for example, do:

0. bring /WP=1 (high)
1. unlock the whole flash
2. bring /WP=0 (low) -- flash is still unlocked
3. allow a one-time relocking of the flash via MEMLOCK
4. no more locking changes

I'll send out v2.

Brian
