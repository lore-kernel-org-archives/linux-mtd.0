Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165WcC-0006En-00
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 18:24:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1006107094.1391.46.camel@gromit.house> 
References: <1006107094.1391.46.camel@gromit.house> 
To: Michael Rothwell <rothwell@holly-springs.nc.us>
Cc: linux-mtd@lists.infradead.org
Subject: Re: second "mount" hangs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 18 Nov 2001 18:33:34 +0000
Message-ID: <1335.1006108414@redhat.com>
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


rothwell@holly-springs.nc.us said:
> I mounted a JFFS2 filesystem stored on a 16MB partition on a zip disk,
> using mtdblock and blktmd. I accidentally typed "mount /mnt/flash"
> rather than "umount /mnt/flash", and "mount" is now hung. Unkillable. /
> mnt/flash is still mounted and usable, but not unmountable. It seems I
> will have to reboot to umount the filesystem. I can't even eject the
> zip disk. 

ISTR someone reported this to me recently. I don't recall them ever 
responding with the results of SysRq-T when I asked though. What are the 
relevant processes waiting for?


--
dwmw2
