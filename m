Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141X57-0007KH-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 17:01:13 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141X56-0007KB-00
	for mtd@infradead.org; Thu, 30 Nov 2000 17:01:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F1FC@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F1FC@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: inter-module-2.2.17 patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Nov 2000 17:01:05 +0000
Message-ID: <9315.975603665@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
> 
> 	I'm still getting link errors (down to only one, though). Now it
> can't find cfi_cmdset_0002 for check_cmd_set.
> 	drivers/mtd shows a cfi_cmdset_0002.o and CONFIG_MTD_CFI_AMDSTD is
> set to yes in .config.
> 	What the heck is going on? 

Superfluous 'static' in declaration of cfi_cmdset_000[12]()

Fixed in CVS.

Have you taken a baseball bat to your firewall admin yet? Time to see your 
manager and tell him it's affecting your productivity, because it's 
preventing you from getting code fixes as soon as they're available.
:)


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
