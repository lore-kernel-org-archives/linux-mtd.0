Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoPii-0003sT-Vx
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 19:59:05 +0100
Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
From: Thomas Gleixner <tglx@linutronix.de>
To: Jeff Kalikstein <jeff@kalikstein.com>
In-Reply-To: <4488665D.5010908@kalikstein.com>
References: <4488665D.5010908@kalikstein.com>
Content-Type: text/plain
Date: Thu, 08 Jun 2006 20:59:32 +0200
Message-Id: <1149793172.5257.53.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-06-08 at 13:03 -0500, Jeff Kalikstein wrote:
> I have a system with a DiskOnChip Millennium Plus and existing TrueFFS 
> filesystem.  In attempting to get this configuration working with Linux 
> 2.6.16.20, I have tried both the "Self contained MTD
> device driver" and the MTD NAND based driver.
> 
> Running INFTL on the self-contained driver complains that "INFTL no 
> longer supports the old DiskOnChip drivers loaded via docprobe.", and 
> the MTD NAND based driver complains that "DiskOnChip Millennium Plus 
> 32MB is not supported, ignoring.".
> 
> Is it possible to run INFTL on a DiskOnChip Millenium Plus 32MB?  I 
> found an old mailing list post from  2005 that  suggested that there was 
> a patch to support the mp32 to the MTD NAND based driver, so I was 
> surprised to not see it in the latest linux 2.6 release.

Simply because nobody cared enough to put it in and test it proper.
Patches welcome :)

	tglx
