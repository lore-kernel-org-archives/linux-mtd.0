Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j4e8-00013A-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 20:33:20 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j4e5-000134-00
	for mtd@infradead.org; Fri, 30 Mar 2001 20:33:17 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Tim Bowman" <tbowman@emware.com>,
	"mtd mailing list" <mtd@infradead.org>
Subject: AW: RPX Classic/Lite and byte ordering
Date: Fri, 30 Mar 2001 21:32:43 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFAEHGEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3AC4C5D9.13DACBF5@emware.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>I am having trouble with an Embeddded Planet RPX board.  The mtd layer
>seems to be reversing the data by double words.  If I write (then cat)
>some text, every double word is reversed.  I can use a cramfs file
>system, but I have to reverse the dwords myself before writing it to
>flash, then everything works fine.  JFFS and other file systems
>obviously don't work, since the data is written by mtd in the wrong
>order.  I am doing everything on big-endian machines (PowerPC).
>
>If someone can point me to the right code I would be glad to work on
>this.

Did you upgrade to the latest cvs code? If not try this first. If you
already have the latest code then play with the endian options under the cfi
advanced settings in the kernel config.

PPC works very here.

Hope that helps
  Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
