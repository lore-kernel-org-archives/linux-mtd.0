Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pVtL-0000Xu-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 14:51:39 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Elan SC520 - problem with MTD
Date: Tue, 17 Apr 2001 15:42:31 +0200
Content-Type: text/plain
References: <002901c0c310$aa21aa80$4d02010a@lrpeople.com> <01041114460500.00396@rob> <19294.987514727@redhat.com>
In-Reply-To: <19294.987514727@redhat.com>
Cc: "Alexander Melichenko" <AlexanderM@lrpeople.com>, mtd@infradead.org
MIME-Version: 1.0
Message-Id: <01041715513200.02005@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Die, 17 Apr 2001 you wrote:
> AlexanderM@lrpeople.com said:
> > I used e520.c (from AMD site), but after your letter I found that
> > sc520cdp.c there is on CVS. I plan probing it today. Thank You very much.
> 
> What's the difference between the one in CVS and the one from AMD, other 
> than the 'interesting' licence on the latter?

>From a brief look at it, I'd say that it is intended for AMD's "Net520" eval
board, not the SC520 CDP. The addresses it uses to access Flash are not
valid on the SC520 CDP, (at least not with the configuration established by the
General Software BIOS that the board comes with).

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
