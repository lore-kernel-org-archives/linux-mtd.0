Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14WDV5-0003JD-00
	for mtd-list@infradead.org; Fri, 23 Feb 2001 08:22:51 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14WDV4-0003J7-00
	for mtd@infradead.org; Fri, 23 Feb 2001 08:22:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A957005.3400694E@danielind.com> 
References: <3A957005.3400694E@danielind.com>  <30724FF712DFD2119E6200104B2448920119744A@mail1> <3A956884.2050504@brocade.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: Amit D Chaudhary <amitc@brocade.com>,
    Vipin Malik <Vipin.Malik@daniel.com>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: Unable to mount compressed root f/s because init_mtd() does not r egister block device! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Feb 2001 08:22:47 +0000
Message-ID: <20729.982916567@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  Also, as far as reading goes, there is no real difference between the
> mtd0 device and the block device (i.e. reading from mtd0 does not get
> you anything extra).

Except that the block device is quite a lot of unnecessary overhead (and a 
kernel thread, etc.). Reading directly from the MTD device rather than 
through either the blockdevice or chardevice would be nicer. 

Actually, for 2.4 I'd like to be able to extract a tarball from an MTD 
device directly into ramfs rather than ramdisk. CONFIG_BLK_DEV=n


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
