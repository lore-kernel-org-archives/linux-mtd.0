Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbJyU-0005OR-8w
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 11:08:45 -0400
Message-ID: <4295E673.3050704@cetrtapot.si>
Date: Thu, 26 May 2005 17:08:35 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Damian Slee <Damian@commtech.com.au>
References: <B967C997C2BE2D48A6BBE14078F79BD601CE3A@ntserver.commtech.com.au>
In-Reply-To: <B967C997C2BE2D48A6BBE14078F79BD601CE3A@ntserver.commtech.com.au>
Content-Type: text/plain; charset=windows-1250; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Serial flash memory support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Damian Slee wrote:
> Jffs2 does support atmel serial dataflash, as far as the driver for spi,
> that is more hardware dependent.   They recently changed the conditional 
> compiles to be CONFIG_JFFS2_FS_WRITEBUFFER for nand and dataflash.
> 
> BTW JFFS2 takes ages to do the startup scan of the flash with the 528 or
> 1056 block size of the dataflash.

Our serial flash uses 256 byte pages and is forming sectors with them, 
depending on the whole flash size. But I guess that is no case for accessing it 
quicker.

>  I was evalutating the latest cvs JFFS2 last week upon eCos.  I think it
> was about 7 seconds for 64kbytes, with the SPI clocked at 15MHz.

That is too slow for our application.
My conclusion would be that JFFS2 is too much for 'slow' SPI serial flash. I 
guess will just use raw access to the data stored there and achieve maximum 
speed. Can mtd raw access driver/module be used for this purpose or is that 
driver meant for a another stuff?

regards,
hinko k
-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
