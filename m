Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FONV-0008A0-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 00:05:46 +0100
From: Simon Evans <spse@secret.org.uk>
To: Felix Radensky <felix@allot.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Block device as MTD 
In-reply-to: Your message of "Wed, 27 Jun 2001 09:49:39 +0300."
             <3B398202.CC5B6125@allot.com>
Date: Wed, 27 Jun 2001 23:03:14 +0100
Message-Id: <E15FNP2-0000LQ-00@spoinky.secret.org.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

Basically it wont work. blkmtd isnt actually a driver more a translation
layer. If you want to talk to CF cards directly, you'll have to write an
MTD driver for it. I dont know much about CF cards as I have always used
them as IDE drives, but you may want to look at the PCMCIA utils memory_cs
driver. I think CF cards can appear as regular PCMCIA flash memory cards
until a bit is enabled that puts them into IDE mode. 

I tried a test once using the memory_cs driver on a CF and whilst it
gave me some memory regions, they werent the correct size. Basically,
you'll have to do some hacking around on the driver to get it to work
but I dont know where to find specs for CF cards.

the PCMCIA stuff is at http://pcmcia-cs.sourceforge.net/

My next project is to write an MTD driver for PCMCIA flash cards
(not CF) and if I get that working, im going to try and have a go at
CF after that.

cheers
si

>Hi,
>
>We have CF slot on our board, but no IDE controllers. Can I still use your
>blkmtd.c driver to access CF ? If not, what approach should I take to
>utilize
>CF (adding IDE controller is not an option) ?
>
>Thanks in advance.
>
>Felix.
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
