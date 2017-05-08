Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d7hGZ-0006X8-Au
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 11:55:54 +0000
Date: Mon, 8 May 2017 13:55:29 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, David Woodhouse <dwmw2@infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Henrique de Moraes Holschuh
 <hmh@hmh.eng.br>, Tejun Heo <tj@kernel.org>
Subject: Re: Race to power off harming SATA SSDs
Message-ID: <20170508135529.172b7009@bbrezillon>
In-Reply-To: <20170508134807.498b3ee7@bbrezillon>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <20170508092846.GA11029@amd>
 <1494236048.6528.32.camel@infradead.org>
 <20170508104953.GA17773@amd>
 <CAFLxGvzAmURHU_6K3gmBfOqHKgvQOkkO_+qgMKsmzhWZwwGnqw@mail.gmail.com>
 <20170508134807.498b3ee7@bbrezillon>
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

On Mon, 8 May 2017 13:48:07 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Mon, 8 May 2017 13:06:17 +0200
> Richard Weinberger <richard.weinberger@gmail.com> wrote:
> 
> > On Mon, May 8, 2017 at 12:49 PM, Pavel Machek <pavel@ucw.cz> wrote:  
> > > Aha, nice, so it looks like ubifs is a step back here.
> > >
> > > 'clean marker' is a good idea... empty pages have plenty of space.    
> > 
> > If UBI (not UBIFS) faces an empty block, it also re-erases it.  
> 
> Unfortunately, that's not the case, though UBI can easily be patched
> to do that (see below).

Sorry for the noise, I was wrong, UBI already re-erases empty blocks
[1].

[1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/ubi/attach.c#L983
