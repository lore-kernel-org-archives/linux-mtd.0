Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aHqW-0000KU-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 13:49:48 +0000
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Using mtdblock as root device
Date: Tue, 6 Mar 2001 14:37:48 +0100
Content-Type: text/plain
References: <01030613110600.01913@rob> <7121.983884306@redhat.com>
In-Reply-To: <7121.983884306@redhat.com>
Cc: <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01030614494400.02338@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

On Die, 06 Mär 2001 you wrote:
> It's been submitted many many times. If you do submit it again, please add 
> nftl[bcd] and ftl[abcd] too, and I don't think you actually need anything 
> more than
> 	{"mtdblock", 0x1f00},
> 
> for the mtdblock devices, because they're handled just like partitions.

Hmm, I for one have two mtd devices on my platform, both of which I'd like
to be able to use as root device. But I agree that 16 is probably a bit
overkill. How about:

	{"mtdblock0", 0x1f00},
	{"mtdblock1", 0x1f01},
or:
	{"mtdblock", 0x1f00},
	{"mtdblock0", 0x1f00},
	{"mtdblock1", 0x1f01},

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
