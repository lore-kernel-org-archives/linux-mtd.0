Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rz29-0005MT-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2002 11:59:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1032432851.1847.22.camel@www.avantwave.com> 
References: <1032432851.1847.22.camel@www.avantwave.com> 
To: Victor Tse <victortse@avantwave.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 BUG() in gc.c:135 "Checked all inodes but still..." 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Sep 2002 11:59:36 +0100
Message-ID: <28606.1032433176@redhat.com>
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

victortse@avantwave.com said:
>  Before updating to the latest code there had been strange behaviors
> e.g. seemingly corrupted executable files that restores itself after a
> reboot, and we get different bad CRC reports every time the system
> boots up. However generally the system is stable enough for our
> development.

Can you provide more details? These aren't expected, except the CRC errors, 
which shouldn't be common -- they should only happen on power loss.

> Is the new code compatible with old data? Should I just rebuild the
> whole filesystem with the new code by erasing it and copying all files
> into it? Any help is greatly appreciated... 

Yes, the new code is compatible. September 6th was a bad time to take a 
snapshot -- can you update and try again?

If you can reproduce it still, please provide a full log of the mount with 
CONFIG_JFFS2_FS_DEBUG=1.


--
dwmw2
