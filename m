Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nK1Q-0005Yi-00
	for mtd-list@infradead.org; Wed, 11 Apr 2001 13:46:56 +0100
Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nK1H-0005Yb-00
	for mtd@infradead.org; Wed, 11 Apr 2001 13:46:54 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: "Alexander Melichenko" <AlexanderM@lrpeople.com>
Subject: Re: Elan SC520 - problem with MTD
Date: Wed, 11 Apr 2001 14:22:59 +0200
Content-Type: text/plain
References: <00ae01c0c24e$5b566480$4d02010a@lrpeople.com>
In-Reply-To: <00ae01c0c24e$5b566480$4d02010a@lrpeople.com>
Cc: <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01041114460500.00396@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mit, 11 Apr 2001 you wrote:
> We use Elan SC520 CDP Rev.1.3.
> I have linux-2.2.18 (on hard drive) with MTD support. I use MTD MAKEDEV script to make MTD devices. I want to place kernel image into flash. But when I do 
>   #cat zFlashImage > /dev/mtd0
> I see the message : bash: /dev/mtd0: No such device
>  
> During booting I see following messages :
> AMD Elan SC520 flash mapping: 1000000 at 4800000 
> mapped physical memory to c4800000
> Elan SC520 Physically mapped flash: Found no CFI device at location zero
> JFFS version 1.0, (C) 1999, 2000 Axis Communications AB
> 
> When I inspect directory /proc  I see 2 (!!!) files mtd with no information about MTD devices.
>  
> How can I solve this problem?

Which mapping module are you using ?

There is one specifically designed for the SC520 CDP in the current MTD CVS.
It works fine on my (rev1.2) board. 

Cheers

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
