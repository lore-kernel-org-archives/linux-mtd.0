Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KLvZh-0001Sd-7f
	for linux-mtd@lists.infradead.org; Thu, 24 Jul 2008 07:49:21 +0000
Message-ID: <488833E9.1020207@cetrtapot.si>
Date: Thu, 24 Jul 2008 09:48:57 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: suresh@mistralsolutions.com
Subject: Re: JFFS2 GC Bug?
References: <20080723201527.c93gjrlujjjswwc0@webmail.mistralsolutions.com>
In-Reply-To: <20080723201527.c93gjrlujjjswwc0@webmail.mistralsolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

suresh@mistralsolutions.com wrote:
> Hi,
> 
> Can files go missing if there is a powerfail when the garbage  
> collection is running (and doing updation to the file system) on a  
> JFFS2 filesystem.
> 

According to this doc not: http://www.linux-mtd.infradead.org/faq/jffs2.html

> Was this a bug in older kernels?

We are using 2.6.12 and 2.6.15 kernel on our embedded devices that use JFFS2 on NOR flash for rootfs. Devices are uncleanly shutdown every time, at least 3 times a day. Some devices are about 2.5 years in the wild and work as expected, while some fail to mount/use(!?) the rootfs right after the kernel has finished booting.
Right now we are testing 2.6.26 that does not fail to mount rootfs even under bigger stress tests than 2.6.12/2.6.15 kernels ever faced. Also a 'corrupt' flash that won't boot with 2.6.12/2.6.15 boots FINE with 2.6.26.

So my recommendation would be to use latest kernel sources.
 
my 2c,
Hinko

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
