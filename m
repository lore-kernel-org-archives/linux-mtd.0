Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FhozJ-00029U-LJ
	for linux-mtd@lists.infradead.org; Sun, 21 May 2006 10:33:02 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1060636uge
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 May 2006 07:32:55 -0700 (PDT)
Message-ID: <625fc13d0605210732x189256c6o21f3b49a17e5622e@mail.gmail.com>
Date: Sun, 21 May 2006 09:32:55 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Andrew Morton" <akpm@osdl.org>
In-Reply-To: <20060520141924.2f2e5289.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <E1FhOEg-0003dX-4R@pentafluge.infradead.org>
	<625fc13d0605201411kb7f40e1sd6cfe8ebf50a6e38@mail.gmail.com>
	<20060520141924.2f2e5289.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MTD] Avoid 64-bit division in mtdconcat
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/20/06, Andrew Morton <akpm@osdl.org> wrote:
> "Josh Boyer" <jwboyer@gmail.com> wrote:
> > >     [MTD] Avoid 64-bit division in mtdconcat
> > >
> > >     WARNING: "__moddi3" [drivers/mtd/mtdconcat.ko] undefined!
> > >
> > >     Signed-off-by: Andrew Morton <akpm@osdl.org>
> > >     Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> >
> > NAK.  asm-ppc/div64.h doesn't exist.
>
> It must exist.  Things like mm/vmscan.c include it.

Ugh.  Of course, you're right.  It's obfuscated by having
-Iarch/ppc/include and then having arch/ppc/include/asm a symlink to
include/asm-powerpc.

Sigh.

Sorry for the noise.  At least it motivated me to finally setup a
cross compile environment on my new machine ;)

josh
