Received: from f225.pav1.hotmail.com ([64.4.31.225] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181PNH-00072M-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 11:56:32 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: mtd, jffs and bootloader..
Date: Tue, 15 Oct 2002 10:55:50 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F225IaX31lKxtLUNYMy00017f3e@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Friends,

Looks like either they are very dumb questions or haev been
answered many many times already. Since am still unable to
find answer to my queries, am reposting..pls help me out.
Sorry for posting the querries again.

1. Can I put my bootloader in a seperate partition say mtd0 ?.
2. Since its my home built bootloader, am not sure how to tell
ffs about its location.( Will it matter?.) Am scared that the
partition table / any ffs data struct may overwrite bootloader
and if that happens, don't have any tool to reflash and bring
up the board.
3.Am unable to locate any detailed text on cramfs. Can you
suggest one?.

thanks and regards,
Vijay

>
>-----Original Message-----
>From: vijay vijay [mailto:vijay_peshkar@hotmail.com]
>Sent: Friday, October 11, 2002 4:45 PM
>To: linux-mtd@lists.infradead.org
>Cc: vijay.peshkar@wirpo.com
>Subject: my bootloader and mtd / cramfs
>
>
>Hi Friends,
>
>Few queries..
>1. Is there any documentation availible on cramfs?. Couldn't find any thru 
>google, though saw lot of mail discussions?.
>2. Want to use an inhouse built bootloader on my board. How to ensure that 
>the ffs(jffs2 / cramfs) and mtd do not write to it(say partition tables 
>etc.,)?.
>3. Can I use FFS on only a certain part of flash and the rest as raw
>(say) for storing my image?.
>
>Regards,
>Vijay


_________________________________________________________________
Join the world’s largest e-mail service with MSN Hotmail. 
http://www.hotmail.com
