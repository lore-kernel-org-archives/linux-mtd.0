Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Avgd7-0004tw-Jw
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 17:46:01 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 17:05:03 +0000
References: <4034E8ED.5757.55A2D9@localhost> <69D8404D0D5E@baydel.com>
	<1077641461.7826.578.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077641461.7826.578.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <6A03D4BC2018@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 4:51 pm, David Woodhouse wrote:
> Hack JFFS2 to always get_mtd_device number 2 and boot with
> root=/dev/ram0

Sorry again for being so stupid. I know you have only told me half a dozen 
times that JFFS2 does not use the block read and write routines.

I have done this and rebooted several times. Normally I would expect a CRC 
error within a couple or reboots. As yet I have no CRC errors but I do get a 
large number of "Empty Flash" messages, about 15 per reboot. I do not see any 
of these if I boot via the network and mount and dismount the smc ?

I will keep rebooting over night and hack the kernel to panic on a CRC error.

Would you recommend changing the printk for the "Empty Flash" messages to a 
different level and using the ramdisk as a permanent solution ?
