Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDXto-0000AV-Jo
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 06:00:11 +0000
Subject: Re: write error while using UBI/UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manoj <manoj23@gmail.com>
In-Reply-To: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
References: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jun 2009 08:59:39 +0300
Message-Id: <1244440779.5847.334.camel@localhost.localdomain>
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

Hi,

On Fri, 2009-06-05 at 20:05 -0700, Manoj wrote:
> I have created a ubi image that I have programmed to NAND flash using
> ubiformat. After I mount the ubifs, I am trying to write a 3MB file to
> the flash and I am seeing some issues.

Please, make sure you have all the latest UBI and UBIFS fixes:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source
I think I fixed debugging problems recently. I suspect this fix may
help you:
http://git.infradead.org/ubi-2.6.git?a=commit;h=f9fd3ec55e099ccd6894d7e639e2419c53a823e0

> I have enabled UBI debug and CONFIG_MTD_NAND_VERIFY_WRITE.

Please, also take this into account:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail


> Also, as an experiment, I used mtd_debug utility to write a 10MB image
> to the flash and I don't see any issues there. So, it doesn't sound
> like a driver issue?
> HW ECC is enabled and I am presuming that no maintenance data is
> stored in spare area for UBI/UBIFS (from documentation). I don't see
> errors with ECC off.

Enabling debugging checks for verification is good. But please, bear
in mind that they make your system slower.

If you enable just debugging - it is light-weight, but if you also
enable additional checks - they are very slow, so you should later
disable them.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
