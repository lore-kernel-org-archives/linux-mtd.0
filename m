Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYrp8-0006Ym-1I
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 09:03:05 +0000
Date: Thu, 25 Feb 2016 10:02:30 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>
CC: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Filesystems over UBI can't handle badblocks
In-Reply-To: <CAFLxGvxbAoA_EJFe2rm8aSoyJowC02R1_8qV9g7thSpnH4LadA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1602250952180.21201@lnxricardw1.se.axis.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
 <CAFLxGvxbAoA_EJFe2rm8aSoyJowC02R1_8qV9g7thSpnH4LadA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 24 Feb 2016, Richard Weinberger wrote:

> On Wed, Feb 24, 2016 at 9:08 PM, Guilherme de Oliveira Costa
> <guilherme.oliveira@autotrac.com.br> wrote:
> > As you can see, UBI starts just fine, and I'm able to initialize ubiblk and at least mount the filesystem. I thought UBI was supposed to make any badblocks transparent to the upper layers... Is there a problem with that tought, or did my manual tampering (with nand markbad) got in the way of UBI's bad block management capabilities?
> 
> So, you marked a block as bad, _after_ setting up UBI and your rootfs?
> Well, this cannot work as from UBI's point of view the block is now
> gone --> the rootfs is missing something.

Exactly.

ubiblk will handle existing bad blocks in the system, but can not handle 
new ones. While this might sound like a serious limitation, remember that 
blocks don't just 'go bad' randomly, what happens is that with repeated 
erase and write cycles the blocks will eventually wear out. Thus in a 
read-only file system such as cramfs [over ubiblk] which is never 
rewritten, a block that is good will never 'go bad'.

You could run into an issue when upgrading the filesystem however, if it 
has been done sufficiently often to actually wear out the flash. It is 
highly unlikely that that would be an issue in a traditional rootfs on an 
SLC (the flash is specified to handle a minimum of 100 000 erase/write 
cycles per block; that would correspond to rewriting the file system 27 
times a day over a 10 year period), and at any rate, it would be detected 
by UBI during the rewrite process, so such blocks would never be reused 
for writing, but could eventually lead to running out of available space.

With UBI this could happen in the natural course of things, if a block 
starts to exhibit excessive read errors, UBI will 'scrub' the block and 
copy it (transparently) to another physical location in the flash. Given 
enough time, this could theoretically wear out all the blocks in the 
flash, although in practice, the data retention of SLC flashes means that 
it would not occur for much longer than a reasonable product life cycle 
(meaning that the number of times a block would need to be scrubbed due to 
excessive read errors is much less than the specified number of 
erase/write cycles for the flash chip over a reasonable life span).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
