Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xall-0002OJ-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 19:04:25 +0000
Received: from [205.230.20.78] (helo=kona.xsilogy.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xalj-0002OD-00
	for mtd@imladris.mvhi.com; Mon, 13 Dec 1999 19:04:23 +0000
Message-ID: <001501bf459d$5ad20ac0$6600160a@isidesign.com>
From: "Jon Burford" <jburford@xsilogy.com>
To: "Adi Linden" <adi@adis.on.ca>
Cc: "Vipin Malik" <vmalik@danielind.com>, "MTD" <mtd@imladris.mvhi.com>
References: <Pine.LNX.4.10.9912130848130.3723-100000@localhost.localdomain>
Subject: Re: [Fwd: power down]
Date: Mon, 13 Dec 1999 11:07:51 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I would have NEVER thought of that!  Too bad I need to write to this
partition (as detailed in the rest of my message that you did not include
here).  I have a database on board which needs persistent storage.  And yes,
I have thought of the previously mentioned options of running everything in
ramdisk and periodically moving files to the flash.  Of course, odds say
this is less susceptible to corruption, but I don't have enough ram (I am
using the biggest SIMM my board will take already) for this.

-Jon


----- Original Message -----
From: Adi Linden <adi@adis.on.ca>
To: Jon Burford <jburford@xsilogy.com>
Cc: Vipin Malik <vmalik@danielind.com>; MTD <mtd@imladris.mvhi.com>
Sent: Monday, December 13, 1999 6:49 AM
Subject: Re: [Fwd: power down]


>
> > I mount the DOC2000 on /usr, but write only to the logs and db files (I
have
> > 'chattr i' on all other files in /usr).  What I would like to get an
opinion
> > on is:
>
> If you mount the doc2000 on /usr and have evrything else in ramdisk,
> perhaps mount /usr read-only. It won't corrupt that way.
>
> TTYL,
> Adi
>
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
