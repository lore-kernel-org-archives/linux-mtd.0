Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eQAv-0002qS-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 01:41:01 +0000
Received: from pengwin (h209-139-192-234.gtconnect.net [209.139.192.234])
	(authenticated bits=0)
	by smtp.hotbox.ru (8.12.6/8.12.6) with ESMTP id h0V27P31012300
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 05:07:26 +0300 (MSK)
	(envelope-from samoutin@hotbox.ru)
Message-ID: <004701c2c8ce$107caea0$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: <linux-mtd@lists.infradead.org>
References: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com> <20030130210325.0F2BB405E@tiger.actrix.co.nz>
Subject: Re: NAND subsector writing problem
Date: Thu, 30 Jan 2003 18:11:23 -0800
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

 don't know much about sub-page writing. I've only took latest MTD snapshot
and wrote hardware level driver for NAND chip on IBM 405ep board. And then
started "nandtest" program from the same snapshot. So, if "mixing ECC and
sub-page writes is
invalid" then something wrong in "nand.c" or "nandtest.o"

And furthermore -  that was not ECC error, it was error during verify read
after write (read and write buffer not match).

Also I have troubles with JFFS2  :(.  nand_write_page failed after verify
( If CONFIG_MTD_NAND_VERIFY_WRITE not defined - I have no error message)

Alex.

----- Original Message ----- 
From: "Charles Manning" <manningc2@actrix.gen.nz>
To: "Alex Samoutin" <samoutin@hotbox.ru>; <linux-mtd@lists.infradead.org>
Sent: Thursday, January 30, 2003 12:57 PM
Subject: Re: NAND subsector writing problem


> There is no problem using this for JFFS2 or YAFFS since neither use 
> sub-page writes.
> 
> ECC applies to the whole page.  Thus, mixing ECC and sub-page writes is 
> invalid.
> 
> -- Charles
> 
