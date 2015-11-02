Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtOZJ-0004eY-7W
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 23:31:17 +0000
Received: by padec8 with SMTP id ec8so53125755pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 15:30:56 -0800 (PST)
Date: Mon, 2 Nov 2015 15:30:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Clay McClure <clay@daemons.net>
Cc: Ray Jui <rjui@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
Message-ID: <20151102233054.GH7274@google.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
 <20151026181430.GA13239@google.com> <562E7667.5050406@broadcom.com>
 <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
 <20151027204023.GV13239@google.com>
 <CAOVqfW_HXf9E4JNBHOCgAk7rpGexhpKHyfrQvSR7e3poiSHi2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOVqfW_HXf9E4JNBHOCgAk7rpGexhpKHyfrQvSR7e3poiSHi2A@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 03:10:05PM -0800, Clay McClure wrote:
> On Tue, Oct 27, 2015 at 1:40 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> >
> > OK, getting testing feedback from an iProc-based system using ONFI would
> > be somewhat illuminating.
> 
> I've tested your refactoring patch [1] on Helix4 (an iProc-based
> switch chip); seems to work fine.

You mean, you tested with a combo of my [1] and either [2] or [3]? Can I
get a 'Tested-by' line to add to them?

e.g.: 'Tested-by: Your Name <your@email>'

Regards,
Brian

> 
> [1] http://patchwork.ozlabs.org/patch/536148/

[2] http://patchwork.ozlabs.org/patch/539145/ (except your patch is
    whitespace damaged and patchwork didn't like it)

[3] http://patchwork.ozlabs.org/patch/535330/
