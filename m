Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMkWA-0007yc-Hj
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 14:45:25 +0000
Subject: Re: Writing a ubinize'd image to fresh NANDFlash with a burner
From: Artem Bityutskiy <dedekind@infradead.org>
To: Pontus Hedman <pontushedman@navcast.com>
In-Reply-To: <1231433726.16113.8.camel@phedman.navcastinc.local>
References: <1231433726.16113.8.camel@phedman.navcastinc.local>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2009 16:45:15 +0200
Message-Id: <1231857915.5973.18.camel@localhost.localdomain>
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

On Thu, 2009-01-08 at 11:55 -0500, Pontus Hedman wrote:
> So I have used ubinize to create a UBIFS image.  I would now
> like to burn it to fresh-from-the factory blank nandflash
> 
> Do I just tell the burner to skip bad blocks on write, like nandwrite
> does?
> 
> This will happen only once; after that Linux will mount the
> filesystem and take of it itself.

I've updated UBI documentation and reflected what you asked there
as well. Please, beware about the "skip 0xFF'ed pages" part. See here:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_format_det

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
