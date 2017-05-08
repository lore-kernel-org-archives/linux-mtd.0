Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7mkA-0004cy-O7
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 17:46:48 +0000
Received: by mail-pf0-x241.google.com with SMTP id v14so10675200pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 10:46:25 -0700 (PDT)
Date: Mon, 8 May 2017 10:46:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: orion: don't complain for probe deferral
Message-ID: <20170508174622.GA20745@google.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-5-computersforpeace@gmail.com>
 <20170502080730.GA7617@gandalf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170502080730.GA7617@gandalf>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 02, 2017 at 10:07:31AM +0200, Simon Baatz wrote:
> Hi Brian,
> 
> On Mon, May 01, 2017 at 05:04:54PM -0700, Brian Norris wrote:
> > Recent patches to this driver changed the error handling for missing
> > clocks. Now we'll print an error if the clock causes us to defer
> > probing. Let's not do that.
> > 
> 
> This is by intention.  Probe deferral is not supported by drivers
> using module_platform_driver_probe().  EPROBE_DEFER results in not
> being able to get the clock and, thus, is handled like any other
> error.

Ah, good point. I overlooked that part.

Seems kind of inconsistent driver writing (what happens if someone wants
to use this driver on a more complex system, where some of the dependent
resources are not available at init time?), but I see in the git logs
that apparently this is intentional (to save memory?).

So, I'll NAK this patch.

Brian
