Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZC6C-0002s5-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 14:34:00 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "Arne Jonsson" <arne.jonsson@i3micro.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Flash left in a write mode
Date: Fri, 8 Feb 2002 06:43:59 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFGEBDDEAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3C6378F1.78EEA1BB@i3micro.com>
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

Luckily our boot ROM is not the same device as the flash file-system.
Another recommendation for hardware designers. Separate your flash
functions.

Thanks for the feedback.

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Arne Jonsson
> Sent: Thursday, February 07, 2002 11:06 PM
> To: acurtis@onz.com
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Flash left in a write mode
>
>
> Hi!
>
> Another problem is when you have your interrupt vectors stored
> in the flash you are accessing.
> If you get an interrupt and have unlocked the flash your interrupt
> vectors are not seen by the CPU, and off you go into the deep binary
> space.
> I had to disable interrupts at all times when the flash was "unlocked".
> Maybe this is something that we could have a switch/define for ?
> Putting the boot address and hard interrupt vectors in the same address
> range
> is IMHO _very_ bad chip design.
> Another approach would be to have external hardware for the boot vector,
> switching to the flash and have RAM at the address of the interrupt
> vectors, but the extra HW is an extra cost.
>
> Best regards,
> /Arne Jonsson
>
> --
> Arne Jonsson
> i3 micro technology AB
> Phone:+46-8-506 388 00
> Fax:  +46-8-506 388 75
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
