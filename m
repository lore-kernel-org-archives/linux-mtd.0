Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hnbi8-0005nd-6Y
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 10:39:41 -0400
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: dedekind@infradead.org
In-Reply-To: <1179138892.3642.5.camel@sauron>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 14 May 2007 16:37:25 +0200
Message-Id: <1179153445.21753.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-05-14 at 13:34 +0300, Artem Bityutskiy wrote:
> On Mon, 2007-05-14 at 11:05 +0200, Hans-Christian Egtvedt wrote:
> > Hello,
> > 
> > I am trying to mount an JFFS2 image made with mkfs.jffs2 on my x86
> > laptop. The image is made with --big-endian set.
> 
> I think you cannot do this without re-compiling JFFS2. I am not sure,
> just glance to the code (to je32_to_cpu and the like macros).

Oki, then I at least know where to look. It would have been a nice
feature to add support for choosing endianess when loading the module.

I would not recommend customers or less experienced Linux people to
recompile one of their kernel modules to support big endian JFFS2
images.

<cut jffs2 image mounting>

> > mount -t jffs2 /dev/mtdblock0 /some/mount/point
> 
> FYI, mtdblock is not needed and is ancient and confusing way to mount
> jffs2. 
> 
> http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

Oh, thanks, and as Håvard stated it is also supported in the latest
busybox.

-- 
Mvh
Hans-Christian Egtvedt
