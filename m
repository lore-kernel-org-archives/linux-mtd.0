Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwGHc-0004k5-Qh
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 03:54:48 -0500
Date: Wed, 2 Feb 2005 09:54:41 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050202085441.GB3063@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: I need still help with XIP, kernel boots now :)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Ok, seems to be it is debug time :)

I have a BDI2000 here, but I never used it to debug a running kernel, I
should learn that now :/

I am trying to look ATM if the __xipram using functions went into .data
but I doubt that, since the compiler issues a warning at just this
point, so I asked in my initial mail if thats not only a warning for me
:)

In System.map there are 

bf112a8c t xip_disable
c0014e14 d xip_enable
c0014f78 d xip_udelay

I did an arm-linux-objdump -ad and searched for the addresses, but only
I find the xip_disable address:

bf112a8c <xip_disable>:
bf112a8c:	e1a0c00d 	mov	ip, sp

not the address of xip_enable and xip_udelay...

How can that be?

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
