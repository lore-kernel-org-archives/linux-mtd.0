Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CcLha-0006m5-0G
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 05:39:15 -0500
Message-ID: <41B82B1E.80503@yandex.ru>
Date: Thu, 09 Dec 2004 13:38:22 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <20041204133336.GA11070@angel.research.nokia.com>
	<1102181689.13353.301.camel@tglx.tec.linutronix.de>
In-Reply-To: <1102181689.13353.301.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jarkko Lavinen <jarkko.lavinen@nokia.com>
Subject: Re: ECC errors on padded images
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thomas Gleixner wrote:
> On Sat, 2004-12-04 at 15:33 +0200, Jarkko Lavinen wrote:
> 
>>I recently encountered ECC errors with padded JFFS2 images (mkfs.jffs2
>>-p) on Nand flash.
>>
>>The padded pages were written into flash with a driver which uses
>>noninverted ECC code. Pages with all bytes either 00 or FF will
>>produce 00s as ECC bytes.
>>
>>When JFFS2 scans such padded image, it fails to check the zero ECC
>>bytes of seemingly unused pages and will use them. Then the already
>>once written page is written again and later an ECC error is produced
>>upon read -- because ECC bytes remain zero.
>>
>>We have now three options:
>>
>>1. We couuld blame JFFS2, because it fails to check ECC bytes of
>>   seemingly unused pages.
>>
>>   But should JFFS2 care if somebody produces an image that JFFS2
>>   would never produce by itself?
>>
>>   JFFS2 itself won't pad erase blocks and won't write unused blank
>>   pages.  Even if writing a long node would result writing an all FF
>>   page, JFFS2 would know in next mount from node header the page is
>>   being used and not available for writing.
>>
>>
>>2. We could blame Mkfs.jffs2, because it is the one who produced
>>   padded erase block. Without padding there would be no error.
>>
>>
>>3. We could blame the Ecc logic and insist that writing a blank, all
>>   FF page will result ECC code of FFs and it would allow writing
>>   first a blank page and then real data page.
>>
>>   Conceptually an unused, erased page is not the same as used,
>>   written blank page.
> 
> 
> 4. We could blame you, that you did not read the mail archive and found
> the thread discussing this problem and for not using the -p=YOURPAGESIZE
> option :)
> 
> tglx
> 
Anyway, mkfs.jffs2 should print this in help, IMHO. I was confused by 
this either.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
