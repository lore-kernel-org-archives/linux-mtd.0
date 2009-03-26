Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmjCu-0003QX-U6
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 06:37:00 +0000
Subject: Re: ubifs version 1 compatibility
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20090326051508.GA4760@cloud.net.au>
References: <20090326051508.GA4760@cloud.net.au>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2009 08:34:57 +0200
Message-Id: <1238049297.3321.20.camel@localhost.localdomain>
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

On Thu, 2009-03-26 at 16:15 +1100, Hamish Moffatt wrote:
> Hi Artem and all,
> 
> I'm upgrading my embedded system which uses UBIFS from 2.6.24 (with a
> slightly updated ubifs) to 2.6.29.
> 
> I notice that the new kernel won't read my existing file systems as it
> says they are too old - version 1. The code checks for version 3 or 4 I
> see.
> 
> My application firmware is generated with mkfs.ubifs and programmed via
> ubiupdatevol, but the boot loader on my devices is based on the older
> kernel and won't be able to read it. And I have read-write file systems
> that will be formatted with the old version too.
> 
> 
> Is there any solution?

I've took a brief look. UBIFS went into mainline with format version 4,
and versions 1,2,3 were more development versions. There were changes in
the truncation node format and in inode node format. I would probably
be possible to have compatibility mode, but it is big job :-(

Your boot-loader is Linux kernel-based, right? Does it have write
support, or it is read-only?

Is it possible to upgrade the boot-loader at the same time you upgrade
the kernel on your devices?

Side note: now when u-boot supports UBIFS, we need to re-think our
versioning scheme and strictly preserve R/O compatibility.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
