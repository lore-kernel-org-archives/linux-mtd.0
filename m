Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 146e6y-0005Ee-00
	for mtd-list@infradead.org; Thu, 14 Dec 2000 19:32:16 +0000
Received: from cr53988-a.rchrd1.on.wave.home.com
	([24.112.95.30] helo=thegravitywell.dhs.org ident=michealk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 146e6x-0005EY-00
	for mtd@infradead.org; Thu, 14 Dec 2000 19:32:15 +0000
From: Micheal Kelly <michealk@thegravitywell.dhs.org>
Reply-To: michealk@thegravitywell.dhs.org
Date: Thu, 14 Dec 2000 14:28:43 -0500
Content-Type: text/plain;
  charset="us-ascii"
To: David Vrabel <dvrabel@arcom.co.uk>, mtd@infradead.org
References: <3A38EC28.9EDC59BF@arcom.co.uk>
In-Reply-To: <3A38EC28.9EDC59BF@arcom.co.uk>
Subject: Re: JFFS: deleted files still appear in directory
MIME-Version: 1.0
Message-Id: <00121414284302.01222@morpheus.espial.com>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi David,

I'm seeing the same thing with kernel 2.4.0-test12-pre7.  I haven't dug into 
the code yet, as I've gotten sidetracked on other things...  I'll probably 
get around to looking at it on Monday.


- Mike K.

--------------------------------------------------
Micheal Kelly
Espial Inc.

On Thursday 14 December 2000 10:50, David Vrabel wrote:
> Hi,
>
> I'm using the lastest CVS MTD+JFFS with kernel 2.2.18 with the following
> result:
>
> # ls
> # touch j
> # rm j
> # ls
> ls: ./j: No such file or directory
>
> It appears that readdir() (?) thinks the files exists put stat(), open()
> etc. do not.
>
> David Vrabel
>
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
