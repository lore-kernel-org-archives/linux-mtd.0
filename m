Received: from mail-qe0-x232.google.com ([2607:f8b0:400d:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlVTu-0007fn-JX
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 03:08:03 +0000
Received: by mail-qe0-f50.google.com with SMTP id 1so4693565qec.37
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 19:07:41 -0800 (PST)
Date: Tue, 26 Nov 2013 19:07:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 0/2] Regarding NAND core and drivers maintenance
Message-ID: <20131127030736.GW9468@ld-irv-0074.broadcom.com>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA4DCBC@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA4DCBC@DBDE04.ent.ti.com>
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 22, 2013 at 07:07:09AM +0000, Pekon Gupta wrote:
> > My proposal (copy-pasted from the media subsystem) is to define
> > sub-maintainers, one for each NAND driver, in addition to the top-level
> > NAND subsystem maintainer.
> > 
> > When a patch comes for a given driver, the _ideal_ situation would be
> > for the sub-maintainer to Ack-it first.
> > 
> Specifically, we need someone to keep a watch on m25p80 (apart from
> David and Brian). This is because I see lot of patches coming in but not
> on generic framework approach. Serial Flash driver might be next big
> component of MTD sub-system in coming times.

Hmm, I don't know if we really need a separate SPI NOR maintainer, and I
don't know if we have anyone with enough experience with SPI NOR to
qualify anyway. I know Marek Vasut has been a good reviewer, but I'd be
surprised if he really wanted to take official responsibility. And
anyway, implementors and reviewers don't have to be official
maintainers, so this shouldn't stop any pending work on the subject.

Also, I have some HW that can do quad-SPI, but only in limited
circumstances. Right now, my driver is just faking being a generic SPI
driver when it really scrapes the commands and performs accelerated
transactions on ones it recognizes... so it shares some similarities
with what Huang is trying to do. I hope to contribute more to the
generic framework of SPI NOR in the future (as time allows, of course).

So while I might be officially responsible for driver/mtd/nand/, I will
be involved in the rest of MTD and will likely continue to queue up
patches anyway.

Brian
