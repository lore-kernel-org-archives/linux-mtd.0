Received: from outbound-mail-35.bluehost.com ([69.89.18.155])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L3CvI-0004RJ-J7
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 17:02:33 +0000
Received: from 208.123.189.57.dynamic.dejazzd.com ([208.123.189.57]
	helo=hp-dhlii.dlasys.lcl)
	by host200.hostmonster.com with esmtpa (Exim 4.69)
	(envelope-from <dhlii@dlasys.net>) id 1L3CvC-00062Q-RH
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 10:02:27 -0700
Message-ID: <4925981F.2000509@dlasys.net>
Date: Thu, 20 Nov 2008 12:02:23 -0500
From: "David H. Lynch Jr." <dhlii@dlasys.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: cfi_probe geometry problem
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Reply-To: dhlii@dlasys.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    I am having difficulty getting cfi_probe working for the flash in my
board.

    I am trying to complete a map driver for Spansion S29GL512N NOR
flash in Pico cards.
    The flash shared between two CPU's so a mapping driver is required
to enable and disable it.

    I have most of the driver code working and after setting up data
structures in probe I can issue a QRY as

    d.x[0] = 0xf0;
    (map->write) (map, d, 0);
    d.x[0] = 0xff;
    (map->write) (map, d, 0);
    d.x[0] = 0x98;
    (map->write) (map, d, 0x55);
    pico_flash_copy_from(map, &buf, 0 , 64);
    if(buf[0x20] != 'Q' && buf[0x22] != 'R' && buf[0x24] != 'Y')
        DBG("Flash Error QRY failed\n");
    else
        DBG("Flash QRY %d\n");

    However cfi_probe fails. this seems to be some type of geometry
issue. When I watch CFI probe it either sends the query request to the
wrong addresses, or it checks the wrong addresses for the results.

    A clue would be appreciated.

 
   



-- 
Dave Lynch 					  	    DLA Systems
Software Development:  				         Embedded Linux
717.627.3770 	       dhlii@dlasys.net 	  http://www.dlasys.net
fax: 1.253.369.9244 			           Cell: 1.717.587.7774
Over 25 years' experience in platforms, languages, and technologies too numerous to list.

"Any intelligent fool can make things bigger and more complex... It takes a touch of genius - and a lot of courage to move in the opposite direction."
Albert Einstein
