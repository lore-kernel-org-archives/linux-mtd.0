Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mz9a-0006NM-00
	for mtd-list@infradead.org; Wed, 03 May 2000 14:25:26 +0100
Received: from ncc3.infomail.es ([194.224.53.142] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12mz9Z-0006NG-00
	for mtd@infradead.org; Wed, 03 May 2000 14:25:25 +0100
Date: Wed, 03 May 2000 15:26:42 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: mtd@infradead.org
Subject: next step
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E12mz9Z-0006NG-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Hi all!

After my problems compiling, I've successfully compiled all the MTD files,
and now I boot my system from the zip drive and I can even 'fdisk
/dev/nftla'.

So, now I have to put the system in the zip drive into the DOC. What steps
do I need? I've been thinking about:

fdisk /dev/nftla -> and create a unique partition for linux
dd if=/dev/sda4 of=/dev/nftla1
/sbin/lilo -> should I use the patched LILO I suppose?

But I'd like to have your opinion before doing so. Is there any other thing
I must do?

Another thing: it is impossible for me to subscribe to the mailing list
with my new email address. I always get a response like the following:

>>>>>>>>>>>>>>>>>>>>>>>>>>
The original message was received at Wed, 3 May 2000 06:14:40 -0700
from 57222.rad.tsai.es [194.224.57.222]

   ----- The following addresses had permanent fatal errors -----
<majordomo@infradead.org>

   ----- Transcript of session follows -----
.. while talking to imladris.infradead.org.:
>>> RCPT To:<majordomo@infradead.org>
<<< 550-above.net has multiple open relays and has blocked the ORBS tester.
<<< 550 mail from 208.184.88.8 rejected: administrative prohibition
550 <majordomo@infradead.org>... User unknown
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

The same happens when sending mail directly to David. I don't know if it's
my fault or not, any idea?

Cheers


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
