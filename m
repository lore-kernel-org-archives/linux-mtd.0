Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs8Cr-0006JF-GF
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 11:50:54 +0000
Received: by wmeg8 with SMTP id g8so9975593wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 04:50:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1446199765.6126.63.camel@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
 <1446035085.12536.71.camel@gmail.com> <20151030091521.439f436b@bbrezillon>
 <1446196090.6126.48.camel@gmail.com> <20151030104537.2196c4a8@bbrezillon>
 <1446199765.6126.63.camel@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 30 Oct 2015 12:49:51 +0100
Message-ID: <CAOMqctRzGcm786jmh_g-jTbqOnnXRZE0=_-qs+Yy0AYSNhDr6A@mail.gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 Richard Weinberger <richard@nod.at>, Andrea Scian <rnd4@dave-tech.it>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 October 2015 at 11:09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2015-10-30 at 10:45 +0100, Boris Brezillon wrote:
>> On Fri, 30 Oct 2015 11:08:10 +0200
>> Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>
>> > On Fri, 2015-10-30 at 09:15 +0100, Boris Brezillon wrote:
>> > > Hi Artem,
>> > >
>> > > Don't take the following answer as a try to teach you how
>> > > UBI/UBIFS
>> > > work
>> > > or should work with MLC NANDs. I still listen to your
>> > > suggestions,
>> > > but
>> > > when I had a look at how this "skip pages on demand" approach
>> > > could
>> > > be implemented I realized it was not so simple.
>> >
>> > Sure.
>> >
>> > Could you verify my understanding please.
>> >
>> > You realized that "skip on demand" is not easy, and you suggest
>> > that we
>> > simply write all the data twice - first time we skip pages, and
>> > then we
>> > garbage collect everything. At the end, roughly speaking, we trade
>> > off
>> > half of the IO speed, power, and NAND lifetime.
>
> So I guess the answer is generally "yes", right? I just want to be
> clear about the trade-off.
>
>> That will be pretty much the same with the "skip on demand" approach,
>> because you'll probably loose a lot of space when syncing the wbuf.
>
> Write buffer is designed to optimized space usage. Instead of wasting
> the rest of the NAND page, we wait for more data to arrive and put it
> to the same NAND page with the previous piece of data.
>
> This suggests that we do not sync it too often, or at least that the
> efforts were taken not to do this.
>
> Off the top of my head, we sync the write-buffer (AKA wbuf) in these
> cases:
> 1. Journal commit, which happens once in a while, depends on journal
> size.
> 2. User-initiated sync, like fsync(), sync(), remount, etc.
> 3. Write-buffer timer, which fires when there were no writes withing
> certain interval, like 5 seconds. The time can be tuned.
> 4. Other situations like the end of GC, etc - these are related to meta
> -data management.
>
> Now, imagine you writing a lot of data, like uncompressing a big
> tarball, or compressing, or just backing up your /home. In this
> situation you have a continuous flow of data from VFS to UBIFS.
>
> UBIFS will keep writing the data to the journal, and there won't be any
> wbuf syncs. The syncs will happen only on journal commit. So you end up
> with LEBs full of data and not requiring any GC.

Actually, since there is no guarantee that the data ever gets written
(or error reported in case it cannot) unless you fsync() every file
before close() any sane uncompressor, backup program, etc. will
fsync() every file written regardless of its size. So if your home has
a lot of configuration files and sources this will not be nice
continuous stream of data in many cases.

IIRC scp(1) does not fsync() potentially resulting in large amounts of
data getting silently lost. For that reason and others it should be
renamed to iscp.

Thanks

Michal
