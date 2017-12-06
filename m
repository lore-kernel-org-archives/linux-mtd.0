Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMX8R-0007sj-JX
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 10:41:05 +0000
From: Richard Weinberger <richard@nod.at>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-mtd@lists.infradead.org, manfred@colorfullife.com,
 boris.brezillon@free-electrons.com, david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 0/5] Add flight recorder to MTDRAM
Date: Wed, 06 Dec 2017 11:41:10 +0100
Message-ID: <252100234.Y1JYG21Gen@blindfold>
In-Reply-To: <20171206085039.27164-1-dirk.behme@de.bosch.com>
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
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

Dirk, Manfred,

Am Mittwoch, 6. Dezember 2017, 09:50:34 CET schrieb Dirk Behme:
> From: Manfred Spraul <manfred@colorfullife.com>
> 
> Hi,
> 
> The series adds a flight recorder to MTDRAM.

Thanks a lot for sharing your tool, this is highly appreciated.

> This allows very efficient power fail testing:
> From the flight recorder output, it is possible to recreate every image
> that might have existed between the start of the recording and the end.
> 
> Obviously, a user space tool is required, it is attached as the last
> mail in the series.

So, to understand this approach better I need to recap.
The "flight recorder" logs every single MTD operation (READ, ERASE, PROGRAM) 
to a file while the MTD is under load, right?

Then you take the log, replay it to a _file_ but instead of replaying
all N MTD operations only N - X operations are replayed?
The output file is later written back to MTDRAM to check how much UBIFS likes 
it?

While having such a tool would be awesome, we have to be very sure that it 
behaves correctly.
Yesterday I spent almost the whole night with staring at some of Manfred's 
images and I'm not sure whether what I see makes sense or can actually happen
on a real NAND or NOR flash. But I'm still investigating.

> Patches:
> 
> 0001-mtdram-expose-write-size-and-writebuf-size-as-module:
> 	An initial cleanup: write_size and writebuf_size are
> 	hardcoded in the source code.
> 	Convert that to module parameters.

MTDRAM is a special purpose MTD simulator, I'm not so sure whether it is a 
good idea to turn it into a NAND-alike zombie.

I said this already some time before, Boris and I are in general unhappy with 
the current MTD simulator zoo in MTD.
But fixing this is not your job, we have to. :-)

Thanks,
//richard
