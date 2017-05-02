Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Sqj-00038m-Lp
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:07:59 +0000
Received: by mail-wr0-x243.google.com with SMTP id w50so15910403wrc.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 01:07:35 -0700 (PDT)
Date: Tue, 2 May 2017 10:07:31 +0200
From: Simon Baatz <gmbnomis@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: orion: don't complain for probe deferral
Message-ID: <20170502080730.GA7617@gandalf>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-5-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170502000455.13240-5-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, May 01, 2017 at 05:04:54PM -0700, Brian Norris wrote:
> Recent patches to this driver changed the error handling for missing
> clocks. Now we'll print an error if the clock causes us to defer
> probing. Let's not do that.
> 

This is by intention.  Probe deferral is not supported by drivers
using module_platform_driver_probe().  EPROBE_DEFER results in not
being able to get the clock and, thus, is handled like any other
error.


- Simon
