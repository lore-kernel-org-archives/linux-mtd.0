Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hYTz-0002TP-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 16:00:35 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hYTx-0002TJ-00
	for mtd@infradead.org; Mon, 26 Mar 2001 16:00:33 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: <mtd@infradead.org>
Subject: (Physmap-)design question
Date: Mon, 26 Mar 2001 17:00:23 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFKEGFEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <6291.985611452@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

I've just a little question: While looking around the mtd directory i found
a couple of drivers which a basically all the same. More or less the same
than physmap.c. The only things that are different are size, offset and if
availible the partititions and bank informations.

As i have to write a driver which supports our hardware out of the box i
wondered wether its the best way. There a two solutions for this problem:

a) Putting all drivers together into one file and do some ifdef's
b) Putting together a common file which holds all common stuff and a
hardware specific file which only consits of the size, offset, ...
definitions.

What do you think (David)?

Thanks a lot
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
