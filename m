Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUuMC-00034a-NJ
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 08:47:45 +0000
Received: by mail-pa0-f52.google.com with SMTP id rd3so9518089pab.39
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 01:47:22 -0700 (PDT)
Date: Tue, 1 Apr 2014 01:47:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Message-ID: <20140401084718.GH6400@brian-ubuntu>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
 <CALnQHM0PkQUQk0uYGBL3TwgWaComHfZNBxu1e45_FJK2i+TrbA@mail.gmail.com>
 <20140328125600.GC3998@book.gsilab.sittig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140328125600.GC3998@book.gsilab.sittig.org>
Cc: David Mosberger <davidm@egauge.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 28, 2014 at 01:56:00PM +0100, Gerhard Sittig wrote:
> There must have been a reason for the
> introduction of the "oob_required" condition -- I just understood
> it was other MLC chips, not the on-die-ECC that we are talking
> about here.

'oob_required' is really only there for hardware which optimizes the
no-OOB case for program and read (I have an out-of-tree driver for
hardware whose DMA engine accelerates data-only read/program; ECC is
done on-the-fly in hardware).

Brian
