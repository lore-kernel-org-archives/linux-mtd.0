Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aIQc-0000hW-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 14:27:06 +0000
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: Vipin Malik <Vipin.Malik@daniel.com>
Subject: RE: Using mtdblock as root device
Date: Tue, 6 Mar 2001 15:14:36 +0100
Content-Type: text/plain
References: <30724FF712DFD2119E6200104B2448920119745E@mail1>
In-Reply-To: <30724FF712DFD2119E6200104B2448920119745E@mail1>
Cc: David Woodhouse <dwmw2@infradead.org>, <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01030615265401.02401@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Die, 06 Mär 2001 you wrote:
> >Now my question is: is there any particular reason (other than "nobody
> >has told Linus") why this is not already in the standard kernel ?
> 
> 
> because it's easier to do a
> $rdev <your kernel image here> /dev/mtdblock0 before installing
> the kernel with lilo. You don't need to pass any root kernel
> line parameters then.

I'd say since the kernel does support a "root=..." option it might as well
support it for all possible devices rather than just a selection of them.

But that's probably a discussion to be held in linux-kernel.

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
