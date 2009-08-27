Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgYmq-0001MG-3m
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 06:48:55 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KP000MPEVQ96C@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 15:37:21 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KP0005YNVQ6K6@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 15:37:21 +0900 (KST)
Date: Thu, 27 Aug 2009 12:07:45 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
To: Artem Bityutskiy <dedekind1@gmail.com>
Message-id: <6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
Cc: dedekind@infradead.org, David Woodhouse <dwmw2@infradead.org>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Re-implemented OTP support for OneNAND
>> Added following features to OneNAND
>> 1. Lock only 1st Block in OneNAND
>> 2. Lock BOTH 1st Block and OTP Block in OneNAND
>
> -ENOPARSE
>
> Large patches like this normally require good explanations of what is
> done, why it is done, which problem it solves, how it is done, etc.
>

What is OTP in OneNAND?
The device includes,
1. one block-sized OTP (One Time Programmable) area and
2. user-controlled 1st block OTP(Block 0)
that can be used to increase system security or to provide identification capabilities.

What is done?
In OneNAND, one block of the NAND Array is set aside as an OTP memory area, and 1st Block (Block 0) 
can be used as OTP area.
This area, available to the user, can be configured and locked with secured user information.
The OTP block can be read, programmed and locked using the same operations as any other NAND Flash 
Array
memory block. After issuing an OTP-Lock, OTP block cannot be erased. OTP block is fully-guaranteed 
to be a valid block.

Why it is done? (Impact)
Locking the 1st Block OTP has the effect of a 'Write-protect' to guard against accidental 
re-programming of data stored in the 1st block and OTP Block.

Which problem it solves?
OTP support is provided in the existing implementation of OneNAND/Flex-OneNAND driver, but it is not 
working with OneNAND devices.
Have observed the following in current OTP OneNAND Implmentation,
1. DataSheet specific sequence to lock the OTP Area is not followed.
2. Certain functions are quiet generic to cope with OTP specific activity.
This patch re-implements OTP support for OneNAND device.

How it is done?
For all blocks, 8th word is available to the user.
However,in case of OTP Block, 8th word of sector 0, page 0 is reserved as OTP Locking Bit area.
Therefore, in case of OTP Block, user usage on this area is prohibited.
Condition specific values are entered in the 8th word, sector0, page 0 of the OTP block during the 
process of issuing an OTP-Lock.
The possible conditions are:-
1. Only 1st Block Lock
2. Only OTP Block Lock
3. Lock both the 1st Block and the OTP Block

What feature additions have been done in this patch?
This patch adds feature for:-
1. Only 1st Block Lock
2. Lock both the 1st Block and the OTP Block 
