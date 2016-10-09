Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bt6ko-0006UJ-8k
 for linux-mtd@lists.infradead.org; Sun, 09 Oct 2016 05:34:31 +0000
Received: by mail-pf0-x243.google.com with SMTP id i85so5265688pfa.0
 for <linux-mtd@lists.infradead.org>; Sat, 08 Oct 2016 22:34:09 -0700 (PDT)
Date: Sat, 8 Oct 2016 22:34:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Peter Pan <peterpansjtu@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC PATCH 0/7] mtd: nand: Abstract away the NAND interface type
Message-ID: <20161009053406.GE10199@brian-ubuntu>
References: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 22, 2016 at 12:12:53PM +0200, Boris Brezillon wrote:
> Hi,
> 
> This series is aiming at providing a generic NAND layer to share code
> between different NAND based devices.
> 
> We currently have 3 different interfaces to interact with NANDs:
> - Raw NANDs
> - OneNANDs
> - SPI NANDs
> 
> Apart from the way these NAND devices are accessed they have a lot
> in common, like the way the memory is organized, or their constraints.
> This is usually a good sign that some work should be done to factorize
> the code.
> 
> This work has been started by Peter who wanted to re-use the BBT
> code for its SPI-NAND driver. But I think we can push it further
> other stuff (the software ECC implementation, or the way offsets are
> converted to block/page number).
> 
> Before I continue in this direction, I'd like to get some feedback
> from Peter and those who reviewed his initial submission (Brian,
> Ezequiel) [1], or anyone who is interested in this topic.

My eyes are bleeding for two reasons:

(1) You haven't used any of git's nice rename detection for your patches
(2) The 'rawnand' naming seems a bit much for me. If we really need to
    reorganize everything, keeping the name shorter, like just 'raw'
    might be fine -- at least wherever we're already namespaces as
    "nand". e.g., 'drivers/mtd/nand/raw/' and 'mtd: nand: raw:
    commit subject', but you might still keep 'rawnand.h' (unless you
    want to move things into an include/linux/mtd/nand/ subdirectory).

You'll also need to update MAINTAINERS for the header pattern.

Haven't looked too closely at the code yet.

Brian
