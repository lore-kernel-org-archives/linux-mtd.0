Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rgk1-0005Sq-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 14:51:01 +0100
Received: from mailserver.arcom.co.uk ([194.200.159.162])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rgjp-0005Sk-00
	for mtd@infradead.org; Mon, 23 Apr 2001 14:50:49 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: <rob@sysgo.de>,
	"Alexander Melichenko" <AlexanderM@lrpeople.com>
Cc: <mtd@infradead.org>
Subject: RE: Elan SC520 - problem with MTD
Date: Mon, 23 Apr 2001 14:45:08 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEIEJJCJAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <01042312512000.00451@rob>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>> However, if you want to get rid of the BIOS, you have to write your own
startup
>> code for the board, which is not a trivial task. Actually, I'm currently
>> working on something like that, but it is not ready for release yet and
I'm
>> making only slow progress as I have about a hundred other things to do.
>> However, I believe, Vipin Malik has gotten this to work for himself.
Maybe if
>> you ask him nicely...

I this BIOS compressed ? If not you should be able to write a simple BIOS
extension
to hook INT13h or INT19h. Then when your BIOS proper executes the interrupt
your
custom BIOS extension code loads your kernel out of linear flash - or do you
see a
problem with this approach ?

Regards,

	Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
