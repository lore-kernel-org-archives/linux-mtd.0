Received: from mikonos.cyclades.com.br
	([200.230.227.67] helo=firewall.cyclades.com.br ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Shpg-0001kn-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 18:34:25 +0100
Message-ID: <3D2DC391.6C13A750@cyclades.com.br>
Date: Thu, 11 Jul 2002 14:42:41 -0300
From: Daniel Belz <danielb@cyclades.com.br>
MIME-Version: 1.0
To: justin.wojdacki@analog.com
CC: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Mounting JFFS2, Bootloader
References: <3D2D79FE.5C54CC78@cyclades.com.br> <3D2DBB83.ED181F2C@analog.com>
Content-Type: text/plain; charset=us-ascii
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

Hi,

Justin Wojdacki wrote:
> 
> Having recently done the same kind of thing (on a different board), I
> think I can help.
...
> If you want more flexibility than that, you may instead need to look for
> a configuration file and then process the configuration file.
>

Yes, i need something like this, as an application to be loaded instead
of the
kernel. Simple, to allow load for more than one option from flash or
from network
(simple tftp). I don't need write on the flash (CF) at this time. 
 
> JFFS2 has a really easy to work with on-device layout, so it shouldn't
> take much effort to locate the files you're interested in.
> 
> The files you'll need to work with are in fs/jffs2 and include/linux.
> 
> Figure out exactly what capabilities you want first though. That'll
> make it much easier to plan out. And remember, if it's being done in
> the bootloader, you're not in the kernel, so you may have to
> reimplement some things.

Ok, but which is the "entry point" of the JFFS, that is, i need to call
the
functions to mount, or i can treat like a mounted file system, and just
read
the needed files? 
And, I can read from a CompactFlash card, if i'm using (after boot) the
MTD 
emulation? The CF is mapped as a hd device.

> 
> --
> -------------------------------------------------
> Justin Wojdacki
> justin.wojdacki@analog.com         (408) 350-5032
> Communications Processors Group -- Analog Devices

-- 
------------------------------------------------- 
 Daniel Belz           danielb@cyclades.com.br
 Cyclades Brasil       R&D 
 Sao Paulo - Brazil    +55 (11) 5033-3393
-------------------------------------------------
