Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13AA04-0005yj-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 12:39:24 +0100
Received: from ncc2.infomail.es ([194.224.53.135] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13AA03-0005yZ-00
	for mtd@infradead.org; Thu, 06 Jul 2000 12:39:23 +0100
Date: Thu, 06 Jul 2000 13:36:20 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: mtd@infradead.org
Subject: Re: Re: plilo problems
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E13AA03-0005yZ-00@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi all!

Well, first of all, I'd like to thank you all for your help. I owe you a
beer (or two)!

> Hi Rodrigo,
> 
> You need the patched lilo provided by Dvir Oren which he patched to work
> with
> either M-Systems or MTD DOC drivers, which I've attached.
> Decompress it (tar -zxvf...) and you should have a boot.b and a plilo
> that
> will work. Also you'll have a patch that you can apply to LILO-21 to
> re-create
> plilo (and it works!)
> 
Now everything seemed to work when running lilo. I then boot from DOS, run
dupdate to update the firmware, and tried to boot from Linux, but, this is
what I get:

> Searching for Boot Record from SCSI..OK
> 
> LILO
> .ccboot:
> Loading linux.........................

and it hangs there. What do you think about it?

Cheers


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
