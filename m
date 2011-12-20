Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RcvOk-0008AU-Un
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2011 08:50:13 +0000
Message-ID: <4EF04C33.7060805@linutronix.de>
Date: Tue, 20 Dec 2011 09:49:55 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: write bad block marker even with BBT
References: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Baruch Siach <baruch@tkos.co.il>,
 Dan Carpenter <error27@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Barry Song <barry.song@analog.com>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sukumar Ghorai <s-ghorai@ti.com>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>,
 Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/19/2011 11:03 PM, Brian Norris wrote:
> Currently, the flash-based BBT implementation writes bad block data only
> to its flash-based table and not to the OOB marker area. Then, as new
> bad blocks are marked over time, the OOB markers become out of date and
> the flash-based table becomes the only source of current bad block
> information. This can be a problem when:
>
>   * bootloader cannot read the flash-based BBT format
>   * BBT is corrupted and the flash must be rescanned for bad
>     blocks; we want to remember bad blocks that were marked from Linux
>
> In an attempt to keep the bad block markers in sync with the flash-based
> BBT, this patch changes the default so that we write bad block markers
> to the proper OOB area on each block in addition to flash-based BBT.
>
> Theoretically, the bad block table and the OOB markers can still get out
> of sync if the system experiences a power cut between writing the BBT to
> flash and writing the OOB marker to a newly-marked bad block. However,
> this is a relatively unlikely event, as new bad blocks shouldn't appear
> frequently.
>

The marker and BBT may get out of sync. You should use either the one 
_or_ the other but not both. Why use both anyway? I use BBT because I
have no room left in OOB or updating a single area in OOB is too
complicated / hardly possible.
In the former case, reading that area again and interpreting it as
something as it was once is a bad thing.

Why is the BBT corrupted? You have two tables. If one is broken you
have still the other. If you lose one block which was about to be
marked bad you find soon enough.

Sebastian
