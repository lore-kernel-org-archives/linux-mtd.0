Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179gzA-00049v-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 07:49:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020519233143.3205B4B93A@dragon.actrix.co.nz> 
References: <20020519233143.3205B4B93A@dragon.actrix.co.nz>  <20020518182026.49817.qmail@web21505.mail.yahoo.com> <3048.1021800872@redhat.com> 
To: manningc2@actrix.gen.nz
Cc: linux-mtd@lists.infradead.org
Subject: Re: Newby question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 20 May 2002 07:49:27 +0100
Message-ID: <5253.1021877367@redhat.com>
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

manningc2@actrix.gen.nz said:
> OK, I've pulled the latest mtd stuff from CVS and have it in a
> direcory  called ~/mtd.

> Now I want to apply these files to my kernel directory (ie so that the
> files  end up where they should be in the kernel tree).

> I figure there's some flavour of cp or something that I should be
> using. 

You should be able to build modules just by typing 'make', and it'll find 
the build tree for your kernel in /lib/modules/`uname -r`/build. You can 
override that with LINUXDIR= and also ARCH= and CROSS_COMPILE= as normal 
with a kernel build.

If you want to build stuff into your kernel, copy or symlink the contents 
of the drivers/mtd and include/linux/mtd directories into your kernel tree.

I usually just use symlinks into the checked out MTD tree, 
so I can continue to cvs update it easily, etc.

There's a 'patchin.sh' script which does some of this, I think. I've never 
paid much attention to it.

--
dwmw2
