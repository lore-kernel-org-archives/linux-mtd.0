Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143ECl-0007fG-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 09:16:07 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143ECk-0007fA-00
	for mtd@infradead.org; Tue, 05 Dec 2000 09:16:06 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200012050154.LAA16910@singularity.tronunltd.com> 
References: <200012050154.LAA16910@singularity.tronunltd.com> 
To: "Ian" <Relativity@HumanHeuristic.com>
Cc: ollie@sis.com.tw, mtd@infradead.org, linuxbios@lanl.gov
Subject: Re: Problems with r/w on mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Dec 2000 09:15:44 +0000
Message-ID: <7809.976007744@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Relativity@HumanHeuristic.com said:
> I am a scumbag.  I have just re-run it up as modules and redone my
> test, and the data *is*  sticking .. and *is* surviving reboots.  I
> have no idea how it failed my previous test  (considering I'm using
> the same test scripts and configs).

The way I normally program stuff into the DiskOnChip is with the 
'doc_loadbios' program - which uses the character device, does MEMERASE 
ioctls to make room for the image you tell it to load, then writes the 
image.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
