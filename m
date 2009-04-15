Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtyRF-0003d7-BU
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 06:17:44 +0000
Subject: Re: Run UBIFS on top of IDE mode NAND disk?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Subodh Nijsure <sunijsur@cisco.com>
In-Reply-To: <000001c9bd90$e726cdb0$0470150a@cisco.com>
References: <000001c9bd90$e726cdb0$0470150a@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2009 09:17:20 +0300
Message-Id: <1239776240.3390.151.camel@localhost.localdomain>
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

On Tue, 2009-04-14 at 23:10 -0700, Subodh Nijsure wrote: 
> I have board with 4GB NAND memory chip, it is configured to operate in IDE
> mode. And currently I am creating ext3 file-system on it. 
> This chip also have on-board controller that does wear-levelling, ECC so the
> quesitons are:
>  
> Can I (Should I) run UBIFS on of it and gain more of wear-levelling or its
> not worth it? 

Vs "Can I": if this is raw NAND, you just need an MTD driver for it.
Then you can use UBI/UBIFS on top of that.

Vs "Should I": you really should not ask questions like this. It is a
question of your design. Look at your NAND and how many erase cycles
each eraseblock survives. Then roughly calculate how many years or
months it should survive with ext3, which has fixed-position journal
and inode table and bitmap. Then decide whether you need WL or not.
Everything depends on your requirements.

Also, if this is raw NAND, then HW does not hide bad blocks for you,
right? How will you manage bad eraseblocks then, ext3 cannot do this.
It just panics in case of any I/O error.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
