Received: from mail.theptrgroup.com ([209.183.211.17])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRaNr-0000AH-DO
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 13:06:24 -0500
From: Jeff Angielski <jeff@theptrgroup.com>
To: sam <sam.hsu@southpro.com.tw>
In-Reply-To: <4190F0A5.80609@southpro.com.tw>
References: <4190F0A5.80609@southpro.com.tw>
Content-Type: text/plain
Message-Id: <1100023535.1901.4.camel@nighteyes.localdomain>
Mime-Version: 1.0
Date: Tue, 09 Nov 2004 13:05:35 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 root filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-11-09 at 11:30, sam wrote:
> hi
> 
> I try to port linux-2.4.19-rmk1 to a pxa255 board
> i am success to use MTD partition and can mount it
> But when i try to use MTD as root filesystem (root=/dev/mtdblock/3
> console=ttyS0,38400)
> kernel boot message show:

Try using /dev/mtdblock3.

And is the flash really mapped at 0x00000000?

Jeff Angielski
The PTR Group
