Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QAA9-0002Gq-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 15:36:13 +0000
Received: from [195.166.20.93] (helo=frumious.unidec.co.uk)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14QAA7-0002Gj-00
	for mtd@infradead.org; Tue, 06 Feb 2001 15:36:12 +0000
Received: from localhost (localhost [[UNIX: localhost]])
	by frumious.unidec.co.uk (8.11.0/8.11.0) id f16FZX908507
	for mtd@infradead.org; Tue, 6 Feb 2001 15:35:33 GMT
From: dr john halewood <john@frumious.unidec.co.uk>
To: mtd@infradead.org
Subject: Re: Maybe FAQ, but I don't know te answer...
Date: Tue, 6 Feb 2001 15:35:33 +0000
Content-Type: text/plain;
  charset="us-ascii"
References: <003c01c08fd2$db3d36a0$016310ac@archimede> <15502.981449891@redhat.com>
In-Reply-To: <15502.981449891@redhat.com>
MIME-Version: 1.0
Message-Id: <0102061535330I.29605@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tuesday 06 February 2001 08:58, David Woodhouse wrote:
> You can leave the original firmware in place, which makes it pretend to be
> a BIOS-supported hard drive. So you can use any bootloader, although some
> versions of LILO have problems with the amount of memory that the firmware
> eats.

 I found that lilo < 21.4 would hang at boot with a 24Mb DOC2000. 21.5&6 both 
work fine with it. And the one that shipped with RH7 didn't even get as far 
as hanging on one of my development boxes whilst the one in 6.2 was fine (for 
some reason I've got a 15Gb hard drive attached to it).

cheers
john

p.s. off-topic really: can anyone recommend a place to get DOCs from in the 
UK? The last lot I tried (who M-Sys put us in contact with) took about 3 
months to ship a single chip...


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
