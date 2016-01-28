Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOsYt-0005FK-5x
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 19:48:59 +0000
Received: by mail-pf0-x241.google.com with SMTP id 65so2557394pfd.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 11:48:38 -0800 (PST)
Date: Thu, 28 Jan 2016 11:48:36 -0800
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
Message-ID: <20160128194836.GA63180@google.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
 <1453960307-10181-5-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfC6HM6M0ZJuEqj-=QUUs9+kHJB0m5bt2t9a-VYuiMPx4Q@mail.gmail.com>
 <20160128175905.GA33340@google.com>
 <CAAEAJfDHRutp1R1nKxih-4CENBsjhmFaaTnqD7S6Vub+pqE05Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfDHRutp1R1nKxih-4CENBsjhmFaaTnqD7S6Vub+pqE05Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 28, 2016 at 04:24:50PM -0300, Ezequiel Garcia wrote:
> On 28 January 2016 at 14:59, Brian Norris <computersforpeace@gmail.com> wrote:
> > So, maybe we want to clear SR_SRWD only when we unlock the *entire*
> > flash? What do you think?

I'll paste in the relevant datasheet details from w25q32fw, to make sure
we're on the same page here, noting that 'SRP0' is our 'SR_SRWD', and
we're not touching SRP1 (i.e., SRP1=0):

 "SRP1=0, SRP0=0, /WP=X: Software Protection
    /WP pin has no control. The Status register can be written to after
    a Write Enable instruction, WEL=1. [Factory Default]
  SRP1=0, SRP0=1, /WP=0: Hardware Protected
    When /WP pin is low the Status Register locked [sic] and cannot be
    written to.
  SRP1=0, SRP0=1, /WP=1: Hardware Unprotected
    When /WP pin is high the Status register is unlocked and can be
    written to after a Write Enable instruction, WEL=1."

> How about this:
> 
> 1) ioctl(MEMLOCK) the entire flash (SR_SRWD is set)
> 2) ioctl(MEMUNLOCK) partially (SW_SRWD keeps set)
> 3) ioctl(MEMLOCK) the entire flash again

I might be confused; are you making a suggestion of a new behavior, or
are you just trying to clarify my proposal? Because this sounds like it
matches my proposal.

> Not sure this use case make sense,

I suppose it could make sense, if you (e.g.) have some intermediate
steps toward determining the locked regions during factory programming.
Maybe a process would start by doing #1 and #2, then decide
conditionally whether to do #3. And only after the whole process is done
does something assert /WP=0 (in my case, a factory process would tie /WP
low).

> but would (3)  be allowed given
> SW_SRWD is set?

Yes, if /WP=1 (high).

Brian
