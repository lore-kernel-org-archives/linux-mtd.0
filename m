Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhJ5-0007uR-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:04:19 +0100
Date: Tue, 15 May 2001 12:08:10 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Bao C. Ha" <baoha@sensoria.com>, <linux-mtd@lists.infradead.org>
Subject: Re: Booting from JFFS2 
In-Reply-To: <27752.989910645@redhat.com>
Message-ID: <Pine.LNX.4.33.0105151207240.30128-100000@xanadu.home>
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

> The answer to that question is entirely dependent on the bootloader you
> use. But at the moment, I think there are no bootloaders which support this.
>
> There are patches available for Compaq bootldr used on the iPAQ, which make
> it capable of loading a kernel from a JFFSv1 filesystem. But nobody's yet
> done JFFS2, AFAIK.

Yes, JFFS2 is apparently done as well.


Nicolas
