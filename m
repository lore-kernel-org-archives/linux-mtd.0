Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELJ7o-0000Ks-LE
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 07:34:20 -0400
Message-ID: <433D2040.3090109@mw-itcon.de>
Date: Fri, 30 Sep 2005 13:23:44 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <43344342.8030303@mw-itcon.de>
	<20050925131630.GC28978@wohnheim.fh-wedel.de>
In-Reply-To: <20050925131630.GC28978@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] fix for mtd partitions for erase_size != 2^X
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Fri, 23 September 2005 20:02:42 +0200, Peter Menzebach wrote:
> 
>>Here a trivial patch,
>>which allows correct creation of mtd partitions, which have erase sizes
>>which are not a power of 2.
>>
>>Best regards
>>Peter
>>
>>Sorry, I didn't succeed to get the patch accepted by the mailing list as
>>attachment.
> 
> 
> I actually prefer inline.  Except that your mailer seems to have
> messed things up - grr.
> 
> 
>>--- drivers/mtd/mtdpart.c.orig    2005-09-23 09:28:07.000000000 +0200
>>+++ drivers/mtd/mtdpart.c    2005-09-23 09:29:37.000000000 +0200
>>@@ -465,9 +465,9 @@
>>         if (slave->offset == MTDPART_OFS_APPEND)
>>             slave->offset = cur_offset;
>>         if (slave->offset == MTDPART_OFS_NXTBLK) {
>>-            u_int32_t emask = master->erasesize-1;
>>-            slave->offset = (cur_offset + emask) & ~emask;
>>-            if (slave->offset != cur_offset) {
>>+            slave->offset = cur_offset;
>>+            if ((cur_offset % master->erasesize) != 0) {
>>+                slave->offset = ((cur_offset / master->erasesize) + 1) 
>>* master->erasesize;
>>                 printk(KERN_NOTICE "Moving partition %d: "
>>                        "0x%08x -> 0x%08x\n", i,
>>                        cur_offset, slave->offset);
> 
> 
> Looks complicated.  I guess we could use the equivalent of this:
> #define ALIGN(x,a) (((x)+(a)-1)&~((a)-1))
> in some header.  Then your patch would be as simple as
> 
>          if (slave->offset == MTDPART_OFS_APPEND)
>              slave->offset = cur_offset;
>          if (slave->offset == MTDPART_OFS_NXTBLK) {
> -            u_int32_t emask = master->erasesize-1;
> -            slave->offset = (cur_offset + emask) & ~emask;
> +	     slave->offset = TRUE_ALIGN(cur_offset, master->erasesize);
>              if (slave->offset != cur_offset) {
>                  printk(KERN_NOTICE "Moving partition %d: "
>                         "0x%08x -> 0x%08x\n", i,
> 
> Maybe this:
> #define TRUE_ALIGN(x,a) (((x)+(a)-1) - ((x)+(a)-1) % a)
> 
> The macro is still complicated, but we just have to get it right once.
> 
> Jörn
> 
Here the patch again. As the macro does not seem to reduce the 
complexity of the line seriously and would be used only once, I did put 
in a comment, which explains inline, what should go on there.

The patch now as link:
http://www.mw-itcon.de/patches/patch.dataflash.mtdpart.c

Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
