Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wh8d-0002UM-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 08:44:51 +0000
Received: from mail.auriga.ru ([213.24.253.102])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wh8c-0002UG-00
	for mtd@infradead.org; Fri, 17 Nov 2000 08:44:50 +0000
Message-ID: <3A14EFF6.EE574112@auriga.ru>
Date: Fri, 17 Nov 2000 11:44:38 +0300
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: Peter De Schrijver <p2@portablue.linux-apollo.org>
CC: mtd@infradead.org
Subject: Re: MTD on intel 28F320B3 flash memory
References: <20001117005926.A829@portablue.linux-apollo.org>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Are you sure it's not CFI complaint?
I've been working with 28F640 which is CFI complaint and
is detected and operated by the existing code fairly well.
I believe the only difference between 28F640 and 28F320 is
that the latter is smaller. They are even described in a
single datasheet.

Nick

Peter De Schrijver wrote:

> Hi,
>
> Is this type of flash memory supported ? It seems to use the standard
> intel/sharp command set (command set #3), although it's not fully CFI
> compliant.
>
> Thanks,
>
> Peter.
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
