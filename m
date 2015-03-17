Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXmR5-0000Qm-CA
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 08:01:12 +0000
Message-ID: <5507DF27.7050300@dave-tech.it>
Date: Tue, 17 Mar 2015 09:00:39 +0100
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 Andrea Marson - DAVE Embedded Systems <andrea.marson@dave.eu>
Subject: Re: RFC: detect and manage power cut on MLC NAND
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
 <55016A43.3000201@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
 <20150313213134.1b53430b@bbrezillon>
 <0D23F1ECC880A74392D56535BCADD7354973DF0B@NTXBOIMBX03.micron.com>
 <55040370.3040204@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973DFE3@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973DFE3@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear Jeff,

Il 16/03/2015 17:02, Jeff Lauruhn (jlauruhn) ha scritto:
> "What if it is set low while NAND is ready - that is it can accept new commands - but an erase operation is in progress?".  Again, the likelihood is low, in this case a block that was intended to be erased my not be fully erase, it can be fully erased when power returns.  No data will lost because the block was intended to be erased anyway. 

AFAIK the real problem here is how to detect that the in-progress erase
has not been terminated completely
The block seems to be erased (it contains all 0xFF) but it can lead to
some failure when writing or reading
(I have some indirect experience in it, when doing some power-cut test
on MLC but I cannot say for sure that it was caused by not completed
erase operation. See also this reference
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits)

> "Does the erase operation complete anyway?"  There has been a lot of work done to mitigate power loss on NAND, but I haven't ever seen a design from any NAND vendor that is 100%.  Surprise power loss should be avoided on NAND or consider power detection and elegant shutdown circuitry.

IIUC we have two workaround here:
- power detection and clean shutdown. This implies, of course, some
hardware implementation and a piece of software able to intercept the
hardware event, block all the NAND operation apart the one that is
currently running. This is the topic of my initial RFC. I got a first
implementation but, IMHO, is too strictly related to the NAND controller
(I've placed the event handler inside it and just lock the NAND access
by hacking chip->select_chip())
I think that power fail detection can be useful in some other context
too inside Linux kernel, so probably it may have a more general
implementation. However (and unfortunately) I'm not so involved in
mainline kernel so I don't really know if this topic has been discussed
or not

- detection of interrupted operations: having some kind of journal that
record the last running operation and fix it on next reboot. AFAIK this
is what commercial FTL and flash memory controller do, using a lot of
patented piece of software.
I'm not so aware of UBI/MTD internals but I think this is hard to
implement using a general approach. It should be easier to implement
such a logic having some additional hardware support (the first that
come into my mind is battery backed SRAM, e.g. the one that we find
inside RTC devices)

Best Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
