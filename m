Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qJ40-0003HR-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 19:21:56 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Elan SC520 - problem with MTD
Date: Thu, 19 Apr 2001 20:11:18 +0200
Content-Type: text/plain
References: <3ADC73B1.1960BC87@daniel.com> <5360.987524764@redhat.com> <10578.987545795@redhat.com>
In-Reply-To: <10578.987545795@redhat.com>
Cc: Vipin Malik <vipin.malik@daniel.com>,
        Alexander Melichenko <AlexanderM@lrpeople.com>, mtd@infradead.org,
        mark.langsdorf@amd.com
MIME-Version: 1.0
Message-Id: <01041920213500.03722@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi David,

On Mit, 18 Apr 2001 you wrote:
> I think I'm just going to stick my head in the sand on this one and accept 
> what I'm given. It's just a leafnode driver, and I really can't keep 
> track of them all unless they're doing something particularly naughty.

FYI, I have just checked in a new version of the sc520cdp.c mapping that
does the PAR reprogramming as suggested by Vipin. The old behavior (i.e.
keep the weird mapping setup by the BIOS) is still available by commenting
out a single line. (I decided against a config option for this).

Cheers

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
