Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179hzA-0004F2-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 08:53:40 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Newby question --> source tree management
Date: Mon, 20 May 2002 19:48:04 +1200
Cc: linux-mtd@lists.infradead.org
References: <20020519233143.3205B4B93A@dragon.actrix.co.nz> <3048.1021800872@redhat.com> <5253.1021877367@redhat.com>
In-Reply-To: <5253.1021877367@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020520075322.201314088@tiger.actrix.co.nz>
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

On Mon, 20 May 2002 18:49, David Woodhouse wrote:
> manningc2@actrix.gen.nz said:
> > OK, I've pulled the latest mtd stuff from CVS and have it in a
> > direcory  called ~/mtd.
> >
> > Now I want to apply these files to my kernel directory (ie so that the
> > files  end up where they should be in the kernel tree).
> >
> > I figure there's some flavour of cp or something that I should be
> > using.
>
> You should be able to build modules just by typing 'make', and it'll find
> the build tree for your kernel in /lib/modules/`uname -r`/build. You can
> override that with LINUXDIR= and also ARCH= and CROSS_COMPILE= as normal
> with a kernel build.
>
> If you want to build stuff into your kernel, copy or symlink the contents
> of the drivers/mtd and include/linux/mtd directories into your kernel tree.
>
> I usually just use symlinks into the checked out MTD tree,
> so I can continue to cvs update it easily, etc.
>
> There's a 'patchin.sh' script which does some of this, I think. I've never
> paid much attention to it.

Thanx David

The symlinks sound like the best option once you get a bit more integrated 
than building seperate modules. 

Manual copying sucketh hugely and sounds rather error prone.

Can you give a few more details on how you structure this? I thought maybe of 
making an equivalence between LINUXDIR and the cvs root  mtd (which to me 
would seem the nicest) , but this would seem to cause pulling CVS to go stomp 
some key files at that level Makefile, COPYING...

Thanx

-- Charles
