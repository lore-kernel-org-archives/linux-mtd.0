Received: from mail.root.at ([212.172.120.146])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zfJr-0007m0-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 14:56:59 +0100
Date: Tue, 15 May 2001 14:00:52 +0000 (/etc/localtime)
From: Karl Pitrich <pit@root.at>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Bao C. Ha" <baoha@sensoria.com>, linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2 
In-Reply-To: <27752.989910645@redhat.com>
Message-ID: <Pine.LNX.4.21.0105151357480.18492-100000@mail.root.at>
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

On Tue, 15 May 2001, David Woodhouse wrote:

> baoha@sensoria.com said:
> > I would like to partition the Flash into two: (1) boot loader and  (2)
> > JFFS2.  Can I put the kernel, zImage, and fs.gz on JFFS2,  and boot
> > the kernel from there? 
> 
> The answer to that question is entirely dependent on the bootloader you 
> use. But at the moment, I think there are no bootloaders which support this.
> 

you could check zboot which is used in the yopy pda.
zboot resides on a separate part in the flash.
it is available at yopydeveloper.org under gpl.
i think the gmate guys are currently mangling their system to
jffs so this could work.

karl.
