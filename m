Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewXDR-0002si-Al
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 18:03:04 +0000
Date: Thu, 15 Mar 2018 19:02:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
Message-ID: <20180315190232.6b8b8d77@bbrezillon>
In-Reply-To: <1521136555.4790.159.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <1520784361.4790.86.camel@infinera.com>
 <20180315165454.5bf24ec0@bbrezillon>
 <1521136555.4790.159.camel@infinera.com>
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

On Thu, 15 Mar 2018 17:55:57 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> On Thu, 2018-03-15 at 16:54 +0100, Boris Brezillon wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > On Sun, 11 Mar 2018 16:06:03 +0000
> > Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:
> >   
> > > On Thu, 2018-03-01 at 14:39 +0100, Joakim Tjernlund wrote:  
> > > > This fixes a bug which allows read/write to a erase block currently
> > > > erasing.
> > > > Also works around a chip bug in Micron 28F00AP30 chips.
> > > > 
> > > > Joakim Tjernlund (3):
> > > >   cfi_cmdset_0001: Do not allow read/write to suspend erase block.
> > > >   cfi_cmdset_0001: Workaround Micron Erase suspend bug.
> > > >   cfi_cmdset_0002: Do not allow read/write to suspend erase block.
> > > > 
> > > >  drivers/mtd/chips/cfi_cmdset_0001.c | 33 ++++++++++++++++++++++++++++-----
> > > >  drivers/mtd/chips/cfi_cmdset_0002.c |  9 ++++++---
> > > >  include/linux/mtd/flashchip.h       |  1 +
> > > >  3 files changed, 35 insertions(+), 8 deletions(-)
> > > >   
> > > 
> > > Ping?  
> > 
> > You didn't Cc the MTD maintainers, so that's not surprising you don't
> > get a reply from us :P.  
> 
> I find it more surprising that the MTD maintainers doesn't read the MTD list ?

I do read the ML occasionally, though I tend to rely on what's in my
inbox, so there might be a bigger latency if you don't Cc me. I guess
the process differ for each maintainer, but it's a good practice to Cc
maintainers when you send a patch.

> I figured this was a requirement.
> 
> >   
> > > This is a fairly serious bug as it confuses the flash state machine,
> > > making further flash access fail.  
> > 
> > I'll try to have a look.  
> 
> Thanks


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
