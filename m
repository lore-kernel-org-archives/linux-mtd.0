Received: from [202.130.83.226] (helo=www.avantwave.com ident=[8mfzJA6UTRnBMPTjc9xZzIIKwrHpoy0+])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sF5r-0006ph-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 05:08:40 +0100
Subject: Re: jffs2 BUG() in gc.c:135 "Checked all inodes but still..."
From: Victor Tse <victortse@avantwave.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <28606.1032433176@redhat.com>
References: <1032432851.1847.22.camel@www.avantwave.com>
	 <28606.1032433176@redhat.com>
Content-Type: text/plain
Message-Id: <1032494909.1059.41.camel@www.avantwave.com>
Mime-Version: 1.0
Date: 20 Sep 2002 12:08:29 +0800
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

I updated to the latest code and rebuilt the filesystem by eraseall,
mount then copy the files into it. There is no problem if I umount it
before reboot, but the BUG() appears if I did not umount it.

This log is taken after copying the files, umount and then reboot:
http://www.avantwave.com/~victortse/jffs2.log1.gz

Then reboot withing umounting:
http://www.avantwave.com/~victortse/jffs2.log2.gz

Many thanks.

Regards,
Victor Tse

On Thu, 2002-09-19 at 18:59, David Woodhouse wrote:
> victortse@avantwave.com said:
> >  Before updating to the latest code there had been strange behaviors
> > e.g. seemingly corrupted executable files that restores itself after a
> > reboot, and we get different bad CRC reports every time the system
> > boots up. However generally the system is stable enough for our
> > development.
> 
> Can you provide more details? These aren't expected, except the CRC errors, 
> which shouldn't be common -- they should only happen on power loss.
> 
> > Is the new code compatible with old data? Should I just rebuild the
> > whole filesystem with the new code by erasing it and copying all files
> > into it? Any help is greatly appreciated... 
> 
> Yes, the new code is compatible. September 6th was a bad time to take a 
> snapshot -- can you update and try again?
> 
> If you can reproduce it still, please provide a full log of the mount with 
> CONFIG_JFFS2_FS_DEBUG=1.
> 
> 
> --
> dwmw2
-- 
Victor Tse <victortse@avantwave.com>
