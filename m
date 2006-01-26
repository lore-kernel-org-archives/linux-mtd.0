Received: from moutvdom.kundenserver.de ([212.227.126.249]
	helo=moutvdomng.kundenserver.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F26G2-00033f-4v
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 07:29:49 -0500
Message-ID: <43D8C0E3.6040204@anagramm.de>
Date: Thu, 26 Jan 2006 13:30:27 +0100
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: Martin Krause <Martin.Krause@tqs.de>
References: <47F3F98010FF784EBEE6526EAAB078D1C05FA3@tq-mailsrv.tq-net.de>
In-Reply-To: <47F3F98010FF784EBEE6526EAAB078D1C05FA3@tq-mailsrv.tq-net.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash on MPC8xxx via UPM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Martin!

> we are working on a new board with a MPC8272 cpu. We plan to connect
> the NAND flashes over the Local Bus Controller and control it via
> the UPM, like described in the freescale application note:
> "How to Interface the PowerQUICC II Pro and PowerQUICC III Local
> Bus Controller to NAND Flash":
> 
> http://www.freescale.com/files/32bit/doc/white_paper/NANDFLASHWP.pdf

That should be possible. I guess I'll need that in the future, too
for MPC8540.

> I'm wondering, if this had been done already by someone or if there
> is a working lowlevel driver? Or perhaps someone is currently working
> on a driver or has plans to do so?

I have a little MPC8540ish raw test driver kernel 2.6 module which
allows to access something on the Local Bus via GPCM as well as via
UPM. It was a useful thing to experiment around.

Feel free to contact me if you want to have it.

Best greets,
-- 
Clemens Koller
_______________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Str. 45/1
81379 Muenchen
Germany

http://www.anagramm.de
Phone: +49-89-741518-50
Fax: +49-89-741518-19
