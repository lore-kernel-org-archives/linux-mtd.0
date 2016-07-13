Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNSIW-0005Mq-O1
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 22:06:33 +0000
Received: by mail-pa0-x241.google.com with SMTP id ez1so206897pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 15:06:07 -0700 (PDT)
Date: Wed, 13 Jul 2016 15:06:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/8] mtd-utils: Fix return status in mtd_torture test
 function
Message-ID: <20160713220604.GA54628@google.com>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-2-git-send-email-richard@nod.at>
 <20160713173024.GA10487@google.com> <5786B9A4.4090609@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5786B9A4.4090609@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 13, 2016 at 11:59:00PM +0200, Richard Weinberger wrote:
> But I'm still a bit unsure how the mtd-utils release cycle
> works.
> In fact, I fear there is none. ;-)

Yep, that's about correct. We can try to establish one if that'd help.
Previously, I think it was "whenever Artem decided there were enough
new things (fixes or features)".

> David was so kind and went through linux-mtd@ to located old but not merged
> mtd-utils packages.
> I'm currently rebasing them to 1.5.2 and would push them later into a temporary
> branch.

Cool.

Brian
