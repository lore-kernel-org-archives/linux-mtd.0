Received: from [203.194.209.83] (helo=machine36.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196sCO-000190-KM
	for <linux-mtd@lists.infradead.org>; Sat, 19 Apr 2003 14:16:08 +0100
From: Mark Meade <mark@lakeshoremicro.com>
To: lhl <lhl@phy.ccnu.edu.cn>,
 linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Date: Sat, 19 Apr 2003 09:14:50 -0400
References: <E196mXN-00005l-En@pentafluge.infradead.org>
In-Reply-To: <E196mXN-00005l-En@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304190914.51074.mark@lakeshoremicro.com>
Content-Type: text/plain;
  charset="gb2312"
Content-Transfer-Encoding: 7bit
Subject: Re: How to Install grub on DiskOnChip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 April 2003 03:29 am, lhl wrote:
> I had download the doc-grub-20000128.tar.gz,then
> #make
> #/usr/src/mtd/util/doc_loadbios /dev/mtd0 grub_firmware
> and I found the partition I had make in /dev/nftla had lost,and
> fdisk /dev/nfla again make nfla1
> mke2fs /dev/nfla1
> then cp the root filesystem onto /dev/nfla1
> reboot,system still boot my hda device.

There's a much newer Grub/DOC patch available, I think the latest was 
grub-2003-01-08-doc.patch.

See http://lakeshoremicro.com/diskonchip-grub-howto.html for instructions on 
how to apply this patch, and install grub on a DiskOnChip.
