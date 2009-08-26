Received: from mail-bw0-f222.google.com ([209.85.218.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgFgy-00048R-Pp
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 10:25:28 +0000
Received: by bwz22 with SMTP id 22so13217bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Aug 2009 03:25:23 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 26 Aug 2009 12:25:23 +0200
Message-ID: <b8e9195f0908260325h1e7183dawa9adc2a306a4731d@mail.gmail.com>
Subject: Re: Fix MTD device probing... (really)
From: Guillaume LECERF <foxcore@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm experiencing a problem with a 16bit SST 39VF3201 flash chip (id
0x235b) that is misdetected as a 8bit SST 49LF080A (id 0x005b).
I found that this commit is the source of my problem :

On Mon Jan 24 18:39:41 EST 2005, Russell King wrote :
>Fix MTD device probing, trying larger numbers of chips before smaller
>numbers of chips across the bus width.
>
>This means we'll avoid misdetecting a 2 x16 array as 1 x32 if the
>high 16-bits happen to read as zeros in the QRY area.
>
>--- orig/drivers/mtd/chips/gen_probe.c	Sat Oct 23 11:38:17 2004
>+++ linux/drivers/mtd/chips/gen_probe.c	Mon Jan 24 22:54:38 2005
>@@ -162,7 +162,7 @@ static int genprobe_new_chip(struct map_
> 	int max_chips = map_bankwidth(map); /* And minimum 1 */
> 	int nr_chips, type;
>
>-	for (nr_chips = min_chips; nr_chips <= max_chips; nr_chips <<= 1) {
>+	for (nr_chips = max_chips; nr_chips >= min_chips; nr_chips >>= 1) {
>
> 		if (!cfi_interleave_supported(nr_chips))
> 		    continue;


Before this commit, genprobe_new_chip() started the detection on
CFI_DEVICETYPE_X32, then CFI_DEVICETYPE_X16, and CFI_DEVICETYPE_X8.
I understand why this commit is useful, but can't find a way (apart
from reverting this change locally) to handle both cases.

Could you help me with this ?

Thanks in advance.

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
