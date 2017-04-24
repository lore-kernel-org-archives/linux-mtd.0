Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2dVB-0003kG-U1
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 12:54:04 +0000
Subject: Re: UBIFS support of NFS
To: Leon Pollak <leon.pollak@gmail.com>
References: <CAM===sQfUTUSBbby2goJDNj7MJShbtoFain-U0+AeKiH330BwQ@mail.gmail.com>
 <CAFLxGvwCU6eMv6ajkFM4ok1vMdc9p0c4gnR1cDio5tkmRe2JjA@mail.gmail.com>
 <CAM===sQWNRLsQGNLoGywbrNyH9R8x5HW18uDqEwmX4K9iRW+rA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <c68ae857-6b8c-eae7-7c3f-8672e2dfef04@nod.at>
Date: Mon, 24 Apr 2017 14:53:39 +0200
MIME-Version: 1.0
In-Reply-To: <CAM===sQWNRLsQGNLoGywbrNyH9R8x5HW18uDqEwmX4K9iRW+rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Leon,

Am 24.04.2017 um 10:50 schrieb Leon Pollak:
> Thanks, Richard.
> 
> The questions are:
> 1. I am working with 2.6.37 kernel. Will it be possible to move this
> last version of UBIFS to it relatively easy?

Depends on your definition of "relatively". :-)
It is doable for sure.

> 2. Is it in the state of simple usage? I need to share the read-only
> root FS on NAND between several CPUs.

It should work just like every other NFS export.
Maybe you have to set a filesystem id in your exports file too.

> 3. Is it a useful testing for you?

Yes.
Since Linus did a -rc8 we got one more week, maybe we can even get
it in v4.12.

Thanks,
//richard
