Received: from [203.194.209.83] (helo=machine36.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197ZXF-0001R5-M0
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 12:32:34 +0100
From: Mark Meade <mark@lakeshoremicro.com>
To: lhl <lhl@phy.ccnu.edu.cn>,
 linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 07:32:17 -0400
References: <E197StG-0000Sy-Nb@pentafluge.infradead.org>
In-Reply-To: <E197StG-0000Sy-Nb@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304210732.17972.mark@lakeshoremicro.com>
Content-Type: text/plain;
  charset="gb2312"
Content-Transfer-Encoding: 7bit
Subject: Re: DOC2000 grub boot problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 21 April 2003 12:42 am, lhl wrote:
> then mke2fs /dev/nftla and mount it on /mnt,cp the bzImage to the
> /mnt/boot/vmlinuz-doc cp the menu.list to the /mnt/boot/grub/
> menulist:

Grub looks for "menu.lst", not "menu.list".
