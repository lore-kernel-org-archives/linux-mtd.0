Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFOky-0007AO-Vj
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 00:20:33 -0400
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id F3546896F4D
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Sep 2005 14:20:09 +1000 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 23B83896F4D
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Sep 2005 14:20:09 +1000 (EST)
Message-ID: <4327A4F8.60300@magellan-technology.com>
Date: Wed, 14 Sep 2005 14:20:08 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
References: <43267172.20702@magellan-technology.com>
	<432691B7.5040804@magellan-technology.com>
In-Reply-To: <432691B7.5040804@magellan-technology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2+NAND problem in 2.6.13-at91
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Aras Vaichas wrote:
> Aras Vaichas wrote:
> 
>>Hi,
>>
>>I was previously using 2.6.12-rc1, AT91 with JFFS2 on NAND and I had no
>>problems whatsoever with using JFFS2 on NAND.
>>
>>I recently upgraded to 2.6.13 and now JFFS2 on NAND seems a little broken ...

Jian Zhang wrote:

> i turn off debugging information( only MTD_DEBUG_LEVEL3) in nand_read_ecc( ),
> nand_write_ecc( ),nand_read_oob( ),nand_write_oob( ) which contained in
nand_base.c
> seperately. eventually,i found that it works well except turning off debugging
> info in nand_read_oob( ).so i insert  3us delay in this routine.

Thanks for the hint, I've got my NAND working again.

I did a diff between the nand_base.c version shipped with 2.6.13 (v1.147) and
2.6.12-rc1 (v1.138) and noticed that a delay loop had been moved further down
the code, I moved this delay back to where it was in v1.138 and it is now
working again. i assume that there was a probably a good reason to move this
delay in the first place though and I don't wish to break anything else ...

e.g.

--- drivers/mtd/nand/nand_base.c.orig   2005-09-14 13:28:07.000000000 +1000
+++ drivers/mtd/nand/nand_base.c        2005-09-14 13:37:59.000000000 +1000
@@ -1410,6 +1410,18 @@
                this->read_buf(mtd, &buf[i], thislen);
                i += thislen;

+
+               /* Apply delay or wait for ready/busy pin
+                * Do this before the AUTOINCR check, so no problems
+                * arise if a chip which does auto increment
+                * is marked as NOAUTOINCR by the board driver.
+                */
+               if (!this->dev_ready)
+                       udelay (this->chip_delay);
+               else
+                       nand_wait_ready(mtd);
+
+
                /* Read more ? */
                if (i < len) {
                        page++;
@@ -1421,16 +1433,6 @@
                                this->select_chip(mtd, -1);
                                this->select_chip(mtd, chipnr);
                        }
-
-                       /* Apply delay or wait for ready/busy pin
-                        * Do this before the AUTOINCR check, so no problems
-                        * arise if a chip which does auto increment
-                        * is marked as NOAUTOINCR by the board driver.
-                        */
-                       if (!this->dev_ready)
-                               udelay (this->chip_delay);
-                       else
-                               nand_wait_ready(mtd);

                        /* Check, if the chip supports auto page increment
                         * or if we have hit a block boundary.

Tom, did you want to check this? Should I submit a patch?

regards,

Aras Vaichas
