Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160Ukg-0004yn-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 21:24:22 +0000
Subject: Re: JFFS2, CF, PCMCIA adapter, ATA
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.33.0111042108140.28157-100000@imladris.demon.co.uk>
References: <Pine.LNX.4.33.0111042108140.28157-100000@imladris.demon.co.uk>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Nov 2001 16:34:07 -0500
Message-Id: <1004909648.1728.53.camel@gromit.house>
Mime-Version: 1.0
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

On Sun, 2001-11-04 at 16:16, David Woodhouse wrote:
> As far as you're concerned, it's just alien technology

Okey-dokey, then.

> # dd if=jffs2-image of=/dev/hda (or hda1, hda2, etc.) 
> # insmod blkmtd device=/dev/hda
> # mount -t jffs2 /dev/mtdblock0 /mnt/jffs2

... followed by a litany of "argh, block not erased" type messages in
the syslog. Mount then returns. Then, I try to copy some files into the
mounted jffs2 filesystem ...  "cp" causes an oops and the interrupt
handler gets killed.

> You may want partitioning if you want to boot from this too, not just use 
> it as filesystem.

Am I correct in assuming that I can make partitions with fdisk, then 

 # dd if=flash.jffs2 of=/dev/hde1
 # modprobe blkmtd device=/dev/hde1
 # mount -t jffs2 /dev/mtdblock0 /mnt/flash

...?

What would this look like in lilo and /etc/fstab on the device that will
hopefully be booting from the jffs2 image?

> There have been some blkmtd updates since then. I'm hoping the 
> maintainer 
> will send those to Linus if appropriate.

Maybe the updates won't oops... :)


Do you use mtdram to create jffs2 filesystems? Or some other method?


Thanks,

Michael
