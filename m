Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17InIy-0003r8-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 10:23:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020614090125.91096.qmail@web21507.mail.yahoo.com> 
References: <20020614090125.91096.qmail@web21507.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: why MTD model ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 10:23:39 +0100
Message-ID: <20169.1024046619@redhat.com>
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
>  We can change the sector size on block devices. 

Even if Linux could cope with sectors larger than PAGE_SIZE, the amount of
space wasted by using 64KiB sectors would be prohibitive. Perhaps reiserfs 
with its tail-packing option could cope, but I doubt it very much.

>  I think, this is not neccesary to keep erase independent from
> writing, we can erase before we write.

Not if you want to be able to write fewer data than an entire eraseblock at 
a time, or if you care about limiting the number of erase cycles.

> It is not neccesary that we use JFFS2, we can use any filesystem on
> flash but at low level when we are writing to flash, we can use wear
> levelling. 

Indeed, this is as I said. You can use a 'normal' journalling file system on
top of another pseudo-filesystem which emulates a block device. Your
'normal' file system will write each block of data to the flash twice --
once to its 'journal' and then again to the actual file system structure, 
while your underlying pseudo-filesystem will faithfully log this activity.

If you are misguided enough to desire this behaviour, it is possible. The 
translation layer is a 'user' of an underlying MTD device driver which 
actually performs the fundamental read/write/erase operations on the flash 
chips. The MTD API represents those fundamental capabilities of the 
hardware.

>  Are these are only feature provided by MTD ? 

By the MTD API, yes. The sole purpose of the MTD API is to represent the
functionality of Memory Technology Devices, and therefore that is all it 
does.

The MTD code base contains drivers for various flash chips, real flash file
systems, and also some of these 'translation layers' which are used to 
emulate a block device. 

>  I am not able to understand what is special in MTD model ? 

There is nothing particularly special about it. It merely represents the
capabilities of the hardware in a way which makes it possible to use it
effectively.

--
dwmw2
