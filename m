Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160UUE-0004xb-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 21:07:23 +0000
Date: Sun, 4 Nov 2001 21:16:35 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Rothwell <rothwell@holly-springs.nc.us>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2, CF, PCMCIA adapter, ATA
In-Reply-To: <1004907553.4240.42.camel@gromit.house>
Message-ID: <Pine.LNX.4.33.0111042108140.28157-100000@imladris.demon.co.uk>
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

On 4 Nov 2001, Michael Rothwell wrote:

> I've been trying to create a jffs2 image on a 16MB compact flash card
> today. I've got a pcmcia-to-cf adapter that works well for treating the
> CF like a small disk.

The CF _is_ a small disk. You may think it has flash inside - we couldn't 
possibly comment. As far as you're concerned, it's just alien technology 
which allows them to stick a real IDE hard drive inside that package and 
stops you from hearing the whirring sounds.

There is a driver which uses a real hard drive as backing store for a 
faked MTD device - see the 'blkmtd' driver. I haven't used it - others can 
perhaps give you more helpful advice.

> How do I create a "loopback" jffs2 filesystem? 

# insmod mtdram total_size=16386 erase_size=64
# dd if=jffs2-image of=/dev/mtdblock0
# mount -t jffs2 /dev/mtdblock0 /mnt/jffs2

> How do I create a jffs2 filesystem on the CF card using the PCMCIA adapter 

# dd if=jffs2-image of=/dev/hda (or hda1, hda2, etc.) 
# insmod blkmtd device=/dev/hda
# mount -t jffs2 /dev/mtdblock0 /mnt/jffs2

You may want partitioning if you want to boot from this too, not just use 
it as filesystem.

> I'm using 2.4.13, with mtd and jffs2 compiled in. No devfs.

There have been some blkmtd updates since then. I'm hoping the maintainer 
will send those to Linus if appropriate.

-- 
dwmw2
