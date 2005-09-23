Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIll4-0003E0-3Z
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 07:30:33 -0400
Message-ID: <4333E759.8000804@mw-itcon.de>
Date: Fri, 23 Sep 2005 13:30:33 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <4333D014.8000809@mw-itcon.de> <4333D37A.1020900@yandex.ru>
In-Reply-To: <4333D37A.1020900@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Minimum/optimal sector_size for jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Peter Menzebach wrote:
> 
>> Hi,
>> since my grep through the source code was not successful:
>> Is there a minimum possible jffs2_sb_info.sector_size and somewhere a 
>> definition?
> 
> There is probably no minimum value, but not because it doesn't matter, 
> just because nobody cared adding a check.
> 
>> Is there somewhat like an optimal sector_size?
> 
> Not sure about optimal, probably yes. Consider the following aspects:
> 
> 1. There is an array (c->blocks[]) with one element per eraseblock. The 
> smaller is yur eraseblock - the larger is the array.
> 
> 2. The eraseblock size cannot be less then PAGE_SIZE + sizeof(struct 
> jffs2_raw_inode). PAGE_SIZE is mostly 4096 bytes.
> 
Sorry,
I was not precise in terms. When I talked about erasesize, I mean 
mtd_info.erasesize.

As far as I see in the code, for jffs2 the erase vloack size (used by 
jeb) is jffs2_sb_info.sector_size.

So, in these terms, the jffs2 sector_size has a minimum:
jffs2 sector_size >= PAGE_SIZE + sizeof(struct jffs2_raw_inode)

That's the information, I wanted to confirm.

>> I have here a device (dataflash), which has a very small
>> erase/write page size (1056 bytes).
> 
> Err, AFAIR, I explained why you cannot use 1056 bytes eraseblocks... It 
> is simply too small.
See explanation above, sorry for the confusion ;) .


Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
