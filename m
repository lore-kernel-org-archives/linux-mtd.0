Received: from unix.worldpath.net ([206.152.180.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15x6OZ-0007eQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2001 13:47:31 +0100
Received: from toybox.demon.co.uk (dsl-199.worldpath.net [206.152.188.199]) by unix.worldpath.net (8.9.3/8.9.3(WPI)) with ESMTP id IAA04098 for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2001 08:56:47 -0400 (EDT)
Message-ID: <3BD95D89.4090701@technicaltoys.net>
Date: Fri, 26 Oct 2001 08:56:41 -0400
From: Derek Mulcahy <derek@technicaltoys.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD driver for Atmel serial flash
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi

I am developing an MTD driver for an Atmel serial flash.

The device has 264 byte pages and they can be erased and written 
individually.

I'm not sure what values to put in the mtd_info structure. I intend this 
to be used with JFFS2.

Currently I have

    mtd->name = "atmel";
    mtd->type = MTD_OTHER;
    mtd->flags = MTD_WRITEB_WRITEABLE | MTD_ERASEABLE | MTD_CLEAR_BITS | 
MTD_SET_BITS;
    mtd->size = 256 * 2048;
    mtd->read = serial_read;
    mtd->write = serial_write;
    mtd->sync = serial_sync;
    mtd->erase = serial_erase;
    mtd->erasesize = 256;

As you can see, I am hiding the extra 8 bytes per page from the MTD 
system, this makes the read/writes simpler.

An advice/pointers on the right way to do this would be much appreciated.

Cheers

Derek
