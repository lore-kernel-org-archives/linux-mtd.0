Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LteXU-0001os-GY
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 09:02:52 +0000
Subject: Re: ubifs corrupt
From: Artem Bityutskiy <dedekind@infradead.org>
To: jerry <jerrydreaming@gmail.com>
In-Reply-To: <71103bce0904140105l2aea95b4i2bfe460abacf66ec@mail.gmail.com>
References: <71103bce0904140105l2aea95b4i2bfe460abacf66ec@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Apr 2009 12:02:24 +0300
Message-Id: <1239699744.3390.115.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Tue, 2009-04-14 at 16:05 +0800, jerry wrote:
> I'm getting some problem with UBIFS when the power is switched off abruptly
>  during a write to flash(nandflash 2k/page). In the next boot the contents of
>  the file is not found and prints the following information.
> 
> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
> expected 0x6101831
> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
> UBIFS error (pid 358): ubifs_read_node: expected node type 2
> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
> expected 0x6101831
> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
> UBIFS error (pid 358): ubifs_read_node: expected node type 2
> problem renaming the file /Settings/qpe.conf.new to /Settings/qpe.conf
> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
> expected 0x6101831
> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
> UBIFS error (pid 358): ubifs_read_node: expected node type 2
> 
> I think the qpe.conf is writting when the power is off and The problem
> is reproducable.
> 
> Please could you tell me if this is a known issue.
> 
> Thanks for your help and time!

Could you please, check what Adrian pointed. And if this does
not help, could you please send a bug report as described here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

We are usually especially interested in items 1, 3, 4.

Thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
