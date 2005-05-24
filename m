Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaaXN-0002My-PO
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 10:37:43 -0400
Message-ID: <42933C35.3040305@ru.mvista.com>
Date: Tue, 24 May 2005 18:37:41 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: last commit breaks the AMD NOR flash functionality?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

the latest commit for cfi_cmdset_0002.c:

>Index: cfi_cmdset_0002.c
>===================================================================
>RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
>retrieving revision 1.115
>retrieving revision 1.116
>diff -u -r1.115 -r1.116
>--- cfi_cmdset_0002.c	20 May 2005 03:28:23 -0000	1.115
>+++ cfi_cmdset_0002.c	24 May 2005 13:29:42 -0000	1.116
>@@ -1320,7 +1320,7 @@
> 		cfi_spin_lock(chip->mutex);
> 	}
> 	/* Did we succeed? */
>-	if (chip_good(map, adr, map_word_ff(map))) {
>+	if (!chip_good(map, adr, map_word_ff(map))) {
> 		/* reset on all failures. */
> 		map_write( map, CMD(0xF0), chip->start );
> 		/* FIXME - should have reset delay before continuing */
>
resulted in the following behavior for my AMD NOR flash:

# flash_eraseall /dev/mtd/3
Erasing 64 Kibyte @ 0 --  0 % complete.
flash_eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 64 Kibyte @ 10000 -- 25 % complete.
flash_eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 64 Kibyte @ 20000 -- 50 % complete.
flash_eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 64 Kibyte @ 30000 -- 75 % complete.
flash_eraseall: /dev/mtd/3: MTD Erase failure: Input/output error

If I roll it back, it starts working.
I also suspected something strange with 'if(chip_good(...)) ...' instead 
of 'if(!chip_good(...)) ...' but it worked before and it doesn't work 
now. Can anyone elaborate this a bit?

Best regards,
   Vitaly
