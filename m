Received: from enigma.barak.net.il ([212.150.48.99])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16XMYQ-0003vo-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Feb 2002 13:19:34 +0000
Received: from gad ([10.10.11.11]) by enigma.barak.net.il
          (InterMail vK.4.03.00.00 201-232-121 license 5444ddd44659357c6c93343e0ce38507)
          with SMTP id <20020203133111.MZFW1829.enigma@gad>
          for <linux-mtd@lists.infradead.org>;
          Sun, 3 Feb 2002 15:31:11 +0200
Message-ID: <087b01c1acb6$ea583840$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Subject: where is the flash map for nanoEngine (especially for Nico)
Date: Sun, 3 Feb 2002 15:30:15 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

i use the mtd cvs from about 15/01/2002
and there in no definition for nanoEngine in drivers/mtd/maps/sa1100-flash.c
(offcourse after patchin.sh is done)
heres' the file header:

/*
 * Flash memory access on SA11x0 based devices
 *
 * (C) 2000 Nicolas Pitre <nico@cam.org>
 *
 * $Id: sa1100-flash.c,v 1.23 2002/01/01 23:26:07 rmk Exp $
 */

why ?

Gad
