Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lnWp-0005Mg-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2002 10:29:51 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1T00J4A10WEK@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 02 Sep 2002 11:29:21 +0200 (MEST)
Date: Mon, 02 Sep 2002 11:28:56 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Smart card 64 MB v. 128 MB
In-reply-to: <3850FE6A-BC64-11D6-9352-000393467F1A@arlut.utexas.edu>
To: Ken Offer <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Message-id: <1030958937.1704.3.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <3850FE6A-BC64-11D6-9352-000393467F1A@arlut.utexas.edu>
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

On Sat, 2002-08-31 at 00:02, Ken Offer wrote:
> Hello all,
> 
> Does anyone know why a nand-driver which works for a 64 MB smart card 
> would NOT work for a 128 MB smart card?  I've checked the data sheets 
> and the two devices look very similar (same block size, same ecc size, 
> same 22-pads, etc.)  My driver mounts the device just fine but when I 
> try to erase I get I/O errors.  I'm going to look into the software 
> side of this but I thought I'd consult the group to find if there are 
> any hardware issues.
> 
Should work with 128MB.

Which device & manufacturer ID is displayed, when you mount your device
? There should be a output: NAND device: Manufacturer ID .............
 

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
