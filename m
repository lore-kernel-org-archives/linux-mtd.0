Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRR84-0002zQ-Tj
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:26:33 +0000
Date: Wed, 2 Oct 2013 11:22:27 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: JFFS2 SUMMARY prior to Linux 3.9
Message-ID: <20131002182227.GA7065@kroah.com>
References: <alpine.DEB.2.00.1309161003150.2394@lnxricardw.se.axis.com>
 <CAN8TOE8PLvcK4kuRvbRh32gg0_Y8sbwWjdcWh_xt-tgQcPb85Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE8PLvcK4kuRvbRh32gg0_Y8sbwWjdcWh_xt-tgQcPb85Q@mail.gmail.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Kees Cook <keescook@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 02, 2013 at 10:57:04AM -0700, Brian Norris wrote:
> On Mon, Sep 16, 2013 at 1:04 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
> > I've noticed that JFFS2 summary has been relieved of it's EXPERIMENTAL
> > status since Linux 3.9 . But was it stable enough before then as well? -
> > often the EXPERIMENTAL property lingers on longer that it really needs to.
> 
> AFAIK, JFFS2 hasn't changed much for many releases, so its current
> status pretty well reflects its status for many previous releases.
> 
> Regarding the EXPERIMENTAL status; this was changed without CC'ing the
> MTD list (although David was CC'd, it seems) in commit:
> 
> commit cf98c5e56807af7c793497bbd0446f71c383ffd5
> Author: Kees Cook <keescook@chromium.org>
> Date:   Wed Jan 16 18:54:12 2013 -0800
> 
>     fs/jffs2: remove depends on CONFIG_EXPERIMENTAL
> 
> Judging by the commit description, this change just represents a
> change in attitude toward the CONFIG_EXPERIMENTAL Kconfig option
> rather than any particular judgment of JFFS2 summary support.

CONFIG_EXPERIMENTAL was removed from the entire kernel, as it really
didn't mean anything anymore, and hadn't for _years_.

greg k-h
