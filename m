Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14psVv-0005Po-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 15:00:59 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Elan SC520 - problem with MTD
Date: Wed, 18 Apr 2001 15:50:43 +0200
Content-Type: text/plain
References: <3ADC62AE.66B350ED@daniel.com> <22300.987516491@redhat.com> <5360.987524764@redhat.com>
In-Reply-To: <5360.987524764@redhat.com>
Cc: Vipin Malik <vipin.malik@daniel.com>,
        Alexander Melichenko <AlexanderM@lrpeople.com>, mtd@infradead.org,
        mark.langsdorf@amd.com
MIME-Version: 1.0
Message-Id: <01041816004001.00407@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Die, 17 Apr 2001 you wrote:
> OK, so it's likely that the two drivers use different addresses just 
> because they expect the board to have been set up differently? 

[Assuming by the "two drivers" you mean the e520.c file by AMD and my
 sc520cdp.c in MTD CVS]

Probably not: The e520.c expects the flash at physical address 0x2000000,
where the SC520 CDP board potentially has RAM.

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
