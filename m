Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LaBTq-0003xb-PJ
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 16:10:33 +0000
Subject: Re: UBI attach and mounting problem after rebooting
From: Artem Bityutskiy <dedekind@infradead.org>
To: Subramani Venkatesh <subbu31mani@gmail.com>
In-Reply-To: <25dd9bf10902190658p4e0adea3s8f8bba6f5cfd01d6@mail.gmail.com>
References: <25dd9bf10902190658p4e0adea3s8f8bba6f5cfd01d6@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 Feb 2009 18:10:18 +0200
Message-Id: <1235059818.17790.373.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2009-02-19 at 09:58 -0500, Subramani Venkatesh wrote:
> UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB
> 798:0, read 64 bytes
> UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB
> 799:0, read 64 bytes
> UBI error: ubi_read_volume_table: the layout volume was not found
> UBI error: ubi_init: cannot attach mtd4
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -22

-71 is -EBADMSG which means that ECC error occurred. IOW, your NAND
driver reports that it cannot read 64 bytes from eraseblock 798,
offset 0, and UBI has nothing else to do but stopping.

You should look closer at what your driver do. I think it might be
not handling sub-pages correctly. You may experiment and force UBI
not to use sub-pages, and if it helps, you have your problem a little
bit narrowed down.

I've just created a FAQ entry which tells how to force UBI
not to use sub-pages:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_force_no_subpage

Also, you may try to attach an empty flash and play with it. If it
works fine, this may be something to do with how you flash your
initial images. Indeed, the program you use for flashing may screw
up ECCs somehow.

HTH.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
