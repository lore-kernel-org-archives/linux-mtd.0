Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165XPt-0006KU-00
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 19:15:45 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1006107094.1391.46.camel@gromit.house> 
References: <1006107094.1391.46.camel@gromit.house> 
To: Michael Rothwell <rothwell@holly-springs.nc.us>
Cc: linux-mtd@lists.infradead.org, spse@secret.org.uk
Subject: Re: second "mount" hangs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 18 Nov 2001 19:25:12 +0000
Message-ID: <2915.1006111512@redhat.com>
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
>  I mounted a JFFS2 filesystem stored on a 16MB partition on a zip
> disk, using mtdblock and blktmd. I accidentally typed "mount /mnt/
> flash" rather than "umount /mnt/flash", and "mount" is now hung.
> Unkillable. /mnt/flash is still mounted and usable, but not
> unmountable. It seems I will have to reboot to umount the filesystem.
> I can't even eject the zip disk.

I think that the last time I saw this reported, it was also on a blkmtd 
device. A quick perusal of the blkmtd code shows that it uses sleep_on 
functions - which makes me instantly assume it's racy.

Simon - can you reproduce this problem?

--
dwmw2
