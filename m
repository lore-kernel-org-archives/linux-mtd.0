Received: from brmea-mail-4.sun.com ([192.18.98.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D45hF-0002dD-1V
	for linux-mtd@lists.infradead.org; Wed, 23 Feb 2005 18:13:33 -0500
Received: from phys-san-2 ([129.153.85.71])
	by brmea-mail-4.sun.com (8.12.10/8.12.9) with ESMTP id j1NNDUL0024199
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Feb 2005 16:13:30 -0700 (MST)
Received: from conversion-daemon.san-mail1.west.sun.com by
	san-mail1.west.sun.com
	(iPlanet Messaging Server 5.2 HotFix 1.24 (built Dec 19 2003))
	id <0ICE00M010AMF4@san-mail1.west.sun.com>
	(original mail from Muhammad.Yahya@Sun.COM) for
	linux-mtd@lists.infradead.org; Wed, 23 Feb 2005 15:13:30 -0800 (PST)
Date: Wed, 23 Feb 2005 15:13:29 -0800
From: Muhammad Yahya <Muhammad.Yahya@Sun.COM>
To: jffs-dev@axis.com, linux-mtd@lists.infradead.org
Message-id: <421D0E19.6030507@sun.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7BIT
Cc: 
Subject: Errors writing to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am running a PPC 875 board with Linux  2.4.25 and an 8MB flash.
When I try to write to the flash an image, as


>
> /tmp # wget -O - 
> http://129.148.183.102/~muhammad/flashupdate/spimage_nouboot |
> dd of=/dev/mtdblock0 bs=1k seek=256
> 7936+0 records in
> 7936+0 records out
>
> The write seems to go OK withiout any errors, but, on the console, we see
> the following messages which I an not sure if they are coming from 
> jffs or the mtd driver.
> Sometimes these messages are output right away after the write 
> completes and
> sometimes there is a delay before they are output:
>
>
> Node totlen on flash (0xffffffff) != totlen in node ref (0x000000c0)
> Node totlen on flash (0xffffffff) != totlen in node ref (0x00000064)
> Node totlen on flash (0xffffffff) != totlen in node ref (0x00000044)
>
> Any idea as to what this means and how to avoid this ? 

Thanks!
Muhammad

>
>
>
>
>
>
>
