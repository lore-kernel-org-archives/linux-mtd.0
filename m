Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Sj0K-0001tI-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 19:49:28 +0100
Message-ID: <3D2DD329.25008AC@analog.com>
Date: Thu, 11 Jul 2002 11:49:13 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: Daniel Belz <danielb@cyclades.com.br>
CC: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Mounting JFFS2, Bootloader
References: <3D2D79FE.5C54CC78@cyclades.com.br> <3D2DBB83.ED181F2C@analog.com> <3D2DC391.6C13A750@cyclades.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Daniel Belz wrote:
> 
> > JFFS2 has a really easy to work with on-device layout, so it shouldn't
> > take much effort to locate the files you're interested in.
> >
> > The files you'll need to work with are in fs/jffs2 and include/linux.
> >
> > Figure out exactly what capabilities you want first though. That'll
> > make it much easier to plan out. And remember, if it's being done in
> > the bootloader, you're not in the kernel, so you may have to
> > reimplement some things.
> 
> Ok, but which is the "entry point" of the JFFS, that is, i need to
> call the functions to mount, or i can treat like a mounted file
> system, and just read the needed files? And, I can read from a
> CompactFlash card, if i'm using (after boot) the MTD emulation? The
> CF is mapped as a hd device.
> 

The "entry point" of the JFFS is defined by the map you create for the
flash device. Take a look at drivers/mtd/maps to get an idea of what's
going on. Basically you'll lay out the flash, telling the kernel what
parts it can and can't touch. You'll assign one or more parts of that
map to be JFFS2 partitions, one of which is the root partition. Then,
in your bootstrap, you'll walk through flash, starting at the base of
that root paritition until you've found and loaded all the data for
the kernel. I do that stage in a few passes, but it's not hard to do. 

I can't help you on the compact flash side though. I'm not familiar
with that technology. If the bootloader has to do any modification of
the CF card/interface, then it should reset it to the base state the
kernel is expecting, before booting the kernel. 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
