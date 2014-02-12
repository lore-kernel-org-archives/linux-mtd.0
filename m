Received: from anubis.se.axis.com ([195.60.68.11])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDUVL-0008Tk-Ra
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 07:45:13 +0000
Date: Wed, 12 Feb 2014 08:44:45 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: Aw: Re: Linux MTD: Per Partition ECC
In-Reply-To: <52FA4E64.8020200@gmail.com>
Message-ID: <alpine.DEB.2.00.1402120840481.5908@lnxricardw.se.axis.com>
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>,
 <52FA1B39.2070904@corscience.de>
 <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
 <52FA4E64.8020200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "star@gmx.li" <star@gmx.li>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?ISO-8859-15?Q?Andreas_Bie=DFmann?= <andreas.biessmann@corscience.de>,
 "biessmann@corscience.de" <biessmann@corscience.de>,
 Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 11 Feb 2014, Peter Barada wrote:

> It may be possible to burn the bootloader into NAND using MTD_RAW_MODE
> which _should_ disable all ECC for the operation, but in my case the ECC
> generator is internal to the NAND chip itself and this won't work.
>
> I'm working on a possible solution in my linux-3.0 kernel, to modify
> nand_get_device to take an extra pramater "no_ecc" which keys off
> whether the NAND ops mode (if known) is MTD_OOB_RAW, and if so shut off
> all ECC (including the in-chip ECC my NAND requires).    Then every NAND
> operation will enable/disable ECC while getting the controller lock.

I'm sure I don't understand this properly, but in the first paragraph you 
state that the ECC generator is internal to the NAND chip so that you 
can't disable ECC on a per-write basis using MTD_RAW_MODE, then in the 
second paragraph above you say that you want to add a parameter which 
disables ECC. But that is what MTD_OOB_RAW is supposed to do isn't it?

Or is the real problem here that in the default routines in nand_base.c 
there is no way of notifying the _nand_chip_ which mode we're in? It 
should be possible though if you replace the appropriate default callbacks 
with chip-specific ones.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
