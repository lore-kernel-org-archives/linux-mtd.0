Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DabtI-0003QD-20
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 12:04:27 -0400
Message-ID: <42935087.3000108@ru.mvista.com>
Date: Tue, 24 May 2005 20:04:23 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <42933C35.3040305@ru.mvista.com>
	<1116946904.6736.212.camel@tglx.tec.linutronix.de>
In-Reply-To: <1116946904.6736.212.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: last commit breaks the AMD NOR flash functionality?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Thomas,
I think I found the bug.

This is the 'problematic' part code in cfi_cmdset_0002.c:

>         /* Did we succeed? */
>         if (!chip_good(map, adr, map_word_ff(map))) {
>                 /* reset on all failures. */
>                 map_write( map, CMD(0xF0), chip->start );
>                 /* FIXME - should have reset delay before continuing */
>
>                 ret = -EIO;
>         }

I inserted a stupid printk into the chip_good function:

> static int chip_good(struct map_info *map, unsigned long addr, 
> map_word expected)
> {
>         map_word oldd, curd;
>
>         oldd = map_read(map, addr);
>         curd = map_read(map, addr);
>
>         printk("FFFFFF %ld %ld %ld\n", *oldd.x, *curd.x, *expected.x);
>         return  map_word_equal(map, oldd, curd) &&
>                 map_word_equal(map, curd, expected);
> }

And what I saw was:

...
FFFFFF 65535 65535 -1
...

And that's because map_word_ff is the following:

> static inline map_word map_word_ff(struct map_info *map)
> {
>         map_word r;
>         int i;
>
>         for (i=0; i<map_words(map); i++) {
>                 r.x[i] = ~0UL;
>         }
>         return r;
> }

which won't work in my case (16-bit flash access).
The suggested fix is the following:

Index: include/linux/mtd/map.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/map.h,v
retrieving revision 1.48
diff -u -r1.48 map.h
--- include/linux/mtd/map.h     16 Feb 2005 15:54:59 -0000      1.48
+++ include/linux/mtd/map.h     24 May 2005 15:51:28 -0000
@@ -346,7 +346,10 @@
        int i;

        for (i=0; i<map_words(map); i++) {
-               r.x[i] = ~0UL;
+               if (map_bankwidth_is_1(map) || map_bankwidth_is_2(map))
+                       r.x[i] = (1 << (8*map_bankwidth(map))) - 1;
+               else
+                       r.x[i] = ~0UL;
        }
        return r;
 }

This fix at least works for my case :)

Best regards,
   Vitaly


Thomas Gleixner wrote:

>On Tue, 2005-05-24 at 18:37 +0400, Vitaly Wool wrote:
>  
>
>>>	/* Did we succeed? */
>>>-	if (chip_good(map, adr, map_word_ff(map))) {
>>>+	if (!chip_good(map, adr, map_word_ff(map))) {
>>>		/* reset on all failures. */
>>>		map_write( map, CMD(0xF0), chip->start );
>>>		/* FIXME - should have reset delay before continuing */
>>>
>>>      
>>>
>>If I roll it back, it starts working.
>>I also suspected something strange with 'if(chip_good(...)) ...' instead 
>>of 'if(!chip_good(...)) ...' but it worked before and it doesn't work 
>>now. Can anyone elaborate this a bit?
>>    
>>
>
>I had the same problem you see before the fix. It took a bit to figure
>out what was going wrong. 
>
>I'm quite sure, that my fix is correct, because the previous revision
>exited via the error path in case of no error.
>
>I suspect, that something goes really wrong with your erase. You have to
>check the results in chip_good.
>
>The chip_good function reads the same address twice and compares whether
>the results are equal. The chip good result also requires that the reads
>are all 0xff.
>
>I suggest to add a check into chip_good, where you can identify which of
>the requirements is not fulfilled to further narrow down the source of
>trouble
>
>tglx
>
>
>
>  
>
