Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rhjm-00069l-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 15:54:50 +0100
Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rhjk-00069f-00
	for mtd@infradead.org; Mon, 23 Apr 2001 15:54:49 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: "Alex Lennon" <ajlennon@arcom.co.uk>
Subject: RE: Elan SC520 - problem with MTD
Date: Mon, 23 Apr 2001 16:43:00 +0200
Content-Type: text/plain
References: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk>
In-Reply-To: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk>
Cc: <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01042316543802.01109@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 23 Apr 2001 you wrote: 
> I'm looking at this myself at the moment - the simplest solution is to
> perform the hook,
> load a zImage into low mem and let the Linux startup code handle the nasty
> protected
> mode bits 'n' pieces. Works fine for me under 2.2. Unfortunately I really
> can't seem to
> manage to get 2.4 down to < 500Kb so I need bzImage which means that - yes -
> there is some protected mode support required. Alternatively it might be
> possible to
> throw the kernel up to 0x100000 using 32-bit real mode. I need to check on
> this....

If you're interested in this kind of stuff, have a look at our GPLed ROM loader.

ftp://ftp.sysgo.de/pub/elinos/1.0/updates/rolo_1.1_src.tar.gz

It loads a bzimage using 32-bit real mode. It is written mostly in C, but it
doesn't compile  with gcc (you need bcc). 

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
