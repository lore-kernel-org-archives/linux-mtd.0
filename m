Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnbwA-0002Yb-2Y
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 15:54:11 +0100
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l4EEs2Ls026750
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2007 10:54:02 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l4EEs2h2254534
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2007 08:54:02 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l4EEs2KL011643
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2007 08:54:02 -0600
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
In-Reply-To: <1179153445.21753.29.camel@localhost.localdomain>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179153445.21753.29.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 14 May 2007 09:53:58 -0500
Message-Id: <1179154438.3420.18.camel@zod.rchland.ibm.com>
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

On Mon, 2007-05-14 at 16:37 +0200, Hans-Christian Egtvedt wrote:
> On Mon, 2007-05-14 at 13:34 +0300, Artem Bityutskiy wrote:
> > On Mon, 2007-05-14 at 11:05 +0200, Hans-Christian Egtvedt wrote:
> > > Hello,
> > > 
> > > I am trying to mount an JFFS2 image made with mkfs.jffs2 on my x86
> > > laptop. The image is made with --big-endian set.
> > 
> > I think you cannot do this without re-compiling JFFS2. I am not sure,
> > just glance to the code (to je32_to_cpu and the like macros).
> 
> Oki, then I at least know where to look. It would have been a nice
> feature to add support for choosing endianess when loading the module.
> 
> I would not recommend customers or less experienced Linux people to
> recompile one of their kernel modules to support big endian JFFS2
> images.

Ideally, we would have the capability for doing a -o loop mount of
jffs2.  Requiring a device to shove the data in sucks.  If this ever
materializes, we should add an endian-ness parameter to it to
automatically do some mapping.

josh
