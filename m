Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO07l-0000DH-TR
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:46:26 +0000
Received: by bwz5 with SMTP id 5so7107983bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:46:21 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20101129195014.19224240@wker>
References: <20101129195014.19224240@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:46:15 +0200
Message-ID: <1291261575.14534.12.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-29 at 19:50 +0100, Anatolij Gustschin wrote:
> Hello,
> 
> using kernel 2.6.34.7 with applied UBI/UBIFS back-port patches from
> 2.6.34 UBIFS back-port tree and an UBIFS filesystem in a partition
> on Spansion NOR Flash S29GL512P (2 x16 chips in a 32-bit bank) we are
> not able to mount the filesystem after around 30 power cut test
> cycles. Has anyone seen similar issues before?

Hi, so, as other people indicated, the problem comes from the write
buffer size. In short, UBIFS issue you see is because of incorrect UBIFS
assumptions how your flash writes data. The right way to fix it, IMO,
is to report your write buffer size in 'struct mtd_info' and make
UBI/UBIFS use it as min_io_size. Now min_io_size is 1 for NOR in UBI and
8 in UBIFS, hardcoded.

Try to make mtd->writesize = 8 in your setup, and test again, it should
work better.

If you are interested to know why exactly UBIFS dies, what it complains
about, I can try to provide some explanation.

HTH.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
