Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbxB2-00088u-Sd
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 18:41:05 +0000
Date: Thu, 31 Oct 2013 15:40:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Subject: Re: Flashing UBIFS image to gluebi mtd
Message-ID: <20131031184045.GA2498@localhost>
References: <72811383227314@web24j.yandex.ru> <20131031150844.GA1092@localhost>
 <16161383242430@web27h.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16161383242430@web27h.yandex.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 10:00:30PM +0400, Konstantin Tokarev wrote:
> 
> 
> 31.10.2013, 19:08, "Ezequiel Garcia" <ezequiel.garcia@free-electrons.com>:
> > Hi Konstantin,
> >
> > On Thu, Oct 31, 2013 at 05:48:34PM +0400, Konstantin Tokarev wrote:
> >
> >>  I'm migrating rootfs of device from SquashFS on top of gluebi to UBIFS.
> >
> > Sounds like you could use ubiblock for that setup, which is suitable
> > for squashfs, and completely independent of ubifs (thus less cpu and
> > memory hungry and easier to setup).
> 
> Could you elaborate this a bit more? Do you mean that block device emultaion
> layer on top of UBI + FS on top of that can work faster than UBIFS on top of
> UBI?
> 

Given you provided no details, I'm not sure why you're migrating from squashfs
(which is a read-only, block oriented fs) to ubifs (which supports r/w on MTD).
But anyway, let me do this homework for you :-)

So, you had squashfs on top of gluebi, right? I guess you had this:

  mtd (plus your NAND driver) -> ubi -> gluebi/mtd -> mtdblock -> squashfs

On the other side, using ubiblock to emulate the block device you'd
end up with this:

  mtd (plus your NAND driver) -> ubi -> ubiblock -> squashfs

Which is less memory (cpu?) hungry than the first alternative.
The latest git branch also contained a non-cached option which
has shown some good behavior, given squashfs does its own caching.

But of course, this is _NOT_ a replacement for UBIFS, and using ubiblock
for R/W is strictly discouraged.

And here's the (already ancient) discussion:

http://lists.infradead.org/pipermail/linux-mtd/2012-November/045011.html

And the v2:
http://lists.infradead.org/pipermail/linux-mtd/2012-December/045274.html

I'll post the latest work as soon as I find some time, but you're free
to pursue your own research.

Hope it helps and best of lucks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
