Received: from chello062178007137.3.11.vie.surfer.at ([62.178.7.137] helo=quake.thinstuff.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154dGO-0006Gk-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 07:45:56 +0100
Received: from dmz.thinstuff.com ([192.168.2.1] helo=mg)
	by quake.thinstuff.com with smtp (Exim 3.12 #1 (Debian))
	id 154dHZ-00064l-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 08:47:09 +0200
Reply-To: <m.gibson@esesixtech.com>
From: "Michael Gibson" <m.gibson@esesixtech.com>
To: <linux-mtd@lists.infradead.org>
Subject: AW: HELP! - ISDN device not working with 16M DOC2000 but working with 8MB DOC Millenium 
Date: Tue, 29 May 2001 08:54:02 +0200
Message-ID: <000e01c0e80c$254bf380$3201a8c0@thinstuff.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
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

Hi David,

First of all thank you that you want to help.

I can always succesfully load both DOC´s (8MB Mill. and 16MB DOC2000)
without problem. They are always detected correctly.
And PCMCIA works with the 8MB DOC Mill.
The problem is that I CAN NOT load the other modules succesfully after
loading the 16MB DOC2000 but I CAN load them after loading the 8MB DOC Mill.
The ISDN Card is PCI and the wavelan card is PCMCIA + ISA PCMCIA Adapter and
they are not inserted at the same time, so I have eighter inserted the PCI
ISDN card or the ISA PCMCIA Adapter (1 slot) + PCMCIA Wavelan card but not
both together.

Sorry, I don´t exactely understand your last question:
Which kind of resources does the DOC use?
- /proc/ioports
- /proc/interrupts
- /proc/iomem
- /proc/dma
and why can´t I see in above files which resources are occupied by the DOC?
When you say "memory region", would that be /proc/iomem or /proc/ioports? (I
think /proc/iomem but I am not shure).
The info which I get when doing modprobe docprobe is /proc/iomem or
/proc/ioports?
If there would be a problem with the memory region with the PCI ISDN
adapter, how could I change the memory region for it?


Sorry for this big confusion on my side and for asking so many questiones.

Best regards
Michael

> -----Ursprüngliche Nachricht-----
> Von: David Woodhouse [mailto:dwmw2@redhat.com]Im Auftrag von David
> Woodhouse
> Gesendet am: Montag, 28. Mai 2001 17:43
> An: MG
> Cc: linux-mtd@lists.infradead.org
> Betreff: Re: HELP! - ISDN device not working with 16M DOC2000 but
> working with 8MB DOC Millenium
>
>
> m.gibson@thinstuff.com said:
> > I can mount nftla1 from the 16MB DOC2000, but when I try to load the
> > hisax module for the Sedlbauer ISDN card it simply does not work. When
> > I try to do the same thing with a 8MB DOC millenium I can load the
> > hisax module without any problem.
>
> > Same problem with wavelan - PCMCIA. it works perfect with 8MB DOC
> > Millenium but with 16MB DOC2000 it does not work?
>
> Do you mean it failed to detect the DiskOnChip hardware at all? Can you
> show the startup messages?
>
> Is it a PCMCIA ISDN card? Is the PCMCIA correctly configured not
> to attempt
> to use the memory region used by the DiskOnChip?
>
> --
> dwmw2
>
