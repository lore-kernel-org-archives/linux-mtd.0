Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197WBH-0000wa-Tc
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 08:57:40 +0100
Received: from there (203-96-48-242-tollfree.actrix.co.nz [203.96.48.242])
	by blood.actrix.co.nz (Postfix) with SMTP id 7C7F641AC
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Apr 2003 19:57:46 +1200 (NZST)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Mon, 21 Apr 2003 19:58:36 +1200
MIME-Version: 1.0
Message-Id: <20030421075746.7C7F641AC@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 8bit
Subject: nand_ecc error in byte order?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I've been dabbling with ECCs a bit today and discovered something that looks 
to me like an error in nand_ecc.c.

I think I recall someone mentioning this before, but could not find an email 
to this effect.

The code implements the parity generation/correction algorithms used for 
SmartMedia. However, unless I got it wrong, the byte ordering of the ecc_code 
array is not the same as used in SmartMedia.

In SmartMedia (according to specs and code from Samsung), the byte ordering 
is:

byte 0: low byte of line parity.
byte1: high byte of line parity
byte2:column parity

nand_ecc.c seems to me to generate:
byte 0: high byte of line parity.
byte1: low byte of line parity
byte2:column parity

Clearly this is not a problem if the same ECC generator gets used all the 
time. However, it will be a problem if they are mixed.

Assuming I'm not seeing ghosts, and this is a real problem, do we fix the 
problem (to be consistent with SmartMedia) or retain the status quo (to not 
break legacy mtd)?

-- Charles
