Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SeBL-0006Gm-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 12:03:43 +0000
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SeBK-0006Gg-00
	for mtd@infradead.org; Tue, 13 Feb 2001 12:03:42 +0000
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id NAA18929
	for <mtd@infradead.org>; Tue, 13 Feb 2001 13:03:01 +0100 (MET)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <mtd@infradead.org>
Subject: Boot flash
Date: Tue, 13 Feb 2001 13:03:34 +0100
Message-ID: <002b01c095b4$fe0387b0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all

I want to use JFFS on a custom made PPC860 board. This board will have NOR
flash memory(Intel) and will probably use ppcboot(suggestions for better
boot loader welcome).
Can I have ppcboot share a flash device with JFFS?

something like this:

  FLASH device 1:
  -------------------------  address 0
  |  ppcboot              |
  |-----------------------|
  |  linux kernel         |
  |-----------------------|
  |  start of JFFS        |
  |                       |
  |                       |
  |                       |
  |                       |
  -------------------------
  FLASH device 2:
  -------------------------
  |   JFFS continued      |
  |                       |
  |                       |
  |                       |
  |                       |
  |                       |
  |                       |
  |                       |
  |                       |
  -------------------------

ppcboot starts after a reset, loads the linux kernel image. The linux kernel
expects to find JFFS at some offset(compiled into JFFS) in the flash device.

Is this possible or do I need an extra boot flash where ppcboot and linux
kernel goes?

        Jocke



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
