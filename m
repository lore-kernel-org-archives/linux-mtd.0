Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13TXLG-0006Kp-00
	for mtd-list@infradead.org; Mon, 28 Aug 2000 23:25:22 +0100
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: Ciro Cattuto <ciro@prosa.it>
Date: Mon, 28 Aug 2000 19:24:09 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: GRUB on DOC: 2Mb issues
Reply-to: miguel@cetuc.puc-rio.br
CC: mtd@infradead.org, David Woodhouse <dwmw2@infradead.org>
In-reply-to: <20000828185018.A2777@localhost>
Message-ID: <129C7B9418F@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On 28 Aug 00, at 18:50, Ciro Cattuto wrote:

> Also, doc_stage1.S doesn't support the
> addressing scheme needed for 2Mb DOCs, so I had to make a few
> modifications to make it load GRUB-stage2.

   I haven't tried your modifications yet, but IMHO it looks right. The  
doc_stage1 should work on both 256 and 512 paged devices without 
any conditionals. The loop will send a READ0 command, set 
address such as column(byte)=0 and page(word)=counter++ and 
read 256 bytes. Of course stage2 needs to be written as described 
in mtd/grub/README.
   It may also be a good idea to send an additional address byte 
zero for compatibility with >= 64Mb chips. Datasheet of 2MB says 
this additional byte would be ignored, but I need to check for all 
other chips.

> The relevant cvs diffs follow. Notice: these mods make doc_stage1.S and
> makecsum.c work _only_ for 2Mb DOCs! I'd like to merge this functionality
> into the existing code, but I'll wait for your feedback. I'd use a simple
> "#ifdef DOC_PAGE256" both in doc_stage1.S and makecsum.c, but in the long
> run it would be nice to be able to access the page256 flag
> (mtd->priv->page256) from userland (page256 in mtd_info_user?).

   I don't really like userland tools (eg. makecsum or doc_loadbios) 
taking care of such details as addressing mechanism of nand chips. 
I guess it would be better to create an ioctl called "loadbios" and 
handle that odditys inside the kernel driver. If page256==1, just write 
the 8kb image. If page256==0, write 512 byte pages padding with 
0xff the unused bytes.


Regards,

Miguel Freitas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
