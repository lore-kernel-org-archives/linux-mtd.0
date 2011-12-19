Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RclVi-0007bU-Df
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 22:16:43 +0000
Received: by wgbdt11 with SMTP id dt11so8190837wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2011 14:16:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
References: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
Date: Mon, 19 Dec 2011 14:16:37 -0800
Message-ID: <CAN8TOE-7WgqEqJj5wja15ZRnnTOVYyq7--WPqC+0A-CGThkAUw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: write bad block marker even with BBT
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Baruch Siach <baruch@tkos.co.il>, Dan Carpenter <error27@gmail.com>,
 Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
 Guillaume LECERF <glecerf@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sukumar Ghorai <s-ghorai@ti.com>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for two e-mails; apparently several addresses I reached were no
longer valid. I'm removing Randy Dunlap and Sukumar Ghorai from the CC
list, and I updated Barry Song and Adrian Hunter's addresses.

Hopefully this can prevent other people from receiving too many
bounces :) Patch description copied below.

On Mon, Dec 19, 2011 at 2:03 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Currently, the flash-based BBT implementation writes bad block data only
> to its flash-based table and not to the OOB marker area. Then, as new
> bad blocks are marked over time, the OOB markers become out of date and
> the flash-based table becomes the only source of current bad block
> information. This can be a problem when:
>
> =A0* bootloader cannot read the flash-based BBT format
> =A0* BBT is corrupted and the flash must be rescanned for bad
> =A0 blocks; we want to remember bad blocks that were marked from Linux
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
> Note that this is a change from the previous default flash-based BBT
> behavior. If any contributors rely on the old behavior, they are welcome
> to introduce an option flag for it.
>
> Adapted from code by Matthieu Castet.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Brian
