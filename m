Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eUs1-0003TR-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 06:41:49 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9K00M98HCJ5Z@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 31 Jan 2003 08:12:20 +0100 (MET)
Date: Fri, 31 Jan 2003 08:10:31 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: NAND subsector writing problem
In-reply-to: <004701c2c8ce$107caea0$1a00a8c0@itc.intrinsyc.com>
To: Alex Samoutin <samoutin@hotbox.ru>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301310810.31301.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com>
 <20030130210325.0F2BB405E@tiger.actrix.co.nz>
 <004701c2c8ce$107caea0$1a00a8c0@itc.intrinsyc.com>
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

On Friday 31 January 2003 03:11, Alex Samoutin wrote:
>  don't know much about sub-page writing. I've only took latest MTD snapshot
> and wrote hardware level driver for NAND chip on IBM 405ep board. And then
> started "nandtest" program from the same snapshot. So, if "mixing ECC and
> sub-page writes is invalid" then something wrong in "nand.c" or "nandtest.o"
nandtest is not a valid testprogram for NAND. It should be removed from CVS.

> And furthermore -  that was not ECC error, it was error during verify read
> after write (read and write buffer not match).
> Also I have troubles with JFFS2  :(.  nand_write_page failed after verify
> ( If CONFIG_MTD_NAND_VERIFY_WRITE not defined - I have no error message)
Can you turn NAND debugging on and send me the debug output ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
