Received: from [216.219.239.237] (helo=www.sensoria.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160osH-0006bB-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 18:53:33 +0000
Received: from baoha ([209.245.83.145])
	by www.sensoria.com (8.10.2/8.10.2) with SMTP id fA5Iu9W20942
	for <linux-mtd@lists.infradead.org>; Mon, 5 Nov 2001 13:56:09 -0500
From: "Bao C. Ha" <baoha@sensoria.com>
To: <linux-mtd@lists.infradead.org>
Subject: RE: DOC2000 support for a custom PPC750 board 
Date: Mon, 5 Nov 2001 11:01:13 -0800
Message-ID: <007c01c1662c$3e1767c0$456c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <29072.1004953009@redhat.com>
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

> The DiskOnChip requires no firmware. It is not an intelligent device. 
> What's normally referred to as the DiskOnChip 'firmware' is the BIOS 
> extension which installs a driver which hooks the PC INT 13h 
> disk service 
> interrupt and hence makes DOS and LILO work. I assume you 
> don't want that :)

Can the firmware boot into LILO directly?  Or it requires the patched
lilo-mtd in the patches subdirectory?

I have been under the impression that you need lilo-mtd to boot the
DiskOnChip.  However, the lilo-mtd patch is dated March of 2000.

Thanks.
Bao

 
