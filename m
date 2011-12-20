Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rd4Fe-0000Nw-UB
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2011 18:17:24 +0000
Received: by wgbdt11 with SMTP id dt11so9206496wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2011 10:17:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EF04C33.7060805@linutronix.de>
References: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
 <4EF04C33.7060805@linutronix.de>
Date: Tue, 20 Dec 2011 10:17:16 -0800
Message-ID: <CAN8TOE_2yuqPnUwA6KWJ7Vqr=dEqevGP5A1nbqYSbJGB_hgSEQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: write bad block marker even with BBT
From: Brian Norris <computersforpeace@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Baruch Siach <baruch@tkos.co.il>, Dan Carpenter <error27@gmail.com>,
 Kulikov Vasiliy <segooon@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
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
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sebastian,

On Tue, Dec 20, 2011 at 12:49 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 12/19/2011 11:03 PM, Brian Norris wrote:
>>
>> Currently, the flash-based BBT implementation writes bad block data only
>> to its flash-based table and not to the OOB marker area. Then, as new
>> bad blocks are marked over time, the OOB markers become out of date and
>> the flash-based table becomes the only source of current bad block
>> information. This can be a problem when:
>>
>> =A0* bootloader cannot read the flash-based BBT format
>> =A0* BBT is corrupted and the flash must be rescanned for bad
>> =A0 =A0blocks; we want to remember bad blocks that were marked from Linu=
x
>>
>> In an attempt to keep the bad block markers in sync with the flash-based
>> BBT, this patch changes the default so that we write bad block markers
>> to the proper OOB area on each block in addition to flash-based BBT.
>>
>> Theoretically, the bad block table and the OOB markers can still get out
>> of sync if the system experiences a power cut between writing the BBT to
>> flash and writing the OOB marker to a newly-marked bad block. However,
>> this is a relatively unlikely event, as new bad blocks shouldn't appear
>> frequently.
>>
>
> The marker and BBT may get out of sync. You should use either the one _or=
_
> the other but not both. Why use both anyway?

Two reasons for using OOB area were stated above. There are cases where:
* bootloader cannot read the flash-based BBT format [... but it still
may need to recognize bad blocks]
* BBT is corrupted and the flash must be rescanned for bad blocks; we
want to remember bad blocks that were marked from Linux

In the above cases, one might still want to use flash-based BBT for
boot-time performance.

> I use BBT because I
> have no room left in OOB or updating a single area in OOB is too
> complicated / hardly possible.
> In the former case, reading that area again and interpreting it as
> something as it was once is a bad thing.

Well, then that is one case where you want an option to avoid writing
to markers back to OOB. We may need an option flag to enforce the old
behavior.

However, your use case is not the only use case. I use flash-based BBT
because of the boot-time performance improvement when I don't have to
rescan the whole flash. I believe there are others who use flash-based
BBT who want the ability to fall back to OOB bad block markers.

> Why is the BBT corrupted? You have two tables. If one is broken you
> have still the other. If you lose one block which was about to be
> marked bad you find soon enough.

There are certainly cases where the table could be erased/overwritten
(and therefore "corrupted"), like by a bootloader that doesn't
recognize the BBT, by a software bug, etc. Also, a table entry that
was written once and then read back over a lifetime might wear out and
start to have errors. Recent patches have tried to solve this with
"scrubbing" and, if necessary, rescanning the flash for bad blocks to
rebuild the table.

Also, mirroring is not a requirement for flash-based BBT. A driver
could provide a custom, non-mirrored configuration.

Brian
