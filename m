Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179N5G-0002xy-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 May 2002 10:34:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020518182026.49817.qmail@web21505.mail.yahoo.com> 
References: <20020518182026.49817.qmail@web21505.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Sun, 19 May 2002 10:34:32 +0100
Message-ID: <3048.1021800872@redhat.com>
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

studying_mtd@yahoo.com said:
> > Neither the 'mtdblock' nor 
> > 'mtdchar' code is involved at all.  

> As per drivers/mtd/Config.help (2.5.15) :-

> You do not need this option for use with the
> DiskOnChip devices. For those, enable NFTL support
> (CONFIG_NFTL) instead.
> it means we have to set CONFIG_MTD_BLOCK, if we are
> not using DoC but we are using JFFS2 filesystem.

> i am confused, who is correct ?

Both. You do not need CONFIG_MTD_BLOCK in the situation about which we were 
talking; where you use a translation layer to mount a 'normal' file system 
on a flash device. CONFIG_MTD_BLOCK provides such a translation layer itself;
just a very naïve one which doesn't do any wear levelling and can lose data 
if you power down while it's writing.

Until about 2.5.10, you had to pretend to mount JFFS2 on the mtdblock 
device, but it didn't actually _use_ it - just looked at the minor device 
number to work out which MTD device to use. You don't need that hack any 
more in 2.5.

--
dwmw2
