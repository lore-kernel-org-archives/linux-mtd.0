Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDnPU-0004wT-FJ
 for linux-mtd@lists.infradead.org; Fri, 17 Jun 2016 06:37:44 +0000
Message-ID: <1466145440.15435.2.camel@gmail.com>
Subject: Re: UBI: recover_peb and power cut safety
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard.weinberger@gmail.com>,
 =?ISO-8859-1?Q?J=F6rg_Pf=E4hler?= <pfaehler@isse.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 17 Jun 2016 09:37:20 +0300
In-Reply-To: <CAFLxGvwydtMa3wizdfC1K1Ti2pn=OuJ9UF2wTMFqt-kw2xFO3g@mail.gmail.com>
References: <1811946.TqycnYvpkR@pfaehler-pc>
 <CAFLxGvzxEkRfGzxsxS3_xYupPvAXNO6X9AMi=6SQzXYqBLqiqQ@mail.gmail.com>
 <CAFLxGvwydtMa3wizdfC1K1Ti2pn=OuJ9UF2wTMFqt-kw2xFO3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-06-16 at 12:03 +0200, Richard Weinberger wrote:
> Forgot to CC Artem.
> 
> On Thu, Jun 16, 2016 at 11:46 AM, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> > 
> > Jörg,
> > 
> > On Thu, Jun 16, 2016 at 10:37 AM, Jörg Pfähler <pfaehler@isse.de>
> > wrote:
> > > 
> > > Hi,
> > > 
> > > I would greatly appreciate some clarification with respect to
> > > power cut safety
> > > during writing of an erase block in UBI, specifically power cut
> > > safety of
> > > recover_peb.
> > > 
> > > During a normal write operation (ubi_eba_write_leb in
> > > mtd/ubi/eba.c) UBI tries
> > > to move the contents of the block (and the new contents) to a new
> > > location via
> > > recover_peb, if the write fails. However, recover_peb does not
> > > seem to use the
> > > capability to exchange the (logical) block atomically (as
> > > ubi_eba_atomic_leb_change in mtd/ubi/eba.c does). Specifically,
> > > it does not
> > > seem to write the amount of data and its checksum to the VID
> > > header. Thus, if
> > > the system crashes in the middle of recover_peb before the
> > > old/broken block
> > > could be erased, we are left with a newer version of the block
> > > (the sequence
> > > number in the header is increased by recover_peb), but without
> > > having moved
> > > all the contents of the old block. This would obviously lead to
> > > data loss.
> > > Thus, It seems to me that recover_peb (and therefore
> > > ubi_eba_write_leb) is not
> > > power cut safe or is there some other mechanism distinct from the
> > > one used by
> > > ubi_eba_atomic_leb_change to achieve this? If not I would suggest
> > > using
> > > ubi_eba_atomic_leb_change in ubi_eba_write_leb instead of
> > > recover_peb.
> > Hmm, you are right, if ubi_eba_write() is facing -EIO from the MTD
> > driver we can
> > lose the whole erase block upon power cut.
> > So you found a bug. :-)
> > 
> > Artem, can you tell more on this?
> > I'd guess that recover_peb() is older than
> > ubi_eba_atomic_leb_change() and
> > therefore it was not used.
> > And nobody noticed so far since the condition is hard to hit.
> > 
> > That said, switching to ubi_eba_atomic_leb_change() seems like a
> > good
> > plan to me.
> > Jörg, please send a patch and explain how you tested it.

Yes indeed, very bad bug, good catch.
