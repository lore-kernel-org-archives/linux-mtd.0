Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoXhb-0005xQ-H8
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2012 09:57:40 +0000
Received: by wgbdq13 with SMTP id dq13so971323wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 21 Jan 2012 01:57:34 -0800 (PST)
Date: Sat, 21 Jan 2012 11:57:04 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: nand: write BBM to OOB even with
 flash-based BBT
Message-ID: <20120121115704.3c10a64f@pixies.home.jungo.com>
In-Reply-To: <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
 <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, Dan Carpenter <error27@gmail.com>,
 Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
 Florian Fainelli <florian@openwrt.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
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

On Fri, 20 Jan 2012 20:38:04 -0800 Brian Norris <computersforpeace@gmail.com> wrote:
> The new flash-based BBT procedure for marking bad blocks:
>  (1) erase the affected block, to allow OOB marker to be written cleanly
>  (2) update in-memory BBT
>  (3) write bad block marker to OOB area of affected block
>  (4) update flash-based BBT
> Note that we retain the first error encountered in (3) or (4), finish the
> procedures, and dump the error in the end:
> 
> This should handle power cuts gracefully enough. (1) and (2) are mostly
> harmless (note that (1) will not erase an already-recognized bad block).
> The OOB and BBT may be "out of sync" if we experience power loss bewteen
> (3) and (4), but we can reasonably expect that on next boot, subsequent
> I/O operations will discover that the block should be marked bad again,
> thus re-syncing the OOB and BBT.
> 
> Note that this is a change from the previous default flash-based BBT
> behavior. If your system cannot support writing bad block markers to OOB,
> use the new NAND_BBT_NO_OOB_BBM option (in combination with
> NAND_BBT_USE_FLASH and NAND_BBT_NO_OOB).

Looks good.

I've came up with another idea - an addition to your patch which
improves BBM vs BBT out-of-sync handling in a rather simple,
non-intrusive way, adapting Artem's idea of lazy checking.

Users of the MTD interface use the 'mtd->block_isbad' method for
querying the badness of a block.

Current implementation ('nand_block_checkbad') queries the in-ram BBT
(using 'nand_isbad_bbt'), which was built by scanning the on-flash BBT
in the NAND_BBT_USE_FLASH case.

We could augment 'nand_block_checkbad' as follows:
- query the in-ram BBT (nand_isbad_bbt)
- if !NAND_BBT_USE_FLASH or (NAND_BBT_USE_FLASH && NAND_BBT_NO_OOB_BBM)
   single source of badness indicator. return the in-ram bbt value
- otherwise, also read from the OOB BBM using 'chip->block_bad'
- if no inconsistency, we're done
- inconsistency? synchronise:
   OOB BBM is marked? update flash BBT
   BBT marked? update OOB BBM // shouldn't happen, OOB was marked first

This way we keep them synced using lazy checking, relying on the fact
that MTD users use the 'block_isbad' interface for querying the badness
of a block.

The penatly is a 'chip->block_bad' (OOB read) invocation per
'block_isbad' call.

Alternatively, we can do it only once, within 'nand_isbad_bbt', if we
have an additional bit per eraseblock in the in-ram BBT, as Artem
suggested.

I assume this additional feature isn't a must, but OTOH it doesn't look
like a drastic change.

Regards
Shmulik
