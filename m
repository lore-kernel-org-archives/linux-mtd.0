Received: from smtp103.plus.mail.mud.yahoo.com ([68.142.206.236])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoOsg-0001WS-Ci
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 14:05:24 -0400
Message-ID: <4488665D.5010908@kalikstein.com>
Date: Thu, 08 Jun 2006 13:03:09 -0500
From: Jeff Kalikstein <jeff@kalikstein.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskOn Chip Millennium Plus 32MB + INFTL
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a system with a DiskOnChip Millennium Plus and existing TrueFFS 
filesystem.  In attempting to get this configuration working with Linux 
2.6.16.20, I have tried both the "Self contained MTD
device driver" and the MTD NAND based driver.

Running INFTL on the self-contained driver complains that "INFTL no 
longer supports the old DiskOnChip drivers loaded via docprobe.", and 
the MTD NAND based driver complains that "DiskOnChip Millennium Plus 
32MB is not supported, ignoring.".

Is it possible to run INFTL on a DiskOnChip Millenium Plus 32MB?  I 
found an old mailing list post from  2005 that  suggested that there was 
a patch to support the mp32 to the MTD NAND based driver, so I was 
surprised to not see it in the latest linux 2.6 release.
