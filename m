Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140VYi-0000f3-00
	for mtd-list@infradead.org; Mon, 27 Nov 2000 21:11:32 +0000
Received: from blackdog.wirespeed.com ([208.170.106.25])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140VYg-0000ex-00
	for mtd@infradead.org; Mon, 27 Nov 2000 21:11:31 +0000
Received: from seado (dhcp-21.wirespeed.com [172.16.17.21])
	by blackdog.wirespeed.com (8.9.3/8.9.3) with SMTP id PAA11661
	for <mtd@infradead.org>; Mon, 27 Nov 2000 15:09:23 -0600
From: "Louis Hamilton" <hamilton@redhat.com>
To: <mtd@infradead.org>
Subject: Boot EBSA285 using root filesystem stored in flash
Date: Mon, 27 Nov 2000 15:10:53 -0600
Message-ID: <001601c058b6$8792f060$151110ac@seado.wirespeed.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I'm looking for information on moving our root filesystem (currently NFS
mounted
on a Linux host box) to flash memory on our EBSA285 (sa110) development
card.

We would like to eliminate the step where the kernel uses NFS to mount the
filesystem and instead boot the target using a filesystem stored in flash.

Do you know of any write-ups, urls, etc. to help achieve this goal?
I expect the MTD subsystem would (or could) be an important piece to
solving the puzzle.

thanks,
  -Louis

Louis Hamilton
Red Hat, Inc.
hamilton@redhat.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
