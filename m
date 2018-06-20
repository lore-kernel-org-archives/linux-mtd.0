Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVbhi-0002JP-A5
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 11:55:15 +0000
Date: Wed, 20 Jun 2018 13:54:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 3/4] mtd: cfi_cmdset_0002: Avoid point less
 unlocking/locking
Message-ID: <20180620135449.14f9919c@bbrezillon>
In-Reply-To: <d8e1537549e42dfc873c1fac876e2a898f11efd0.camel@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
 <20180606101330.11071-3-joakim.tjernlund@infinera.com>
 <20180620111430.0dd2ecde@bbrezillon>
 <d8e1537549e42dfc873c1fac876e2a898f11efd0.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Jun 2018 11:10:23 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> On Wed, 2018-06-20 at 11:14 +0200, Boris Brezillon wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > On Wed,  6 Jun 2018 12:13:29 +0200
> > Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:
> >   
> > > cfi_ppb_unlock() walks all flash chips when unlocking sectors.
> > > testing lock status on each chip which causes relocking of already
> > > locked sectors. Test against offset to aviod this aliasing.  
> > 
> >                                          ^ avoid
> > 
> > As I said before, I think the current code is doing worse than just
> > relocking already locked sectors. As soon as you cross a chip boundary,
> > addr is set back to 0, and the (addr < offs || adr >= (ofs + len)) might
> > be true while it shouldn't be (absolute offset still in the unlock
> > range), which means you'll lock sectors that the caller expect to be
> > unlocked.  
> 
> I don't see how, the code asks for its current lock status and will reapply
> those that are locked again.

After reading the commit message a second time I think I
misunderstood it. I thought you were implying that the re-locking
operation was harmless and the only reason for fixing the test was to
avoid useless lock operations, but that's not what you wrote.

Sorry for the noise.
