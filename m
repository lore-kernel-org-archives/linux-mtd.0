Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14naV2-0004kj-00
	for mtd-list@infradead.org; Thu, 12 Apr 2001 07:22:36 +0100
Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14naV0-0004kd-00
	for mtd@infradead.org; Thu, 12 Apr 2001 07:22:35 +0100
Message-ID: <002901c0c310$aa21aa80$4d02010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: <rob@sysgo.de>
Cc: <mtd@infradead.org>
References: <00ae01c0c24e$5b566480$4d02010a@lrpeople.com> <01041114460500.00396@rob>
Subject: Re: Elan SC520 - problem with MTD
Date: Thu, 12 Apr 2001 09:23:10 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Robert Kaiser wrote:
> Which mapping module are you using ?
>
> There is one specifically designed for the SC520 CDP in the current MTD
CVS.
> It works fine on my (rev1.2) board.
>
> Cheers
>
> Rob
>

I used e520.c (from AMD site), but after your letter I found that sc520cdp.c
there is on CVS.
I plan probing it today. Thank You very much.

Alexander Melichenko
LiveRepair.com Inc.
email: AlexanderM@lrpeople.com






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
