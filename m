Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkgq8-0005F8-Au
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 18:54:34 +0000
Received: by wera10 with SMTP id a10so5236025wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 10:54:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F0C086A.5070608@linutronix.de>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de>
Date: Tue, 10 Jan 2012 10:54:26 -0800
Message-ID: <CAN8TOE94xzVsFaD4WC-pbdnk_p-sG_o0jOTA2DWW8m7nUMw6TA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Brian Norris <computersforpeace@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
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
 Florian Fainelli <florian@openwrt.org>, Artem Bityutskiy <dedekind1@gmail.com>,
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

On Tue, Jan 10, 2012 at 1:44 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 01/09/2012 09:23 PM, Brian Norris wrote:
>> The important
>> segments of this series involve the default steps for marking new bad
>> blocks when using a flash-based BBT. The new default behavior will write
>> to the BBT as well as attempting to write a BBM to the OOB area of the
>> bad block. See the patch descriptions for details.
>
> Why do we update BBT and OOB and have the date in two places? One
> Argument was that the boot loader may not have support for BBT and uses
> OOB instead. If so, why not update the boot loader and make sure both
> users (OS and boot loader) use the same data?

This is not possible to do very generically. The NAND BBT framework is
not a stable exportable framework and has too many options and
variability for that to make sense, IMO. I feel that, if the
bootloader really needs to read from NAND and detect bad blocks, it
should only have to rely on the "standards" set down in the
datasheets. Having a bootloader learn Linux would unnecessarily
complicate it as well as seemingly defy the purpose of the bootloader.

> Any other other arguments why updating OOB is a good idea?

Yes. There were two stated reasons in patch 2. The second one:
   BBT is corrupted and the flash must be rescanned for bad blocks; we
want to remember bad blocks that were marked from Linux

Essentially, some developers have found that flash-based BBT isn't
100% reliable, and so we find ways to improve it so that when one or
two pages on a device have unexpected problems, the whole chip doesn't
become unusable. For one, perhaps you haven't followed a recent patch
(that was integrated into mainline) that provided a fallback mechanism
for the instance of ECC errors or excessive bitflips in the BBT:
   commit 623978de362a5faeb18d8395fa86089650642626
   mtd: nand: scrub BBT on ECC errors

This patch means that, for reliability reasons, "default" flash-based
BBT systems *already* may rely on the bad block markers in OOB. Now,
this also may not be desirable for your situation, but I didn't hear
complaints about this earlier. And I don't think I was the only one
requesting that feature.

>> The first patch, regarding NAND_NO_WRITE_OOB, is a first attempt at
>
> So now the old-default behavior requires a flag.

Yes. I hoped to make that clear.

>> satisfying Sebastian's concerns that some systems utilize the entire OOB
>> area for ECC, and so we need an option to prevent writing markers to
>> OOB. My attempt to prevent other OOB writes may be misguided,
>> incomplete, flawed in some other way, or some combination of the three.
>> Please provide constructive criticism.
>
> and I am still not convinced that it is a good idea to provide one
> information in two places. It seems to be redundant.

It seems that overall, we have (at least) two different paradigms for
the flash-based BBT concept. For me, I use it primarily as a
performance convenience: I don't have to scan the entire flash at
every bootup, saving time. I don't rely on it 100%, as it has caused
some problems in practice; I wish to be able to fall back to the
"standard" bad block markers when needed. For you, you seem to use it
out of necessity: you cannot use OOB for both ECC and bad block
markers, so you must scan the device once, build a table, then rely on
the table 100%. Please correct me if this characterization is wrong.

Now, the question is: are these paradigms reconcilable? For instance,
I've recently built in the ability to rescan the NAND if/when ECC
problems arise (mentioned above); but this is undesirable in your
paradigm, I think. You just hope to prevent fatal ECC problems?
Similarly, the BBT may be accidentally overwritten somehow; I would
hope that we can (someday) provide a mechanism to erase the table and
rebuild it. There are probably other more significant points of
contention between the two views, but I'm not going further at the
moment.

> If there are other
> people supporting this, I am not in your way.

I believe at least Matthieu Castet was interested in this patch series
before, and I have seen confirmation from Artem that the concept is
reasonable (in fact, he wasn't sure why this wasn't already the
default). I don't intend to ignore your views, and at a minimum, would
like to provide an option that fits correctly into the entire
MTD/NAND/BBT system and fulfills the requirements of your systems.

To that end: is the NAND_NO_WRITE_OOB flag acceptable? Are there
fundamental problems with that approach, where MTD/NAND will never
write to the OOB region? How about smaller technical issues with the
corresponding patches (patch 1 and 2)?

Brian
