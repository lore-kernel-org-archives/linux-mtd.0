Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qDob-0007vm-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 13:45:41 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qDoU-0007vg-00
	for mtd@infradead.org; Thu, 19 Apr 2001 13:45:39 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'Florian Schirmer / TayTron'" <schirmer@taytron.net>,
        "'Vipin Malik'" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
Subject: RE: JFFS2 as root FS
Date: Thu, 19 Apr 2001 14:45:01 +0200
Message-ID: <000b01c0c8ce$8d5d3d10$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <001a01c0c8d1$143aece0$0d3318b5@jolt>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi, it's me again :-)

I have tried to mount the FS again and the files are still there.
It still takes 1 min and 30 sec to mount it and sometime when I do a ls the
system hangs
for 10-20 sec before the output from ls is seen. Is this normal?

Maybe I should change my kernel, but to which? Linux 2.4.3? Or maybe a later
kernel from the PPC tree?

Also, when I boot the kernel it stops and ask for a kernel cmdline. Usually
I press
return here and the boot continues with my default values. How can I make
the kernel bypass
this and start without any questions asked?

   Jocke

-----Original Message-----
From: Florian Schirmer / TayTron [mailto:schirmer@taytron.net]
Sent: Thursday, April 19, 2001 15:02
To: joakim.tjernlund@lumentis.se; 'Vipin Malik'
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS


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
