Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8LyY-0007OY-Fe
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 09:02:33 +0000
From: Richard Weinberger <richard@nod.at>
To: Romain Izard <romain.izard.pro@gmail.com>, derosier@gmail.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Nandsim, UBIFS and memory concerns
Date: Fri, 05 Oct 2018 11:00:30 +0200
Message-ID: <2590130.nCcsbWpItk@blindfold>
In-Reply-To: <CAGkQfmMr-NTEyv7f-Bb9AmwBh3iJR_ekbkKGv4BtZmvfbLHB1A@mail.gmail.com>
References: <CAGkQfmN6PguBRdL68ZRuOEgC2GWEW4-XxeE3=7epLGODTqHqeQ@mail.gmail.com>
 <CAFLxGvy1704O8bEdLS_t2A3vKDdvsB71n8R-OrQHrsgATxjdsg@mail.gmail.com>
 <CAGkQfmMr-NTEyv7f-Bb9AmwBh3iJR_ekbkKGv4BtZmvfbLHB1A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 5. Oktober 2018, 10:55:51 CEST schrieb Romain Izard:
> Yes, this looks like a good explanation. Thanks for taking some time
> to look at my
> issue.

So the solution for your problem should be "make sure that userspace is sane and does
fsync/fdatasync/sync/umount.." :-)

Thanks,
//richard
