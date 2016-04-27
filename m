Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avRuo-0000gY-IW
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 16:02:15 +0000
Received: by mail-pa0-x229.google.com with SMTP id zm5so23186140pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 09:01:54 -0700 (PDT)
Date: Wed, 27 Apr 2016 10:01:44 -0600
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] flash_eraseall: Remove warning
Message-ID: <20160427160144.GF25981@localhost>
References: <1461701022-21023-1-git-send-email-richard@nod.at>
 <20160427102101.13c6d017@bbrezillon> <572077F5.9080004@nod.at>
 <20160427102947.634d5ece@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160427102947.634d5ece@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Apr 27, 2016 at 10:29:47AM +0200, Boris Brezillon wrote:
> On Wed, 27 Apr 2016 10:27:33 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
> > Am 27.04.2016 um 10:21 schrieb Boris Brezillon:
> > >> Well, flash_erase <mtddev> 0 0 is the same as flash_eraseall <mtddev>.
> > >> But flash_eraseall is still more handy to use.

^ Acked.

> > >> Let's keep flash_eraseall as short cut and don't force users to
> > >> use a less handy user interface.  
> > > 
> > > Hm, I'm not convinced by this change. Aren't we trying to make people
> > > switch to flash_erase instead of using flash_eraseall.
> > > If you want to make flash_erase more easy to use, you can always erase
> > > the whole partition if only <mtddev> is passed in arguments, which IMO
> > > would be clearer than having to pass 0 0.  
> > 
> > So, you suggest fixing flash_erase such that a "flash_erase /dev/mtd0"
> > works and acts like "flash_erase /dev/mtd0 0 0"?
> 
> Yep.

Agreed, good idea. (FWIW, flash_lock and flash_unlock do similarly.)

Brian
