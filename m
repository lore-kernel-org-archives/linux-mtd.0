Received: from i3micro-gw1.dcs.net ([217.78.32.2] helo=mail.i3micro.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Z4xY-0002Tt-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 06:56:36 +0000
Message-ID: <3C6378F1.78EEA1BB@i3micro.com>
Date: Fri, 08 Feb 2002 08:06:25 +0100
From: Arne Jonsson <arne.jonsson@i3micro.com>
MIME-Version: 1.0
To: acurtis@onz.com
CC: linux-mtd@lists.infradead.org
Subject: Re: Flash left in a write mode
References: <NCBBIINEHIPFGJPLBEIFMEBBDEAA.acurtis@onz.com>
Content-Type: text/plain; charset=us-ascii
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

Hi!

Another problem is when you have your interrupt vectors stored
in the flash you are accessing.
If you get an interrupt and have unlocked the flash your interrupt
vectors are not seen by the CPU, and off you go into the deep binary
space.
I had to disable interrupts at all times when the flash was "unlocked".
Maybe this is something that we could have a switch/define for ?
Putting the boot address and hard interrupt vectors in the same address
range
is IMHO _very_ bad chip design.
Another approach would be to have external hardware for the boot vector,
switching to the flash and have RAM at the address of the interrupt
vectors, but the extra HW is an extra cost.

Best regards,
/Arne Jonsson

-- 
Arne Jonsson
i3 micro technology AB
Phone:+46-8-506 388 00
Fax:  +46-8-506 388 75
