Received: from ozlabs.org ([103.22.144.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2vHE-0006DG-4z
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2015 05:43:44 +0000
Message-ID: <1434001398.28304.3.camel@ellerman.id.au>
Subject: Re: [PATCH V3] drivers/mtd: add powernv flash MTD abstraction driver
From: Michael Ellerman <mpe@ellerman.id.au>
To: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 11 Jun 2015 15:43:18 +1000
In-Reply-To: <CAFLxGvxM1V8EMmZotqhSUG-q0cy+NpufeksChjJrD0qSJCSB0g@mail.gmail.com>
References: <1433219169-5115-1-git-send-email-cyrilbur@gmail.com>
 <1433479201.3379.10.camel@cyril>
 <CAFLxGvxM1V8EMmZotqhSUG-q0cy+NpufeksChjJrD0qSJCSB0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-06-05 at 10:16 +0200, Richard Weinberger wrote:
> On Fri, Jun 5, 2015 at 6:40 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > On Tue, 2015-06-02 at 14:26 +1000, Cyril Bur wrote:
> >> Powerpc powernv platforms allow access to certain system flash devices
> >> through a firmwarwe interface. This change adds an mtd driver for these
> >> flash devices.
> >>
> >> Minor updates from Jeremy Kerr and Joel Stanley.
> >>
> >> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> >> ---
> >> Hello Brian and MTD folk,
> >> Could I please get an ACK for Michael to take this through the powerpc
> >
> > As we have some deadlines approaching, I am getting pressure to ensure
> > this gets merged upstream as quickly as possible, please let me know if
> > there is anything more which can be done.
>
> FYI, Brian is not available for the next 1.5 weeks.
> So I fear this driver has to wait for the next merge window.

OK. We'll merge it via the powerpc tree and if there are any problems with it
we can fix them later.

cheers
