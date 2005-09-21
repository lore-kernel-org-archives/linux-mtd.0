Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI53z-0006rg-2F
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 09:57:27 -0400
Message-ID: <4331663C.1020103@mw-itcon.de>
Date: Wed, 21 Sep 2005 15:55:08 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>	<4329251C.7050102@mw-itcon.de>	<43292A8B.4020707@yandex.ru>
	<43292E94.4020702@mw-itcon.de> <43293527.9010504@yandex.ru>
In-Reply-To: <43293527.9010504@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Peter Menzebach wrote:
> 
>> -    if (!jffs2_can_mark_obsolete(c) && c->nextblock && 
>> (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
>> +    if (!jffs2_can_mark_obsolete(c) && c->nextblock && 
>> (c->nextblock->free_size % c->wbuf_pagesize)) {
> 
> [snip]
> 
>> -        uint32_t skip = c->nextblock->free_size & (c->wbuf_pagesize-1);
>> +        uint32_t skip = c->nextblock->free_size % c->wbuf_pagesize;
> 
> [snip]
> 
>> -#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>>  #define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned 
>> long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
>>  #define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned 
>> long)(c->wbuf_pagesize) )
>> -#else
>> -#define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
>> -#define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
>> -#endif
> 
> Looks sane.
> 
Do you put this into cvs or shall I submit it later again?

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
