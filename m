Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166uYL-0003IL-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2001 14:10:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011122140413.3E0E7FE89@tasmanie.mensi.net> 
References: <20011122140413.3E0E7FE89@tasmanie.mensi.net> 
To: DAVID Guillaume <guillaume.david@mensi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can't modify my DoC anymore (pb with GRUB) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Nov 2001 14:20:41 +0000
Message-ID: <30337.1006438841@redhat.com>
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

guillaume.david@mensi.com said:

I created the system as follow :

>    ../util/nftl_format /dev/mtd0 98304   

.. no reboot or rmmod nftl;insmod nftl here? If that worked, you were lucky.

>      sfdisk /dev/nftla <<EOF
>     	0,770,83,*
>     	771,,83
>     	EOF

Er, what partitioning? If you have only one useful partition, why have a 
partition table at all? Just use /dev/nftla for your filesystem. 

>  The real problem is that I can't boot my development system on hda1
> anymore  because the disk-on-chip firmware intercepts the boot
> sequence.

What Grub presents you with isn't bash, it's a tiny command prompt which 
allows you access to the Grub commands. You should be able to get Grub to 
boot from the hard drive by telling it something like
	root=(hd0,0)
	chainloader = +1
	boot

I don't know why Grub isn't finding the menu. Maybe you need to set 
the default boot_drive to match (dc0,0) ?

--
dwmw2
