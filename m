Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewVDx-0004r7-Uh
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 15:55:27 +0000
Date: Thu, 15 Mar 2018 16:54:54 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
Message-ID: <20180315165454.5bf24ec0@bbrezillon>
In-Reply-To: <1520784361.4790.86.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <1520784361.4790.86.camel@infinera.com>
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

On Sun, 11 Mar 2018 16:06:03 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> On Thu, 2018-03-01 at 14:39 +0100, Joakim Tjernlund wrote:
> > This fixes a bug which allows read/write to a erase block currently
> > erasing.
> > Also works around a chip bug in Micron 28F00AP30 chips.
> > 
> > Joakim Tjernlund (3):
> >   cfi_cmdset_0001: Do not allow read/write to suspend erase block.
> >   cfi_cmdset_0001: Workaround Micron Erase suspend bug.
> >   cfi_cmdset_0002: Do not allow read/write to suspend erase block.
> > 
> >  drivers/mtd/chips/cfi_cmdset_0001.c | 33 ++++++++++++++++++++++++++++-----
> >  drivers/mtd/chips/cfi_cmdset_0002.c |  9 ++++++---
> >  include/linux/mtd/flashchip.h       |  1 +
> >  3 files changed, 35 insertions(+), 8 deletions(-)
> >   
> 
> Ping?

You didn't Cc the MTD maintainers, so that's not surprising you don't
get a reply from us :P.

> This is a fairly serious bug as it confuses the flash state machine,
> making further flash access fail.

I'll try to have a look.

> 
>  Jocke
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
