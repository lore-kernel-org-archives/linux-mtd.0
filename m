Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j3CY-0000eV-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 19:00:46 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j3CX-0000eO-00
	for mtd@infradead.org; Fri, 30 Mar 2001 19:00:45 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "=?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?=" <kd@flaga.is>,
	<mtd@infradead.org>
Subject: AW: partitions and erase regions
Date: Fri, 30 Mar 2001 20:00:09 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFMEHEEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E3108B012@kolkrabbi.flaga.is>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>Since there was no protest I just went ahead and commited the "virtual"
>erase region
>patch to mtdpart.

Just a short question :-)

Situation:

2 partitions not aligned to erase sectors. The first jffs and the second
cramfs. What happens if jffs writes to the last sector (the shared one) and
just in the second the block was erased the power fails. Data loss on the
second partition?

If so please make virtual support a selectable option in kernel config. (If
not already)

Thanks
  Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
