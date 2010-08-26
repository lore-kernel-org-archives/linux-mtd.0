Received: from aa013msr.fastwebnet.it ([85.18.95.73])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoXGj-00019s-7w
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 07:53:06 +0000
Received: from aurio01.localnet (39.225.70.39) by aa013msr.fastwebnet.it
	(8.5.016.6) id 4C68FDFD02AE8E00 for linux-mtd@lists.infradead.org;
	Thu, 26 Aug 2010 09:52:55 +0200
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Very strange problem of ghost data!!!
Date: Thu, 26 Aug 2010 09:52:54 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201008260952.54222.fabio.giovagnini@aurion-tech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, I try to explain my problem.
I bougth an eva board from Renesas. This board has SH2A 7203 as 
microcontroller and as NOR flash a Spansion s29gl032a11tfir23
Renesas gave to me the E10A emulator and the .mot file to esare the nor flash 
during the firmware upgrading process.

Well, starting from the schematics of the eva board I designed a custom board 
and becouse of availability problem, even if to use s29gl032a11tfir23 flash I 
used SST sst39VF64002B nor flash.

Now I have some boards. Among of them, some works properly; others allow you 
to progam and work properly only untill you leave connected the Power 
supplier; if you give a reset disconnecting and reconnecting the power 
supplier you lose all the data sent to flash. The behaviour is like you program 
the firmware into the flash, the data are stored into an intermediate ram but it 
is not really stored into the memory cells of the flash; so if you stay 
supplied  you read properly the flash; as you desconnect the power suppier and 
reconnect again you lose everything and with the emulator you read at 
0x00000000 (start up address) 0xFFFFFFFF

Any of you could be so kind to tell me whach could be the reason of so strange 
behaviour?

Thanks a lot in advance.


-- 
Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
Cell. +39.335.83.50.919
www.aurion-tech.com
