Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qDYE-0007p0-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 13:28:46 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qDYD-0007ou-00
	for mtd@infradead.org; Thu, 19 Apr 2001 13:28:45 +0100
Message-ID: <001a01c0c8d1$143aece0$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: <joakim.tjernlund@lumentis.se>,
	"'Vipin Malik'" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
References: <000801c0c8bb$44e56de0$0a01a8c0@Win1>
Subject: Re: JFFS2 as root FS
Date: Thu, 19 Apr 2001 15:02:16 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hallo!

> By adding /dev/mtdblock1 to init/main.c I managed to make Linux recognize
> my root FS on mtdblock1 :-)
>
> Now I am having some other problems :-(
> First it takes about 1 min 30 sec to mount my root FS. Is that expected? I
> was hoping for a much shorter
> mount time, 10-20 sec

Did you try to mount the flash again under linux? We had a problem with the
endianess some time ago and run into the same trouble as you did. Mounting
took a long time and after that the flash was completely empty. Files cound
be moved onto it, but as soon as you re-mounted the flash it was empty
again. Try if this happens to you too.

I know its a wild guess but maybe it helps!

Happy hacking
   Florian



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
