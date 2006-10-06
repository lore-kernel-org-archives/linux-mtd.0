Received: from web210.biz.mail.re2.yahoo.com ([68.142.224.172])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVqJz-0006RW-H1
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 10:05:09 -0400
Message-ID: <20061006140500.6723.qmail@web210.biz.mail.re2.yahoo.com>
Date: Fri, 6 Oct 2006 07:05:00 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Re: Problem with developing Samsung K9F1G08U0A MTD driver
To: Nishanth Menon <menon.nishanth@gmail.com>
In-Reply-To: <4525E60D.1030006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> might help, on the R1 device is 128M, the U device
is 256M(so am not too
> sure abt ur mtd.size param), on this device,
page1,page2 offset 0 had
> badblock info, so am not sure if mtd is putting ecc
over there..
I doubled checked the datasheet, R is 1.8v device, U
is 3.3v.

> mebbe u can try this: (dunno if it works):
flash_eraseall mtd and mount
> and umount the same, let jffs2 maintain the bad
blocks - remount should
> not show any jffs2 errors.
Is it possible to mount a bare MTD device?

> Just my guesses.. but then.. I can be completely
wrong...
Thanks for the help.
