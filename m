Received: from bay2-f158.bay2.hotmail.com ([65.54.247.158] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g8fE-0004AB-N2
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 20:55:40 +0100
From: "aldo vargas" <aldox@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 25 Jul 2003 19:55:10 +0000
Mime-Version: 1.0
Message-ID: <BAY2-F158nZrKoUhTew000040c3@hotmail.com>
Content-Type: text/plain; format=flowed
Subject: Usging Etherboot With DOC Msys Millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I am booting by floppy a image of 20k, but I want to boot by DOC MSys 
Millenium of  8MB, why??? cause I have this technology aviable, Can I do 
this.

Normally when i pass the image of boot to floopy i do this

cat bin/boot1a.bin bin32/rtl8139.lzrom > /dev/fd0

I suppose that if I want to do this whit DOC I do this

cat bin/boot1a.bin bin32/rtl8139.lzrom > /dev/mtd0 or /dev/ntfla1????

ok if i do this, is correct or i need to do something else....

Thanks.

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus
