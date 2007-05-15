Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hnrj4-0006CV-EL
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 03:45:47 -0400
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1179189724.3482.24.camel@shinybook.infradead.org>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179189724.3482.24.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Tue, 15 May 2007 09:45:26 +0200
Message-Id: <1179215126.21753.40.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-15 at 08:42 +0800, David Woodhouse wrote:
> On Mon, 2007-05-14 at 13:34 +0300, Artem Bityutskiy wrote:
> > 
> > > I am trying to mount an JFFS2 image made with mkfs.jffs2 on my x86
> > > laptop. The image is made with --big-endian set.
> > 
> > I think you cannot do this without re-compiling JFFS2. I am not sure,
> > just glance to the code (to je32_to_cpu and the like macros).
> 
> Edit fs/jffs2/nodelist.h and set JFFS2_BIG_ENDIAN instead of
> JFFS2_NATIVE_ENDIAN.

Ah, thanks for this hint.

> The reason it's not a runtime option is because that would be quite
> slow, and it's a very esoteric feature.

For development systems it would be a great feature, hence my original
email. But for an embedded system this should not be present at all.

> I'm sorry. I should have just made it either big- or little-endian right
> from the very beginning and never made the mistake of letting it be
> host-endian.

What I would have liked was a possibility to choose which read/write
operations should be used when using my developing machine, but for the
kernel I boot my embedded target with I would like an optimized jffs2
driver.

Use native endianess by default, but have a possibility to override at
runtime.

</thoughts>

-- 
Best regards
Hans-Christian Egtvedt
