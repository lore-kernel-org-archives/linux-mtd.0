Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EISXm-0000Ol-9q
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 10:59:35 -0400
Message-ID: <4332C6D1.905@mw-itcon.de>
Date: Thu, 22 Sep 2005 16:59:29 +0200
From: Peter Menzebach <pm@mw-itcon.de>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
References: <432812E8.2030807@mw-itcon.de> <4332A3E8.8020002@mw-itcon.de>	
	<1127393059.20014.105.camel@sauron.oktetlabs.ru>	
	<4332B24F.2050305@mw-itcon.de> <4332BA7E.3060409@yandex.ru>
	<1127399523.6125.79.camel@fuzzie.sanpeople.com>
In-Reply-To: <1127399523.6125.79.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Victor wrote:
> hi,
Hi,
> 
>>>Problem is here, how does the user get the information about the erase 
>>>size used by jffs2?
>>
>>He detects that the flash is DataFlash (mtd->type == MTD_DATAFLASH). 
>>Afterwards he knows, that
>>1. mtd->erasesize is the size of DataFlash block
>>2. mtd->oobblock is the size of DataFlash page
> 
> 
> No.  You can't change mtd->erasesize.
> There are other existing applications that access the raw MTD layer and
> want the real erasesize.
I agree. The erase size reported to the mtd layer should be always the 
physical erase size (528/1056).

>>Sorry, didn't get it. I mean, MTD provide information about both 
>>DataFlash block size and DataFlash page size. That's obvious.
> 
> 
> This magic minimum block size could always be calculated in JFFS2 (in
> jffs2_dataflash_setup).  It is a JFFS2-specific value.
> Just calculate an 'N' where:
>    (N * mtd->erasesize) >= jffs2_minimum_block_size
> and
>    (mtd->size % (N * mtd->erasesize)) == 0

That would possible.
Set jffs2->wbuf_size to erasesize and calculate the jffs2->sector size 
as you outlined...

Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
