Received: from rose.man.poznan.pl ([150.254.173.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NsZo-0003YZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 10:34:20 +0000
Date: Mon, 16 Dec 2002 12:04:50 +0100 (CET)
From: Michal Schulz <mschulz@rose.man.poznan.pl>
To: Wolfgang Denk <wd@denx.de>
cc: David Woodhouse <dwmw2@infradead.org>, Paul Nash <paulnash@wildseed.com>,
   "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
In-Reply-To: <20021216092801.80539C6139@atlas.denx.de>
Message-ID: <Pine.GSO.4.44.0212161155540.15280-100000@rose.man.poznan.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 16 Dec 2002, Wolfgang Denk wrote:

> > With the chips available today and in the near future, XIP, at least for a
> > writable flash chip, makes virtually zero sense on Linux. Anyone who tries
> > to tell you otherwise is either on crack, trying to sell you something, or
> > both.
>
> Also you might find problems running recent (and future)  kernels  in
> XIP  mode  -  the kernel text segment is often not exactly read-only.
> Especially when you use one f the existing real-time extensions  (but
> not only then). It seems the amount of tweaking that is necessary for
> XIP  is  growing  with  each new kernel release - to a level where it
> becomes impractical.

With the XIP in kernel it is relatively simple with 2.2.x serie of
kernels. I have managed to put most of 2.2.18 kernel onto flash, where it
was executing from. The most problems are with .rodata section, which is
not read-only for kernel. It is so because some structures (one passed to
procfs for example) are created dynamically during function call, so they
can be later found in .rodata section.

After some play with arch/i386/vmlinux.lds.S it is possible to divide the
kernel into two parts. One is really read-only one and may reside anywhere
in memory (so for example in rom or in Flash) and the other one must be
copied from rom/flash into ram.

with XIP and runable applications, it makes sence when one operates with
2.5MB of real RAM or less. but it doesn't save too much because tons of
data are in writable sections. It is possible to fix romfs driver and
implement XIP there.

Please also note, that many flash memories are unreadable during write
cycles, so it makes no sence to execute linux kernel from them and using
some parts as a writable fs, because it causes immediate lock.

-- 
Michal Schulz
