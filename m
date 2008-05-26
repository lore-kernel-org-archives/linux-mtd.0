Received: from offshost.com ([91.194.90.55])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0XZL-0006IT-3W
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 07:56:36 +0000
Message-ID: <483A6CFB.9000902@prodigi.ch>
Date: Mon, 26 May 2008 09:55:39 +0200
From: Hamish Guthrie <hamish@prodigi.ch>
MIME-Version: 1.0
To: Philip Loewen <philip@tidepool.ca>
Subject: Re: Toshiba NAND flash on CS5530A Southbridge
References: <483A665C.9030107@tidepool.ca>
In-Reply-To: <483A665C.9030107@tidepool.ca>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Try this link:

http://winterm.gaast.net/main.php/news.html

Philip Loewen wrote:
> I would like to get linux access to the Toshiba NAND flash 
> in my Compaq Evo T20 thin client, made in 2001. I have tried 
> many many combinations of the kernel parameters without 
> success. RTFM and SFTW have left me no wiser, so I am asking 
> here: can anyone suggest a working recipe?
> 
> The thin client has a Geode GX1 CPU, an AMD CS5530A 
> Southbridge, and 48MB of flash memory soldered to the 
> mainboard: Toshiba TC58128FT or some near relation. The 
> kernel version is 2.6.24-gentoo-r8. At some early stage I 
> stumbled upon some combination of keys that caused 
> interesting-sounding devices like /dev/mtd0 to appear, but 
> they didn't seem mountable so I adjusted the kernel and 
> recompiled without noting the settings I had -- ouch! -- and 
> now even that small glimmer of hope has gone.
> 
> Any helpful suggestions would be most welcome. Thanks.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
