Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165WnV-0006Fk-00
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 18:36:05 +0000
Subject: Re: second "mount" hangs
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1335.1006108414@redhat.com>
References: <1006107094.1391.46.camel@gromit.house>  
	<1335.1006108414@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 18 Nov 2001 13:46:39 -0500
Message-Id: <1006109199.1391.48.camel@gromit.house>
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

Well, SysRQ-t prints "SysRQ : Show State" and that's it. Strangely.

-M

On Sun, 2001-11-18 at 13:33, David Woodhouse wrote:
> 
> 
> rothwell@holly-springs.nc.us said:
> > I mounted a JFFS2 filesystem stored on a 16MB partition on a zip disk,
> > using mtdblock and blktmd. I accidentally typed "mount /mnt/flash"
> > rather than "umount /mnt/flash", and "mount" is now hung. Unkillable. /
> > mnt/flash is still mounted and usable, but not unmountable. It seems I
> > will have to reboot to umount the filesystem. I can't even eject the
> > zip disk. 
> 
> ISTR someone reported this to me recently. I don't recall them ever 
> responding with the results of SysRq-T when I asked though. What are the 
> relevant processes waiting for?
> 
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
