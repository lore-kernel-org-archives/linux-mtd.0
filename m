Received: from mta066b.interbusiness.it ([85.37.17.66])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ftkpx-0005iN-9D
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 08:32:47 -0400
Received: from gianlinux.eptar.com (massimo.eptar.com [192.168.143.6])
	by eptar.com (8.11.6/8.9.3) with ESMTP id k5NCWQV05669
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 14:32:26 +0200
From: Gianluca <gianlucarenzi@eptar.com>
To: linux-mtd@lists.infradead.org
Subject: Re: uboot performances
Date: Fri, 23 Jun 2006 14:32:31 +0200
References: <001001c696b3$9aeacf70$253682a4@nap.st.com>
In-Reply-To: <001001c696b3$9aeacf70$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606231432.32048.gianlucarenzi@eptar.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 23 June 2006 12:55, Davide CASCONE wrote:
> I'm working with the OMAP5912 OSK platform. I have the boot-loader code and
> the Linux OS compressed image in a Sibley flash. When I run the system, the
> boot loader (uBoot) have to copy the Kernel Image (about 700KB) in RAM. It
> takes about 300ms in order to perform that copy. But I have read some
> benchmark results in which the copy of the kernel in RAM lasts only
> 80-100ms. In order to reduce the time of the copy on my platform, the only
> solution that I found (after checking the memory controller settings) is to
> modify the copy function memmove (uboot/ lib_generic/string.c). This
> function performs the copy byte by byte. If I modify this function to
> perform the copy 4byte by 4byte, the bootloader only takes about 80 ms. Do
> you think this is a good workaround for this problem? Can you suggest me
> anything better?
Sometime (I don't know about uboot) first-stage bootloaders are executing 
themselves at very low clock timing due to flash-timing constraints (i.e.: 
4Mhz/16Mhz/25Mhz). Are you sure your board is running at the maximum speed 
allowed by Sibley flash device?
Your consideration about memmove (4byte by 4byte (a single word) in a 32bit 
micro) is correct. But what about other functions that are using memmove and 
complain about byte ordering?
It is better to write a memmove32() and use this instead.

Regards,  
-- 
Gianluca Renzi
Eptar s.r.l.
Via Celletta 8/B
40026 Imola (BO) ITALY
Tel.:	+39-0542-609060
Fax.:	+39-0542-609054
