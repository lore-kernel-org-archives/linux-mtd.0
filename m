Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs6d5-0000ON-6h
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 10:09:51 +0000
Message-ID: <1446199765.6126.63.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>,  Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?=
 "\"\"(beanhuo)\"\"" <beanhuo@micron.com>
Date: Fri, 30 Oct 2015 12:09:25 +0200
In-Reply-To: <20151030104537.2196c4a8@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon> <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-10-30 at 10:45 +0100, Boris Brezillon wrote:
> On Fri, 30 Oct 2015 11:08:10 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Fri, 2015-10-30 at 09:15 +0100, Boris Brezillon wrote:
> > > Hi Artem,
> > > 
> > > Don't take the following answer as a try to teach you how
> > > UBI/UBIFS
> > > work
> > > or should work with MLC NANDs. I still listen to your
> > > suggestions,
> > > but
> > > when I had a look at how this "skip pages on demand" approach
> > > could
> > > be implemented I realized it was not so simple.
> > 
> > Sure.
> > 
> > Could you verify my understanding please.
> > 
> > You realized that "skip on demand" is not easy, and you suggest
> > that we
> > simply write all the data twice - first time we skip pages, and
> > then we
> > garbage collect everything. At the end, roughly speaking, we trade
> > off
> > half of the IO speed, power, and NAND lifetime.

So I guess the answer is generally "yes", right? I just want to be
clear about the trade-off.

> That will be pretty much the same with the "skip on demand" approach,
> because you'll probably loose a lot of space when syncing the wbuf.

Write buffer is designed to optimized space usage. Instead of wasting
the rest of the NAND page, we wait for more data to arrive and put it
to the same NAND page with the previous piece of data.

This suggests that we do not sync it too often, or at least that the
efforts were taken not to do this.

Off the top of my head, we sync the write-buffer (AKA wbuf) in these
cases:
1. Journal commit, which happens once in a while, depends on journal
size.
2. User-initiated sync, like fsync(), sync(), remount, etc.
3. Write-buffer timer, which fires when there were no writes withing
certain interval, like 5 seconds. The time can be tuned.
4. Other situations like the end of GC, etc - these are related to meta
-data management.

Now, imagine you writing a lot of data, like uncompressing a big
tarball, or compressing, or just backing up your /home. In this
situation you have a continuous flow of data from VFS to UBIFS.

UBIFS will keep writing the data to the journal, and there won't be any
wbuf syncs. The syncs will happen only on journal commit. So you end up
with LEBs full of data and not requiring any GC.

But yes, if we are talking about, say, an idle system, which
occasionally writes something, there will be a wbuf sync after every
write.

So in the "I need all your capacity" kind of situations where IO speed
matters, and there are a lot of data written - we'd be optimal, no
double writes.

In the "I am mostly idle" type of situations we'll do double writes.

SIGLUNCH, colleagues waiting, sorry, I guess I wrote enough :-)

> A given LEB can only be in secure or unsecure mode, but a UBI volume
> can expose both unsecure and secure LEBs, and those LEBs have
> different
> sizes.
> The secure/unsecure mode is chosen when mapping the LEB, and the LEB
> stays in this mode until it's unmapped.

This is not going to be a little value add to UBI, this is going to be 
a big change in my opinion. If UBIFS ends up using this - may worth the
effort. Otherwise, I'd argue that this would need an important customer
to be worth the effort.
