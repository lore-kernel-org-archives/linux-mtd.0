Received: from smtpauth17.prod.mesa1.secureserver.net ([64.202.165.29])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K0X7W-0006mw-Ra
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 07:27:51 +0000
Message-ID: <483A665C.9030107@tidepool.ca>
Date: Mon, 26 May 2008 00:27:24 -0700
From: Philip Loewen <philip@tidepool.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Toshiba NAND flash on CS5530A Southbridge
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would like to get linux access to the Toshiba NAND flash 
in my Compaq Evo T20 thin client, made in 2001. I have tried 
many many combinations of the kernel parameters without 
success. RTFM and SFTW have left me no wiser, so I am asking 
here: can anyone suggest a working recipe?

The thin client has a Geode GX1 CPU, an AMD CS5530A 
Southbridge, and 48MB of flash memory soldered to the 
mainboard: Toshiba TC58128FT or some near relation. The 
kernel version is 2.6.24-gentoo-r8. At some early stage I 
stumbled upon some combination of keys that caused 
interesting-sounding devices like /dev/mtd0 to appear, but 
they didn't seem mountable so I adjusted the kernel and 
recompiled without noting the settings I had -- ouch! -- and 
now even that small glimmer of hope has gone.

Any helpful suggestions would be most welcome. Thanks.
